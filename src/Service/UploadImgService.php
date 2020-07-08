<?php
namespace App\Service;


use App\Entity\Tricks;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\HttpFoundation\File\UploadedFile;

/**
 * Class UploadImgService
 * @package App\Service
 */
class UploadImgService
{
    /**
     * @var
     */
    private $targetDirectory;
    /**
     * @var
     */
    private $fileNameMainImage;

    /**
     * UploadImgService constructor.
     * @param $targetDirectory
     */
    public function __construct($targetDirectory)
    {
        $this->targetDirectory = $targetDirectory;
    }

    /**
     * @param UploadedFile $file
     * @param null $path
     * @return string
     */
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

    /**
     * @return mixed
     */
    public function getTargetDirectory()
    {
        return $this->targetDirectory;
    }


    /**
     * @return mixed
     */
    public function getFileNameMainImage(){
        return $this->fileNameMainImage;
    }
}