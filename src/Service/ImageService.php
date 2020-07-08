<?php


namespace App\Service;


use App\Entity\Image;
use App\Entity\Tricks;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\RouterInterface;

/**
 * Class ImageService
 * @package App\Service
 */
class ImageService extends AbstractController
{
    /**
     * @var RouterInterface
     */
    private $router;

    /**
     * @var EntityManagerInterface
     */
    private $entityManager;


    /**
     * @var UploadImgService
     */
    private $uploadImgService;

    /**
     * ImageService constructor.
     * @param EntityManagerInterface $entityManager
     * @param RouterInterface $router
     * @param UploadImgService $uploadImgService
     */
    public function __construct(EntityManagerInterface $entityManager,
                                RouterInterface $router, UploadImgService $uploadImgService)
    {
        $this->entityManager = $entityManager;
        $this->router = $router;
        $this->uploadImgService = $uploadImgService;
    }

    /**
     * @param Image $image
     * @param Tricks $tricks
     * @param $imageFile
     * @param bool $mainImage
     */
    public function addImage(Image $image, Tricks $tricks, $imageFile, $mainImage = false)
    {
        if ($imageFile) {
            $imageFileName = $this->uploadImgService->upload($imageFile);
            if ($mainImage == false) {
                $image->setImage($imageFileName);
                $image->setPath("img/$imageFileName");
                $image->setTricks($tricks);
                $this->entityManager->persist($image);

            }else{
                $tricks->setMainImage("img/$imageFileName");
                $this->entityManager->persist($tricks);
            }
        }

        $this->entityManager->flush();

        return;
    }

    /*Delete image in db and in directory*/
    /**
     * @param Image $image
     */
    public function deleteImage(Image $image)
    {
        $filesystem = new Filesystem();
        $imagePath = 'img/'.$image->getImage();

        if ($filesystem->exists($imagePath)) {
            $filesystem->remove($imagePath);
        }
        $this->entityManager->remove($image);
        $this->entityManager->flush();
    }

    /**
     * @param string $mainImage
     */
    private function deleteFromPath(string $mainImage){
        $filesystem = new Filesystem();
        if ($filesystem->exists($mainImage)) {
            $filesystem->remove($mainImage);
        }
    }

    /**
     * @param Tricks $tricks
     */
    public function deleteAllImageFromTrick(Tricks $tricks){
        $mainImage = $tricks->getMainImage();
        $this->deleteFromPath($mainImage);

        $images = $tricks->getImages();
        foreach($images as $image){
            $this->deleteImage($image);
        }
    }

}