# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: okky.kr (MySQL 5.5.5-10.1.31-MariaDB)
# Database: okjsp2014
# Generation Time: 2018-04-20 16:04:43 +0000
# ************************************************************

grant all privileges on oknode.* to okuser@localhost identified by 'okpass';
create database oknode;
use oknode;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activity`;

CREATE TABLE `activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `avatar_id` bigint(20) NOT NULL,
  `content_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `point` int(11) NOT NULL,
  `point_type` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dp3d2bxij9mm80cxm1i3vrvl4` (`article_id`),
  KEY `FK_ana8iqeq5tiawsejshcfx1q7f` (`avatar_id`),
  KEY `FK_r3lekoitkrnolu2kdrmg514xx` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table anonymous
# ------------------------------------------------------------

DROP TABLE IF EXISTS `anonymous`;

CREATE TABLE `anonymous` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `content_id` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1qcrcuj69k45flbbkf3uboad7` (`article_id`),
  KEY `FK_8bxwecgp815alb4x6u11lgs15` (`content_id`),
  KEY `FK_5196gmxl1jy0ksli1bxmijjts` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table area_city_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `area_city_code`;

CREATE TABLE `area_city_code` (
  `id` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table area_district_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `area_district_code`;

CREATE TABLE `area_district_code` (
  `id` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `area_city_code_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_immb4s17sm93vut6c97xfoquu` (`area_city_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `a_nick_name` varchar(255) DEFAULT NULL,
  `anonymity` bit(1) NOT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `category_id` varchar(255) NOT NULL,
  `choice` bit(1) NOT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `enabled` bit(1) NOT NULL,
  `last_editor_id` bigint(20) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `note_count` int(11) NOT NULL,
  `scrap_count` int(11) NOT NULL,
  `selected_note_id` bigint(20) DEFAULT NULL,
  `tag_string` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `view_count` int(11) NOT NULL,
  `vote_count` int(11) NOT NULL,
  `create_ip` varchar(255) DEFAULT NULL,
  `is_recruit` bit(1) NOT NULL,
  `ignore_best` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ebjpyd2e71hvfsuaiflecjl6a` (`author_id`),
  KEY `FK_3xb4honslug1uo860luq52ikn` (`category_id`),
  KEY `FK_k9a5ex44phfr3v0f1k5ckgr0y` (`content_id`),
  KEY `FK_f7fkdrxc7d6nsv2hnpjh1dv0w` (`last_editor_id`),
  KEY `FK_4795giu4udp6siruemmvey9c4` (`selected_note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table article_notice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_notice`;

CREATE TABLE `article_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6iawpywbhfc1sten4x467e25u` (`article_id`),
  KEY `FK_fou879fv358j77w8n11fnhxe5` (`category_id`),
  KEY `FK_ggp2mdpq6i3i7egtom5497hrr` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table article_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_tag`;

