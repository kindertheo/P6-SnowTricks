<?php

namespace App\DataFixtures;

use App\Entity\Tricks;
use Cocur\Slugify\Slugify;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Faker;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {

        $faker = Faker\Factory::create();
        $slugify = new Slugify();

        for($i = 1; $i <= 12; $i++){
            $trick = new Tricks();

            $name = $faker->sentence(2);
            $slug = $slugify->slugify($name);
            $image = "img/tricks".mt_rand(1,5).".jpg";

            $trick->setName($name)
                ->setDescription($faker->paragraph())
                ->setImage($image)
                ->setSlug($slug);

            $manager->persist($trick);
        }
        $manager->flush();
    }
}
