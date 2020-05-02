<?php

namespace App\Controller;

use App\Entity\PasswordUpdate;
use App\Entity\User;
use App\Form\PasswordUpdateType;
use App\Form\RegisterType;
use App\Form\UpdateProfileType;
use App\Service\EmailService;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class AccountController extends AbstractController
{
    /**
     * Affiche et gère le formulaire de connexion
     * @Route("/account/login", name="account_login")
     */
    public function login()
    {
        return $this->render('account/login.html.twig', [
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
     * @return Response
     */
    public function update(EntityManagerInterface $manager, Request $request){
        $user = $this->getUser();

        $form = $this->createForm(UpdateProfileType::class, $user);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
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

}