CREATE TABLE `article_tag` (
  `article_tags_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  KEY `FK_pkndl0ud6fkak73gdkls858a5` (`tag_id`),
  KEY `FK_4o1x1bus87nayvsarmvs9rshh` (`article_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table attached_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attached_file`;

CREATE TABLE `attached_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `byte_size` int(11) NOT NULL,
  `height` int(11) DEFAULT NULL,
  `mime_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `org_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auto_passwordoid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auto_passwordoid`;

CREATE TABLE `auto_passwordoid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `oid` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_no` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dw3kajhf40u1umj2jy36x9u0v` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table avatar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `avatar`;

CREATE TABLE `avatar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `activity_point` int(11) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `picture_type` int(11) NOT NULL,
  `official` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_d1pcarfn1w8jo6n82f6vwgfci` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table avatar_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `avatar_tag`;

CREATE TABLE `avatar_tag` (
  `avatar_tags_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  KEY `FK_q94oklxk8crewpik088wfl6iv` (`tag_id`),
  KEY `FK_nfr6916v8d245denxv2hq9ny6` (`avatar_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `image` varchar(255) DEFAULT '',
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT '',
  `visible` bit(1) NOT NULL,
  `target` varchar(255) DEFAULT '',
  `content_type` varchar(255) NOT NULL DEFAULT '',
  `tag_desktop` text,
  `tag_mobile` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table banner_click
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banner_click`;

CREATE TABLE `banner_click` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `banner_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `click_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tfqq1oaqg80e6f7m2l6fx0ata` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table blocked_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blocked_ip`;

CREATE TABLE `blocked_ip` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `memo` varchar(255) NOT NULL,
  `remote_addr` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table career
# ------------------------------------------------------------

DROP TABLE IF EXISTS `career`;

CREATE TABLE `career` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `resume_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qew6oh8321lk2axn1psfr56r3` (`company_id`),
  KEY `FK_pmu1hyvbl4rxj7m2eqlft1jdg` (`resume_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `code` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `default_label` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `icon_css_names` varchar(255) DEFAULT NULL,
  `isurl` bit(1) NOT NULL,
  `label_code` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `level` int(11) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `use_evaluate` bit(1) NOT NULL,
  `use_note` bit(1) NOT NULL,
  `use_opinion` bit(1) NOT NULL,
  `use_tag` bit(1) NOT NULL,
  `writable` bit(1) NOT NULL,
  `require_tag` bit(1) DEFAULT NULL,
  `external_link` varchar(255) DEFAULT NULL,
  `write_by_external_link` bit(1) DEFAULT NULL,
  `anonymity` bit(1) DEFAULT NULL,
  `admin_only` bit(1) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_81thrbnb8c08gua7tvqj7xdqk` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table change_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `change_log`;

CREATE TABLE `change_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `md5` varchar(255) NOT NULL,
  `revision` int(11) NOT NULL,
  `patch` longtext NOT NULL,
  `avatar_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bb64pvy7hsqt3qwbh5j5c5qme` (`article_id`),
  KEY `FK_6i8uiqt8llio3sra5099uw9p7` (`content_id`),
  KEY `FK_rbn64bqld2g0omlvycjoydcs9` (`avatar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table change_log_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `change_log_copy`;

CREATE TABLE `change_log_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `md5` varchar(255) NOT NULL,
  `revision` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bb64pvy7hsqt3qwbh5j5c5qme` (`article_id`),
  KEY `FK_6i8uiqt8llio3sra5099uw9p7` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `locked` bit(1) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `register_number` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_niu8sfil2gxywcru9ah3r4ec5` (`name`),
  KEY `FK_a5g6icik7hlclc4a07hwlgo13` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table company_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company_info`;

CREATE TABLE `company_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `description` longtext,
  `email` varchar(255) NOT NULL,
  `employee_number` int(11) NOT NULL,
  `homepage_url` varchar(255) DEFAULT '',
  `tel` varchar(255) NOT NULL,
  `welfare` longtext,
  `intro_file_id` bigint(20) DEFAULT NULL,
  `manager_email` varchar(255) NOT NULL,
  `manager_name` varchar(255) NOT NULL,
  `manager_tel` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fr4mxwrpohm4rlvxt0a6pcwsl` (`company_id`),
  KEY `FK_nb4xyjucno9h3jfhe3ribu2al` (`intro_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table confirm_email
# ------------------------------------------------------------

DROP TABLE IF EXISTS `confirm_email`;

CREATE TABLE `confirm_email` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_expired` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `secured_key` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_51dbkp9mtxwffs5o5umn76f3m` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `a_nick_name` varchar(255) DEFAULT NULL,
  `anonymity` bit(1) NOT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `last_editor_id` bigint(20) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `selected` bit(1) NOT NULL,
  `text` longtext NOT NULL,
  `text_type` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `vote_count` int(11) NOT NULL,
  `create_ip` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hynbjcgrdohbxvymx72tfxnaq` (`article_id`),
  KEY `FK_47w7t3xoh40qxp9euwm3jgy7b` (`author_id`),
  KEY `FK_agfighifa6k82mn2eajv4emn8` (`last_editor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table content_attached_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_attached_file`;

CREATE TABLE `content_attached_file` (
  `content_files_id` bigint(20) DEFAULT NULL,
  `attached_file_id` bigint(20) DEFAULT NULL,
  KEY `FK_j0csro225qoklrbwqh2db309p` (`attached_file_id`),
  KEY `FK_h9jm6eprk2e69bblt9i2wc4j9` (`content_files_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table content_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_copy`;

CREATE TABLE `content_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `a_nick_name` varchar(255) DEFAULT NULL,
  `anonymity` bit(1) NOT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `author_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_editor_id` bigint(20) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `selected` bit(1) NOT NULL,
  `text` longtext NOT NULL,
  `text_type` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `vote_count` int(11) NOT NULL,
  `create_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hynbjcgrdohbxvymx72tfxnaq` (`article_id`),
  KEY `FK_47w7t3xoh40qxp9euwm3jgy7b` (`author_id`),
  KEY `FK_agfighifa6k82mn2eajv4emn8` (`last_editor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table content_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_file`;

CREATE TABLE `content_file` (
  `content_files_id` bigint(20) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  KEY `FK_cw1m9npaqjgpmldtudiwely2t` (`file_id`),
  KEY `FK_o7maf5864olqhfcvb6wgekach` (`content_files_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table content_vote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_vote`;

CREATE TABLE `content_vote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `content_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `point` int(11) NOT NULL,
  `voter_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_voter_id` (`content_id`,`voter_id`),
  KEY `FK_5s91ixn850kp3gh1d0eg07777` (`article_id`),
  KEY `FK_hgsy3uiepx3g1a8x5byhwn2ag` (`voter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table dm_disallow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_disallow`;

CREATE TABLE `dm_disallow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `attach_type` varchar(255) NOT NULL,
  `byte_size` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `org_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table follow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `follow`;

CREATE TABLE `follow` (
  `follower_id` bigint(20) NOT NULL,
  `following_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`follower_id`,`following_id`),
  KEY `FK_tkjr0k3x569btja89gb5vccck` (`following_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table job_position
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_position`;

CREATE TABLE `job_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` mediumtext NOT NULL,
  `max_career` int(11) DEFAULT NULL,
  `min_career` int(11) NOT NULL,
  `tag_string` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `max_pay` int(11) NOT NULL,
  `min_pay` int(11) NOT NULL,
  `recruit_id` bigint(20) NOT NULL,
  `duty_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r4neo26cjn5h7dcha4erpn2sj` (`recruit_id`),
  KEY `FK_9v8a1pekpk2apvslhut449e83` (`duty_id`),
  KEY `FK_4y8yr132xounfphbsouwdfdev` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table job_position_duty
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_position_duty`;

CREATE TABLE `job_position_duty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9hjn8a25dr8xaj8x52dvafqk5` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table job_position_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_position_group`;

CREATE TABLE `job_position_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table job_position_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_position_tag`;

CREATE TABLE `job_position_tag` (
  `job_position_tags_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  KEY `FK_3n8b8n0uxcgcoaalsjbu26mgl` (`tag_id`),
  KEY `FK_tk0jln89jis9xvemrhsxh7iaf` (`job_position_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table logged_in
# ------------------------------------------------------------

DROP TABLE IF EXISTS `logged_in`;

CREATE TABLE `logged_in` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `remote_addr` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1tfkvkkykspvunsasyx7x1jpa` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table managed_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `managed_user`;

CREATE TABLE `managed_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_80vtr1da3ym28hpnf8t82nuao` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table notification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `content_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `receiver_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_33lfpiiis8i1ouwf1ev3e9k1p` (`article_id`),
  KEY `FK_jf0gq222n498xej0bh7cyjfvo` (`content_id`),
  KEY `FK_hjasx3vto1njuv5li7nqqajfk` (`receiver_id`),
  KEY `FK_9v6i6w3j79wsk1cj8enfhjwmb` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table notification_read
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notification_read`;

CREATE TABLE `notification_read` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `avatar_id` bigint(20) NOT NULL,
  `last_read` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pufako83hh1ixj6ed15oqgcnc` (`avatar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oauthid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauthid`;

CREATE TABLE `oauthid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2hy0on28oron3v471plrnu1k0` (`access_token`),
  KEY `identity_idx` (`access_token`,`provider`),
  KEY `FK_m55d9kulbi1h29t7xs23ohd0w` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table opinion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `opinion`;

CREATE TABLE `opinion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment` longtext NOT NULL,
  `content_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `vote_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_62quyovrifvn7rv0ln44e3mxp` (`author_id`),
  KEY `FK_q6xvoyhwue5c9plig8t0krs87` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table person
# ------------------------------------------------------------

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `dm_allowed` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `homepage_url` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `resume_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bmitwdbd0ff8brd63rr4j54sf` (`company_id`),
  KEY `FK_ahb0uu9t59ntbxb11sk3u1eyc` (`resume_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table recruit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruit`;

CREATE TABLE `recruit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `closed` bit(1) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `district` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `job_type` varchar(255) NOT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `tel` varchar(255) NOT NULL,
  `working_month` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lqfg3efxa59nvxeyqf3t8jik9` (`article_id`),
  KEY `FK_ss1068deh7uf6r3qk4jtd4k7l` (`company_id`),
  KEY `job_type` (`job_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table recruit_job_position
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruit_job_position`;

CREATE TABLE `recruit_job_position` (
  `recruit_job_positions_id` bigint(20) DEFAULT NULL,
  `job_position_id` bigint(20) DEFAULT NULL,
  KEY `FK_huhx8qm9t2iplynlule1xgp2i` (`job_position_id`),
  KEY `FK_nw06m3n8itfrj9h107swbibsb` (`recruit_job_positions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table resume
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resume`;

CREATE TABLE `resume` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_irsamgnera6angm0prq1kemt2` (`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table scrap
# ------------------------------------------------------------

DROP TABLE IF EXISTS `scrap`;

CREATE TABLE `scrap` (
  `article_id` bigint(20) NOT NULL,
  `avatar_id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`article_id`,`avatar_id`),
  KEY `FK_b2beb1ioonv94wdbbt6wfgb95` (`avatar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table spam_word
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spam_word`;

CREATE TABLE `spam_word` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `tagged_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1wdpsed5kna2y38hnbgrnhi5b` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tag_similar_text
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tag_similar_text`;

CREATE TABLE `tag_similar_text` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_htfd8kv9to3fvlbt52q77n5js` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `avatar_id` bigint(20) NOT NULL,
  `create_ip` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `enabled` bit(1) NOT NULL,
  `last_password_changed` datetime NOT NULL,
  `last_update_ip` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `person_id` bigint(20) NOT NULL,
  `username` varchar(15) NOT NULL,
  `date_withdraw` datetime DEFAULT NULL,
  `withdraw` bit(1) NOT NULL,
  `oid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1wch7xpck1m4hv6371lijpnq3` (`avatar_id`),
  UNIQUE KEY `UK_skugu4aa786hx4o05wn6cs7q0` (`person_id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK_apcc8lxk2xnug8377fatvbn04` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
