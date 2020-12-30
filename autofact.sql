/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.14-MariaDB : Database - autofact
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`autofact` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `autofact`;

/*Table structure for table `answers` */

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_number` int(11) DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forms_questions_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `answers` */

insert  into `answers`(`id`,`question_number`,`answer`,`forms_questions_id`,`users_id`,`created`) values (1,1,'MAS COSAS',1,1,'2020-12-30 22:34:26'),(2,2,'SI',1,1,'2020-12-30 22:34:26'),(3,3,'5',1,1,'2020-12-30 22:34:26');

/*Table structure for table `forms` */

DROP TABLE IF EXISTS `forms`;

CREATE TABLE `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `forms` */

insert  into `forms`(`id`,`form`,`description`,`created`) values (1,'QUIZ','QUIZ MENSUAL','2020-12-29 18:58:56');

/*Table structure for table `forms_questions` */

DROP TABLE IF EXISTS `forms_questions`;

CREATE TABLE `forms_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  `question` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forms_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `forms_questions` */

insert  into `forms_questions`(`id`,`number`,`question`,`forms_id`) values (1,1,'¿Qué te gustaría que agregáramos al informe?',1),(2,2,'¿La información es correcta?',1),(3,3,'¿Del 1 al 5, es rápido el sitio?',1);

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logs_type_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `logs` */

insert  into `logs`(`id`,`description`,`logs_type_id`,`created`) values (1,'email or password wrong',2,'2020-12-29 23:50:47');

/*Table structure for table `logs_type` */

DROP TABLE IF EXISTS `logs_type`;

CREATE TABLE `logs_type` (
  `int` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`int`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `logs_type` */

insert  into `logs_type`(`int`,`type`) values (4,'ERROR AUTENTIFICACION API'),(3,'ERROR CONEXION BD'),(2,'ERROR ENVIO FORMULARIO'),(1,'ERROR SESION');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rol` (`rol`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`rol`) values (1,'ADMINISTRADOR'),(2,'USUARIO');

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL,
  `access_way` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `exp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`users_id`,`access_way`,`token`,`created`,`exp`) values (1,1,'WEB','d8a38a1270939691cd6798a27f2251e23b930f0404fa6de13ccad91316192d28','2020-12-29 23:48:22','2020-12-29 23:58:22'),(2,1,'WEB','2fa07dc479f9da79de757ad68a6b06a73cfc9282fd70c249ed85a4a7abefe219','2020-12-29 23:51:02','2020-12-30 00:01:02'),(3,1,'WEB','a5a50cd49400a2f5422a737cc9ef285cc0416000d618c519d6d1bdcf814ac36e','2020-12-29 23:56:56','2020-12-30 00:06:56'),(4,2,'WEB','9bc696aacbd162c768563dfb0460cb5fdcae128f8dff91cbcccb18a028341e4c','2020-12-30 01:28:41','2020-12-30 01:38:41'),(5,1,'WEB','53dd739050ea787b6fe605237958d4243b5a3c9a5a92445bfca1ab7a6ee91cee','2020-12-30 01:29:08','2020-12-30 01:39:08'),(6,2,'WEB','0de3d6602f4675f16d13cc3c9c06bf66c5994dd7876a75cc5c55469c97e20288','2020-12-30 01:34:04','2020-12-30 01:44:04'),(7,1,'WEB','b0285c770f5e45c6db0e49b65fae7a67d92989e1bb67223e3ad65a0451143332','2020-12-30 01:34:29','2020-12-30 01:44:29'),(8,2,'WEB','915f160f7fbf8b4ce3270527492674288bdf1572a3cef3ee4083b5928e281c69','2020-12-30 01:34:36','2020-12-30 01:44:36'),(9,1,'WEB','5dcbed0a5a36ba4f8ef0dc3b2648387c39dd9f51126b07b82c71a1182414af1f','2020-12-30 01:34:42','2020-12-30 01:44:42'),(10,1,'WEB','0c4fabe2df0f9b64dfe0501fca267ba3f0e0a8edd7f61f23680b869333dfdb23','2020-12-30 02:36:06','2020-12-30 02:46:06'),(11,1,'WEB','5a0533e429e796a36afce935baf93288d8294c55a8704821ef9c4eb76094c8a9','2020-12-30 03:14:14','2020-12-30 03:24:14'),(12,2,'WEB','19e677f1c946472d269b6b2859e73c1d3276513ba53cc08fd8142e1a0826a98c','2020-12-30 03:14:26','2020-12-30 03:24:26'),(13,1,'WEB','f448da61656d4045c1d78e899f11f5826d36a547b149ca13c64f893f8a305bac','2020-12-30 03:14:44','2020-12-30 03:24:44'),(14,1,'WEB','87bc430b8e08acd2698b9673d0903f7247ff8292e1b1ba6fbe60b2cab75242a2','2020-12-30 03:46:00','2020-12-30 03:56:00'),(15,1,'WEB','a09bf219178d44f1d708e3f2ef340200290387addd087e1e2d7763ebb49c93b0','2020-12-30 03:46:34','2020-12-30 03:56:34'),(16,1,'WEB','7561e0d97782776e00355397309acd01deaa0c4ec26864b63fc29ea9fd9d80eb','2020-12-30 21:03:48','2020-12-30 21:13:48'),(17,1,'WEB','348ac73294d56cf6f6afe0d74631977f209df2f9fa1e2f5cde4c245d8e274df0','2020-12-30 22:11:00','2020-12-30 22:21:00'),(18,2,'WEB','bbd8696e7e36699e1755ea033c5bef9e5f999b36ea258779b1bd7c4daf7f9d75','2020-12-30 22:15:41','2020-12-30 22:25:41'),(19,1,'WEB','c3757546af943d3b3ddcb4aad889ce2249256fc95c008d14b8d6181e5a947de0','2020-12-30 22:18:48','2020-12-30 22:28:48'),(20,1,'WEB','2b8ba0f606bb787931b299daa77168c3d60c9f367ddb1b319b0da60e31071c47','2020-12-30 22:20:27','2020-12-30 22:30:27'),(21,2,'WEB','6e3f5e4b91773ddc11de4b01c10204b7d17a3ed3e51c62db64fc95de12d4bde6','2020-12-30 22:20:34','2020-12-30 22:30:34'),(22,1,'WEB','aa80b2bec46227e2b3e71935f92ed6ee999fce25621736c18577facccf098958','2020-12-30 22:21:11','2020-12-30 22:31:11'),(23,2,'WEB','0c028113676dc48711e5aa907b1772369c21b0b0967f3fae8ba4b8975735e269','2020-12-30 22:21:25','2020-12-30 22:31:25'),(24,1,'WEB','f855d54bcb747f56517dd390f92daf4006c843f75963c578269a80c8bdee61e3','2020-12-30 22:21:39','2020-12-30 22:31:39'),(25,1,'WEB','f8940c20e374de3d5cb50e53686f3e60effa8a3ee161577d461b73d23f1eb8be','2020-12-30 22:23:56','2020-12-30 22:33:56'),(26,2,'WEB','b319cef7af7afe0a86dddf0474ea1db9be99119aaa56ee3fbdcd33f85096be9d','2020-12-30 22:24:04','2020-12-30 22:34:04'),(27,1,'WEB','5d377d272f68936b27ca8f0395f7196a6a3fc09779be61aebe68598951c656ee','2020-12-30 22:25:56','2020-12-30 22:35:56'),(28,1,'WEB','af7d257dec1969adecd3b4225d3bfb5be7fcbbf87c89d34bacaab2c7aba78cb4','2020-12-30 22:27:22','2020-12-30 22:37:22'),(29,2,'WEB','cbbc73eb86680afe35be319e814089ec5f526f09bbedb4ded9f1349df343069b','2020-12-30 22:27:33','2020-12-30 22:37:33'),(30,1,'WEB','abc21937b7637921db44a0a50750b98293c093e0cddfa50a8d6933cccea153e4','2020-12-30 22:34:12','2020-12-30 22:44:12');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`roles_id`) values (1,'ADMIN','admin@gmail.com','d033e22ae348aeb5660fc2140aec35850c4da997',1),(2,'usuario1','usuario1@gmail.com','ada6d34bca926b40be00893cabc0aeae138ea2a0',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
