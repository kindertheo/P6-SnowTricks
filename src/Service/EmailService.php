<?php

namespace App\Service;

use App\Entity\User;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;


class EmailService extends AbstractController
{

    public function sendEmailTest($name, \Swift_Mailer $mailer)
    {
        $message = (new \Swift_Message('Hello Email'))
            ->setFrom('mail@blog.kindertheo.net')
            ->setTo("kinder.theo@gmail.com")
            ->setSubject("LE TEST")
            ->setBody(
                $this->renderView(
                    'email/template.html.twig',
                    ['name' => $name]
                ),
                'text/html'
            )
        ;
        $mailer->send($message);

        return $this->render("account/login.html.twig");
    }

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
}