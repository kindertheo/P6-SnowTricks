<?php

namespace App\Service;

use Doctrine\ORM\EntityManagerInterface;

/**
 * Class StatsService
 * @package App\Service
 */
class StatsService{

    /**
     * @var EntityManagerInterface
     */
    private $manager;

    /**
     * StatsService constructor.
     * @param EntityManagerInterface $manager
     */
    public function __construct(EntityManagerInterface $manager)
    {
        $this->manager = $manager;
    }

    /**
     * @return mixed
     * @throws \Doctrine\ORM\NoResultException
     * @throws \Doctrine\ORM\NonUniqueResultException
     */
    public function getTricksCount(){
        return $this->manager->createQuery("SELECT COUNT(t) FROM App\Entity\Tricks t")->getSingleScalarResult();
    }

    /**
     * @return mixed
     * @throws \Doctrine\ORM\NoResultException
     * @throws \Doctrine\ORM\NonUniqueResultException
     */
    public function getUsersCount(){
        return $this->manager->createQuery("SELECT COUNT(u) FROM App\Entity\User u")->getSingleScalarResult();
    }

    /**
     * @return mixed
     * @throws \Doctrine\ORM\NoResultException
     * @throws \Doctrine\ORM\NonUniqueResultException
     */
    public function getCommentsCount(){
        return $this->manager->createQuery("SELECT COUNT(c) FROM App\Entity\Comment c")->getSingleScalarResult();
    }

}