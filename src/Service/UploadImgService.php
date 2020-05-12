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

    public function upload(UploadedFile $file, $path = null)
    {
        $fileName = md5(uniqid()).'.'.$file->guessExtension();
        if($path){
            $file->move($path, $fileName);
        }else{
            $file->move($this->getTargetDirectory(), $fileName);
        }
        $fileName = $path . $fileName;
        $this->fileNameMainImage = $fileName;
        return $fileName;
    }

    public function getTargetDirectory()
    {
        return $this->targetDirectory;
    }


    public function getFileNameMainImage(){
        return $this->fileNameMainImage;
    }
}