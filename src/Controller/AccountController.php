<?php

namespace App\Controller;

use App\Entity\PasswordUpdate;
use App\Entity\User;
use App\Form\PasswordUpdateType;
use App\Form\RegisterType;
use App\Form\UpdateProfileType;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
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
     * @return Response
     */
    public function register(EntityManagerInterface $manager, Request $request, UserPasswordEncoderInterface $encoder){
        $user = new User();
        $form = $this->createForm(RegisterType::class, $user);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $hash = $encoder->encodePassword($user, $user->getPassword());
            $user->setPassword($hash);
            $manager->persist($user);
            $manager->flush();

            $this->addFlash('success', 'Votre compte a bien été crée ! Vous pouvez vous connecter');

            return $this->redirectToRoute("account_login");
        }

        return $this->render('account/register.html.twig', [
            'form' => $form->createView()
        ]);
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
