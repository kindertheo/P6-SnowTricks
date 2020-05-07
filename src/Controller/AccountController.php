<?php

namespace App\Controller;

use App\Entity\PasswordUpdate;
use App\Entity\User;
use App\Form\PasswordUpdateType;
use App\Form\RegisterType;
use App\Form\UpdateProfileType;
use App\Service\EmailService;
use App\Service\UploadImgService;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Security\Core\Encoder\PasswordEncoderInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class AccountController extends AbstractController
{
    /*TODO REFAIRE UML + JEU DE DONNEES
    TODO TEST UNITAIRE*/
    /*TODO SUPPORT PRESENTATION*/
    /**
     * Affiche et gère le formulaire de connexion
     * @Route("/account/login", name="account_login")
     * @param AuthenticationUtils $authenticationUtils
     * @return Response
     */
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        if($error){
            $this->addFlash("danger", 'Identifiants incorrects');
        }
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('account/login.html.twig',
            [
                'username' => $lastUsername
            ]);
    }

    /**
     * @Route("account/logout", name="account_logout")
     *
     */
    public function logout(){
        //
    }

    /**
     * @Route("account/register", name="account_register")
     * @param EntityManagerInterface $manager
     * @param Request $request
     * @param UserPasswordEncoderInterface $encoder
     * @param EmailService $emailService
     * @param \Swift_Mailer $mailer
     * @return Response
     * @throws \Exception
     */
    public function register(EntityManagerInterface $manager, Request $request, UserPasswordEncoderInterface $encoder, EmailService $emailService, \Swift_Mailer $mailer){
        $user = new User();
        $form = $this->createForm(RegisterType::class, $user);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            /* encode password*/
            $hash = $encoder->encodePassword($user, $user->getPassword());
            $user->setPassword($hash);

            $emailService->sendRegistrationEmail($mailer, $user, $manager);

            $this->addFlash('success', 'Votre compte a bien été crée ! Regardez dans votre boite mail pour confirmer votre inscription. Vous n\'avez que 30 minutes');

            return $this->redirectToRoute("account_login");
        }

        return $this->render('account/register.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/account/register/validation/{token}", name="register_validation", methods={"GET"})
     * @param EntityManagerInterface $manager
     * @param $token
     * @return RedirectResponse
     * @throws \Exception
     */
    public function registerValidation(EntityManagerInterface $manager, $token){
        /*Recherche l'utilisateur selon le token dans l'url*/
        /*Si l'user est trouvé met le token a null*/
        $user = $manager->getRepository(User::class)->findOneBy([
            'registrationToken' => $token]);
        $dateToken = $user->getRegTokenCreatedAt();

        /*Si l'utilisateur existe et si la date d'enregistrement est inférieure a maintenant*/
        if($user and  new DateTime("now") < $dateToken){
            $user->setRegistrationToken(null);
            $manager->persist($user);
            $manager->flush();
            $this->addFlash("success", "Vous pouvez à présent vous connecter");
        } else {
            $this->addFlash("warning", "Le lien n'est pas bon ou n'est plus valide");
        }

        return $this->redirectToRoute("account_login");
    }

    /**
     * @Route("account/register/revalidation/", name="resend_validation_token")
     * @param Request $request
     * @param EntityManagerInterface $manager
     * @param EmailService $emailService
     * @param \Swift_Mailer $mailer
     * @return RedirectResponse|Response
     * @throws \Exception
     */
    public function resendValidationToken(Request $request, EntityManagerInterface $manager, EmailService $emailService, \Swift_Mailer $mailer){
        $form = $this->createFormBuilder()
            ->add("email", EmailType::class)
            ->getForm();
        $form->handleRequest($request);


        if($form->isSubmitted() && $form->isValid()){
            $user = $manager->getRepository(User::class)->findOneBy(["email" => $form['email']->getData()]);
            if($user){

                $emailService->sendRegistrationEmail($mailer, $user, $manager);

                $this->addFlash("success", "Un mail de confirmation vous a été envoyé!");
                return $this->redirectToRoute("account_login");
            }
            elseif(!$user){
                $this->addFlash("danger", "Vous n'avez pas de compte chez nous");
                return $this->redirectToRoute("account_login");
            }

        }

        return $this->render("account/email_validation.html.twig", ['form' => $form->createView()]);
    }

    /**
     * @Route("/account/update", name="account_update")
     * @IsGranted("ROLE_USER")
     * @param EntityManagerInterface $manager
     * @param Request $request
     * @param UploadImgService $uploadImgService
     * @return Response
     */
    public function update(EntityManagerInterface $manager, Request $request, UploadImgService $uploadImgService){
        $user = $this->getUser();

        $form = $this->createForm(UpdateProfileType::class, $user);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            if(!empty($form['picture']->getData())){
                $filename = $uploadImgService->upload($form['picture']->getData(), "img/profile/");
                $user->setPicture($filename);
            }

            $manager->persist($user);
            $manager->flush();

            $this->addFlash("success", "Votre profil a bien été modifié");

            return $this->redirectToRoute("user_profile", ['id' => $user->getId()]);
        }

        return $this->render('account/update.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/account/update_password", name="account_update_password")
     * @IsGranted("ROLE_USER")
     * @param Request $request
     * @param UserPasswordEncoderInterface $encoder
     * @param EntityManagerInterface $manager
     * @return Response
     */
    public function updatePassword(Request $request, UserPasswordEncoderInterface $encoder, EntityManagerInterface $manager){
        $user = $this->getUser();
        $passwordUpdate = new PasswordUpdate();

        $form = $this->createForm(PasswordUpdateType::class, $passwordUpdate);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            if(!password_verify($passwordUpdate->getOldPassword(), $user->getPassword())){

            }else{
                $newPassword = $passwordUpdate->getNewPassword();
                $password = $encoder->encodePassword($user, $newPassword);

                $user->setPassword($password);

                $manager->persist($user);
                $manager->flush();

                $this->addFlash("success", "Votre mot de passe a bien été modifié");

                return $this->redirectToRoute("user_profile", ['id' => $user->getId()]);
            }

        }

        return $this->render("account/passwordUpdate.html.twig", [
            'form' => $form->createView()
        ]);

    }

    /**
     * @Route("/account/password_forgot_email/", name="account_mail_password_forgot")
     * @param Request $request
     * @param \Swift_Mailer $mailer
     * @param EmailService $emailService
     * @param EntityManagerInterface $manager
     * @return RedirectResponse|Response
     */
    public function mailPasswordForgot(Request $request, \Swift_Mailer $mailer, EmailService $emailService, EntityManagerInterface $manager){
        $form = $this->createFormBuilder()
            ->add("email", EmailType::class)
            ->getForm();
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid() ){
            $user = $manager->getRepository(User::class)->findOneBy(['email' => $form['email']->getData()]);
            if($user){
                $emailService->sendForgotPassword($mailer, $user, $manager);

                $this->addFlash("success", "Une demande de changement de mot de passe vient d'être envoyé sur votre adresse mail!");
                return $this->redirectToRoute("account_login");
            }else{
                $this->addFlash("danger", "Nous n'avons pas trouvé votre adresse mail");
                return $this->redirectToRoute("account_login");
            }
        }

        return $this->render("account/password_forgot.html.twig", ['form' => $form->createView()]);
    }

    /**
     * @Route("/account/password_forgot/{token}", name="account_password_forgot")
     * @param Request $request
     * @param EntityManagerInterface $manager
     * @param $token
     * @param UserPasswordEncoderInterface $encoder
     * @return Response
     */
    public function passwordForgot(Request $request, EntityManagerInterface $manager, $token, UserPasswordEncoderInterface $encoder){
        $form = $this->createFormBuilder()
            ->add("newPassword", PasswordType::class)
            ->add("newPasswordConfirm", PasswordType::class)
            ->getForm();
        $form->handleRequest($request);

        $user = $manager->getRepository(User::class)->findOneBy(['forgotPassToken' => $token]);
        if(!$user){
            $this->addFlash("danger", "Nous n'avons pas trouvé votre compte");
            return $this->redirectToRoute("account_login");
        }
        if($form->isSubmitted() && $form->isValid() ){
            if($form['newPassword']->getData() === $form['newPasswordConfirm']->getData()){
                $password = $encoder->encodePassword($user, $form['newPassword']->getData());
                $user->setPassword($password);
                $user->setForgotPassToken(null);
                $manager->persist($user);
                $manager->flush();

                $this->addFlash("success", "Votre mot de passe a bien été changé");
                return $this->redirectToRoute("account_login");
            }
            $this->addFlash("danger", "Les mots de passes ne sont pas les mêmes");
            return $this->redirect($request->getUri());
        }

        return $this->render("account/password_forgot.html.twig", ['form' => $form->createView()]);
    }
}
