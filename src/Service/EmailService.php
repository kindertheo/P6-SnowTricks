<?php

namespace App\Service;

use App\Entity\User;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;


/**
 * Class EmailService
 * @package App\Service
 */
class EmailService extends AbstractController
{

    /**
     * @param \Swift_Mailer $mailer
     * @param User $user
     * @param EntityManagerInterface $manager
     * @return bool
     * @throws \Exception
     */
    public function sendRegistrationEmail(\Swift_Mailer $mailer, User $user, EntityManagerInterface $manager){

        $token = uuid_create(UUID_TYPE_RANDOM);
        $user->setRegistrationToken($token)
            ->setRegTokenCreatedAt(new DateTime("+30 minutes"));

        $manager->persist($user);
        $manager->flush();

        /*get user info, generate an url and send it*/
        $fullName = $user->getFullName();
        $emailTo = $user->getEmail();
        $link = $this->generateUrl("register_validation", ['token' => $token], UrlGeneratorInterface::ABSOLUTE_URL);

        $message = (new \Swift_Message('Hello Email'))
            ->setFrom('mail@blog.kindertheo.net')
            ->setTo($emailTo)
            ->setSubject("Confirmez votre inscription sur SnowTricks")
            ->setBody(
                $this->renderView(
                    'email/registration.html.twig',
                    [
                        'fullName' => $fullName,
                        'link' => $link,
                    ]
                ),
                'text/html'
            )
        ;
        $mailer->send($message);

        return true;
    }

    /**
     * @param \Swift_Mailer $mailer
     * @param User $user
     * @param EntityManagerInterface $manager
     * @throws \Exception
     */
    public function sendForgotPassword(\Swift_Mailer $mailer, User $user, EntityManagerInterface $manager){

        $token = uuid_create(UUID_TYPE_RANDOM);
        $user->setForgotPassToken($token)
            ->setForgotPassTokenCreatedAt(new DateTime("+30 minutes"));

        $manager->persist($user);
        $manager->flush();

        $emailTo = $user->getEmail();
        $fullName = $user->getFullName();
        $link = $this->generateUrl("account_password_forgot", ['token' => $token], UrlGeneratorInterface::ABSOLUTE_URL);
        $message = (new \Swift_Message('Hello Email'))
            ->setFrom('mail@blog.kindertheo.net')
            ->setTo($emailTo)
            ->setSubject("Mot de passe oublié SnowTricks")
            ->setBody(
                $this->renderView(
                    'email/forgot_password.html.twig',
                    [
                        'fullName' => $fullName,
                        'link' => $link,
                    ]
                ),
                'text/html'
            )
        ;
        $mailer->send($message);
    }
}