<?php

namespace App\Tests\Unit;


use Faker;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class AccountTest extends WebTestCase
{
    //fail test
    public function testFailureCheckPassword()
    {
        $client = static::createClient();

        $crawler = $client->request(
            'GET',
            '/account/register'
        );

        $form = $crawler->selectButton('Inscription')->form();

        $form['register[email]'] = 'toto@email.com';
        $form['register[firstName]'] = 'usernametest';
        $form['register[lastName]'] = 'Doe';
        $form['register[password]'] = 'pass1';
        $form['register[passwordConfirm]'] = 'pass1236';

        $crawler = $client->submit($form);

        $alert = $crawler->filter('.form-error-message')->count();
        $this->assertEquals(1, $alert);
    }


    //success test
    public function testcreateAccount()
    {
        $faker = Faker\Factory::create();
        $client = static::createClient();

        $crawler = $client->request(
            'GET',
            '/account/register'
        );

        $form = $crawler->selectButton('Inscription')->form();

        $form['register[email]'] = $faker->safeEmail;
        $form['register[firstName]'] = $faker->firstName;
        $form['register[lastName]'] = $faker->lastName;
        $form['register[password]'] = 'password';
        $form['register[passwordConfirm]'] = 'password';

        $crawler = $client->submit($form);

        //echo $client->getResponse()->getContent();


        $alert = $crawler->filter('.form-error-message')->count();
        $this->assertEquals(0, $alert);
    }

    public function testLogin(){
        $client = static::createClient();

        $crawler = $client->request(
            'GET',
            '/account/login'
        );

        $form = $crawler->selectButton('Connexion')->form();

        $form['_username'] = 'kinder.theo@gmail.com';
        $form['_password'] = 'password';

        $crawler = $client->submit($form);

        $alert = $crawler->filter('.form-error-message')->count();
        if($alert > 0){
            $message = $crawler->filter('.form-error-message')->text();
        } else {
            $message = "";
        }
        $this->assertEquals(0, $alert, $message);
    }


}