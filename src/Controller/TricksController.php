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
use App\Service\Pagination\PaginationCommentService;
use App\Service\UploadImgService;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Class TricksController
 * @package App\Controller
 */
class TricksController extends AbstractController
{
    /**
     * List of tricks
     * @Route("/tricks", name="tricks_show")
     * @param TricksRepository $tricks
     * @return Response
     */
    public function index(TricksRepository $tricks)
    {
        return $this->render('tricks/index.html.twig', [
            'tricks' => $tricks->findAll(),
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
            /*Upload l'image et l'ajoute comme main image*/
            $uploadImgService->upload($form['mainImage']->getData());
            $tricks->setMainImage("img/".$uploadImgService->getFileNameMainImage());
            /*Lie l'utilisateur au tricks*/
            $tricks->setAuthor($this->getUser());

            /*Persiste et ajoute à la bdd*/
            $manager->persist($tricks);
            $manager->flush();

            $this->addFlash("success", "Ajoutez des images et des vidéos au tricks");
            /*Redirige vers la page de modification pour qu'il ajoute des images et des vidéos*/
            return $this->redirectToRoute("tricks_update", ['slug' => $tricks->getSlug()]);
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


    /*TODO Pagination service*/
    /**
     * Page of one trick
     * @Route("/tricks/{slug}/{page<\d+>?1}", name="tricks_display",  requirements={"id"="\d+"})
     * @param Tricks $tricks
     * @param CommentRepository $comment
     * @param Request $request
     * @param EntityManagerInterface $manager
     * @param PaginationCommentService $paginationService
     * @param $page
     * @return Response
     */
    public function display(Tricks $tricks, CommentRepository $comment, Request $request, EntityManagerInterface $manager, PaginationCommentService $paginationService, $page){
        //create form for comment
        $newComment = new Comment();
        $form = $this->createForm(CommentType::class, $newComment);

        $form->handleRequest($request);
        /*Formulaire des commentaires*/
        if($form->isSubmitted() && $form->isValid() && $this->getUser()){
            /*Ajoute l'utilisateur et le trick au commentaire*/
            $newComment->setAuthor($this->getUser())
                       ->setTricks($tricks);

            $manager->persist($newComment);
            $manager->flush();

            $this->addFlash("success", "Le commentaire a bien été ajouté!");
            /*Affiche la vue avec l'ajout du commentaire*/
            return $this->redirectToRoute("tricks_display", ['slug' => $tricks->getSlug()]);
        }

        $paginationService->setEntityClass(Comment::class)
            ->setLimit(10)
            ->setPage($page)
            ->setEntitySlug($tricks->getSlug())
            ->setTricks($tricks);

        /*Affiche la vue du trick*/
        return $this->render("tricks/display.html.twig", [
            'tricks' => $tricks,
            'comments' => $comment->findBy([
                'tricks' => $tricks
            ]),
            'form' => $form->createView(),
            'pagination' => $paginationService
        ]);
    }

    /**
     * @IsGranted("ROLE_USER")
     * @Route("/tricks/{slug}/delete", name="tricks_delete",  requirements={"id"="\d+"})
     * @param Tricks $tricks
     * @param EntityManagerInterface $manager
     * @param ImageService $imageService
     * @return RedirectResponse
     */
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
     * @Route("tricks/{slug}/update", name="tricks_update",  requirements={"id"="\d+"})
     * @param Tricks $tricks
     * @param EntityManagerInterface $manager
     * @param Request $request
     * @return Response
     */
    public function update(Tricks $tricks, EntityManagerInterface $manager, Request $request){
        $form = $this->createForm(TricksUpdateType::class, $tricks);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){

            $manager->persist($tricks);
            $manager->flush();

            $this->addFlash("success", "Le tricks a bien été modifié!");

            return $this->redirectToRoute("tricks_display", ['slug' => $tricks->getSlug()]);
        }

        return $this->render("tricks/update.html.twig", ['form' => $form->createView(), 'tricks' => $tricks]);
    }
}
