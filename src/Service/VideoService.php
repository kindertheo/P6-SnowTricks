<?php


namespace App\Service;


use App\Entity\Tricks;
use App\Entity\Video;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\RouterInterface;

/**
 * Class VideoService
 * @package App\Service
 */
class VideoService extends AbstractController
{


    /**
     * @var EntityManagerInterface
     */
    private $entityManager;

    /**
     * VideoService constructor.
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * @param Video $video
     * @param Tricks $tricks
     */
    public function addVideo(Video $video, Tricks $tricks)
    {
        $video->setTricks($tricks);

        $this->entityManager->persist($video);
        $this->entityManager->flush();
    }

    /**
     * @param Video $video
     * @return RedirectResponse
     */
    public function deleteVideo(Video $video)
    {
        $slug = $video->getTricks()->getSlug();
        $this->entityManager->remove($video);
        $this->entityManager->flush();

        return $this->redirectToRoute("tricks_update", ['slug' => $slug]);
    }
}