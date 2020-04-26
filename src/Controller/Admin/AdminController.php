<?php

namespace App\Controller\Admin;

use App\Service\StatsService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    /**
     * @Route("/admin/", name="admin_index")
     * @param StatsService $statsService
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function index(StatsService $statsService)
    {
        $tricksCount = $statsService->getTricksCount();
        $usersCount = $statsService->getUsersCount();
        $commentsCount = $statsService->getCommentsCount();
        return $this->render('admin/admin/index.html.twig', [
            'tricksCount' => $tricksCount,
            'usersCount' => $usersCount,
            'commentsCount' => $commentsCount
        ]);
    }
}
