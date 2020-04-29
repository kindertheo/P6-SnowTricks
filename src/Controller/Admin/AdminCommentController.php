<?php

namespace App\Controller\Admin;

use App\Entity\Comment;
use App\Entity\Tricks;
use App\Repository\CommentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminCommentController extends AbstractController
{
    /**
     * @Route("/admin/comment", name="admin_comment")
     * @param CommentRepository $comment
     * @return Response
     */
    public function index(CommentRepository $comment)
    {
        return $this->render('admin/admin_comment/index.html.twig', [
            'comments' => $comment->findAll()
        ]);
    }

    /**
     * @Route("admin/comment/delete/{id}", name="admin_comment_delete")
     * @param Comment $comment
     * @param EntityManagerInterface $manager
     * @return RedirectResponse
     */
    public function delete(Comment $comment, EntityManagerInterface $manager){
        $id = $comment->getId();
        $manager->remove($comment);
        $manager->flush();

        $this->addFlash("success", "Le commentaire n°$id a bien été supprimé");

        return $this->redirectToRoute("admin_comment");
    }
}
