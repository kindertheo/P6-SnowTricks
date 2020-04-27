<?php

namespace App\Form;

use App\Entity\Tricks;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\UrlType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TricksType extends ApplicationType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {/*TODO Rectifier le placeholder du image upload*/
        $builder
            ->add('name', TextType::class, $this->getConfiguration("Nom du tricks", "Entrez le nom"))
            ->add('description', TextareaType::class, $this->getConfiguration("Description", "Entrez une description représentant le trick"))
            ->add('main_image', FileType::class, $this->getConfiguration("Image principale", "Image principale"))
            ->add('images', CollectionType::class, array(
                "entry_type"    => ImageType::class,
                "allow_add"     => true,
                "allow_delete"  => true,
                'entry_options' => ['label' => false],
            ))
            ->add('video', UrlType::class, $this->getConfiguration("Vidéo", "Lien de la vidéo", ["required" => false]))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Tricks::class,
        ]);
    }
}
