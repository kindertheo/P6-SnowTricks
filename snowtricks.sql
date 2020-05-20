-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `snowtricks`;
CREATE DATABASE `snowtricks` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `snowtricks`;

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `tricks_id` int DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CF675F31B` (`author_id`),
  KEY `IDX_9474526C3B153154` (`tricks_id`),
  CONSTRAINT `FK_9474526C3B153154` FOREIGN KEY (`tricks_id`) REFERENCES `tricks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9474526CF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `comment` (`id`, `author_id`, `tricks_id`, `content`, `date`) VALUES
(101,	20,	24,	'Porro fuga repellendus ut voluptatem optio enim. Et iste voluptatum et nulla sit. Ut vel id inventore fuga aut. Quia sunt culpa optio tempora.',	'2020-03-25 01:55:28'),
(102,	14,	16,	'Eaque eum minus laboriosam consequatur qui. Praesentium animi mollitia doloribus asperiores. Magnam et error et optio aut.',	'2020-05-11 04:43:58'),
(103,	18,	24,	'Modi tenetur doloribus rerum possimus. Nemo suscipit illo rerum perferendis. Fuga est aut maxime totam.',	'2020-02-27 07:50:14'),
(104,	15,	24,	'Incidunt qui consectetur ducimus at ad. Quo rerum culpa perspiciatis commodi amet. Molestias et molestias iste maxime aut cupiditate autem.',	'2020-05-15 10:44:42'),
(105,	18,	27,	'Cum vero quas iusto earum quos. Voluptatem perferendis adipisci ipsa minus. Qui eos tempore nulla et.',	'2020-02-23 19:33:59'),
(106,	16,	21,	'Quisquam delectus molestias rerum dolor quaerat. Eaque repudiandae asperiores earum voluptatum dicta. Fugit sint reprehenderit enim natus possimus rerum deserunt voluptas. Omnis accusantium enim autem sed a.',	'2020-04-05 13:29:24'),
(107,	23,	18,	'Culpa voluptas quod officiis quam in sed. Ullam nostrum minima est et corrupti. Perspiciatis voluptatibus aut in porro architecto repudiandae repudiandae.',	'2020-03-30 08:10:29'),
(108,	14,	22,	'Dolore provident quia at officiis quod ullam sunt. Cum dolorem ea amet nihil cum. Aut consequuntur non nihil assumenda modi velit delectus. Ut commodi occaecati laborum. Possimus hic voluptas porro ea corporis.',	'2020-04-12 11:05:41'),
(109,	18,	25,	'Nulla eveniet error soluta quas corrupti quod. Dolores aspernatur ut consequatur omnis non. Cum error tenetur modi assumenda repellendus in.',	'2020-03-12 07:11:04'),
(110,	14,	27,	'Repudiandae itaque alias est aperiam vel alias. Cumque perspiciatis nihil maxime reprehenderit exercitationem nostrum ut. Aliquam voluptatem fuga debitis ad.',	'2020-05-14 22:27:21'),
(111,	17,	27,	'Quos voluptatibus quia voluptatem dolores cupiditate. Voluptatem et cumque et. Qui nihil repellendus cumque esse voluptate.',	'2020-02-28 14:32:46'),
(112,	23,	30,	'Quam eum mollitia possimus et possimus et. Neque eveniet reprehenderit sapiente aut dolorum. Sed quaerat sequi odio quis aut quod rem. Aliquam non quisquam eum sunt dolore.',	'2020-04-28 05:41:31'),
(113,	19,	25,	'Voluptatem maiores ipsa ducimus voluptatem aut eveniet sint. Ut ipsam et cumque totam est atque molestias adipisci. Repellendus cupiditate eum totam nihil et dolores.',	'2020-02-22 08:50:10'),
(114,	22,	29,	'Debitis dignissimos ea dignissimos qui a. Reiciendis ea aliquam nulla aut a odio excepturi. Consequatur in eligendi ea ex quas enim. Quas rerum enim in et.',	'2020-05-04 07:32:43'),
(115,	18,	20,	'Vero maxime occaecati quis ea est. Quo ducimus dolor culpa non molestias delectus et. Vitae corporis reprehenderit eum. Explicabo ea explicabo consequatur est praesentium quam in pariatur.',	'2020-05-14 12:36:21'),
(116,	20,	19,	'Adipisci voluptatem quia sequi maiores saepe sunt et. Quam et provident voluptatem consequuntur. Veniam eligendi eos odio.',	'2020-03-30 07:41:34'),
(117,	16,	30,	'Asperiores velit architecto impedit. Qui perferendis debitis similique saepe. Laudantium harum incidunt molestiae magni delectus itaque ipsum. Quisquam veritatis adipisci repudiandae aut voluptas.',	'2020-03-22 15:30:22'),
(118,	17,	17,	'Unde et et laudantium quos nemo. Saepe nulla laborum minus quae distinctio neque error modi. Reprehenderit et quia beatae voluptatem officia accusantium. Et repellendus illum autem vitae quo minus tempora necessitatibus.',	'2020-05-04 04:19:47'),
(119,	24,	24,	'Quia quibusdam aut blanditiis cum soluta. Consequatur quis voluptatem ut itaque totam enim ducimus iusto. Quia quia non est recusandae amet architecto ut. Voluptatem nihil aspernatur in dolore autem molestias architecto sit.',	'2020-05-03 09:06:24'),
(120,	21,	25,	'Blanditiis sit qui harum quia id minima mollitia. Aut earum a sint nemo est. Est impedit occaecati nulla est minus molestiae modi.',	'2020-04-28 19:21:38'),
(121,	19,	29,	'Ut ut optio eaque quis similique cumque iste voluptatem. Consequatur quibusdam et nihil aut voluptatem deserunt. Nihil accusantium quia dignissimos aspernatur placeat sed. Consectetur repellat ut molestias ut qui.',	'2020-03-22 02:05:37'),
(122,	21,	29,	'Deleniti praesentium qui et voluptas exercitationem amet. Necessitatibus delectus quos autem quia voluptate quidem. Nulla incidunt nisi ipsum quia. Qui dolore architecto sed atque omnis mollitia. Dolores ut rem tempore vel incidunt eaque.',	'2020-02-26 09:02:45'),
(123,	24,	27,	'Modi sunt quidem aperiam deserunt. Asperiores non molestiae voluptatem architecto. Ipsa dolores rerum provident cumque et eveniet. Modi et sint qui beatae.',	'2020-03-24 17:32:00'),
(124,	17,	20,	'Quos quos quos in. Ut quis perspiciatis tenetur dolores aut nostrum consequatur modi. Est et dolores blanditiis esse eos suscipit aut commodi. Aut sunt excepturi earum.',	'2020-02-23 11:37:42'),
(125,	17,	19,	'Laudantium deserunt et provident alias. Cupiditate nesciunt ut consequuntur voluptatem dignissimos. Occaecati debitis sunt consectetur consequatur ut sapiente aut consequatur. Perspiciatis et culpa dolore quis qui consectetur.',	'2020-04-03 18:51:08'),
(126,	23,	21,	'A assumenda consequuntur repellendus quidem officia incidunt. Commodi ullam soluta recusandae nam. Quidem et est rerum nihil dolorum deleniti reprehenderit aut.',	'2020-02-26 02:03:42'),
(127,	20,	26,	'Nam molestiae est dolorem labore. Deserunt sint id quidem assumenda at veritatis deserunt. Nesciunt ducimus quam omnis. Quis ipsum velit dolorum.',	'2020-05-06 02:06:25'),
(128,	23,	27,	'Odio et id ad nisi. Et sed quisquam ex repellat.',	'2020-04-22 11:36:39'),
(129,	22,	20,	'Omnis amet ea excepturi omnis repellendus. Facilis repudiandae asperiores rerum ut magnam dolores accusamus numquam. Commodi tenetur nihil officia voluptas.',	'2020-03-03 07:23:01'),
(130,	14,	17,	'Et quos deserunt sunt quos fugit. Impedit dicta repellat hic quis officia expedita. Dicta ea id illo ut sequi accusamus.',	'2020-04-24 15:16:11'),
(131,	14,	18,	'Aut quo molestiae provident est in incidunt error et. Aperiam dolores molestias totam incidunt quasi. Nemo eum ut est optio minus nisi velit.',	'2020-05-15 21:25:17'),
(132,	22,	30,	'Suscipit id molestias exercitationem cupiditate maxime consequatur. Tenetur sequi a amet praesentium. Et quo officiis consequatur vero commodi.',	'2020-04-11 18:49:48'),
(133,	21,	28,	'Rerum est aliquid consequatur quasi aliquid. Reprehenderit pariatur quae nulla est dolor ullam adipisci esse. Eum iste aut odit perferendis.',	'2020-03-16 13:05:36'),
(134,	19,	29,	'Sed quaerat non nihil culpa magnam labore consequatur molestias. Possimus facilis aut neque cupiditate. Quam dolorem rerum doloribus vel.',	'2020-04-14 15:52:43'),
(135,	19,	16,	'At itaque consequatur velit provident qui doloremque qui. Omnis aut illo quasi quod assumenda.',	'2020-04-29 16:35:57'),
(136,	23,	22,	'Cumque accusamus vitae eveniet autem dolore. Quasi molestiae beatae fugit consequatur praesentium blanditiis eum. Aliquid voluptatem recusandae minus sunt suscipit velit. Earum ad rerum et.',	'2020-03-25 00:31:53'),
(137,	17,	18,	'Adipisci voluptatem magni ea aut. Earum ut dolores eum iure temporibus. Enim vel eum non eaque facilis ipsa.',	'2020-03-27 19:30:39'),
(138,	21,	25,	'Dicta voluptate nesciunt et est officia. Iure dolor earum culpa dolorum architecto. Et atque sed vero omnis perspiciatis pariatur soluta. Sed neque perspiciatis eos eaque alias.',	'2020-03-08 11:59:47'),
(139,	14,	21,	'Eligendi aut occaecati quis consequatur cumque aut aut. Illum et sit eius sed. Eos est consequuntur eveniet odio ut accusantium dolorem quia. Vitae illum velit illum.',	'2020-03-22 05:01:34'),
(140,	19,	29,	'Consectetur qui doloremque id perferendis. Commodi quia exercitationem id error optio aut eos. Autem in possimus quas officia voluptates minus totam.',	'2020-04-07 22:15:01'),
(141,	24,	16,	'At cumque sit dignissimos qui. Laudantium distinctio est est sunt eligendi maiores corrupti. Omnis voluptatem provident doloribus sunt placeat sequi officia in. Quos quaerat eum quis accusamus repellat voluptatem.',	'2020-03-18 03:11:04'),
(142,	21,	19,	'Temporibus eum cumque sint est. Consequatur error cupiditate rem. Sunt quis et quidem repellendus repellat.',	'2020-05-13 16:32:44'),
(143,	17,	19,	'Quia optio dignissimos amet. Quis est beatae minima nihil recusandae eveniet neque quia. Quis quo at ea quae aut. Voluptas dolorum nihil excepturi quo sint natus beatae. In recusandae eos non vel eius.',	'2020-05-06 11:34:42'),
(144,	16,	17,	'Molestiae reprehenderit et error sequi ut. Fuga pariatur repellendus enim perspiciatis tempora distinctio delectus. Omnis quod sunt rerum ullam tempore debitis qui nesciunt.',	'2020-03-09 04:51:24'),
(145,	24,	28,	'Provident quia dolorem illo ut doloribus laborum nemo. At dignissimos est quod inventore esse rem. Quibusdam reprehenderit porro dolorem quae ad quod. Qui earum omnis mollitia est et sunt autem voluptatem.',	'2020-05-16 06:42:47'),
(146,	20,	21,	'Doloremque exercitationem rerum amet ut eum. Aspernatur unde et necessitatibus fugit. Nisi occaecati voluptate quos dolor fuga. Doloribus est deleniti autem est molestiae harum.',	'2020-02-27 06:51:52'),
(147,	14,	26,	'Ipsam blanditiis illum iure quis atque. Cupiditate non nihil rem vel. Consequatur porro quaerat rerum neque delectus magnam.',	'2020-02-26 04:28:24'),
(148,	21,	27,	'Sequi sint officia dolorum et autem dolor. Enim sed molestiae odit vel dolor. Explicabo minima illo assumenda veritatis velit et libero.',	'2020-03-17 03:38:41'),
(149,	22,	23,	'Nostrum sed ut mollitia et vitae et a. Sequi sed eligendi non maiores. Molestiae debitis rerum consequatur quia. Blanditiis amet eum inventore provident eaque. Quia cupiditate sint ipsum quia voluptatibus est nisi.',	'2020-03-27 20:39:42'),
(150,	14,	22,	'Qui odit molestiae ut dolorem unde repellendus dolor. Error amet eos sunt et. Blanditiis quo ut omnis quia quis quia exercitationem cupiditate.',	'2020-02-26 19:12:16'),
(151,	22,	16,	'Sequi at consequatur quis et in. Asperiores aut ex aut. Dolor voluptatum debitis aut harum.',	'2020-02-22 13:14:32'),
(152,	18,	30,	'Expedita earum odio mollitia placeat consequatur quia voluptate est. Qui ut molestias eum adipisci. Magnam voluptates illum culpa sunt id.',	'2020-05-08 09:48:43'),
(153,	16,	26,	'Eius quaerat sed ipsa fugit qui et. Fuga dolorem eveniet nisi est omnis. Impedit eum ut id unde est quod id. Impedit fugiat aut est veritatis illum.',	'2020-05-16 05:45:38'),
(154,	15,	20,	'Laudantium nam incidunt occaecati aut est animi. Omnis ut perferendis suscipit iusto facere quia consectetur quia. Veritatis repellendus maiores ratione et nisi aut dolor. Totam voluptas officiis distinctio harum.',	'2020-02-20 16:03:38'),
(155,	15,	18,	'Ea voluptatem ad doloremque doloremque aut eos. Unde quisquam vel qui eaque repudiandae eligendi exercitationem. Autem aspernatur voluptas sed consequuntur quos autem sit. Et optio asperiores sit culpa amet quidem.',	'2020-04-26 22:29:53'),
(156,	14,	20,	'Explicabo quod doloribus cumque inventore voluptas et. Eos quas accusantium aut dolor animi aut consequatur nam. Qui illo numquam placeat aliquam.',	'2020-03-27 21:53:42'),
(157,	21,	21,	'Qui culpa est porro cupiditate quis ab voluptatibus. Vero et qui ratione porro est illo sit. Molestias cumque distinctio incidunt. Ratione vel blanditiis eos nesciunt numquam.',	'2020-03-18 14:07:35'),
(158,	14,	17,	'Excepturi fugit aut placeat. Qui voluptatibus sint odio rem illum possimus. Aut cupiditate quidem qui numquam at.',	'2020-03-29 09:40:06'),
(159,	18,	20,	'Est dolorem dolor beatae id quo perferendis. Assumenda modi pariatur sequi quod. Repudiandae quia ipsum aperiam consequatur ipsam id ut. Occaecati consequuntur sint nam dolore dolore voluptatem aspernatur.',	'2020-05-15 04:25:11'),
(160,	23,	27,	'Cumque cum rem sit eum commodi est aut. Dolore expedita laborum recusandae voluptatem neque. Ut mollitia dolore dolores in quasi sint saepe. Non et et quia.',	'2020-05-18 14:43:20'),
(161,	24,	18,	'Deserunt culpa eos et. Vero distinctio est repellat modi occaecati molestiae quia. Ex maxime consequuntur est explicabo. Ut magnam velit ut est nostrum nemo autem.',	'2020-04-16 17:03:21'),
(162,	16,	20,	'Magni beatae quia ipsum perferendis modi dolores accusamus. Saepe autem voluptas quam ea illo sint a. Laboriosam vel eum vel.',	'2020-04-05 09:54:37'),
(163,	16,	17,	'Omnis qui ad quia corrupti sunt aliquam. Commodi voluptatum repellat quisquam optio. Nisi ea culpa cum debitis eos. Dolorum corporis error debitis quam.',	'2020-04-05 15:37:42'),
(164,	19,	26,	'Id est alias placeat ut et necessitatibus. Veniam eligendi nisi sint unde. Aspernatur deleniti nisi repellendus impedit accusantium aut qui. Qui autem in laudantium animi consequatur.',	'2020-03-18 08:22:07'),
(165,	19,	21,	'Voluptates veritatis soluta dolores ut. Quae est error ut eligendi mollitia et eos. Tempore possimus sint officia deserunt fugit consequatur.',	'2020-03-15 20:26:13'),
(166,	16,	22,	'Tempora ut asperiores officia non impedit voluptatum odio repudiandae. Quia aut ut voluptatem sed velit. Id voluptas quia qui harum.',	'2020-05-11 00:05:03'),
(167,	18,	20,	'Veritatis quisquam ut quis quaerat expedita. Ut sit praesentium iure cumque deserunt. Modi voluptate dolorem voluptatibus est est enim. Accusantium non corporis sequi reiciendis.',	'2020-03-31 01:00:55'),
(168,	18,	30,	'Voluptas veniam amet architecto reprehenderit minus. Et facere repellat est est nobis molestias. Ipsam at consequatur eos facilis aliquam voluptatem quos.',	'2020-03-05 16:20:58'),
(169,	23,	22,	'Aperiam et corporis non sunt consequatur ut vitae. Sed error aliquid perferendis eaque est vel et aut. Ut consequatur qui perferendis alias impedit.',	'2020-02-22 03:54:16'),
(170,	20,	17,	'Voluptatem velit a consectetur laboriosam non et voluptas. Sed mollitia et rerum voluptatem illo rerum. Sapiente nisi sint quisquam et quos. Excepturi consequatur possimus qui assumenda iusto sint.',	'2020-02-28 23:33:22'),
(171,	23,	20,	'Totam non mollitia illo id. Ad quisquam perspiciatis officia autem quis. Et non a dolores amet. Qui quia rerum quasi nobis ut eius id consequatur.',	'2020-04-21 18:11:37'),
(172,	17,	28,	'Consequuntur impedit fugiat quo tempore fugiat voluptate reprehenderit. Labore accusamus qui sit. Porro minus ab blanditiis. Non doloribus consequuntur quia eum. Animi commodi voluptatem non.',	'2020-05-02 04:53:18'),
(173,	21,	30,	'Est veritatis natus aliquid incidunt quisquam sapiente vitae. Ea possimus odio doloribus cumque est voluptas. Et sed aliquid iste corporis sed.',	'2020-02-20 08:31:40'),
(174,	14,	28,	'Consequatur temporibus pariatur neque fugit ab eveniet. Blanditiis dolor ipsa maxime fugit et. Et eaque ratione est ut unde ab.',	'2020-05-02 07:59:39'),
(175,	20,	26,	'Autem deserunt quis voluptas rerum dolorem fugiat qui. Dolore eligendi fugiat illo. Accusantium qui facilis et quidem perspiciatis dolor soluta ipsa. Ut sint voluptatem omnis distinctio repellat veritatis facilis quaerat. Dicta omnis qui est distinctio dolorem.',	'2020-05-09 01:21:03'),
(176,	14,	19,	'Reiciendis dolorem modi impedit dolorum consequatur amet reiciendis incidunt. Rerum quasi perspiciatis molestiae modi recusandae qui. Tenetur provident voluptates quam ut.',	'2020-04-29 03:51:16'),
(177,	23,	20,	'Ipsam maiores minima est consectetur ea. Ex fugiat qui neque sed. Error quisquam officia eligendi eveniet et. Sequi ut sequi corporis ipsum facere. Officiis ex aliquam enim distinctio totam eos.',	'2020-05-09 01:18:44'),
(178,	15,	28,	'At nam alias a alias sunt rem qui vitae. Aut sint aut neque doloremque aliquid molestias quibusdam. Itaque sed facilis nobis nam pariatur.',	'2020-03-20 16:57:58'),
(179,	21,	28,	'Illum nulla quos est quia et voluptate quod assumenda. Incidunt delectus dolores voluptatibus magnam nihil quidem. Cupiditate nostrum error sed reiciendis aspernatur. Maiores praesentium impedit cumque.',	'2020-03-21 21:24:39'),
(180,	24,	26,	'Debitis sint nostrum veniam. Qui iure rerum qui quaerat quasi excepturi. Magnam veritatis voluptates ea maiores.',	'2020-03-22 21:34:52'),
(181,	18,	21,	'Perspiciatis debitis suscipit enim officia qui provident. Nesciunt mollitia recusandae ducimus architecto dolorum esse. Voluptatem aut enim sit est. Illum id ratione cum incidunt neque ut occaecati.',	'2020-05-12 09:28:49'),
(182,	15,	18,	'Dolores ut voluptatem ut voluptas. Est velit sequi aut nulla in similique. Nam aut earum accusantium qui assumenda. Rerum necessitatibus qui cumque deleniti ab iusto illum.',	'2020-03-17 16:37:35'),
(183,	15,	23,	'Velit magni esse et et cupiditate velit. Rerum blanditiis nihil soluta a ut. Qui non ab quae.',	'2020-03-14 10:01:36'),
(184,	15,	27,	'Ea minus similique amet consectetur earum molestiae. Et consequatur velit ut veniam. Et ipsam optio enim aut nemo magni qui quod. Aut corporis reprehenderit et et debitis. Et aut autem est.',	'2020-04-17 17:46:14'),
(185,	17,	29,	'Est mollitia hic et sed. Ipsum molestias consectetur voluptas. Quasi doloremque sunt animi.',	'2020-03-12 03:11:38'),
(186,	23,	28,	'Consequatur dicta aut architecto aliquam. Illum sunt et voluptas asperiores eius. Dolor doloribus at mollitia et quod.',	'2020-02-27 12:30:55'),
(187,	24,	29,	'Impedit atque qui fuga. Optio nostrum ad dolores ea.',	'2020-03-09 16:35:40'),
(188,	23,	16,	'Sequi tenetur sunt ipsam. Exercitationem suscipit dicta architecto eos sint quasi et. Rerum ab quis distinctio nemo facilis et consequatur.',	'2020-02-20 13:36:57'),
(189,	22,	27,	'Est aspernatur voluptatem exercitationem. Vel ab consequuntur laudantium eum dicta sed nihil. Ipsum minima voluptatem dicta fuga quaerat eius eum at.',	'2020-03-21 14:51:01'),
(190,	20,	22,	'Consectetur amet explicabo autem. Itaque rerum autem fugiat beatae illo. Eaque ullam eos et adipisci veniam.',	'2020-03-23 22:15:57'),
(191,	17,	25,	'Ea asperiores est magni mollitia dicta. Repudiandae et porro dolor delectus tempora exercitationem praesentium sed. Nam omnis porro iste quam laborum.',	'2020-03-03 22:47:14'),
(192,	16,	30,	'Doloribus necessitatibus consequatur est. Nemo occaecati voluptas ut voluptas. Sunt qui eius et accusantium error ut quis.',	'2020-03-15 01:59:16'),
(193,	19,	25,	'Eos odit qui qui non vel velit consequatur. Sunt in sed sapiente doloremque ipsa consectetur totam perferendis. Dolorem ipsa blanditiis magni quia necessitatibus est ducimus.',	'2020-05-10 04:01:45'),
(194,	21,	25,	'Molestiae a quo velit voluptate. Incidunt vitae eum dolore voluptas qui quaerat. Eius nesciunt consequuntur est deleniti eos.',	'2020-02-28 21:30:24'),
(195,	17,	22,	'Nisi nobis libero porro. Et doloribus ut quisquam distinctio. Nihil veniam nostrum ut quas.',	'2020-02-20 18:26:51'),
(196,	19,	30,	'Atque reiciendis qui enim nihil vitae repellat. Temporibus amet repellendus consequatur aut nihil quaerat delectus. Iusto cumque dolorem eos et sed. Ipsum dolores est laboriosam similique sint magnam.',	'2020-04-19 17:50:58'),
(197,	18,	26,	'Voluptas aut quo reprehenderit sunt et suscipit velit. Iusto qui inventore facere illo quis. Eius voluptas ducimus blanditiis aspernatur.',	'2020-03-23 06:03:50'),
(198,	24,	19,	'Dolores repellat sint pariatur nam. Consequatur sint distinctio voluptatem est. Fugiat quas beatae dolorem illum.',	'2020-03-09 17:21:30'),
(199,	23,	21,	'Repellat velit magni soluta doloribus aut repellat enim qui. Voluptas nihil magnam quam corrupti quidem. In exercitationem eligendi a eius fuga voluptatem dolorum consequatur. Cupiditate et non corrupti.',	'2020-05-11 07:34:04'),
(200,	22,	22,	'Eaque rerum ex rerum. Ut provident et molestiae quisquam at.',	'2020-05-10 19:46:57'),
(201,	13,	16,	'et oui oui oui oui',	'2020-05-19 14:33:51');

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tricks_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C53D045F3B153154` (`tricks_id`),
  CONSTRAINT `FK_C53D045F3B153154` FOREIGN KEY (`tricks_id`) REFERENCES `tricks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `image` (`id`, `tricks_id`, `name`, `path`, `image`) VALUES
