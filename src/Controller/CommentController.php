<?php

namespace App\Controller;

use App\Entity\Comment;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\Annotation\Route;

class CommentController extends AbstractController
{
    /**
     * @Route("/comment", name="comment")
     */
    public function index()
    {
        return $this->render('comment/index.html.twig', [
            'controller_name' => 'CommentController',
        ]);
    }

    /**
     * @Route("/comment/delete/{id}", name="comment_delete")
     * @param Comment $comment
     * @param EntityManagerInterface $manager
     * @return RedirectResponse
     */
    public function delete(Comment $comment, EntityManagerInterface $manager){
        $manager->remove($comment);
        $manager->flush();

        $this->addFlash("success", "Le commentaire a bien été supprimé");

        return $this->redirectToRoute("user_profile", ['id' => $this->getUser()->getId()]);
    }
}
