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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `answers` */

insert  into `answers`(`id`,`question_number`,`answer`,`forms_questions_id`,`users_id`,`created`) values (1,1,'nada mas',1,1,'2020-12-30 01:04:42'),(2,2,'SI',1,1,'2020-12-30 01:04:42'),(3,3,'5',1,1,'2020-12-30 01:04:42'),(4,1,'quizás algo mas',1,2,'2020-12-30 01:28:56'),(5,2,'SI',1,2,'2020-12-30 01:28:56'),(6,3,'1',1,2,'2020-12-30 01:28:56');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`users_id`,`access_way`,`token`,`created`,`exp`) values (1,1,'WEB','d8a38a1270939691cd6798a27f2251e23b930f0404fa6de13ccad91316192d28','2020-12-29 23:48:22','2020-12-29 23:58:22'),(2,1,'WEB','2fa07dc479f9da79de757ad68a6b06a73cfc9282fd70c249ed85a4a7abefe219','2020-12-29 23:51:02','2020-12-30 00:01:02'),(3,1,'WEB','a5a50cd49400a2f5422a737cc9ef285cc0416000d618c519d6d1bdcf814ac36e','2020-12-29 23:56:56','2020-12-30 00:06:56'),(4,2,'WEB','9bc696aacbd162c768563dfb0460cb5fdcae128f8dff91cbcccb18a028341e4c','2020-12-30 01:28:41','2020-12-30 01:38:41'),(5,1,'WEB','53dd739050ea787b6fe605237958d4243b5a3c9a5a92445bfca1ab7a6ee91cee','2020-12-30 01:29:08','2020-12-30 01:39:08'),(6,2,'WEB','0de3d6602f4675f16d13cc3c9c06bf66c5994dd7876a75cc5c55469c97e20288','2020-12-30 01:34:04','2020-12-30 01:44:04'),(7,1,'WEB','b0285c770f5e45c6db0e49b65fae7a67d92989e1bb67223e3ad65a0451143332','2020-12-30 01:34:29','2020-12-30 01:44:29'),(8,2,'WEB','915f160f7fbf8b4ce3270527492674288bdf1572a3cef3ee4083b5928e281c69','2020-12-30 01:34:36','2020-12-30 01:44:36'),(9,1,'WEB','5dcbed0a5a36ba4f8ef0dc3b2648387c39dd9f51126b07b82c71a1182414af1f','2020-12-30 01:34:42','2020-12-30 01:44:42');

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
