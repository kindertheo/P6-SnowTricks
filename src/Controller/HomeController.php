<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\TricksRepository;

/**
 * Class HomeController
 * @package App\Controller
*/
class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(TricksRepository $repo)
    {
        $tricks = $repo->findAll();
        return $this->render('home/index.html.twig', [
            'tricks' => $tricks
        ]);
    }
}
