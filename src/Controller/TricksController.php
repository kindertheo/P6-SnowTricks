<?php

namespace App\Controller;

use App\Entity\Tricks;
use App\Form\TricksType;
use App\Repository\TricksRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TricksController extends AbstractController
{
    /**
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
     * @Route("/tricks/{id}", name="tricks_display",  requirements={"id"="\d+"})
     * @param TricksRepository $tricks
     * @param $id
     * @return Response
     */
    public function display(TricksRepository $tricks, $id){

        return $this->render("tricks/display.html.twig", [
            'tricks' => $tricks->findOneById($id)
        ]);
    }

    /**
     * @Route("/tricks/add/", name="tricks_add")
     * @param EntityManagerInterface $manager
     * @param Request $request
     * @return RedirectResponse|Response
     */
    public function add(EntityManagerInterface $manager, Request $request){
        $tricks = new Tricks;

        $form = $this->createForm(TricksType::class, $tricks);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $manager->persist($tricks);
            $manager->flush();

            $this->addFlash("success", "Le tricks a bien été ajouté!");

            return $this->redirectToRoute("tricks_show");
        }

        return $this->render("tricks/add.html.twig", [
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/tricks/{id}/delete", name="tricks_delete",  requirements={"id"="\d+"})
     * @param Tricks $tricks
     * @param EntityManagerInterface $manager
     * @return RedirectResponse
     */
    public function delete(Tricks $tricks, EntityManagerInterface $manager){
        $manager->remove($tricks);
        $manager->flush();

        $this->addFlash("success", "Le tricks {$tricks->getName()} a bien été supprimé");

        return $this->redirectToRoute("tricks_show");
    }

    /**
     * @Route("tricks/{id}/update", name="tricks_update",  requirements={"id"="\d+"})
     * @param Tricks $tricks
     * @param EntityManagerInterface $manager
     * @param Request $request
     * @return Response
     */
    public function update(Tricks $tricks, EntityManagerInterface $manager, Request $request){
        $form = $this->createForm(TricksType::class, $tricks);

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
