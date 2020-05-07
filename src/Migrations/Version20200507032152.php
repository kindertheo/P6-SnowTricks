<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200507032152 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE comment DROP FOREIGN KEY comment_ibfk_1');
        $this->addSql('ALTER TABLE comment ADD CONSTRAINT FK_9474526C3B153154 FOREIGN KEY (tricks_id) REFERENCES tricks (id)');
        $this->addSql('ALTER TABLE video DROP FOREIGN KEY video_ibfk_1');
        $this->addSql('ALTER TABLE video ADD CONSTRAINT FK_7CC7DA2C3B153154 FOREIGN KEY (tricks_id) REFERENCES tricks (id)');
        $this->addSql('ALTER TABLE image DROP FOREIGN KEY image_ibfk_1');
        $this->addSql('ALTER TABLE image ADD CONSTRAINT FK_C53D045F3B153154 FOREIGN KEY (tricks_id) REFERENCES tricks (id)');
        $this->addSql('ALTER TABLE tricks ADD category VARCHAR(255) NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE comment DROP FOREIGN KEY FK_9474526C3B153154');
        $this->addSql('ALTER TABLE comment ADD CONSTRAINT comment_ibfk_1 FOREIGN KEY (tricks_id) REFERENCES tricks (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE image DROP FOREIGN KEY FK_C53D045F3B153154');
        $this->addSql('ALTER TABLE image ADD CONSTRAINT image_ibfk_1 FOREIGN KEY (tricks_id) REFERENCES tricks (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE tricks DROP category');
        $this->addSql('ALTER TABLE video DROP FOREIGN KEY FK_7CC7DA2C3B153154');
        $this->addSql('ALTER TABLE video ADD CONSTRAINT video_ibfk_1 FOREIGN KEY (tricks_id) REFERENCES tricks (id) ON DELETE CASCADE');
    }
}
