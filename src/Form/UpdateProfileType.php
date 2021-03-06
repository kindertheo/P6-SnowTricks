<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\UrlType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

/**
 * Class UpdateProfileType
 * @package App\Form
 */
class UpdateProfileType extends ApplicationType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('firstName', TextType::class, $this->getConfiguration("Prénom", "Prénom"))
            ->add('lastName', TextType::class, $this->getConfiguration("Nom de famille", "Nom de famille"))
            ->add('email', EmailType::class, $this->getConfiguration("Adresse email", "Adresse email"))
            ->add('picture', FileType::class, $this->getConfiguration("Lien vers votre image de profil", "Photo de profil",
                ['data_class' => null, 'required' => false,  'empty_data' => false]))
            ->add('introduction', TextareaType::class, $this->getConfiguration("Introduction",
                "Une petite introduction qui sera affichée sur votre page de profil", ['required' => false]))
        ;
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
