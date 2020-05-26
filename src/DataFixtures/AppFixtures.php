<?php

namespace App\DataFixtures;

use App\Entity\Comment;
use App\Entity\Image;
use App\Entity\Role;
use App\Entity\Tricks;
use App\Entity\User;
use App\Entity\Video;
use Cocur\Slugify\Slugify;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Faker;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

/**
 * Class AppFixtures
 * @package App\DataFixtures
 */
class AppFixtures extends Fixture
{
    /**
     * @var UserPasswordEncoderInterface
     */
    private $encoder;

    /**
     * AppFixtures constructor.
     * @param UserPasswordEncoderInterface $encoder
     */
    public function __construct(UserPasswordEncoderInterface $encoder)
    {
        $this->encoder = $encoder;
    }

    /**
     * @param ObjectManager $manager
     */
    public function load(ObjectManager $manager)
    {

        $faker = Faker\Factory::create();

        $adminRole = new Role();
        $adminRole->setTitle("ROLE_ADMIN");
        $manager->persist($adminRole);


        $adminUser = new User;
        $adminUser->setFirstName("Théo")
                ->setLastName("Kinder")
                ->setEmail("kinder.theo@gmail.com")
                ->setPassword($this->encoder->encodePassword($adminUser,"password"))
                ->setPicture("https://avatars.io/twitter/logiezer")
                ->addUserRole($adminRole);
        $manager->persist($adminUser);
        $manager->flush();
        $slugify = new Slugify();

        $users = [];
        /* generate user*/
        for($i= 0; $i <= 10; $i++){
            $user = new User();


            $firstName = $faker->firstName('female');
            $lastName = $faker->lastName;
            $slug = $slugify->slugify($firstName . $lastName);
            $email = $faker->email;
            if(mt_rand(1,2) == 1){
                $introduction = $faker->sentence();
            } else {
                $introduction = null;
            }
            $password = $this->encoder->encodePassword($user, "password");
            $picture = "https://randomuser.me/api/portraits/women/". $faker->numberBetween(1,99).".jpg";

            $user->setFirstName($firstName)
                ->setLastName($lastName)
                ->setEmail($email)
                ->setPassword($password)
                ->setPicture($picture)
                ->setIntroduction($introduction);
            $manager->persist($user);
            $users[] = $user;
        }


        $count = count($users);

        $tricks = [];
        $cat = ['Slide', 'Rotation', 'Grab'];
        /* generate tricks */
        for($i = 1; $i <= 15; $i++){
            $trick = new Tricks();

            $name = $faker->sentence(2);
            $image = "img/tricks".mt_rand(1,12).".jpg";

            $trick->setName($name)
                ->setCategory( $cat[mt_rand(0,count($cat) - 1)] )
                ->setDescription($faker->paragraph())
                ->setMainImage($image)
                ->setCreatedAt($faker->dateTimeBetween("-6 months", "now"))
                ->setAuthor($users[mt_rand(0, $count - 1)]);

            $tricks[] = $trick;

            $manager->persist($trick);
        }

        /*generate images for tricks*/
        for($i= 1; $i<= 100; $i++){
            $image = new Image();
            $image->setPath("img/tricks".mt_rand(1,12).".jpg")
                ->setName("random")
                ->setImage("image")
                ->setTricks($tricks[mt_rand(0, count($tricks)-1)]);
            $manager->persist($image);
            $manager->flush();
        }

        /*generate videos for tricks*/
        for($i= 1; $i<= 25; $i++){
            $image = new Video();
            $image->setVideo("https://www.youtube.com/embed/SQyTWk7OxSI")
                ->setName($faker->word)
                ->setTricks($tricks[mt_rand(0, count($tricks)-1)]);
            $manager->persist($image);
            $manager->flush();
        }

        /*generate comment*/
        for($i = 1; $i <= 100; $i++){
            $comment = new Comment();
            $comment->setContent($faker->paragraph())
                    ->setTricks($tricks[array_rand($tricks)])
                    ->setAuthor($users[array_rand($users)])
                    ->setDate($faker->dateTimeBetween('-3 months', 'now'));
            $manager->persist($comment);
        }

        $manager->flush();
    }
}
