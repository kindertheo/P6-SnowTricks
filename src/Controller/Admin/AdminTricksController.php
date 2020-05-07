<?php

namespace App\Controller\Admin;

use App\Entity\Comment;
use App\Entity\Tricks;
use App\Repository\TricksRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminTricksController extends AbstractController
{
    /**
     * @Route("/admin/tricks", name="admin_tricks")
     * @param TricksRepository $tricks
     * @return Response
     */
    public function index(TricksRepository $tricks)
    {
        return $this->render('admin/admin_tricks/index.html.twig', [
            'tricks' => $tricks->findAll()
        ]);
    }

    /**
     * @Route("admin/tricks/delete/{id}", name="admin_tricks_delete")
     * @param Tricks $tricks
     * @param EntityManagerInterface $manager
     *
     * @return RedirectResponse
     */
    public function delete(Tricks $tricks, EntityManagerInterface $manager){
        $name = $tricks->getName();

        $manager->remove($tricks);
        $manager->flush();

        $this->addFlash("success", "Le tricks '$name' a bien été supprimé");

        return $this->redirectToRoute("admin_tricks");
    }
}