(101,	22,	'random',	'img/tricks5.jpg',	'image'),
(102,	27,	'random',	'img/tricks1.jpg',	'image'),
(103,	22,	'random',	'img/tricks1.jpg',	'image'),
(104,	29,	'random',	'img/tricks4.jpg',	'image'),
(105,	16,	'random',	'img/tricks1.jpg',	'image'),
(106,	28,	'random',	'img/tricks3.jpg',	'image'),
(107,	18,	'random',	'img/tricks1.jpg',	'image'),
(108,	29,	'random',	'img/tricks2.jpg',	'image'),
(109,	29,	'random',	'img/tricks4.jpg',	'image'),
(110,	18,	'random',	'img/tricks3.jpg',	'image'),
(111,	20,	'random',	'img/tricks2.jpg',	'image'),
(112,	30,	'random',	'img/tricks5.jpg',	'image'),
(113,	25,	'random',	'img/tricks1.jpg',	'image'),
(114,	18,	'random',	'img/tricks4.jpg',	'image'),
(115,	20,	'random',	'img/tricks2.jpg',	'image'),
(116,	21,	'random',	'img/tricks5.jpg',	'image'),
(117,	24,	'random',	'img/tricks1.jpg',	'image'),
(118,	21,	'random',	'img/tricks3.jpg',	'image'),
(119,	23,	'random',	'img/tricks5.jpg',	'image'),
(120,	21,	'random',	'img/tricks3.jpg',	'image'),
(121,	27,	'random',	'img/tricks2.jpg',	'image'),
(122,	22,	'random',	'img/tricks5.jpg',	'image'),
(123,	16,	'random',	'img/tricks3.jpg',	'image'),
(124,	22,	'random',	'img/tricks2.jpg',	'image'),
(125,	26,	'random',	'img/tricks4.jpg',	'image'),
(126,	22,	'random',	'img/tricks5.jpg',	'image'),
(127,	16,	'random',	'img/tricks4.jpg',	'image'),
(128,	22,	'random',	'img/tricks4.jpg',	'image'),
(129,	26,	'random',	'img/tricks4.jpg',	'image'),
(130,	27,	'random',	'img/tricks3.jpg',	'image'),
(131,	24,	'random',	'img/tricks5.jpg',	'image'),
(132,	23,	'random',	'img/tricks3.jpg',	'image'),
(133,	19,	'random',	'img/tricks3.jpg',	'image'),
(134,	26,	'random',	'img/tricks2.jpg',	'image'),
(135,	30,	'random',	'img/tricks4.jpg',	'image'),
(136,	21,	'random',	'img/tricks2.jpg',	'image'),
(137,	25,	'random',	'img/tricks3.jpg',	'image'),
(138,	27,	'random',	'img/tricks1.jpg',	'image'),
(139,	17,	'random',	'img/tricks3.jpg',	'image'),
(140,	24,	'random',	'img/tricks1.jpg',	'image'),
(141,	16,	'random',	'img/tricks3.jpg',	'image'),
(142,	17,	'random',	'img/tricks2.jpg',	'image'),
(143,	18,	'random',	'img/tricks4.jpg',	'image'),
(144,	22,	'random',	'img/tricks1.jpg',	'image'),
(145,	30,	'random',	'img/tricks2.jpg',	'image'),
(146,	19,	'random',	'img/tricks2.jpg',	'image'),
(147,	25,	'random',	'img/tricks2.jpg',	'image'),
(148,	24,	'random',	'img/tricks4.jpg',	'image'),
(149,	17,	'random',	'img/tricks4.jpg',	'image'),
(150,	26,	'random',	'img/tricks2.jpg',	'image'),
(151,	26,	'random',	'img/tricks4.jpg',	'image'),
(152,	19,	'random',	'img/tricks4.jpg',	'image'),
(153,	20,	'random',	'img/tricks4.jpg',	'image'),
(154,	23,	'random',	'img/tricks4.jpg',	'image'),
(155,	21,	'random',	'img/tricks3.jpg',	'image'),
(156,	29,	'random',	'img/tricks2.jpg',	'image'),
(157,	25,	'random',	'img/tricks2.jpg',	'image'),
(158,	27,	'random',	'img/tricks2.jpg',	'image'),
(159,	25,	'random',	'img/tricks3.jpg',	'image'),
(160,	19,	'random',	'img/tricks1.jpg',	'image'),
(161,	30,	'random',	'img/tricks2.jpg',	'image'),
(162,	19,	'random',	'img/tricks3.jpg',	'image'),
(163,	17,	'random',	'img/tricks1.jpg',	'image'),
(164,	27,	'random',	'img/tricks3.jpg',	'image'),
(165,	18,	'random',	'img/tricks5.jpg',	'image'),
(166,	27,	'random',	'img/tricks3.jpg',	'image'),
(167,	27,	'random',	'img/tricks4.jpg',	'image'),
(168,	29,	'random',	'img/tricks3.jpg',	'image'),
(169,	21,	'random',	'img/tricks3.jpg',	'image'),
(170,	18,	'random',	'img/tricks2.jpg',	'image'),
(171,	29,	'random',	'img/tricks1.jpg',	'image'),
(172,	22,	'random',	'img/tricks5.jpg',	'image'),
(173,	29,	'random',	'img/tricks2.jpg',	'image'),
(174,	21,	'random',	'img/tricks4.jpg',	'image'),
(175,	30,	'random',	'img/tricks5.jpg',	'image'),
(176,	27,	'random',	'img/tricks5.jpg',	'image'),
(177,	19,	'random',	'img/tricks1.jpg',	'image'),
(178,	19,	'random',	'img/tricks5.jpg',	'image'),
(179,	28,	'random',	'img/tricks4.jpg',	'image'),
(180,	29,	'random',	'img/tricks1.jpg',	'image'),
(181,	22,	'random',	'img/tricks2.jpg',	'image'),
(182,	26,	'random',	'img/tricks3.jpg',	'image'),
(183,	28,	'random',	'img/tricks2.jpg',	'image'),
(184,	27,	'random',	'img/tricks4.jpg',	'image'),
(185,	27,	'random',	'img/tricks1.jpg',	'image'),
(186,	20,	'random',	'img/tricks1.jpg',	'image'),
(187,	20,	'random',	'img/tricks1.jpg',	'image'),
(188,	17,	'random',	'img/tricks1.jpg',	'image'),
(189,	30,	'random',	'img/tricks3.jpg',	'image'),
(190,	24,	'random',	'img/tricks4.jpg',	'image'),
(191,	19,	'random',	'img/tricks3.jpg',	'image'),
(192,	17,	'random',	'img/tricks2.jpg',	'image'),
(193,	16,	'random',	'img/tricks1.jpg',	'image'),
(194,	25,	'random',	'img/tricks4.jpg',	'image'),
(195,	25,	'random',	'img/tricks4.jpg',	'image'),
(196,	25,	'random',	'img/tricks1.jpg',	'image'),
(197,	18,	'random',	'img/tricks5.jpg',	'image'),
(198,	28,	'random',	'img/tricks2.jpg',	'image'),
(199,	18,	'random',	'img/tricks2.jpg',	'image'),
(200,	17,	'random',	'img/tricks4.jpg',	'image');

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE `migration_versions` (
  `version` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200519121338',	'2020-05-19 12:14:08');

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role` (`id`, `title`) VALUES
(2,	'ROLE_ADMIN');

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `IDX_332CA4DDD60322AC` (`role_id`),
  KEY `IDX_332CA4DDA76ED395` (`user_id`),
  CONSTRAINT `FK_332CA4DDA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_332CA4DDD60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(2,	13);

DROP TABLE IF EXISTS `tricks`;
CREATE TABLE `tricks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E1D902C1F675F31B` (`author_id`),
  CONSTRAINT `FK_E1D902C1F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tricks` (`id`, `author_id`, `name`, `description`, `created_at`, `updated_at`, `slug`, `main_image`, `video`, `category`) VALUES
(16,	19,	'Animi perspiciatis.',	'Quia saepe est omnis dicta. In modi voluptatem esse nulla vel quia ea. Unde dolorem iste molestiae suscipit consequuntur voluptatibus eum. Nihil ratione sed ad ipsam.',	'2020-05-19 14:32:03',	NULL,	'animi-perspiciatis',	'img/tricks5.jpg',	NULL,	'360'),
(17,	14,	'Excepturi eos.',	'Reprehenderit saepe nihil cupiditate aut. Autem quia vel mollitia nihil assumenda mollitia odio atque. Ad animi quis beatae hic veniam itaque distinctio natus. Dolorum ducimus tenetur sunt blanditiis.',	'2020-05-19 14:32:03',	NULL,	'excepturi-eos',	'img/tricks5.jpg',	NULL,	'360'),
(18,	20,	'Totam et.',	'Ea reprehenderit velit accusamus illo dignissimos illum tempora. Quis dolor quisquam possimus amet dignissimos. Laboriosam labore adipisci nesciunt. Rerum quia corrupti nihil consequatur ut velit.',	'2020-05-19 14:32:03',	NULL,	'totam-et',	'img/tricks1.jpg',	NULL,	'360'),
(19,	18,	'Laboriosam laudantium dolores.',	'Dolorum voluptates architecto eius dignissimos earum adipisci rerum. Voluptates repellat perferendis vel repellat a ut. Eligendi aut repellendus qui officiis repudiandae animi.',	'2020-05-19 14:32:03',	NULL,	'laboriosam-laudantium-dolores',	'img/tricks1.jpg',	NULL,	'360'),
(20,	20,	'Eos nobis ut.',	'Vel aut et impedit distinctio voluptate. Vel ea magni rem quidem dolorum magnam voluptatum. Sapiente nobis nihil itaque iure.',	'2020-05-19 14:32:03',	NULL,	'eos-nobis-ut',	'img/tricks1.jpg',	NULL,	'360'),
(21,	14,	'Aut omnis.',	'Praesentium inventore ut atque est in porro nam. Ipsum earum possimus quia occaecati explicabo veritatis possimus eos. Ea magnam impedit fuga nam ipsa.',	'2020-05-19 14:32:03',	NULL,	'aut-omnis',	'img/tricks3.jpg',	NULL,	'360'),
(22,	23,	'Nihil nihil.',	'Quos dolor quam pariatur rerum quis corrupti voluptas. Facere et non at similique unde veniam occaecati. Quas similique eligendi nemo vitae laudantium. Soluta asperiores qui maiores minima veniam velit.',	'2020-05-19 14:32:03',	NULL,	'nihil-nihil',	'img/tricks2.jpg',	NULL,	'360'),
(23,	16,	'Sint et vel.',	'Voluptatem numquam consequatur ipsum voluptatem et voluptas veniam. Earum vitae quo deserunt molestiae. Quae consectetur fuga fugiat quis accusamus.',	'2020-05-19 14:32:03',	NULL,	'sint-et-vel',	'img/tricks4.jpg',	NULL,	'360'),
(24,	16,	'Laborum non assumenda.',	'Impedit voluptatem mollitia error et doloremque. Ut voluptatibus consequatur quisquam asperiores aut. Autem est quidem necessitatibus laboriosam tempore aspernatur. Culpa voluptas et voluptatem molestiae.',	'2020-05-19 14:32:03',	NULL,	'laborum-non-assumenda',	'img/tricks6.jpg',	NULL,	'360'),
(25,	14,	'Est beatae et.',	'Et nihil omnis est dolor. Vero sed blanditiis dolores. Repudiandae est qui repellendus illum perspiciatis. Exercitationem tempora minima ut in est sunt eum.',	'2020-05-19 14:32:03',	NULL,	'est-beatae-et',	'img/tricks4.jpg',	NULL,	'360'),
(26,	18,	'Neque mollitia.',	'Sit autem quasi dolorem harum. Quia id possimus corrupti dolor ex et in. Et hic architecto nostrum fugiat.',	'2020-05-19 14:32:03',	NULL,	'neque-mollitia',	'img/tricks4.jpg',	NULL,	'360'),
(27,	18,	'Voluptatem deserunt.',	'Nihil minima doloremque voluptatem consectetur est. Eum reiciendis totam suscipit sapiente. Qui accusamus earum beatae consequatur quis corrupti excepturi. Doloremque debitis aut rerum enim consequatur.',	'2020-05-19 14:32:03',	NULL,	'voluptatem-deserunt',	'img/tricks2.jpg',	NULL,	'360'),
(28,	24,	'Quis quibusdam sit.',	'Sed autem modi qui ducimus. Et dignissimos minima consectetur non eius sint autem. Itaque omnis reiciendis quidem.',	'2020-05-19 14:32:03',	NULL,	'quis-quibusdam-sit',	'img/tricks5.jpg',	NULL,	'360'),
(29,	17,	'Dolor saepe.',	'Voluptatum et quam et alias. Eum voluptas dignissimos similique excepturi quia. Et harum omnis id ipsam sed. Rerum laudantium et est fuga.',	'2020-05-19 14:32:03',	NULL,	'dolor-saepe',	'img/tricks3.jpg',	NULL,	'360'),
(30,	16,	'Facilis quis.',	'Ut maxime necessitatibus quae in a ullam. Iure eligendi velit tempore fuga sit. Molestiae quod porro sapiente odit quo ut blanditiis. Molestiae ex perspiciatis consequuntur cumque.',	'2020-05-19 14:32:03',	NULL,	'facilis-quis',	'img/tricks3.jpg',	NULL,	'360');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign_up_date` datetime NOT NULL,
  `registration_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_token_created_at` datetime DEFAULT NULL,
  `forgot_pass_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgot_pass_token_created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `picture`, `password`, `introduction`, `slug`, `sign_up_date`, `registration_token`, `reg_token_created_at`, `forgot_pass_token`, `forgot_pass_token_created_at`) VALUES
