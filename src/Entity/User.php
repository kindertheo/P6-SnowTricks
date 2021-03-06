<?php

namespace App\Entity;

use Cocur\Slugify\Slugify;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Exception;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass="App\Repository\UserRepository")
 * @ORM\HasLifecycleCallbacks()
 * @UniqueEntity(
 *     fields={"email"},
 *     message="Cette adresse email est déjà utilisée")
 */
class User implements UserInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank
     */
    private $firstName;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank
     */
    private $lastName;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\Email(message="Veuillez renseigner un email valide")
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=255)
     *
     */
    private $picture;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\Length(min=8, minMessage="Votre mot de passe est trop court!", allowEmptyString="false")
     */
    private $password;

    /**
     * @Assert\EqualTo(propertyPath="password", message="Les mots de passes doivent etre identique")
     */
    public $passwordConfirm;
    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * @Assert\Length(min=10, minMessage="Votre introduction doit faire au moins 10 caractères", allowEmptyString="true")
     */
    private $introduction;

    /**
     * @ORM\Column(type="string", length=255)
     *
     */
    private $slug;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Tricks", mappedBy="author")
     */
    private $tricks;

    /**
     * @ORM\Column(type="datetime")
     */
    private $signUpDate;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Role", mappedBy="users")
     */
    private $userRoles;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Comment", mappedBy="author")
     */
    private $comments;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $registrationToken;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $regTokenCreatedAt;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $forgotPassToken;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $forgotPassTokenCreatedAt;

    /**
     * Initialise le slug
     *
     * @ORM\PrePersist()
     * @ORM\PreUpdate()
     */
    public function initializeSlug(){
        if(empty($this->slug)) {
            $slug = new Slugify();
            $this->slug = $slug->slugify($this->firstName. " " . $this->lastName);
        }
    }

    /**
     * Initialise la date
     *
     * @ORM\PreUpdate()
     * @ORM\PrePersist()
     * @throws Exception
     *
     */
    public function initializeDate(){
        $this->signUpDate = new \DateTime("now");
    }

    /**
     * Initialise l'image de profile
     *
     * @ORM\PrePersist()
     * @throws Exception
     *
     */
    public function initializePicture(){
        if(empty($this->getPicture())){
            $this->picture = 'img/profile/default_profile.jpg';
        }
    }


    /**
     * User constructor.
     */
    public function __construct()
    {
        $this->tricks = new ArrayCollection();
        $this->userRoles = new ArrayCollection();
        $this->comments = new ArrayCollection();
    }

    /**
     * @return int|null
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return string|null
     */
    public function getFirstName(): ?string
    {
        return $this->firstName;
    }

    /**
     * @param string $firstName
     * @return $this
     */
    public function setFirstName(string $firstName): self
    {
        $this->firstName = $firstName;

        return $this;
    }

    /**
     * @return string|null
     */
    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    /**
     * @param string $lastName
     * @return $this
     */
    public function setLastName(string $lastName): self
    {
        $this->lastName = $lastName;

        return $this;
    }

    /**
     * @return string|null
     */
    public function getFullName(): ?string
    {
        return "{$this->firstName} {$this->lastName}";
    }


    /**
     * @return string|null
     */
    public function getEmail(): ?string
    {
        return $this->email;
    }

    /**
     * @param string $email
     * @return $this
     */
    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * @return string|null
     */
    public function getPicture(): ?string
    {
        return $this->picture;
    }

    /**
     * @param string $picture
     * @return $this
     */
    public function setPicture(string $picture): self
    {
        $this->picture = $picture;

        return $this;
    }

    /**
     * @return string|null
     */
    public function getPassword(): ?string
    {
        return $this->password;
    }

    /**
     * @param string $password
     * @return $this
     */
    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @return string|null
     */
    public function getIntroduction(): ?string
    {
        return $this->introduction;
    }

    /**
     * @param string|null $introduction
     * @return $this
     */
    public function setIntroduction(?string $introduction): self
    {
        $this->introduction = $introduction;

        return $this;
    }

    /**
     * @return string|null
     */
    public function getSlug(): ?string
    {
        return $this->slug;
    }

    /**
     * @param string $slug
     * @return $this
     */
    public function setSlug(string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }

    /**
     * @return Collection|Tricks[]
     */
    public function getTricks(): Collection
    {
        return $this->tricks;
    }

    /**
     * @param Tricks $trick
     * @return $this
     */
    public function addTrick(Tricks $trick): self
    {
        if (!$this->tricks->contains($trick)) {
            $this->tricks[] = $trick;
            $trick->setAuthor($this);
        }

        return $this;
    }

    /**
     * @param Tricks $trick
     * @return $this
     */
    public function removeTrick(Tricks $trick): self
    {
        if ($this->tricks->contains($trick)) {
            $this->tricks->removeElement($trick);
            // set the owning side to null (unless already changed)
            if ($trick->getAuthor() === $this) {
                $trick->setAuthor(null);
            }
        }

        return $this;
    }

    /**
     * @return \DateTimeInterface|null
     */
    public function getSignUpDate(): ?\DateTimeInterface
    {
        return $this->signUpDate;
    }

    /**
     * @param \DateTimeInterface $signUpDate
     * @return $this
     */
    public function setSignUpDate(\DateTimeInterface $signUpDate): self
    {
        $this->signUpDate = $signUpDate;

        return $this;
    }

    /**
     * Returns the roles granted to the user.
     *
     *     public function getRoles()
     *     {
     *         return ['ROLE_USER'];
     *     }
     *
     * Alternatively, the roles might be stored on a ``roles`` property,
     * and populated in any number of different ways when the user object
     * is created.
     *
     * @return (Role|string)[] The user roles
     */
    public function getRoles()
    {
        $roles = $this->userRoles->map(function($role){
            return $role->getTitle();
        })->toArray();
        $roles[] = 'ROLE_USER';
        return $roles;
    }

    /**
     * Returns the salt that was originally used to encode the password.
     *
     * This can return null if the password was not encoded using a salt.
     *
     * @return string|null The salt
     */
    public function getSalt()
    {
    }

    /**
     * Returns the username used to authenticate the user.
     *
     * @return string The username
     */
    public function getUsername()
    {
        return $this->email;
    }

    /**
     * Removes sensitive data from the user.
     *
     * This is important if, at any given point, sensitive information like
     * the plain-text password is stored on this object.
     */
    public function eraseCredentials()
    {
        //Implement eraseCredentials() method.
    }

    /**
     * @return Collection|Role[]
     */
    public function getUserRoles(): Collection
    {
        return $this->userRoles;
    }

    /**
     * @param Role $userRole
     * @return $this
     */
    public function addUserRole(Role $userRole): self
    {
        if (!$this->userRoles->contains($userRole)) {
            $this->userRoles[] = $userRole;
            $userRole->addUser($this);
        }

        return $this;
    }

    /**
     * @param Role $userRole
     * @return $this
     */
    public function removeUserRole(Role $userRole): self
    {
        if ($this->userRoles->contains($userRole)) {
            $this->userRoles->removeElement($userRole);
            $userRole->removeUser($this);
        }

        return $this;
    }

    /**
     * @return Collection|Comment[]
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    /**
     * @param Comment $comment
     * @return $this
     */
    public function addComment(Comment $comment): self
    {
        if (!$this->comments->contains($comment)) {
            $this->comments[] = $comment;
            $comment->setAuthor($this);
        }

        return $this;
    }

    /**
     * @param Comment $comment
     * @return $this
     */
    public function removeComment(Comment $comment): self
    {
        if ($this->comments->contains($comment)) {
            $this->comments->removeElement($comment);
            // set the owning side to null (unless already changed)
            if ($comment->getAuthor() === $this) {
                $comment->setAuthor(null);
            }
        }

        return $this;
    }

    /**
     * @return string|null
     */
    public function getRegistrationToken(): ?string
    {
        return $this->registrationToken;
    }

    /**
     * @param string|null $registrationToken
     * @return $this
     */
    public function setRegistrationToken(?string $registrationToken): self
    {
        $this->registrationToken = $registrationToken;

        return $this;
    }

    /**
     * @return \DateTimeInterface|null
     */
    public function getRegTokenCreatedAt(): ?\DateTimeInterface
    {
        return $this->regTokenCreatedAt;
    }

    /**
     * @param \DateTimeInterface $regTokenCreatedAt
     * @return $this
     */
    public function setRegTokenCreatedAt(\DateTimeInterface $regTokenCreatedAt): self
    {
        $this->regTokenCreatedAt = $regTokenCreatedAt;

        return $this;
    }

    /**
     * @return string|null
     */
    public function getForgotPassToken(): ?string
    {
        return $this->forgotPassToken;
    }

    /**
     * @param string|null $forgotPassToken
     * @return $this
     */
    public function setForgotPassToken(?string $forgotPassToken): self
    {
        $this->forgotPassToken = $forgotPassToken;

        return $this;
    }

    /**
     * @return \DateTimeInterface|null
     */
    public function getForgotPassTokenCreatedAt(): ?\DateTimeInterface
    {
        return $this->forgotPassTokenCreatedAt;
    }

    /**
     * @param \DateTimeInterface|null $forgotPassTokenCreatedAt
     * @return $this
     */
    public function setForgotPassTokenCreatedAt(?\DateTimeInterface $forgotPassTokenCreatedAt): self
    {
        $this->forgotPassTokenCreatedAt = $forgotPassTokenCreatedAt;

        return $this;
    }
}
