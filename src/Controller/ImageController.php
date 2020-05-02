<?php

namespace App\Controller;

use App\Entity\Image;
use App\Entity\Tricks;
use App\Form\ImageType;
use App\Service\ImageService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ImageController extends AbstractController
{
    /**
     * @Route("/tricks/{id}/update/image/add/{main?}", name="tricks_update_image_add")
     * @param Request $request
     * @param Tricks $tricks
     * @param ImageService $imageService
     * @param $main
     * @return RedirectResponse|Response
     */
    public function add(Request $request, Tricks $tricks, ImageService $imageService, $main)
    {
        $image = new Image();
        $form = $this->createForm(ImageType::class, $image);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            /*Ce code peut etre enlevé*/
            /*Récupère l'image dans le formulaire ImageType et l'upload avec ImageService*/
            $imageFile = $form['image']->getData();
            if($main){
                $imageService->addImage($image, $tricks, $imageFile, true);
            }else {
                $imageService->addImage($image, $tricks, $imageFile);

            }

            return $this->redirectToRoute("tricks_update", ['id' => $tricks->getId()]);
        }elseif($form->getErrors(true, false)->count() > 0){
            $this->addFlash("danger", $form->getErrors(true));
            return $this->redirectToRoute("tricks_update", ['id' => $tricks->getId()]);
        }

        return $this->render("tricks/add_image.html.twig",
            ['form' => $form->createView()]);

    }

    /**
     * @Route("tricks/{slug}/update/image/delete/{id}", name="tricks_update_image_delete")
     * @param Image $image
     * @param ImageService $imageService
     * @return RedirectResponse
     */
    public function delete(Image $image, ImageService $imageService)
    {
        $id = $image->getTricks()->getId();
        $imageService->deleteImage($image);

        return $this->redirectToRoute('tricks_update', ['id' => $id]);
    }
}