(13,	'Théo',	'Kinder',	'kinder.theo@gmail.com',	'img/profile/953105628395cea0ca9f7c037165c715.png',	'$2y$13$s2.Ol85n8G0x8fIsqPPyZuUTz7oz82HEVlalsNjnXIjKyvm.Zs35e',	NULL,	'theo-kinder',	'2020-05-19 14:32:40',	NULL,	NULL,	NULL,	NULL),
(14,	'Leopold',	'Bode',	'hokuneva@yahoo.com',	'https://randomuser.me/api/portraits/women/64.jpg',	'$2y$13$djHwu1WmIQymsu2OaI4jEeTePtUosiKb93TE9OEZQRc814nmPGyLu',	'Ipsa consequatur rerum eius in.',	'leopold-bode',	'2020-05-19 14:31:59',	NULL,	NULL,	NULL,	NULL),
(15,	'Alice',	'Roberts',	'cayla14@hotmail.com',	'https://randomuser.me/api/portraits/women/80.jpg',	'$2y$13$onDYvAppDDlI0aNqaPJmR.sdEWdb37R0ehsPRiPNp.QRXisI536R.',	NULL,	'alice-roberts',	'2020-05-19 14:32:00',	NULL,	NULL,	NULL,	NULL),
(16,	'Karina',	'Grady',	'nathen83@watsica.com',	'https://randomuser.me/api/portraits/women/89.jpg',	'$2y$13$R8E8mb8/HMfzY7uhBzNkT.FfmhI053zZoAc3ZzLpjt5FMIPK8lVoG',	'Incidunt eaque ducimus cupiditate.',	'karina-grady',	'2020-05-19 14:32:00',	NULL,	NULL,	NULL,	NULL),
(17,	'Hilma',	'Frami',	'tauer@hotmail.com',	'https://randomuser.me/api/portraits/women/99.jpg',	'$2y$13$X1ILbiEnRp3Ot1M13CQDNeqdCU44T0sDSpjMzB1hD2rJm65vwF/eG',	NULL,	'hilma-frami',	'2020-05-19 14:32:00',	NULL,	NULL,	NULL,	NULL),
(18,	'Donato',	'Watsica',	'hcummings@lebsack.com',	'https://randomuser.me/api/portraits/women/71.jpg',	'$2y$13$Z6KEX5qo7x7WTsFlvlRQ9eeZCdHkAPQ7Aua9BQ3.tQO1kYUHqLyb2',	NULL,	'donato-watsica',	'2020-05-19 14:32:01',	NULL,	NULL,	NULL,	NULL),
(19,	'Isadore',	'Abbott',	'uriel.fadel@feeney.com',	'https://randomuser.me/api/portraits/women/75.jpg',	'$2y$13$BKadiQ60bofjCOd.UTKXhOXmpT51R2zU409ELqUzo0VFRvkwB1HEG',	'Cum voluptatem quis vel incidunt blanditiis.',	'isadore-abbott',	'2020-05-19 14:32:01',	NULL,	NULL,	NULL,	NULL),
(20,	'Rosalia',	'Wehner',	'schmeler.joana@hotmail.com',	'https://randomuser.me/api/portraits/women/39.jpg',	'$2y$13$IrzCJMzx0zFWgmQNz.9tbu6FbeyvLIf.P1xd3ZNyDX8MCEBM8j9mC',	'Natus earum nihil quos repellat ex quisquam modi.',	'rosalia-wehner',	'2020-05-19 14:32:02',	NULL,	NULL,	NULL,	NULL),
(21,	'Olin',	'Stroman',	'abigayle.nader@conn.biz',	'https://randomuser.me/api/portraits/women/86.jpg',	'$2y$13$2HGoq7kITJr8M/gxGC7ObuhcTo2mpYCV.W/r/5Cw6gpEa/xDyY34K',	NULL,	'olin-stroman',	'2020-05-19 14:32:02',	NULL,	NULL,	NULL,	NULL),
(22,	'Kyra',	'Nicolas',	'lucie23@hotmail.com',	'https://randomuser.me/api/portraits/women/84.jpg',	'$2y$13$KK.dJQNXQfMefLnvc3.dzObCxsZ5BgmeQ7uzLbqJrSr5I.fskSJPm',	'Optio autem praesentium commodi fuga unde soluta.',	'kyra-nicolas',	'2020-05-19 14:32:02',	NULL,	NULL,	NULL,	NULL),
(23,	'Celine',	'Vandervort',	'larson.zena@nienow.com',	'https://randomuser.me/api/portraits/women/18.jpg',	'$2y$13$grJ2R/2p2Gq4x.umsTLcc.rYbb7TW.luKBEgdHyh7cPaZGJKCYviC',	'Aut voluptatem totam vel repellendus repellendus magnam.',	'celine-vandervort',	'2020-05-19 14:32:03',	NULL,	NULL,	NULL,	NULL),
(24,	'Kacie',	'Schmitt',	'schmidt.pearl@yahoo.com',	'https://randomuser.me/api/portraits/women/49.jpg',	'$2y$13$LyqUSXOWyaLgzFihHG.JC.QoXGmoDZQyV9cFrdCbqoVhUP3OrA75y',	'Nam aut sed consequuntur.',	'kacie-schmitt',	'2020-05-19 14:32:03',	NULL,	NULL,	NULL,	NULL),
(25,	'Ashtyn',	'O\'Kon',	'clark.kemmer@example.net',	'img/profile/default_profile.jpg',	'$2y$13$CFlT8sPXJNv2w9NxUfJ70uGkQxuBInmonG279eHhwEoXJwDhPHGwe',	NULL,	'ashtyn-o-kon',	'2020-05-19 15:24:51',	'9f4e7961-371c-4730-a834-a124bc34096d',	'2020-05-19 15:54:51',	NULL,	NULL),
(26,	'Ayden',	'Bins',	'hegmann.christiana@example.org',	'img/profile/default_profile.jpg',	'$2y$13$irUYklMo1qvpCCjNm5Vjyu2tnPLat6wcXeNS5C1ijOTtZ12IR3r6a',	NULL,	'ayden-bins',	'2020-05-19 15:26:01',	'72b02e20-0830-4178-9d87-d7fb98533565',	'2020-05-19 15:56:01',	NULL,	NULL),
(27,	'Joyce',	'Schuppe',	'brycen.buckridge@example.net',	'img/profile/default_profile.jpg',	'$2y$13$Y64EO5k9.eyCq2kjmC7K8.N2gS8m22N5Fi8gU8mLPwDpgwo4uMOSm',	NULL,	'joyce-schuppe',	'2020-05-19 15:26:19',	'bb7e8beb-19ff-440b-a855-e0b02def6e8c',	'2020-05-19 15:56:19',	NULL,	NULL),
(28,	'Théo',	'Logie',	'rlassdebatata@gmail.com',	'img/profile/default_profile.jpg',	'$2y$13$ka/Q/RG5ihk9m/SAb1wSKOLaFEmFx5z7XYfT5CansT0tDBnbHmkWe',	NULL,	'theo-logie',	'2020-05-20 04:12:28',	'1a1e435c-ca24-4b6a-a5a8-715bb05281fe',	'2020-05-20 04:42:28',	NULL,	NULL);

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tricks_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7CC7DA2C3B153154` (`tricks_id`),
  CONSTRAINT `FK_7CC7DA2C3B153154` FOREIGN KEY (`tricks_id`) REFERENCES `tricks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `video` (`id`, `tricks_id`, `name`, `video`) VALUES
(26,	17,	'praesentium',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(27,	17,	'quasi',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(28,	25,	'tempore',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(29,	18,	'sunt',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(30,	18,	'in',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(31,	19,	'perspiciatis',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(32,	20,	'qui',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(33,	16,	'totam',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(34,	16,	'aut',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(35,	25,	'quisquam',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(36,	26,	'optio',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(37,	28,	'et',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(38,	23,	'voluptatem',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(39,	23,	'exercitationem',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(40,	22,	'quia',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(41,	25,	'quidem',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(42,	17,	'in',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(43,	17,	'mollitia',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(44,	18,	'perspiciatis',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(45,	25,	'sunt',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(46,	25,	'omnis',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(47,	17,	'est',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(48,	16,	'dolores',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(49,	16,	'numquam',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(50,	17,	'rerum',	'https://www.youtube.com/embed/SQyTWk7OxSI');

-- 2020-05-20 14:13:41
