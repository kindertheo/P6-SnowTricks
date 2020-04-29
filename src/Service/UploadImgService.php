<?php
namespace App\Service;


use App\Entity\Tricks;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\HttpFoundation\File\UploadedFile;

class UploadImgService
{
    private $targetDirectory;
    private $fileNameMainImage;

    public function __construct($targetDirectory)
    {
        $this->targetDirectory = $targetDirectory;
    }

    public function upload(UploadedFile $file)
    {
        $fileName = md5(uniqid()).'.'.$file->guessExtension();

        $file->move($this->getTargetDirectory(), $fileName);

        $this->fileNameMainImage = $fileName;
        return $fileName;
    }

    public function getTargetDirectory()
    {
        return $this->targetDirectory;
    }

    public function uploadImageAndVideo(FormInterface $form, Tricks $tricks, EntityManagerInterface $manager){
        $arrayImages = $tricks->getImages();

        for($i = 0; $i < count($arrayImages); $i++ ){
            /*Grab UploadFile object of image*/
            $img = $form['images']->get($i)->get('image')->getNormData();
            /*Upload it*/
            $fileName = $this->upload($img);

            $arrayImages[$i]->setPath("img/". $fileName);
            $arrayImages[$i]->setTricks($tricks);
            $manager->persist($arrayImages[$i]);
        }

        /*Upload l'image principale*/
        $img = $form['main_image']->getData();
        $fileName = $this->upload($img);
        $tricks->setMainImage("img/" . $fileName);

        foreach($tricks->getVideos() as $video){
            $video->setTricks($tricks);
            $manager->persist($video);
        }

    }

    public function getFileNameMainImage(){
        return $this->fileNameMainImage;
    }
}