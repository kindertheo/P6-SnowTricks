<?php

namespace App\Service;

use Doctrine\ORM\EntityManagerInterface;

class StatsService{

    private $manager;

    public function __construct(EntityManagerInterface $manager)
    {
        $this->manager = $manager;
    }

    public function getTricksCount(){
        return $this->manager->createQuery("SELECT COUNT(t) FROM App\Entity\Tricks t")->getSingleScalarResult();
    }

    public function getUsersCount(){
        return $this->manager->createQuery("SELECT COUNT(u) FROM App\Entity\User u")->getSingleScalarResult();
    }

    public function getCommentsCount(){
        return $this->manager->createQuery("SELECT COUNT(c) FROM App\Entity\Comment c")->getSingleScalarResult();
    }

}