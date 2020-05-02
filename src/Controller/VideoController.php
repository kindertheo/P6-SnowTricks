<?php

namespace App\Controller;

use App\Entity\Tricks;
use App\Entity\Video;
use App\Form\VideoType;
use App\Service\VideoService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class VideoController extends AbstractController
{
    /**
     * @Route("/tricks/{id}/update/video/add", name="tricks_update_video_add")
     * @param Tricks $tricks
     * @param Request $request
     * @param VideoService $videoService
     * @return RedirectResponse|Response
     */
    public function addUpdate(Tricks $tricks, Request $request, VideoService $videoService)
    {
        $video = new Video();
        $form = $this->createForm(VideoType::class, $video);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $videoService->addVideo($video, $tricks);

            $this->addFlash('success', 'Vidéo ajoutée');

            return $this->redirectToRoute("tricks_update", ['id' => $tricks->getId()]);
        }

        return $this->render("tricks/add_video.html.twig",
            ['form' => $form->createView()]);
    }

    /**
     * @Route("tricks/{slug}/update/video/delete/{id}", name="tricks_update_video_delete")
     * @param Video $video
     * @param VideoService $videoService
     * @return RedirectResponse
     */
    public function delete(Video $video, VideoService $videoService)
    {
        $id = $video->getTricks()->getId();
        $videoService->deleteVideo($video);

        $this->addFlash("warning", "Vidéo supprimée");

        return $this->redirectToRoute("tricks_update", ['id' => $id]);
    }
}
