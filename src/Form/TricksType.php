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
    {/*TODO Ajouter catégorie*/
        $builder
            ->add('name', TextType::class, $this->getConfiguration("Nom du tricks", "Entrez le nom"))
            ->add('description', TextareaType::class, $this->getConfiguration("Description", "Entrez une description représentant le trick"))
            ->add("mainImage", FileType::class);
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Tricks::class,
        ]);
    }
}
