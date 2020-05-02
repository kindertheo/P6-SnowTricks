<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Tricks;
use App\Form\CommentType;
use App\Form\TricksType;
use App\Form\TricksUpdateType;
use App\Repository\CommentRepository;
use App\Repository\TricksRepository;
use App\Service\ImageService;
use App\Service\UploadImgService;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TricksController extends AbstractController
{
    /*TODO Routing selon le slug et non l'id!*/
    /**
     * List of tricks
     * @Route("/tricks", name="tricks_show")
     * @param TricksRepository $tricks
     * @return Response
     */
    public function index(TricksRepository $tricks)
    {
        return $this->render('tricks/index.html.twig', [
            'tricks' => $tricks->findAll()
        ]);
    }

    /**
     * Page of one trick
     * @Route("/tricks/{id}", name="tricks_display",  requirements={"id"="\d+"})
     * @param TricksRepository $tricks
     * @param CommentRepository $comment
     * @param Request $request
     * @param EntityManagerInterface $manager
     * @param $id
     * @return Response
     */
    /*TODO Créer un service de pagination !*/
    public function display(TricksRepository $tricks, CommentRepository $comment, Request $request, EntityManagerInterface $manager, $id){
        //create form for comment
        $newComment = new Comment();
        $form = $this->createForm(CommentType::class, $newComment);

        $form->handleRequest($request);
        /*Formulaire des commentaires*/
        if($form->isSubmitted() && $form->isValid() && $this->getUser()){
            /*Ajoute l'utilisateur et le trick au commentaire*/
            $newComment->setAuthor($this->getUser())
                    ->setTricks($tricks->findOneById($id));

            $manager->persist($newComment);
            $manager->flush();

            $this->addFlash("success", "Le commentaire a bien été ajouté!");
            /*Affiche la vue avec l'ajout du commentaire*/
            return $this->redirectToRoute("tricks_display", ['id' => $id]);
        }

        /*Affiche la vue du trick*/
        return $this->render("tricks/display.html.twig", [
            'tricks' => $tricks->findOneById($id),
            'comments' => $comment->findBy([
                'tricks' => $id
            ]),
            'form' => $form->createView()
        ]);
    }

    /**
     * @IsGranted("ROLE_USER")
     * @Route("/tricks/add/", name="tricks_add")
     * @param EntityManagerInterface $manager
     * @param Request $request
     * @param UploadImgService $uploadImgService
     * @return Response
     */
    public function add(EntityManagerInterface $manager, Request $request, UploadImgService $uploadImgService){
        $tricks = new Tricks;

        $form = $this->createForm(TricksType::class, $tricks);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            /*TODO Corriger ces deux lignes*/
            $uploadImgService->upload($form['mainImage']->getData());
            $tricks->setMainImage("img/".$uploadImgService->getFileNameMainImage());
            $tricks->setAuthor($this->getUser());

            /*Persiste et ajoute à la bdd*/
            $manager->persist($tricks);
            $manager->flush();

            $this->addFlash("success", "Le tricks a bien été ajouté!");

            return $this->redirectToRoute("tricks_update", ['id' => $tricks->getId()]);
        }
        elseif($form->getErrors(true, false)->count() > 0){

            $this->addFlash("danger", $form->getErrors(true));

            return $this->redirectToRoute("tricks_show");
        }

        return $this->render("tricks/add.html.twig", [
            'form' => $form->createView(),
            'tricks' => $tricks
        ]);
    }

    /**
     * @IsGranted("ROLE_USER")
     * @Route("/tricks/{id}/delete", name="tricks_delete",  requirements={"id"="\d+"})
     * @param Tricks $tricks
     * @param EntityManagerInterface $manager
     * @param ImageService $imageService
     * @return RedirectResponse
     */
    /*TODO Delete image */
    public function delete(Tricks $tricks, EntityManagerInterface $manager, ImageService $imageService){
        /*Delete images in directory */
        $imageService->deleteAllImageFromTrick($tricks);
        $manager->remove($tricks);
        $manager->flush();

        $this->addFlash("success", "Le tricks {$tricks->getName()} a bien été supprimé");

        return $this->redirectToRoute("tricks_show");
    }

    /**
     * @IsGranted("ROLE_USER")
     * @Route("tricks/{id}/update", name="tricks_update",  requirements={"id"="\d+"})
     * @param Tricks $tricks
     * @param EntityManagerInterface $manager
     * @param Request $request
     * @param UploadImgService $upload
     * @return Response
     */
    public function update(Tricks $tricks, EntityManagerInterface $manager, Request $request, UploadImgService $upload){
        $form = $this->createForm(TricksUpdateType::class, $tricks);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){

            $manager->persist($tricks);
            $manager->flush();

            $this->addFlash("success", "Le tricks a bien été modifié!");

            return $this->redirectToRoute("tricks_display", ['id' => $tricks->getId()]);
        }

        return $this->render("tricks/update.html.twig", ['form' => $form->createView(), 'tricks' => $tricks]);
    }
}
