<?php

namespace App\Security;

use App\Entity\User as AppUser;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\Security\Core\Exception\AccountExpiredException;
use Symfony\Component\Security\Core\User\UserCheckerInterface;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * Class UserChecker
 * @package App\Security
 */
class UserChecker implements UserCheckerInterface
{
    /**
     * @param UserInterface $user
     */
    public function checkPreAuth(UserInterface $user)
    {
        if (!$user instanceof AppUser) {
            return;
        }

    }

    /**
     * @param UserInterface $user
     */
    public function checkPostAuth(UserInterface $user)
    {
        if (!$user instanceof AppUser) {
            return;
        }
        // Only in prod
        // if user didn't valid the email
        if ($user->getRegistrationToken() != null) {
            throw new HttpException(498, "Le token n'a pas été validé");
        }
    }
}