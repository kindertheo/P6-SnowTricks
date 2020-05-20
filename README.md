# P6-SnowTricks

[![Maintainability](https://api.codeclimate.com/v1/badges/65097762cad55a9570e6/maintainability)](https://codeclimate.com/github/kindertheo/P6-SnowTricks/maintainability)

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/5972e2b4b9bd4ea49c5ae5c3238ceeb5)](https://www.codacy.com/manual/kindertheo/P6-SnowTricks?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=kindertheo/P6-SnowTricks&amp;utm_campaign=Badge_Grade)

---
## Procédure d'installation

### 1 - Télécharger et extraire le projet

    wget https://github.com/kindertheo/P6-SnowTricks.git
    
### 2 - Installer les dépendances

    composer install

### 3 - Modifier le fichier .env

* Vos identifiants de base de données

> Ligne 32 : DATABASE_URL=mysql://LOGIN:PASSWORD@127.0.0.1:3306/DATABASENAME?serverVersion=5.7

* Votre SMTP

> Ligne 39 : MAILER_URL=smtp://SMTP:465?encryption=ssl&auth_mode=login&username=USERNAME&password=PASSWORD

* Passer de développement à production

> Ligne 17 : APP_ENV=dev par APP_ENV=prod

### 4 - Initialiser la base de données

2 méthodes :

> * Soit utiliser le fichier .sql dans le dossier racine et l'importer dans votre SGBD
> * Soit utiliser les migrations de doctrine et les fixtures


    php bin/console doctrine:migrations:migrate 
    php bin/console doctrine:fixtures:load