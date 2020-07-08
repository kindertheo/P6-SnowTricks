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
(202,	30,	32,	'Dolorem temporibus nam eum mollitia est. Doloribus accusamus et recusandae tenetur. Rem odit est pariatur sit quia.',	'2020-03-11 22:07:53'),
(203,	30,	41,	'Inventore cum libero quam recusandae. Quam inventore nam earum et aperiam. Enim ipsa rem qui doloribus eveniet tenetur quae mollitia. Dolor similique nostrum et reprehenderit consequatur.',	'2020-03-03 02:46:34'),
(204,	33,	32,	'Qui officiis excepturi sit labore deserunt qui. Aliquid illo corrupti est. Vel recusandae cum ut.',	'2020-02-26 02:26:50'),
(205,	38,	31,	'Repudiandae perferendis quam explicabo sit pariatur. Sit dolorum voluptatem nam ad impedit libero explicabo voluptates. Aut sit dolorum doloremque voluptas optio ut repellendus. Tenetur dignissimos atque facere voluptas.',	'2020-03-25 02:50:04'),
(206,	32,	35,	'Architecto facilis ratione voluptate aut nam tempore ut id. Porro a laborum id. Iusto accusantium necessitatibus et necessitatibus est. Nihil totam veniam assumenda nemo suscipit beatae.',	'2020-05-01 22:12:11'),
(207,	32,	34,	'Iure alias quos et eveniet aliquam eum eaque. Eum perferendis labore eum sed autem. Harum accusamus distinctio ut et eos temporibus. Autem est officiis eum libero. Sit dolor aut id enim sed quod sed.',	'2020-05-18 06:55:03'),
(208,	39,	43,	'Accusamus ullam suscipit sint eveniet ad ea consequatur. Impedit sit sit aperiam voluptas. Accusantium facere nobis nesciunt ea sed.',	'2020-04-19 18:40:54'),
(209,	33,	37,	'Deleniti voluptates voluptatem cumque qui. Odit temporibus delectus ut amet quibusdam magni et labore. Animi officia optio atque. Molestiae quo perspiciatis minus. Occaecati et ea et tenetur minima iure.',	'2020-02-25 01:28:16'),
(210,	30,	43,	'Ad eaque dolor quis qui reiciendis quaerat maxime. Aut molestiae exercitationem qui adipisci facere. Magni ut sint eaque non.',	'2020-04-27 14:25:19'),
(211,	32,	39,	'Numquam sunt harum non rem doloribus. Tenetur recusandae dicta quasi dignissimos ducimus in perspiciatis. Hic cum atque corporis unde cum quidem est ut. Porro nisi architecto quasi sint. Necessitatibus deserunt laudantium doloribus aut reprehenderit quidem itaque.',	'2020-05-06 15:05:43'),
(212,	31,	38,	'Laudantium omnis quis eum laborum deleniti autem. Enim odit optio aut quam quos iste. Mollitia corrupti labore ex nihil qui.',	'2020-03-06 03:26:05'),
(213,	39,	32,	'Et officia perferendis rerum maiores consectetur. Magni eum quisquam architecto ad perspiciatis non qui. Voluptatem omnis omnis velit ex eaque. Et nobis repudiandae sint est.',	'2020-03-25 11:10:45'),
(214,	30,	35,	'Id fuga saepe amet est. Iure et sed modi. Consequatur magnam nesciunt tempora. Aliquid quis corrupti hic saepe consequatur.',	'2020-03-14 03:56:02'),
(215,	38,	43,	'Delectus omnis necessitatibus sit maxime occaecati omnis. Ab similique iure doloremque.',	'2020-04-27 08:22:28'),
(216,	40,	33,	'Pariatur et tempore et vel. At quaerat odio assumenda aut. Beatae inventore eveniet fuga eligendi vel. Est aut ab corrupti esse quis in doloribus.',	'2020-05-15 04:08:17'),
(217,	37,	34,	'Voluptate eum quibusdam laudantium asperiores nihil reprehenderit. Et magni ipsa ea non quia saepe. Debitis quaerat minus nesciunt eos. Suscipit ut et facere ex quaerat. Earum voluptatem et et delectus.',	'2020-05-10 11:12:45'),
(218,	38,	34,	'Reprehenderit et aut vitae iste quisquam deserunt. Vitae illum eligendi odit voluptas qui et. Commodi mollitia in ut aut beatae vel rerum rem.',	'2020-04-08 09:53:09'),
(219,	40,	36,	'Consequatur est quibusdam id perferendis. Asperiores sed ratione dicta eligendi. Nobis odio repudiandae enim et nisi voluptas repellat. Quidem et aliquid sit ratione sit qui. Ut repellendus qui laboriosam earum dolorem eaque adipisci eaque.',	'2020-04-10 18:48:23'),
(220,	32,	32,	'Vero explicabo voluptas similique fugit voluptatem non. Id voluptatem non quod assumenda sint nihil maiores. Dolor nihil velit qui id sunt.',	'2020-02-29 20:23:24'),
(221,	30,	35,	'Consectetur unde corrupti autem voluptas velit. Quasi molestiae quibusdam qui sunt sint. Incidunt rerum exercitationem autem eligendi voluptas est molestiae velit.',	'2020-03-28 10:30:54'),
(222,	39,	43,	'Similique quis sed similique possimus cumque. Blanditiis rerum accusantium esse aut eum iste. Repellat voluptatem et eos expedita sed nam. Quia et ab repellendus vel id ullam doloremque. Vel dolores labore quis quibusdam esse fugit optio.',	'2020-03-28 14:24:32'),
(223,	40,	45,	'Maiores consequatur ut molestias molestiae. Velit asperiores fugit et laborum. Deserunt fugit voluptatum beatae non eaque libero quia. Officia non fugiat blanditiis ab est.',	'2020-03-22 12:44:32'),
(224,	33,	45,	'Earum tempora quo ullam. Est porro temporibus atque eveniet quo. Quam sed molestiae voluptas cumque sunt laborum culpa. Soluta voluptatem quos aut quos velit.',	'2020-03-10 13:55:31'),
(225,	35,	42,	'Alias laborum voluptatem quasi maiores ratione voluptatum et. Distinctio ratione velit accusantium explicabo.',	'2020-05-06 01:37:36'),
(226,	31,	31,	'Nobis veritatis magnam doloremque aut aliquid eaque maiores. Ea rem repudiandae nobis architecto sint fugiat quia. Architecto omnis itaque nobis sint. Commodi qui error dolore tempore aliquam a numquam. Accusantium beatae id rerum molestias impedit.',	'2020-04-22 04:53:29'),
(227,	35,	43,	'Voluptatem modi perferendis nisi ut. Saepe tenetur iusto dolorem necessitatibus sunt. Rerum suscipit rerum voluptatem ut numquam eum.',	'2020-04-26 03:08:52'),
(228,	35,	45,	'Quis voluptas voluptatum optio sapiente repellat quibusdam. Possimus placeat libero minus error autem omnis et. Aliquid rem omnis saepe dolores sint magni voluptatem.',	'2020-03-06 07:32:34'),
(229,	35,	32,	'Ullam ut commodi et doloribus consectetur dolor. Nulla pariatur sunt fuga dignissimos praesentium occaecati. Cumque sunt laboriosam magni dolores reprehenderit est autem.',	'2020-04-18 23:00:09'),
(230,	30,	39,	'Perspiciatis harum illum et possimus. Qui autem officia iure nemo.',	'2020-04-15 00:04:14'),
(231,	30,	38,	'Cum possimus sint provident minima. Blanditiis dolores voluptas illum optio odit. Autem quos et sit et.',	'2020-04-28 07:41:31'),
(232,	30,	37,	'Rerum quibusdam ratione et odit. Soluta repellat qui molestiae ipsam architecto itaque et adipisci. Exercitationem et rerum qui consequatur illo ut et.',	'2020-05-15 23:00:32'),
(233,	32,	40,	'Provident quos consectetur assumenda. Facilis voluptas at quam ut eos. Unde ut nulla dolorum explicabo. Qui et ea quisquam odit officiis voluptas veniam.',	'2020-03-22 15:30:08'),
(234,	34,	42,	'Aut ipsam et et officia minima. Id beatae est aut et voluptatem blanditiis. Dolorem voluptas ad aspernatur atque doloremque est. Nobis omnis consequatur officia recusandae eligendi quia.',	'2020-05-17 00:09:05'),
(235,	37,	33,	'Cum ut nostrum et. Quos et non odio non voluptates. Provident sit laborum voluptatem aut inventore doloremque laborum.',	'2020-04-25 03:24:27'),
(236,	39,	41,	'Tempora est similique quaerat quaerat. Temporibus reprehenderit non et nostrum vel at ab. Consequatur tempore iste ut eum sint ea deleniti.',	'2020-03-04 02:20:43'),
(237,	39,	40,	'Qui consequatur mollitia temporibus sint. Veritatis voluptate iusto quibusdam quae doloribus et suscipit sed. Neque dolores maiores fugit harum. Culpa aut velit et iusto sit magnam molestiae voluptas.',	'2020-04-10 23:41:44'),
(238,	34,	42,	'Voluptatem aliquid aut facilis atque quod assumenda. Non aut et iusto quisquam eaque ex labore. Vero et aspernatur voluptatum vel cumque fuga ad.',	'2020-05-10 00:15:15'),
(239,	39,	31,	'Minus delectus sed earum a eaque sit maiores voluptates. Facere dolorem aut ullam nam distinctio. Saepe non accusantium eum sit voluptatem.',	'2020-05-12 01:15:45'),
(240,	38,	31,	'Harum adipisci incidunt commodi pariatur alias sit. Qui veniam harum provident in consectetur nisi recusandae. Enim omnis officiis excepturi. Doloribus sed natus voluptas qui veritatis minima delectus.',	'2020-03-24 08:14:46'),
(241,	33,	44,	'Odit eveniet rerum magnam suscipit non sit maiores. Et dolor non aut vel. Quo cupiditate corrupti eum qui temporibus. Veritatis et tempora et voluptate tenetur.',	'2020-04-22 05:05:39'),
(242,	36,	38,	'Eligendi nesciunt velit fugiat. Dolor expedita laboriosam quia et. Et iste veritatis ut aut sunt velit. Enim ut harum ipsum cupiditate qui omnis eos omnis.',	'2020-04-06 12:42:50'),
(243,	32,	45,	'Qui amet in ut. Officia eos impedit ratione omnis animi. Modi amet commodi vero eligendi ut nihil. Nihil qui qui esse quam fugit.',	'2020-04-18 12:38:03'),
(244,	40,	44,	'Tempora occaecati veritatis blanditiis distinctio minus aut. Delectus aperiam dolores reiciendis qui rem inventore sunt. Aut suscipit dolorem consequuntur ut. Fuga quia non et non veniam ut sit.',	'2020-04-01 16:00:57'),
(245,	38,	35,	'Aut minus aperiam qui non architecto culpa quisquam. Voluptatem et maxime id in a labore corrupti. Labore sed modi quis quia modi ut.',	'2020-05-05 20:35:35'),
(246,	34,	45,	'Voluptatem ea rerum eveniet nam ut. Dolores eveniet corporis ad dicta deserunt assumenda. Aut sint molestias sit esse est dolorem culpa aut.',	'2020-03-31 06:07:09'),
(247,	30,	34,	'Similique consectetur animi optio voluptatem. Et id nesciunt cumque voluptas nihil porro.',	'2020-04-21 19:17:47'),
(248,	31,	33,	'Molestiae nihil praesentium rerum. Dignissimos pariatur quis itaque quo et et dignissimos. Consequuntur quidem omnis facilis assumenda.',	'2020-05-15 03:25:36'),
(249,	33,	32,	'Qui error minus maxime occaecati omnis rerum repudiandae est. Fugit quo neque repellendus voluptates amet et sunt nemo. Et cumque voluptas assumenda dicta velit nihil. Nostrum corporis illo consequuntur laborum. Et non illum nisi nobis.',	'2020-03-19 06:29:03'),
(250,	37,	33,	'Et quod voluptas rerum aliquid ut. Exercitationem in quae et dolorem corrupti. Facilis occaecati corporis velit ut et nihil molestiae. Optio et libero quam quaerat nesciunt.',	'2020-04-13 20:46:05'),
(251,	39,	45,	'Illo qui molestiae sapiente voluptatibus deleniti eligendi. Tempore magni qui quia id. Pariatur culpa pariatur et nam reiciendis aut quaerat.',	'2020-05-20 05:14:30'),
(252,	32,	32,	'Reprehenderit qui cupiditate qui consectetur esse maiores eos. Itaque quia quae molestias sed nihil. Veniam consequatur nobis officiis. Neque quia corporis voluptate minima et vel.',	'2020-05-10 04:02:23'),
(253,	38,	34,	'Ipsa reiciendis perferendis laboriosam illum autem officia. In ut recusandae soluta ullam in a eius minus. Ea ipsa rerum corporis excepturi et eligendi qui sit. Magni vero debitis doloribus sapiente qui possimus.',	'2020-05-13 08:40:23'),
(254,	33,	45,	'Est doloremque doloribus quasi eligendi nihil odit non. Omnis ipsum dignissimos ut praesentium sunt blanditiis fuga. Cum earum consequatur odio id unde.',	'2020-03-09 15:21:45'),
(255,	36,	31,	'Corporis id ratione totam dolores. Veniam voluptatem qui illo qui. Ducimus minus vel dicta beatae cupiditate. Porro aut provident accusantium qui quo molestiae harum.',	'2020-02-24 13:53:54'),
(256,	39,	41,	'In expedita ea aliquam aut molestias eum. Magni rerum magni fugit dolore excepturi. Consequuntur ipsa explicabo modi necessitatibus consequatur. Necessitatibus laudantium quis quia consequatur.',	'2020-04-05 16:14:03'),
(257,	35,	42,	'Et repellat nihil quia laudantium consectetur voluptas. Quos eveniet aut corporis exercitationem error. Ab non numquam consequatur in et.',	'2020-02-27 20:04:00'),
(258,	39,	36,	'Ipsum sed rem et quas itaque. Cum laborum minima optio qui debitis. Explicabo sapiente non rerum dignissimos cumque error. Qui maiores accusamus expedita qui corporis.',	'2020-04-25 02:20:31'),
(259,	37,	40,	'Quo non rerum nisi rem et odit quaerat. Porro possimus ea recusandae aliquam error dolorum aspernatur. Et ea quidem illum nam quidem enim et. Nihil rem numquam error qui.',	'2020-03-26 09:27:16'),
(260,	33,	35,	'Libero aut repellendus quo quo. Ut repellat architecto et voluptates voluptas neque. Error voluptatum ut in voluptate. Qui tenetur voluptatibus voluptas praesentium repellendus sunt deleniti qui.',	'2020-05-02 22:26:35'),
(261,	34,	39,	'In iste et aut ut id blanditiis et quaerat. Non iste eos in aut adipisci dolores alias. Error veniam consequatur suscipit sit ut ex.',	'2020-03-02 03:24:15'),
(262,	35,	35,	'Ea sint qui hic possimus. Libero dolore assumenda dolores sit. Tempora repudiandae sint fuga exercitationem sed et. Accusamus magni voluptates officiis quo harum doloremque et voluptates.',	'2020-02-26 16:14:17'),
(263,	30,	34,	'Quis qui eius numquam dolores sed omnis sed. Eveniet et numquam eveniet libero explicabo esse. Voluptatem tenetur rerum laborum non omnis porro. Dolorem quibusdam veritatis vitae qui dicta nisi.',	'2020-05-20 15:50:13'),
(264,	32,	31,	'Tempora ad at nostrum numquam accusamus perspiciatis. Odit facere corporis consequuntur error at. Eveniet quo illo voluptatem eius nam repudiandae dolores.',	'2020-05-08 11:46:27'),
(265,	32,	45,	'Libero quidem sed qui iusto rerum. Qui fuga aliquid minus autem accusantium non iusto voluptatem. Repudiandae quaerat eum qui et ab non.',	'2020-04-12 06:50:11'),
(266,	37,	40,	'Eos ipsa voluptatum in recusandae non ipsa. Officia dolorum qui tenetur iure doloremque sapiente. Iste soluta autem ea debitis eveniet eaque.',	'2020-05-02 00:02:07'),
(267,	39,	34,	'Velit ipsa adipisci quibusdam minus nam totam. Autem aut consequatur rerum voluptas. Minus veniam minima ea omnis dolores tenetur.',	'2020-03-15 17:22:49'),
(268,	39,	43,	'Ipsa eum quae culpa a aut numquam. Adipisci dicta sunt dolor distinctio modi vel sunt. Dolores similique assumenda vitae assumenda omnis quam. Adipisci necessitatibus voluptates culpa adipisci.',	'2020-02-27 13:27:47'),
(269,	34,	39,	'Facilis molestias ad repudiandae sit accusantium et dolor aut. Sed ipsum temporibus deserunt. Suscipit sit non temporibus rerum beatae provident quibusdam. Harum optio error numquam reprehenderit aut.',	'2020-03-25 00:17:08'),
(270,	31,	34,	'Et porro minus sapiente cumque et laborum et distinctio. Omnis harum dolores sed libero illum ad omnis. Quas ut pariatur laboriosam expedita. Laudantium ea perferendis minus aut dolores dolor culpa quidem. Soluta voluptatem et porro et.',	'2020-05-15 13:27:39'),
(271,	40,	39,	'Quia voluptas quis tenetur itaque aut consequatur officiis. Sed harum quo aperiam illo earum. Debitis quisquam minus consequatur quod non minus.',	'2020-04-18 08:01:05'),
(272,	32,	43,	'Pariatur natus qui optio itaque doloribus sed. Dignissimos possimus officiis illo in. Enim cumque libero tempore dolores omnis. Voluptas aut inventore blanditiis nemo.',	'2020-03-06 11:57:48'),
(273,	33,	44,	'Dolores et qui sed at et et ea. Id ea maxime voluptatem reiciendis. Atque voluptate totam perspiciatis voluptatem ipsa. Ipsa laboriosam non voluptatem et.',	'2020-04-07 20:11:49'),
(274,	37,	35,	'Perferendis enim velit provident debitis voluptas tenetur. Et consequatur dicta totam consequatur. Eveniet possimus non similique doloremque itaque est expedita repudiandae. Ea fuga quas architecto dolor.',	'2020-04-04 11:48:32'),
(275,	37,	41,	'Quis exercitationem assumenda voluptatem magnam quia sit ut. Inventore unde suscipit quibusdam sunt ad non. Recusandae omnis quo similique iste dolorum.',	'2020-04-11 13:06:45'),
(276,	32,	37,	'Amet sed fugiat repellendus et molestiae. Animi in eum quia tenetur ut dignissimos. Pariatur quo pariatur quam laborum quo quo qui. Ducimus quis sequi et rerum quod. Corporis quia aut totam earum est ut.',	'2020-03-27 12:44:41'),
(277,	40,	40,	'Provident velit adipisci adipisci qui et. Deserunt aut ipsa officiis praesentium eaque. Ratione rerum eveniet odio quibusdam cumque.',	'2020-05-09 11:23:50'),
(278,	38,	45,	'Esse est et aspernatur consequuntur reiciendis est. Error est nemo ut quia eaque est. Sit adipisci sint cum id ullam a vitae. Quos unde perferendis voluptas et modi.',	'2020-03-18 21:11:28'),
(279,	36,	41,	'Ex commodi debitis qui esse et sit. Repellat provident odio pariatur modi fugit. Officia impedit reprehenderit veritatis velit temporibus.',	'2020-03-03 03:57:56'),
(280,	37,	36,	'Facere qui alias id et animi minima consequatur. Fuga quo quidem quaerat consectetur quae eaque. Voluptates necessitatibus dolorem incidunt placeat fugiat aut dicta. Autem qui quaerat qui quo.',	'2020-02-25 20:55:38'),
(281,	34,	33,	'Odio omnis sint illum animi libero quod rerum. A quaerat aperiam quia iusto at nihil. Sunt aut provident omnis ut.',	'2020-03-25 01:10:58'),
(282,	35,	45,	'Voluptatem sit facere tenetur officiis quae illum magnam. Et sed esse quisquam tempora. Et quis ea aliquid. Et pariatur mollitia velit assumenda perferendis voluptate et.',	'2020-04-01 10:15:28'),
(283,	31,	41,	'Adipisci accusantium explicabo quo rerum et voluptatem sequi deserunt. Eos ipsam totam fuga. Consequuntur illum officia sapiente.',	'2020-03-14 10:57:37'),
(284,	38,	43,	'Iste nemo asperiores accusamus sed. Provident velit similique non in qui sequi. Nulla molestiae sed quia ex.',	'2020-02-25 10:20:19'),
(285,	31,	32,	'Quibusdam deserunt quos qui quasi. Ut ad sit magnam aut ex eaque. Tempora blanditiis asperiores nihil aut occaecati nulla cumque. Ipsa quae aut ducimus ipsam aut dignissimos.',	'2020-05-08 08:11:45'),
(286,	36,	43,	'Consequatur nam est error dolorem. Voluptatibus consequatur voluptatum est occaecati natus ex. Repellat cupiditate voluptatibus dolor.',	'2020-05-05 08:13:56'),
(287,	40,	33,	'Rem atque non ex alias iure earum corporis. Voluptatem debitis dolores asperiores. Eveniet est rerum iusto est expedita dignissimos perspiciatis. Autem enim aut id omnis et alias reprehenderit est.',	'2020-03-15 20:12:46'),
(288,	34,	34,	'Dolores incidunt sit maxime possimus quo. Sequi nostrum distinctio aliquam. Dolor voluptatem quia et animi autem. Ipsam qui blanditiis eum consequatur eum consectetur.',	'2020-04-28 09:04:56'),
(289,	33,	40,	'Repellendus saepe aut et velit mollitia veritatis quis alias. Vitae ea magnam molestiae vel veniam saepe.',	'2020-03-12 10:59:48'),
(290,	30,	33,	'Nulla similique consequatur exercitationem suscipit et. Ea quas modi et blanditiis. Qui eius vitae soluta porro. Quo voluptas nulla harum ut deleniti reprehenderit.',	'2020-02-24 09:03:39'),
(291,	34,	40,	'Blanditiis voluptatum et omnis perferendis est libero. Temporibus odit incidunt est corporis modi. Ut quaerat ea dolor blanditiis necessitatibus eos et.',	'2020-03-25 16:00:12'),
(292,	33,	38,	'Iusto cumque sit magni et accusantium voluptatum quos. Rerum necessitatibus eligendi vitae consectetur sit quam debitis ab.',	'2020-03-16 19:18:40'),
(293,	40,	42,	'Quibusdam magnam nostrum et illo. Omnis doloribus ea aliquam dolore.',	'2020-05-06 16:14:30'),
(294,	36,	33,	'Minima in praesentium praesentium quo. Beatae blanditiis ut error. Aspernatur voluptatem libero est voluptatem vel. Odit saepe distinctio et quia aliquam quae est. Ut quae et molestiae rerum sunt nam voluptatibus quis.',	'2020-05-17 02:05:39'),
(295,	33,	43,	'Alias qui a qui est iure. Totam dolores voluptate veritatis saepe quia. Aut necessitatibus eius corporis est maiores. Voluptas excepturi qui est et voluptatem et.',	'2020-03-21 15:08:17'),
(296,	34,	39,	'Mollitia cumque ut aperiam neque. Natus quas vel ad est nam. Deleniti id cumque molestiae doloremque.',	'2020-02-25 06:12:57'),
(297,	32,	33,	'Animi tempora odio sed error commodi modi voluptatibus. Quo et aliquam est harum.',	'2020-03-31 16:24:31'),
(298,	32,	41,	'Dolor aut unde porro id. Eum quaerat nobis et veritatis sed. Et quam atque officiis consequuntur non.',	'2020-05-02 17:37:05'),
(299,	35,	44,	'Nulla aliquam consequuntur est excepturi. Consequatur quidem modi ut repellendus eos tenetur. Quaerat eius voluptate commodi illo.',	'2020-05-11 11:10:14'),
(300,	40,	42,	'Voluptas suscipit deserunt vero quisquam praesentium. Facere enim amet sapiente architecto ut voluptas in. Maxime delectus laboriosam soluta ipsum quia in molestiae.',	'2020-04-09 16:44:10'),
(301,	30,	37,	'Aliquid provident ut sed temporibus voluptate est tempora adipisci. Amet esse molestiae recusandae nesciunt. Perferendis mollitia exercitationem sint voluptas ut.',	'2020-03-19 17:58:26');

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
(201,	45,	'random',	'img/tricks5.jpg',	'image'),
(202,	37,	'random',	'img/tricks2.jpg',	'image'),
(203,	32,	'random',	'img/tricks3.jpg',	'image'),
(204,	34,	'random',	'img/tricks2.jpg',	'image'),
(205,	35,	'random',	'img/tricks5.jpg',	'image'),
(206,	44,	'random',	'img/tricks2.jpg',	'image'),
(207,	41,	'random',	'img/tricks3.jpg',	'image'),
(208,	34,	'random',	'img/tricks3.jpg',	'image'),
(209,	43,	'random',	'img/tricks2.jpg',	'image'),
(210,	38,	'random',	'img/tricks2.jpg',	'image'),
(211,	36,	'random',	'img/tricks1.jpg',	'image'),
(212,	34,	'random',	'img/tricks1.jpg',	'image'),
(213,	33,	'random',	'img/tricks2.jpg',	'image'),
(214,	41,	'random',	'img/tricks3.jpg',	'image'),
(215,	33,	'random',	'img/tricks6.jpg',	'image'),
(216,	43,	'random',	'img/tricks3.jpg',	'image'),
(217,	34,	'random',	'img/tricks2.jpg',	'image'),
(218,	32,	'random',	'img/tricks2.jpg',	'image'),
(219,	36,	'random',	'img/tricks4.jpg',	'image'),
(220,	34,	'random',	'img/tricks1.jpg',	'image'),
(221,	44,	'random',	'img/tricks4.jpg',	'image'),
(222,	36,	'random',	'img/tricks3.jpg',	'image'),
(223,	40,	'random',	'img/tricks5.jpg',	'image'),
(224,	36,	'random',	'img/tricks3.jpg',	'image'),
(225,	35,	'random',	'img/tricks5.jpg',	'image'),
(226,	33,	'random',	'img/tricks4.jpg',	'image'),
(227,	38,	'random',	'img/tricks4.jpg',	'image'),
(228,	43,	'random',	'img/tricks3.jpg',	'image'),
(229,	37,	'random',	'img/tricks5.jpg',	'image'),
(230,	31,	'random',	'img/tricks1.jpg',	'image'),
(231,	37,	'random',	'img/tricks6.jpg',	'image'),
(232,	35,	'random',	'img/tricks6.jpg',	'image'),
(233,	40,	'random',	'img/tricks1.jpg',	'image'),
(234,	31,	'random',	'img/tricks6.jpg',	'image'),
(235,	35,	'random',	'img/tricks2.jpg',	'image'),
(236,	44,	'random',	'img/tricks2.jpg',	'image'),
(237,	35,	'random',	'img/tricks3.jpg',	'image'),
(238,	45,	'random',	'img/tricks3.jpg',	'image'),
(239,	32,	'random',	'img/tricks2.jpg',	'image'),
(240,	40,	'random',	'img/tricks3.jpg',	'image'),
(241,	44,	'random',	'img/tricks2.jpg',	'image'),
(242,	37,	'random',	'img/tricks5.jpg',	'image'),
(243,	35,	'random',	'img/tricks6.jpg',	'image'),
(244,	34,	'random',	'img/tricks5.jpg',	'image'),
(245,	42,	'random',	'img/tricks4.jpg',	'image'),
(246,	31,	'random',	'img/tricks5.jpg',	'image'),
(247,	43,	'random',	'img/tricks2.jpg',	'image'),
(248,	32,	'random',	'img/tricks2.jpg',	'image'),
(249,	36,	'random',	'img/tricks6.jpg',	'image'),
(250,	31,	'random',	'img/tricks1.jpg',	'image'),
(251,	37,	'random',	'img/tricks2.jpg',	'image'),
(252,	44,	'random',	'img/tricks2.jpg',	'image'),
(253,	39,	'random',	'img/tricks3.jpg',	'image'),
(254,	40,	'random',	'img/tricks6.jpg',	'image'),
(255,	36,	'random',	'img/tricks4.jpg',	'image'),
(256,	44,	'random',	'img/tricks1.jpg',	'image'),
(257,	42,	'random',	'img/tricks6.jpg',	'image'),
(258,	32,	'random',	'img/tricks3.jpg',	'image'),
(259,	45,	'random',	'img/tricks1.jpg',	'image'),
(260,	36,	'random',	'img/tricks3.jpg',	'image'),
(261,	37,	'random',	'img/tricks6.jpg',	'image'),
(262,	45,	'random',	'img/tricks1.jpg',	'image'),
(263,	40,	'random',	'img/tricks2.jpg',	'image'),
(264,	44,	'random',	'img/tricks4.jpg',	'image'),
(265,	36,	'random',	'img/tricks2.jpg',	'image'),
(266,	34,	'random',	'img/tricks2.jpg',	'image'),
(267,	44,	'random',	'img/tricks6.jpg',	'image'),
(268,	43,	'random',	'img/tricks2.jpg',	'image'),
(269,	34,	'random',	'img/tricks1.jpg',	'image'),
(270,	42,	'random',	'img/tricks5.jpg',	'image'),
(271,	40,	'random',	'img/tricks6.jpg',	'image'),
(272,	36,	'random',	'img/tricks1.jpg',	'image'),
(273,	36,	'random',	'img/tricks6.jpg',	'image'),
(274,	41,	'random',	'img/tricks3.jpg',	'image'),
(275,	39,	'random',	'img/tricks1.jpg',	'image'),
(276,	31,	'random',	'img/tricks1.jpg',	'image'),
(277,	41,	'random',	'img/tricks1.jpg',	'image'),
(278,	37,	'random',	'img/tricks2.jpg',	'image'),
(279,	31,	'random',	'img/tricks3.jpg',	'image'),
(280,	34,	'random',	'img/tricks4.jpg',	'image'),
(281,	31,	'random',	'img/tricks4.jpg',	'image'),
(282,	39,	'random',	'img/tricks6.jpg',	'image'),
(283,	38,	'random',	'img/tricks4.jpg',	'image'),
(284,	33,	'random',	'img/tricks1.jpg',	'image'),
(285,	35,	'random',	'img/tricks4.jpg',	'image'),
(286,	43,	'random',	'img/tricks3.jpg',	'image'),
(287,	38,	'random',	'img/tricks6.jpg',	'image'),
(288,	41,	'random',	'img/tricks4.jpg',	'image'),
(289,	31,	'random',	'img/tricks5.jpg',	'image'),
(290,	45,	'random',	'img/tricks3.jpg',	'image'),
(291,	38,	'random',	'img/tricks6.jpg',	'image'),
(292,	42,	'random',	'img/tricks6.jpg',	'image'),
(293,	42,	'random',	'img/tricks3.jpg',	'image'),
(294,	36,	'random',	'img/tricks5.jpg',	'image'),
(295,	45,	'random',	'img/tricks5.jpg',	'image'),
(296,	33,	'random',	'img/tricks2.jpg',	'image'),
(297,	36,	'random',	'img/tricks4.jpg',	'image'),
(298,	44,	'random',	'img/tricks5.jpg',	'image'),
(299,	39,	'random',	'img/tricks6.jpg',	'image'),
(300,	38,	'random',	'img/tricks3.jpg',	'image');

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
(3,	'ROLE_ADMIN');

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
(3,	29);

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
(31,	34,	'Est ut et.',	'Provident earum veniam impedit magnam excepturi officiis dolore. Eius id repudiandae dolor numquam excepturi. Voluptatum ut ullam est ducimus.',	'2020-05-21 04:14:14',	NULL,	'est-ut-et',	'img/tricks2.jpg',	NULL,	'360'),
(32,	34,	'Suscipit est.',	'Laudantium fuga nihil aspernatur illum itaque unde nesciunt. Aut natus maiores non omnis sed. Omnis et enim laboriosam reiciendis sit. Praesentium voluptate neque sit vel voluptatem culpa.',	'2020-05-21 04:14:14',	NULL,	'suscipit-est',	'img/tricks6.jpg',	NULL,	'360'),
(33,	33,	'Esse aspernatur.',	'Quidem quis praesentium velit magnam laudantium. In autem ab voluptas perspiciatis incidunt maxime. Expedita non aut sunt quam tempora sed non sit. Dolorum et eius a veritatis porro.',	'2020-05-21 04:14:14',	NULL,	'esse-aspernatur',	'img/tricks2.jpg',	NULL,	'360'),
(34,	38,	'Sunt repellendus rem.',	'Illo magni provident numquam accusamus voluptatum nesciunt consequatur. Esse error ut repellat ex itaque sit animi. Consequatur ea et aut et.',	'2020-05-21 04:14:14',	NULL,	'sunt-repellendus-rem',	'img/tricks1.jpg',	NULL,	'360'),
(35,	39,	'Nobis rerum.',	'Debitis quae aperiam dolor quos quo esse sunt. Molestiae nesciunt ut qui magnam assumenda facere quis. Et rerum iusto neque similique. Cum ut id at in occaecati. Ullam alias enim optio natus.',	'2020-05-21 04:14:14',	NULL,	'nobis-rerum',	'img/tricks1.jpg',	NULL,	'360'),
(36,	30,	'Sint aut.',	'Modi doloremque enim inventore in ducimus. Labore ab pariatur possimus. Sit voluptatem quidem dolor eos. Praesentium sunt deleniti quam.',	'2020-05-21 04:14:14',	NULL,	'sint-aut',	'img/tricks4.jpg',	NULL,	'360'),
(37,	37,	'Non explicabo qui.',	'Est iure similique occaecati dolore inventore deleniti commodi. Exercitationem qui doloremque eaque eos at. Quia consequatur quia quasi ex et aspernatur et.',	'2020-05-21 04:14:14',	NULL,	'non-explicabo-qui',	'img/tricks5.jpg',	NULL,	'360'),
(38,	40,	'Ullam fugit libero.',	'Ut aspernatur et molestiae officiis. Et fugit explicabo impedit ducimus quis.',	'2020-05-21 04:14:14',	NULL,	'ullam-fugit-libero',	'img/tricks5.jpg',	NULL,	'360'),
(39,	40,	'Magni ut.',	'Sit soluta accusantium debitis ratione nihil sed cum. Quo eum et qui fugit mollitia ut. Ab rerum veritatis quos quis. Possimus esse ut sed vero iusto nihil pariatur et.',	'2020-05-21 04:14:14',	NULL,	'magni-ut',	'img/tricks3.jpg',	NULL,	'360'),
(40,	35,	'Et est.',	'Est quo corrupti deleniti. Nihil vitae ut et non et commodi est nihil. Delectus consequatur cumque ipsa distinctio.',	'2020-05-21 04:14:14',	NULL,	'et-est',	'img/tricks5.jpg',	NULL,	'360'),
(41,	37,	'Aut dolor qui.',	'Placeat eaque pariatur quibusdam qui tenetur expedita officiis. Nesciunt rerum repellat officiis accusantium perferendis.',	'2020-05-21 04:14:14',	NULL,	'aut-dolor-qui',	'img/tricks5.jpg',	NULL,	'360'),
(42,	38,	'Delectus dolorem assumenda.',	'Debitis nobis dolores minus ipsa. Consectetur accusamus dolorem quis qui et excepturi veniam quasi. In eum perferendis dolor amet nihil. Minus quis dolores eaque mollitia velit.',	'2020-05-21 04:14:14',	NULL,	'delectus-dolorem-assumenda',	'img/tricks1.jpg',	NULL,	'360'),
(43,	34,	'Sit illum facere.',	'Minima alias velit quam quo. Similique totam odio officiis sapiente vero consequatur corrupti. Itaque dolorem et nostrum consequuntur illo. Nisi placeat architecto non ut unde nemo.',	'2020-05-21 04:14:14',	NULL,	'sit-illum-facere',	'img/tricks1.jpg',	NULL,	'360'),
(44,	39,	'Ratione et.',	'Ratione dolorem nihil et recusandae recusandae voluptatibus. Quod non tempore exercitationem autem sunt. Iure eaque minima expedita id.',	'2020-05-21 04:14:14',	NULL,	'ratione-et',	'img/tricks2.jpg',	NULL,	'360'),
(45,	30,	'In provident.',	'Reiciendis fuga sint unde neque fuga. Est ipsa qui eveniet quo. Ratione saepe quidem et vitae ea deleniti quo.',	'2020-05-21 04:14:14',	NULL,	'in-provident',	'img/tricks6.jpg',	NULL,	'360');

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
(29,	'Théo',	'Kinder',	'kinder.theo@gmail.com',	'https://avatars.io/twitter/logiezer',	'$2y$13$kmj6Pj8WNdWBsE8SOyamPOxC0LWQOGaUvXVVkQ38rh4fDkycgEb1W',	NULL,	'theo-kinder',	'2020-05-21 04:14:10',	NULL,	NULL,	NULL,	NULL),
(30,	'Ciara',	'Larkin',	'zack.schaden@parisian.com',	'https://randomuser.me/api/portraits/women/78.jpg',	'$2y$13$jonVVIjg5KmsGpgQfkgzyua2SJHYDxyWuoGalAd3rhL6XdZ0bnB0m',	NULL,	'ciara-larkin',	'2020-05-21 04:14:10',	NULL,	NULL,	NULL,	NULL),
(31,	'Kelly',	'Hegmann',	'cleo56@yahoo.com',	'https://randomuser.me/api/portraits/women/78.jpg',	'$2y$13$3UFP2HsU1KOnIwHmbhJlzOeHkwwVZyBH291aldpb1WfSH3v.KUxo6',	NULL,	'kelly-hegmann',	'2020-05-21 04:14:11',	NULL,	NULL,	NULL,	NULL),
(32,	'Karolann',	'Brown',	'hauck.izaiah@schneider.com',	'https://randomuser.me/api/portraits/women/30.jpg',	'$2y$13$iSWS6ChobOTj8nCZfWk0e.G7hrC4zZZjKNsq.Ktxdco05AoukxiMK',	'Qui sequi ut et necessitatibus tempora autem quibusdam.',	'karolann-brown',	'2020-05-21 04:14:11',	NULL,	NULL,	NULL,	NULL),
(33,	'Kaylin',	'Hegmann',	'moises86@padberg.com',	'https://randomuser.me/api/portraits/women/74.jpg',	'$2y$13$UN2Tn75MCevXbiPAZDnF8O/zf3luJmv.ID/OGv4WcOjqLNhQQifEK',	NULL,	'kaylin-hegmann',	'2020-05-21 04:14:12',	NULL,	NULL,	NULL,	NULL),
(34,	'Tianna',	'Fisher',	'lubowitz.bailey@wehner.net',	'https://randomuser.me/api/portraits/women/72.jpg',	'$2y$13$MRpnij8.940bNwqWSq0Fu.khmpPnSPlC6uP6nKGmw8hYa50yd1QbK',	'Modi reiciendis ipsa impedit voluptatem delectus accusamus.',	'tianna-fisher',	'2020-05-21 04:14:12',	NULL,	NULL,	NULL,	NULL),
(35,	'Serena',	'Howe',	'nikko.nader@hotmail.com',	'https://randomuser.me/api/portraits/women/65.jpg',	'$2y$13$cryH/ipRtG3t/o0ag/kFdOJZVYos7sB3bA9AYneRR0xJVc2QK4yr6',	'Id ut ullam quae nihil.',	'serena-howe',	'2020-05-21 04:14:12',	NULL,	NULL,	NULL,	NULL),
(36,	'Aracely',	'Sauer',	'al.bergstrom@sawayn.org',	'https://randomuser.me/api/portraits/women/35.jpg',	'$2y$13$mC.T.owyA/AZu4iEPNWvFOpjNSnierJp.LyOPYXRvvCdgH.uDStvm',	NULL,	'aracely-sauer',	'2020-05-21 04:14:13',	NULL,	NULL,	NULL,	NULL),
(37,	'Kenyatta',	'Kulas',	'adolphus82@yahoo.com',	'https://randomuser.me/api/portraits/women/86.jpg',	'$2y$13$cRDleKkhpSrx/eGphoc.yOHvojpbABfXMdHZ5z2kDScp6IZhhbOky',	'Et est sed repellendus non eius est corrupti atque.',	'kenyatta-kulas',	'2020-05-21 04:14:13',	NULL,	NULL,	NULL,	NULL),
(38,	'Viva',	'Gleason',	'halle.wiegand@gmail.com',	'https://randomuser.me/api/portraits/women/73.jpg',	'$2y$13$3HLupFcp9R8Cxi1Ir1u59ODov0fc.HrquLbKc9IsUVPHywAMdDp/W',	'Laborum vel debitis soluta commodi iure.',	'viva-gleason',	'2020-05-21 04:14:14',	NULL,	NULL,	NULL,	NULL),
(39,	'Serenity',	'Wilkinson',	'bergstrom.mara@hotmail.com',	'https://randomuser.me/api/portraits/women/64.jpg',	'$2y$13$CgrDDgz1GpmZFR6gEtCC/ObQgS9pRf7VFOnHqqb901ZPU2Kl73SHa',	NULL,	'serenity-wilkinson',	'2020-05-21 04:14:14',	NULL,	NULL,	NULL,	NULL),
(40,	'Zoila',	'Quitzon',	'raynor.brionna@bartoletti.biz',	'https://randomuser.me/api/portraits/women/74.jpg',	'$2y$13$Xp8F7UBbhrwy/qQ9mR8cXuhcjaYmPswrQlHDgluAO95EYA/R8BST2',	NULL,	'zoila-quitzon',	'2020-05-21 04:14:14',	NULL,	NULL,	NULL,	NULL);

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
(51,	34,	'dolorem',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(52,	33,	'recusandae',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(53,	31,	'odio',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(54,	33,	'provident',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(55,	35,	'mollitia',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(56,	38,	'labore',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(57,	39,	'impedit',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(58,	32,	'iste',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(59,	32,	'tempore',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(60,	44,	'ex',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(61,	45,	'dolore',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(62,	37,	'explicabo',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(63,	33,	'sed',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(64,	38,	'maxime',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(65,	42,	'sapiente',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(66,	33,	'animi',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(67,	44,	'molestiae',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(68,	37,	'maiores',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(69,	44,	'eligendi',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(70,	42,	'sint',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(71,	34,	'ullam',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(72,	34,	'architecto',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(73,	43,	'nesciunt',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(74,	42,	'reiciendis',	'https://www.youtube.com/embed/SQyTWk7OxSI'),
(75,	31,	'magnam',	'https://www.youtube.com/embed/SQyTWk7OxSI');

-- 2020-05-21 02:14:39
