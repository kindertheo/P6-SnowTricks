<?php

namespace App\Entity;

use Symfony\Component\Validator\Constraints as Assert;

/**
 * Class PasswordUpdate
 * @package App\Entity
 */
class PasswordUpdate
{

    /**
     * @var
     */
    private $oldPassword;

    /**
     * @Assert\Length(min=8, minMessage="Votre mot de passe doit faire au moins 8 caractères")
     */
    private $newPassword;

    /**
     * @Assert\EqualTo(propertyPath="newPassword", message="Les mots de passes ne sont pas identiques")
     */
    private $confirmPassword;

    /**
     * @return string|null
     */
    public function getOldPassword(): ?string
    {
        return $this->oldPassword;
    }

    /**
     * @param string $oldPassword
     * @return $this
     */
    public function setOldPassword(string $oldPassword): self
    {
        $this->oldPassword = $oldPassword;

        return $this;
    }

    /**
     * @return string|null
     */
    public function getNewPassword(): ?string
    {
        return $this->newPassword;
    }

    /**
     * @param string $newPassword
     * @return $this
     */
    public function setNewPassword(string $newPassword): self
    {
        $this->newPassword = $newPassword;

        return $this;
    }

    /**
     * @return string|null
     */
    public function getConfirmPassword(): ?string
    {
        return $this->confirmPassword;
    }

    /**
     * @param string $confirmPassword
     * @return $this|null
     */
    public function setConfirmPassword(string $confirmPassword): ?self
    {
        $this->confirmPassword = $confirmPassword;

        return $this;
    }
}
