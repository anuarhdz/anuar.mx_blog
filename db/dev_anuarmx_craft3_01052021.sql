-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 06-01-2021 a las 02:04:13
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dev_anuarmx_craft3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_assetindexdata`
--

CREATE TABLE `amx_assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_assets`
--

CREATE TABLE `amx_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_assets`
--

INSERT INTO `amx_assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(27, 1, 1, 1, 'photo.jpg', 'image', 2000, 2000, 793184, NULL, NULL, NULL, '2020-12-30 03:42:37', '2020-12-30 03:42:38', '2020-12-30 03:42:38', 'cf5de68b-bf47-49f8-b3e8-dab035fd670c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_assettransformindex`
--

CREATE TABLE `amx_assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_assettransforms`
--

CREATE TABLE `amx_assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_categories`
--

CREATE TABLE `amx_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_categorygroups`
--

CREATE TABLE `amx_categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_categorygroups_sites`
--

CREATE TABLE `amx_categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_changedattributes`
--

CREATE TABLE `amx_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_changedattributes`
--

INSERT INTO `amx_changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 'title', '2020-12-31 23:17:40', 0, 1),
(2, 1, 'uri', '2021-01-01 19:45:56', 0, 1),
(18, 1, 'uri', '2021-01-01 19:53:09', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_changedfields`
--

CREATE TABLE `amx_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_content`
--

CREATE TABLE `amx_content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_siteHeader` text,
  `field_footer` text,
  `field_newsletterTitle` text,
  `field_newsletterDescription` text,
  `field_authorBio` text,
  `field_instagramAuthor` varchar(255) DEFAULT NULL,
  `field_linkedinAuthor` varchar(255) DEFAULT NULL,
  `field_githubAuthor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_content`
--

INSERT INTO `amx_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_siteHeader`, `field_footer`, `field_newsletterTitle`, `field_newsletterDescription`, `field_authorBio`, `field_instagramAuthor`, `field_linkedinAuthor`, `field_githubAuthor`) VALUES
(1, 1, 1, NULL, '2020-12-24 05:20:48', '2020-12-24 05:20:48', '956eec72-bf49-4adf-a023-fe00b6777eaf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 'Blog', '2020-12-24 05:53:10', '2021-01-01 19:45:57', 'cb215c60-c040-499b-b7bd-12bad45978a1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 1, 'blog', '2020-12-24 05:53:10', '2020-12-24 05:53:10', '34fdbfb9-3ca8-44c3-b7e5-71351a0d9301', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 1, NULL, '2020-12-27 02:09:22', '2020-12-31 04:30:24', 'adb131cc-022f-4327-a340-67ee510e3148', 'Lorem ipsum dolor sit amet', '2020 © Anuar Reyes | Developed and designed by me with :heart:️ and ☕️ in CraftCMS.', 'Quisque dui eros?', 'Praesent rutrum sapien vel dolor feugiat, in semper risus condimentum. Mauris dolor sem, rutrum condimentum lorem eu, volutpat viverra arcu. Sed eleifend accumsan volutpat. <br />\nAliquam sapien diam.', NULL, NULL, NULL, NULL),
(5, 5, 1, 'blog', '2020-12-27 02:13:58', '2020-12-27 02:13:58', '9964dce9-9651-4667-83d9-2512dcdee831', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 1, 'blog', '2020-12-27 02:15:54', '2020-12-27 02:15:54', '50e80ddd-8a89-43f6-a4cf-8b71ff668c93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 1, 'blog', '2020-12-27 02:24:28', '2020-12-27 02:24:28', '0e989f15-7d1d-4847-a344-f1c8e8e24438', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 8, 1, 'blog', '2020-12-27 02:24:44', '2020-12-27 02:24:44', 'bcc05cfe-050f-4c09-89c4-e3a3ea03cdb1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 9, 1, 'blog', '2020-12-27 02:26:41', '2020-12-27 02:26:41', '57b227c6-b18c-404f-b2a0-0b91c1b42c6c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 10, 1, 'blog', '2020-12-27 02:27:50', '2020-12-27 02:27:50', 'ab96e624-e2e7-4357-89f8-61c6e61f8223', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 11, 1, 'blog', '2020-12-27 02:32:17', '2020-12-27 02:32:17', '26ddd39a-2cc8-4e3e-a445-9361b73d401b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 12, 1, 'about-me', '2020-12-27 02:35:35', '2020-12-27 02:37:00', 'a402f539-5731-42fb-9213-633e63b836cd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 13, 1, 'about-me', '2020-12-27 02:35:35', '2020-12-27 02:35:35', 'b52fd68d-252c-4737-8d58-dbe1a35be0f5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 14, 1, 'about-me', '2020-12-27 02:37:00', '2020-12-27 02:37:00', '49d8f229-091c-4cf2-9eec-6ce421052962', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 18, 1, 'blog article', '2020-12-27 22:44:33', '2021-01-01 19:53:09', 'ce0aa924-a7bb-4f91-8ce6-e4283833c6c6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 19, 1, 'blog article', '2020-12-27 22:44:33', '2020-12-27 22:44:33', '10c669b1-4d34-4b99-af0a-6f65de6b9e9f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 21, 1, 'blog', '2020-12-29 05:31:45', '2020-12-29 05:31:45', '0f524f6b-096a-4cc3-b1ab-e6d94c56b739', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 22, 1, 'blog', '2020-12-29 05:32:00', '2020-12-29 05:32:00', 'd97281d6-b340-49d8-9687-b8510b0224f2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 23, 1, 'Sobre mi', '2020-12-29 19:52:48', '2020-12-30 03:58:29', 'bb68a2db-0703-4c52-a674-65667ec9c116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 24, 1, 'Sobre mi', '2020-12-29 19:52:48', '2020-12-29 19:52:48', '0b318e3e-fc83-4056-8085-e83535e866aa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 25, 1, 'Sobre mi', '2020-12-29 19:52:49', '2020-12-29 19:52:49', '9c696b25-6475-4861-8f3e-32af8bb8ea71', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 26, 1, NULL, '2020-12-30 03:27:33', '2020-12-30 03:45:19', '20586f9d-6eda-4784-a229-f1d97fbc375d', NULL, NULL, NULL, NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla id dolor ac ipsum tristique vehicula. Quisque a sem malesuada, tempor dui eu, eleifend leo. Vivamus non faucibus tellus, in interdum metus. Quisque ut augue tortor. Ut eget lobortis dui. Aliquam eget pharetra lectus. In hac habitasse platea dictumst. Quisque commodo tortor ac lectus fringilla viverra. </p>\n<p>Aliquam elementum purus ac leo ultrices consequat. In a lobortis lorem. Nulla sollicitudin, sapien tristique egestas mattis, diam ante bibendum nibh, sit amet fringilla diam nisl sed lectus. Nullam malesuada condimentum cursus. Duis purus nunc, eleifend in lobortis ac, eleifend vitae mauris.</p>', 'https://instagram.com', 'https://linkedin.com', 'https://github.com'),
(23, 27, 1, 'Photo', '2020-12-30 03:42:35', '2020-12-30 03:42:35', 'dc5e7d1c-7bbb-491b-9236-0dc56e7df11c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 28, 1, 'Sobre mi', '2020-12-30 03:58:29', '2020-12-30 03:58:29', '6894bcfb-07f2-43cb-8048-525a365bb295', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 29, 1, 'Contacto', '2020-12-30 22:42:27', '2020-12-30 22:42:27', '0ff2e973-3500-4c87-8f67-3ef58552cffb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 30, 1, 'Contacto', '2020-12-30 22:42:27', '2020-12-30 22:42:27', '78131c03-3555-4a36-9d63-86a96d81fd32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 31, 1, 'blog', '2020-12-31 23:17:07', '2020-12-31 23:17:07', '1b7c3615-a9c0-4297-9e06-68cb30b4571e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 32, 1, 'blog article', '2020-12-31 23:17:17', '2020-12-31 23:17:17', '74af1520-f37f-40b1-a643-11738374c600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 33, 1, 'Blog', '2020-12-31 23:17:40', '2020-12-31 23:17:40', '02eb9689-985e-492b-a21e-b3cbf4783b21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 34, 1, 'blog article', '2020-12-31 23:17:52', '2020-12-31 23:17:52', 'c2b71fa0-3418-4e38-9506-ba1a7cd15932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 35, 1, 'blog article', '2020-12-31 23:18:03', '2020-12-31 23:18:03', 'bfe1afe4-68ef-4917-a8a4-db245fcf8e79', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 36, 1, 'Home', '2020-12-31 23:26:11', '2020-12-31 23:26:11', 'd729dd19-6890-4692-a5fb-e3904678a42a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 37, 1, 'Home', '2020-12-31 23:26:11', '2020-12-31 23:26:11', '7b395ba6-bde1-4a32-91cb-0e70fe2e99fb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 38, 1, 'Blog', '2021-01-01 19:45:56', '2021-01-01 19:45:56', 'd8950fa0-cd68-45ba-a511-8c11b7349520', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 39, 1, 'blog article', '2021-01-01 19:51:52', '2021-01-01 19:51:52', 'dbfde48c-fbff-4dcc-ab63-fd6f24f63882', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 40, 1, 'blog article', '2021-01-01 19:53:09', '2021-01-01 19:53:09', 'd0886a46-b330-4a6c-a599-3e768b39c768', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 41, 1, 'Thank You Page', '2021-01-06 01:57:31', '2021-01-06 01:57:31', 'ec3f2c0f-681c-4e5d-aebe-d1248b7718c3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 42, 1, 'Thank You Page', '2021-01-06 01:57:31', '2021-01-06 01:57:31', '8f376f7f-e728-4446-b032-a75c7f95a7ab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_craftidtokens`
--

CREATE TABLE `amx_craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_deprecationerrors`
--

CREATE TABLE `amx_deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_drafts`
--

CREATE TABLE `amx_drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_elementindexsettings`
--

CREATE TABLE `amx_elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_elements`
--

CREATE TABLE `amx_elements` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_elements`
--

INSERT INTO `amx_elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2020-12-24 05:20:48', '2020-12-24 05:20:48', NULL, '5990e293-1a00-47a0-9c96-0a117f476317'),
(2, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-24 05:53:10', '2021-01-01 19:45:56', NULL, '3e6e24e3-ef37-4f49-b5f8-cd2352525f3c'),
(3, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-24 05:53:10', '2020-12-24 05:53:10', NULL, '58117750-2cf3-4494-a5f4-956d26c5f4c3'),
(4, NULL, NULL, 2, 'craft\\elements\\GlobalSet', 1, 0, '2020-12-27 02:09:22', '2020-12-31 04:30:24', NULL, 'd89e9952-5adf-4287-9055-5c96de44ddc7'),
(5, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-27 02:13:58', '2020-12-27 02:13:58', NULL, '2454bdcc-7906-4950-9f1d-5e46b8ed9d2e'),
(6, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-27 02:15:54', '2020-12-27 02:15:54', NULL, '87fae5f4-ff0a-468d-b92d-d05f07c15bef'),
(7, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-27 02:24:28', '2020-12-27 02:24:28', NULL, '788e0725-fe27-4e42-a0e7-b9255464b094'),
(8, NULL, 5, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-27 02:24:44', '2020-12-27 02:24:44', NULL, 'ba18d04a-9421-47c8-83da-7913de9e93c0'),
(9, NULL, 6, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-27 02:26:41', '2020-12-27 02:26:41', NULL, 'cf64c79c-cfa8-439f-bd79-b42f1ffdd0eb'),
(10, NULL, 7, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-27 02:27:50', '2020-12-27 02:27:50', NULL, '19538540-a7de-4edc-92a2-131379c1466f'),
(11, NULL, 8, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-27 02:32:17', '2020-12-27 02:32:17', NULL, '3f955325-8d01-4a6d-b569-00b3c7aa294d'),
(12, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2020-12-27 02:35:35', '2020-12-27 02:37:00', '2020-12-27 02:40:39', '3d2e9c4e-9b70-41e1-8152-f42a5f003160'),
(13, NULL, 9, 3, 'craft\\elements\\Entry', 1, 0, '2020-12-27 02:35:35', '2020-12-27 02:35:35', '2020-12-27 02:40:39', 'b230ec28-458f-487f-8e82-ccb45cd6f82c'),
(14, NULL, 10, 3, 'craft\\elements\\Entry', 1, 0, '2020-12-27 02:37:00', '2020-12-27 02:37:00', '2020-12-27 02:40:39', 'af8ff934-5b70-4118-8824-ee79c0e73533'),
(15, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-27 21:44:19', '2020-12-29 19:55:00', '2020-12-29 22:59:14', '311f282c-4c6c-4905-9941-a7f8cccace68'),
(16, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-27 22:00:29', '2020-12-31 04:30:24', NULL, '32722655-f7cf-4c6e-8c30-44522f2589a8'),
(17, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-27 22:00:43', '2020-12-31 04:30:24', NULL, '280b518e-4d26-4829-a66d-54e27d8517ed'),
(18, NULL, NULL, 5, 'craft\\elements\\Entry', 1, 0, '2020-12-27 22:44:33', '2021-01-01 19:53:09', NULL, '4ef2360a-c8f5-4b4a-9080-4ac412c52462'),
(19, NULL, 11, 5, 'craft\\elements\\Entry', 1, 0, '2020-12-27 22:44:33', '2020-12-27 22:44:33', NULL, '1d23c5e3-89ac-4051-bb12-2b4af376656d'),
(20, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-29 02:08:16', '2020-12-29 02:19:43', '2020-12-29 07:50:06', 'bc21afc0-c8ba-4bc1-bbee-dbdefe647c8b'),
(21, NULL, 12, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-29 05:31:45', '2020-12-29 05:31:45', NULL, '11b9d366-bdf5-4f75-aa9a-5841dc95a30a'),
(22, NULL, 13, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-29 05:32:00', '2020-12-29 05:32:00', NULL, 'facd18b8-0bb8-438d-a9a6-c59f5c83f065'),
(23, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-29 19:52:48', '2020-12-30 03:58:29', NULL, '2195be02-b3c4-4d5d-b52a-a27cb6cb009d'),
(24, NULL, 14, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-29 19:52:48', '2020-12-29 19:52:48', NULL, 'e4ece668-f585-4802-89b1-f10c90085ffb'),
(25, NULL, 15, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-29 19:52:49', '2020-12-29 19:52:49', NULL, 'f24d515e-144b-4299-afe5-18c9958f9fc2'),
(26, NULL, NULL, 8, 'craft\\elements\\GlobalSet', 1, 0, '2020-12-30 03:27:33', '2020-12-30 03:45:19', NULL, '36f8d6fb-edac-4e19-b7f9-3f86922399a3'),
(27, NULL, NULL, 7, 'craft\\elements\\Asset', 1, 0, '2020-12-30 03:42:35', '2020-12-30 03:42:35', NULL, 'ae2fd681-213b-4c8b-b8f1-ea86042cb6d2'),
(28, NULL, 16, 6, 'craft\\elements\\Entry', 1, 0, '2020-12-30 03:58:29', '2020-12-30 03:58:29', NULL, '2372aee5-fb68-4925-8ab5-ddf50bd0fbff'),
(29, NULL, NULL, 10, 'craft\\elements\\Entry', 1, 0, '2020-12-30 22:42:27', '2020-12-30 22:42:27', NULL, '4d550f56-877f-46c2-816b-c751df4773f4'),
(30, NULL, 17, 10, 'craft\\elements\\Entry', 1, 0, '2020-12-30 22:42:27', '2020-12-30 22:42:27', NULL, '2bdc8e9f-ac39-45bd-9679-ddd23bdc2768'),
(31, NULL, 18, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-31 23:17:07', '2020-12-31 23:17:07', NULL, '2e16812a-c80b-47a1-98b1-5b56421356cb'),
(32, NULL, 19, 5, 'craft\\elements\\Entry', 1, 0, '2020-12-31 23:17:17', '2020-12-31 23:17:17', NULL, '1568b32b-e266-4d74-86ca-3c7ec8a419ae'),
(33, NULL, 20, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-31 23:17:40', '2020-12-31 23:17:40', NULL, 'c00ccf15-f7d6-4bcd-bd4f-e15f99e74005'),
(34, NULL, 21, 5, 'craft\\elements\\Entry', 1, 0, '2020-12-31 23:17:52', '2020-12-31 23:17:52', NULL, '2f769f94-be1b-4afc-8826-4c36174a504c'),
(35, NULL, 22, 5, 'craft\\elements\\Entry', 1, 0, '2020-12-31 23:18:03', '2020-12-31 23:18:03', NULL, '543a79b1-7f67-45e8-9a05-91820b27e4fb'),
(36, NULL, NULL, 11, 'craft\\elements\\Entry', 1, 0, '2020-12-31 23:26:11', '2020-12-31 23:26:11', '2021-01-01 19:45:48', '66290b86-007a-497d-82f3-39caafd27140'),
(37, NULL, 23, 11, 'craft\\elements\\Entry', 1, 0, '2020-12-31 23:26:11', '2020-12-31 23:26:11', '2021-01-01 19:45:48', 'e64b1066-395b-4dbd-8fed-5874808d98a5'),
(38, NULL, 24, 1, 'craft\\elements\\Entry', 1, 0, '2021-01-01 19:45:56', '2021-01-01 19:45:56', NULL, '994a156f-96bc-49b1-8e62-580f7ac8f817'),
(39, NULL, 25, 5, 'craft\\elements\\Entry', 1, 0, '2021-01-01 19:51:52', '2021-01-01 19:51:52', NULL, 'b914d07f-e3a7-4f00-8406-4241b058a6c4'),
(40, NULL, 26, 5, 'craft\\elements\\Entry', 1, 0, '2021-01-01 19:53:09', '2021-01-01 19:53:09', NULL, '29bd32a0-dfc4-45d4-a8f7-b573de40d54a'),
(41, NULL, NULL, 12, 'craft\\elements\\Entry', 1, 0, '2021-01-06 01:57:31', '2021-01-06 01:57:31', NULL, '939c1f49-9ff0-460f-9a63-c3342a008217'),
(42, NULL, 27, 12, 'craft\\elements\\Entry', 1, 0, '2021-01-06 01:57:31', '2021-01-06 01:57:31', NULL, '7c9119ec-3003-4f97-bba3-a7b7969db798');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_elements_sites`
--

CREATE TABLE `amx_elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_elements_sites`
--

INSERT INTO `amx_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2020-12-24 05:20:48', '2020-12-24 05:20:48', '73e783c9-cb69-40bb-b8e0-9bedd08b24fd'),
(2, 2, 1, 'blog', '__home__', 1, '2020-12-24 05:53:10', '2021-01-01 19:45:56', '1b7f1337-ca0b-4a1f-a53a-a66f8b9a42a7'),
(3, 3, 1, 'blog', '__home__', 1, '2020-12-24 05:53:10', '2020-12-24 05:53:10', 'ae06d317-0460-4d14-b11e-2ab5ed1bdf79'),
(4, 4, 1, NULL, NULL, 1, '2020-12-27 02:09:22', '2020-12-27 02:09:22', '0b6d07d9-b650-42d3-8827-bde20d403db1'),
(5, 5, 1, 'blog', '__home__', 1, '2020-12-27 02:13:58', '2020-12-27 02:13:58', '04482e93-b920-46d0-ab80-57a8f1600d64'),
(6, 6, 1, 'blog', '__home__', 1, '2020-12-27 02:15:54', '2020-12-27 02:15:54', 'b2e7abb7-8be3-4ec5-9229-bddb911852ae'),
(7, 7, 1, 'blog', '__home__', 1, '2020-12-27 02:24:28', '2020-12-27 02:24:28', 'ac501fb4-25ec-47b6-8753-b0a0fa84023d'),
(8, 8, 1, 'blog', '__home__', 1, '2020-12-27 02:24:44', '2020-12-27 02:24:44', '5abbf455-d653-4cf6-92a1-0796c66dd977'),
(9, 9, 1, 'blog', '__home__', 1, '2020-12-27 02:26:41', '2020-12-27 02:26:41', 'e7d68222-3223-4036-9298-1a35a7897e08'),
(10, 10, 1, 'blog', '__home__', 1, '2020-12-27 02:27:50', '2020-12-27 02:27:50', '0bf5bde6-5034-4700-8f6b-633c1a1fbc1c'),
(11, 11, 1, 'blog', '__home__', 1, '2020-12-27 02:32:17', '2020-12-27 02:32:17', '1ef367f8-1949-4902-b2ae-5ca5f07c8c66'),
(12, 12, 1, 'about-me', 'about-me', 1, '2020-12-27 02:35:35', '2020-12-27 02:35:35', 'fe8d6bec-0e22-4688-bfad-aa91a24545b9'),
(13, 13, 1, 'about-me', 'about-me', 1, '2020-12-27 02:35:35', '2020-12-27 02:35:35', '8b8a67cd-ffc0-446a-8433-f9d8729e6ae9'),
(14, 14, 1, 'about-me', 'about-me', 1, '2020-12-27 02:37:00', '2020-12-27 02:37:00', '2ee38720-1759-4ea8-9e89-49a5d19a6261'),
(15, 15, 1, NULL, NULL, 1, '2020-12-27 21:44:19', '2020-12-27 21:44:19', '8cb306d6-9f24-494f-a35d-010e7f15ce4f'),
(16, 16, 1, NULL, NULL, 1, '2020-12-27 22:00:29', '2020-12-27 22:00:29', 'fd418840-8051-4975-813f-18670dea3f50'),
(17, 17, 1, NULL, NULL, 1, '2020-12-27 22:00:43', '2020-12-27 22:00:43', 'd5cc0f55-a587-4e3b-a60c-6b96f219b67b'),
(18, 18, 1, 'blog-article', 'article', 1, '2020-12-27 22:44:33', '2021-01-01 19:53:09', 'e7c2b59e-d0a7-47f4-9c90-b7b3bbc209f5'),
(19, 19, 1, 'blog-article', 'article', 1, '2020-12-27 22:44:33', '2020-12-27 22:44:33', 'adb4b46a-4833-4666-9047-1f9b440305fe'),
(20, 20, 1, NULL, NULL, 1, '2020-12-29 02:08:16', '2020-12-29 02:08:16', 'c116fd15-2d55-4ee0-99bb-1280b464278e'),
(21, 21, 1, 'blog', '__home__', 1, '2020-12-29 05:31:45', '2020-12-29 05:31:45', 'd4b1ca5e-24f4-45b1-979f-39d32a1b686e'),
(22, 22, 1, 'blog', '__home__', 1, '2020-12-29 05:32:00', '2020-12-29 05:32:00', 'beb0227f-a135-427c-9d0b-f6f193ce7523'),
(23, 23, 1, 'sobre-mi', 'sobre-mi', 1, '2020-12-29 19:52:48', '2020-12-29 19:52:48', 'e6140322-6f0c-49ef-bebb-4955b9f68181'),
(24, 24, 1, 'sobre-mi', 'sobre-mi', 1, '2020-12-29 19:52:48', '2020-12-29 19:52:48', 'c05fa706-a91c-49fc-8726-5cb2c3c67b5b'),
(25, 25, 1, 'sobre-mi', 'sobre-mi', 1, '2020-12-29 19:52:49', '2020-12-29 19:52:49', 'db5c9f4a-afc7-4a8b-b32c-3ad28ec1bab3'),
(26, 26, 1, NULL, NULL, 1, '2020-12-30 03:27:33', '2020-12-30 03:27:33', 'e6a3a984-6ad3-47f9-8861-5d7b7fde7909'),
(27, 27, 1, NULL, NULL, 1, '2020-12-30 03:42:35', '2020-12-30 03:42:35', 'fcae263e-b707-4c6b-ba51-d3a176cd0ec8'),
(28, 28, 1, 'sobre-mi', 'sobre-mi', 1, '2020-12-30 03:58:29', '2020-12-30 03:58:29', 'cea55f7d-53a8-4220-8433-e789ea14f714'),
(29, 29, 1, 'contacto', 'contacto', 1, '2020-12-30 22:42:27', '2020-12-30 22:42:27', '7c9acb2c-dec8-4fb7-b7f6-a140ea12f608'),
(30, 30, 1, 'contacto', 'contacto', 1, '2020-12-30 22:42:27', '2020-12-30 22:42:27', '5f9ec221-e1d2-4515-889a-d900704fb965'),
(31, 31, 1, 'blog', 'blog', 1, '2020-12-31 23:17:07', '2020-12-31 23:17:07', 'ae6c86e1-06e5-45c4-8900-9d5c28c08e2d'),
(32, 32, 1, 'blog-article', 'blog/article', 1, '2020-12-31 23:17:17', '2020-12-31 23:17:17', '38bcf92f-0bbc-48eb-9914-09ac837c86e3'),
(33, 33, 1, 'blog', 'blog', 1, '2020-12-31 23:17:40', '2020-12-31 23:17:40', '33d07099-f43d-4467-a5cc-02399c34a30b'),
(34, 34, 1, 'blog-article', 'blog/article', 1, '2020-12-31 23:17:52', '2020-12-31 23:17:52', '183cbace-f3df-4ef5-82c7-3fd81f3edd8a'),
(35, 35, 1, 'blog-article', 'blog/article', 1, '2020-12-31 23:18:03', '2020-12-31 23:18:03', '0eb7d87f-f4b2-4709-8e8e-735f0ebc932f'),
(36, 36, 1, 'home', '__home__', 1, '2020-12-31 23:26:11', '2020-12-31 23:26:11', '45efc68a-6e5c-46c2-8786-dff23addb4d5'),
(37, 37, 1, 'home', '__home__', 1, '2020-12-31 23:26:11', '2020-12-31 23:26:11', '97005c50-08bf-4d64-ad67-da86b001e490'),
(38, 38, 1, 'blog', '__home__', 1, '2021-01-01 19:45:56', '2021-01-01 19:45:56', '61dfd32e-eeab-49c7-b600-00cebce26545'),
(39, 39, 1, 'blog-article', 'blog/article', 1, '2021-01-01 19:51:52', '2021-01-01 19:51:52', 'd611f02a-a6e5-4809-9b06-02f394925702'),
(40, 40, 1, 'blog-article', 'article', 1, '2021-01-01 19:53:09', '2021-01-01 19:53:09', '80b40784-eaf8-47bd-b185-4a05bd4a333e'),
(41, 41, 1, 'thank-you-page', 'contacto/thanks', 1, '2021-01-06 01:57:31', '2021-01-06 01:57:31', 'a0ef489c-0825-4837-8b8e-ec8a903c4ee0'),
(42, 42, 1, 'thank-you-page', 'contacto/thanks', 1, '2021-01-06 01:57:31', '2021-01-06 01:57:31', '1e28f13f-e061-44cb-b5d0-9dd69e62bfca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_entries`
--

CREATE TABLE `amx_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_entries`
--

INSERT INTO `amx_entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-24 05:53:10', '2020-12-24 05:53:10', '6e60b048-ce94-4346-ac58-8247fe917ba8'),
(3, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-24 05:53:10', '2020-12-24 05:53:10', 'e9a959c1-8d10-4284-9ff4-b510069c652f'),
(5, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-27 02:13:58', '2020-12-27 02:13:58', 'b9688df4-d6ee-438d-b493-b8f87b571332'),
(6, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-27 02:15:54', '2020-12-27 02:15:54', '5f16db8f-9984-4253-85b8-0de86147611e'),
(7, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-27 02:24:28', '2020-12-27 02:24:28', 'd10b1047-be9d-4676-87f4-927821fa77b8'),
(8, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-27 02:24:44', '2020-12-27 02:24:44', '3eee743c-2b46-46f7-8e9a-6de7023f69ca'),
(9, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-27 02:26:41', '2020-12-27 02:26:41', 'c3628adb-5bd0-4ea9-9654-2ede1d993397'),
(10, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-27 02:27:50', '2020-12-27 02:27:50', 'a037a54e-d462-4b31-bad7-ca937fc321cf'),
(11, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-27 02:32:17', '2020-12-27 02:32:17', '0ac160d6-e96b-4064-9166-31402526c352'),
(12, 2, NULL, 2, NULL, '2020-12-27 02:35:00', NULL, 1, '2020-12-27 02:35:35', '2020-12-27 02:35:35', '3a903945-90c2-40bf-a11e-17e09ea7744b'),
(13, 2, NULL, 2, NULL, '2020-12-27 02:35:00', NULL, NULL, '2020-12-27 02:35:35', '2020-12-27 02:35:35', 'c17262b8-327f-498a-bfb2-8a38588e1728'),
(14, 2, NULL, 2, NULL, '2020-12-27 02:35:00', NULL, NULL, '2020-12-27 02:37:00', '2020-12-27 02:37:00', '8e8e8c16-bf16-4666-a8c6-f97cf19caca2'),
(18, 3, NULL, 3, NULL, '2020-12-27 22:44:00', NULL, NULL, '2020-12-27 22:44:33', '2020-12-27 22:44:33', '9d38554b-d1b4-46db-a52c-4864eb2cabf1'),
(19, 3, NULL, 3, NULL, '2020-12-27 22:44:00', NULL, NULL, '2020-12-27 22:44:33', '2020-12-27 22:44:33', 'bc025144-ca62-4d12-b219-82cc3909e22b'),
(21, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-29 05:31:45', '2020-12-29 05:31:45', '6f2e7173-3d6e-4996-a3bd-4a10ff36e0a5'),
(22, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-29 05:32:00', '2020-12-29 05:32:00', 'ee974de9-6568-43e7-9d7d-05ca9d872e14'),
(23, 4, NULL, 4, NULL, '2020-12-29 19:52:00', NULL, NULL, '2020-12-29 19:52:48', '2020-12-29 19:52:48', 'cc122ac3-1101-4c20-830e-62fd022c6947'),
(24, 4, NULL, 4, NULL, '2020-12-29 19:52:00', NULL, NULL, '2020-12-29 19:52:48', '2020-12-29 19:52:48', '6117d5bd-985d-4a2b-9a00-caad8d4e28f4'),
(25, 4, NULL, 4, NULL, '2020-12-29 19:52:00', NULL, NULL, '2020-12-29 19:52:49', '2020-12-29 19:52:49', '8805ea9e-1f87-4138-b665-0898da17af43'),
(28, 4, NULL, 4, NULL, '2020-12-29 19:52:00', NULL, NULL, '2020-12-30 03:58:29', '2020-12-30 03:58:29', '4eb287ad-eafe-4c37-8438-1cdc50b1e97f'),
(29, 5, NULL, 5, NULL, '2020-12-30 22:42:00', NULL, NULL, '2020-12-30 22:42:27', '2020-12-30 22:42:27', '588ea33e-11e3-4e42-81ec-23cff408d7aa'),
(30, 5, NULL, 5, NULL, '2020-12-30 22:42:00', NULL, NULL, '2020-12-30 22:42:27', '2020-12-30 22:42:27', 'adeac831-00ff-4867-bdd3-0db12117f0bd'),
(31, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-31 23:17:07', '2020-12-31 23:17:07', '7ef87308-0ac3-4fa1-b8a7-9ac2041180c2'),
(32, 3, NULL, 3, NULL, '2020-12-27 22:44:00', NULL, NULL, '2020-12-31 23:17:17', '2020-12-31 23:17:17', '936c4428-3526-4258-96c0-279c97337d6e'),
(33, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2020-12-31 23:17:40', '2020-12-31 23:17:40', '833f8911-d844-467a-b1c8-bbd17b29bb39'),
(34, 3, NULL, 3, NULL, '2020-12-27 22:44:00', NULL, NULL, '2020-12-31 23:17:52', '2020-12-31 23:17:52', '104eba5d-3034-4bcf-9769-4000979d0419'),
(35, 3, NULL, 3, NULL, '2020-12-27 22:44:00', NULL, NULL, '2020-12-31 23:18:03', '2020-12-31 23:18:03', 'aacf2a30-2046-4531-a4ec-a30bbcb058f2'),
(36, 6, NULL, 6, NULL, '2020-12-31 23:26:00', NULL, 1, '2020-12-31 23:26:11', '2020-12-31 23:26:11', '3dd8ecd8-7e43-488d-b2ce-be2a614f46a5'),
(37, 6, NULL, 6, NULL, '2020-12-31 23:26:00', NULL, NULL, '2020-12-31 23:26:11', '2020-12-31 23:26:11', '6345504c-9a9d-45ff-8523-35091544207c'),
(38, 1, NULL, 1, NULL, '2020-12-24 05:53:00', NULL, NULL, '2021-01-01 19:45:56', '2021-01-01 19:45:56', '5ed3b0c4-e677-449f-8335-a266d239f045'),
(39, 3, NULL, 3, NULL, '2020-12-27 22:44:00', NULL, NULL, '2021-01-01 19:51:52', '2021-01-01 19:51:52', 'd78e5637-d060-4fee-99de-6be13183396e'),
(40, 3, NULL, 3, NULL, '2020-12-27 22:44:00', NULL, NULL, '2021-01-01 19:53:09', '2021-01-01 19:53:09', '945ee190-e23a-4af4-a10e-5d54e0ba9e8c'),
(41, 7, NULL, 7, NULL, '2021-01-06 01:57:00', NULL, NULL, '2021-01-06 01:57:31', '2021-01-06 01:57:31', 'f2a1836b-8f87-4355-bacb-dd8dc7140195'),
(42, 7, NULL, 7, NULL, '2021-01-06 01:57:00', NULL, NULL, '2021-01-06 01:57:31', '2021-01-06 01:57:31', 'ebc57da5-2f76-4f52-a866-09574dc68290');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_entrytypes`
--

CREATE TABLE `amx_entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_entrytypes`
--

INSERT INTO `amx_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Blog', 'blog', 0, 'site', NULL, '{section.name|raw}', 1, '2020-12-24 05:53:10', '2020-12-31 23:17:40', NULL, '266de19f-571d-4d6b-a3a6-0889f599a8d0'),
(2, 2, 3, 'about-me', 'aboutMe', 0, 'site', NULL, '{section.name|raw}', 1, '2020-12-27 02:35:35', '2020-12-27 02:35:35', '2020-12-27 02:40:39', '6e73476a-a24f-4fdf-bce4-a3bf33cf520d'),
(3, 3, 5, 'Articulo', 'article', 1, 'site', NULL, NULL, 1, '2020-12-27 22:44:14', '2020-12-31 23:18:03', NULL, 'c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c'),
(4, 4, 6, 'Sobre mi', 'aboutMe', 0, 'site', NULL, '{section.name|raw}', 1, '2020-12-29 19:52:48', '2020-12-29 19:52:48', NULL, '00095364-a40d-4553-b9da-08409b91ffa9'),
(5, 5, 10, 'Contacto', 'contact', 0, 'site', NULL, '{section.name|raw}', 1, '2020-12-30 22:42:27', '2020-12-30 22:42:27', NULL, '1f80c53a-a762-4c61-b0c1-f3438b53219b'),
(6, 6, 11, 'Home', 'home', 0, 'site', NULL, '{section.name|raw}', 1, '2020-12-31 23:26:11', '2020-12-31 23:26:11', '2021-01-01 19:45:48', '855da3c5-3a20-40a5-bda9-2ff4ac285f1c'),
(7, 7, 12, 'Thank You Page', 'thankYou', 0, 'site', NULL, '{section.name|raw}', 1, '2021-01-06 01:57:31', '2021-01-06 01:57:31', NULL, '67b4d5af-bf1e-4f03-830f-2e0b75a93e3b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_fieldgroups`
--

CREATE TABLE `amx_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_fieldgroups`
--

INSERT INTO `amx_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '89e96ba2-3a8a-4bd6-91c6-1e2d58d07def'),
(2, 'blog', '2020-12-27 02:05:43', '2020-12-27 02:05:43', '5a92ed28-fddb-4c98-9f3e-d44f88687438'),
(3, 'about me', '2020-12-27 02:37:36', '2020-12-27 02:37:36', '92488251-a1ab-4094-aece-f065a2f2c32c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_fieldlayoutfields`
--

CREATE TABLE `amx_fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_fieldlayoutfields`
--

INSERT INTO `amx_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(22, 2, 15, 5, 0, 0, '2020-12-27 22:38:46', '2020-12-27 22:38:46', 'd8620331-1982-4106-86cd-cec6eae9bb50'),
(23, 2, 15, 7, 0, 1, '2020-12-27 22:38:46', '2020-12-27 22:38:46', 'c0288648-5142-4828-8161-063050733630'),
(24, 2, 15, 10, 0, 2, '2020-12-27 22:38:46', '2020-12-27 22:38:46', 'fe7cb0f2-860c-40ef-8bb0-8a78fd05bd90'),
(25, 2, 15, 11, 0, 3, '2020-12-27 22:38:46', '2020-12-27 22:38:46', '6fcd8bb5-bc63-48dc-b9c7-01f769cee865'),
(26, 2, 15, 6, 0, 4, '2020-12-27 22:38:46', '2020-12-27 22:38:46', '13b825c8-6d76-4bd5-8eef-96210aa8098b'),
(34, 8, 23, 12, 0, 0, '2020-12-30 03:40:34', '2020-12-30 03:40:34', '92fee980-331b-4f40-9c35-487ca8596cf4'),
(35, 8, 23, 13, 0, 2, '2020-12-30 03:40:34', '2020-12-30 03:40:34', '1f33deea-4e5c-4e60-b167-3af34dc6aa81'),
(36, 8, 23, 14, 0, 4, '2020-12-30 03:40:34', '2020-12-30 03:40:34', '0d4e2062-e576-4813-81e9-d3e106bf0039'),
(37, 8, 23, 15, 0, 6, '2020-12-30 03:40:34', '2020-12-30 03:40:34', 'd6a961fe-b97c-4519-bda1-137b1dd1a257'),
(38, 8, 23, 16, 0, 8, '2020-12-30 03:40:34', '2020-12-30 03:40:34', 'ace6b9ef-0153-482a-b9bd-4d6b0ef8e8a5'),
(54, 4, 30, 8, 0, 0, '2020-12-31 04:30:46', '2020-12-31 04:30:46', '2717cc09-df75-4cd4-b95d-30e0fabd50d1'),
(55, 4, 30, 9, 0, 1, '2020-12-31 04:30:46', '2020-12-31 04:30:46', '98f05abb-42a7-4863-8e31-a15ab3f23e03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_fieldlayouts`
--

CREATE TABLE `amx_fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_fieldlayouts`
--

INSERT INTO `amx_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2020-12-24 05:53:10', '2020-12-24 05:53:10', NULL, '0296914f-54ee-445c-9cee-9e7a35ec1d3c'),
(2, 'craft\\elements\\GlobalSet', '2020-12-27 02:09:22', '2020-12-27 02:09:22', NULL, 'bec19259-136b-4808-a6f3-494080fde62f'),
(3, 'craft\\elements\\Entry', '2020-12-27 02:35:35', '2020-12-27 02:35:35', '2020-12-27 02:40:39', '9f5148ee-ed62-429c-a331-4296a89d42f9'),
(4, 'craft\\elements\\MatrixBlock', '2020-12-27 21:39:36', '2020-12-27 21:39:36', NULL, '54c33367-46e4-4a51-b192-4096f5a1c5c2'),
(5, 'craft\\elements\\Entry', '2020-12-27 22:44:14', '2020-12-27 22:44:14', NULL, '2c33718c-3caa-496a-9a32-742a2fc64c12'),
(6, 'craft\\elements\\Entry', '2020-12-29 19:52:48', '2020-12-29 19:52:48', NULL, '61107288-0549-4204-8f27-2f57573cae25'),
(7, 'craft\\elements\\Asset', '2020-12-30 03:34:55', '2020-12-30 03:34:55', NULL, '1efaec29-b360-4fb6-81c0-100c05aaf04d'),
(8, 'craft\\elements\\GlobalSet', '2020-12-30 03:40:34', '2020-12-30 03:40:34', NULL, 'ccc6a3e8-066a-4ef1-ba53-80882a62e8ef'),
(9, 'craft\\elements\\MatrixBlock', '2020-12-30 03:58:00', '2020-12-30 03:58:00', '2020-12-30 04:54:05', '6b342f6a-c42e-4c8d-8a71-4845cf5e7f73'),
(10, 'craft\\elements\\Entry', '2020-12-30 22:42:27', '2020-12-30 22:42:27', NULL, '8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1'),
(11, 'craft\\elements\\Entry', '2020-12-31 23:26:11', '2020-12-31 23:26:11', '2021-01-01 19:45:48', '1be0e257-c07d-48a4-825e-a4106cbfa948'),
(12, 'craft\\elements\\Entry', '2021-01-06 01:57:31', '2021-01-06 01:57:31', NULL, '45ae6353-7d3d-43ce-9d04-2ca0c7e513b7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_fieldlayouttabs`
--

CREATE TABLE `amx_fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `elements` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_fieldlayouttabs`
--

INSERT INTO `amx_fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(7, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"be6d086f-56a5-46be-9805-16a1b0d9db3a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-27 02:37:00', '2020-12-27 02:37:00', '6638f99d-ca8b-48c2-b797-1da569451f70'),
(15, 2, 'Tab 1', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f994d628-0ddd-4611-972c-f6279e16cbf8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bcd7b15f-d259-40b1-b91e-7d4dd34dd31d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"98e2edbd-acba-4a11-b710-0b20640153d7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"32b2ad79-e016-4d1a-825e-64775b6673b7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7f504dfe-5429-45d1-85a5-9ea127080883\"}]', 1, '2020-12-27 22:38:46', '2020-12-27 22:38:46', 'd62186bd-f1cc-4131-a47d-5aaade521172'),
(22, 7, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-30 03:34:55', '2020-12-30 03:34:55', 'd19a4eac-6176-4693-8bb3-ed738eae16e0'),
(23, 8, 'Tab 1', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8920d61d-62cb-430b-8ff1-8bf952046b05\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4fe3ee3e-a4ab-44f4-8ceb-76fed960b422\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"11f285e6-92bd-4bde-bf87-1166b12d5b45\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4d5b9bb1-c53c-4b55-955d-79d6e54676a2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f9d161fa-6095-4921-9c4c-e82daeea64e1\"}]', 1, '2020-12-30 03:40:34', '2020-12-30 03:40:34', 'c80cbfac-6c6c-431b-b55b-6641fe3e93e4'),
(24, 9, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"551f762b-5a68-4ac3-86ed-45752c82a458\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"eb9eac03-f392-4c54-9bfd-46b2a9b5f56e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b3f7cd40-61cd-4f23-b0da-9fda865e5be5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bfd673ef-4c8b-4989-bd78-a4bcfdd5b44b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0e9cabaa-2a9d-4bfa-866f-dbbc75b47459\"}]', 1, '2020-12-30 03:58:00', '2020-12-30 03:58:00', 'a13263aa-29e7-4c9b-a32a-feeaed9348c7'),
(25, 6, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bafdca7e-f371-4ca4-82a0-1ddfaac6d670\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-30 03:58:29', '2020-12-30 03:58:29', '9129c044-40b0-4dd5-a6bd-10745aff97b8'),
(26, 10, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-30 22:42:27', '2020-12-30 22:42:27', '7af0ebd5-7bd8-450b-98ee-8449e6f3d7fe'),
(30, 4, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"fieldUid\":\"3134121c-a5c6-4588-9b66-7aa5a866e077\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8bd28df4-c540-4ea6-b68a-3950dbb0f226\"}]', 1, '2020-12-31 04:30:46', '2020-12-31 04:30:46', 'aadb8c53-b995-4984-99e1-f4cb9f7835ae'),
(31, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-31 23:17:40', '2020-12-31 23:17:40', 'eed94045-38ed-48af-9080-ca6782a7dfe8'),
(33, 5, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-31 23:18:03', '2020-12-31 23:18:03', '1fbcaac1-f94a-4da5-81a4-5d0574a4e93e'),
(34, 11, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-31 23:26:11', '2020-12-31 23:26:11', '68f752a7-6479-4e65-9b82-1af952345772'),
(35, 12, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-01-06 01:57:31', '2021-01-06 01:57:31', 'f0ef020a-4a68-45cd-ac80-8f211ef19247');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_fields`
--

CREATE TABLE `amx_fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_fields`
--

INSERT INTO `amx_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 1, 'Site Header', 'siteHeader', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-27 21:28:02', '2020-12-27 21:28:02', 'f994d628-0ddd-4611-972c-f6279e16cbf8'),
(6, 1, 'Créditos del footer', 'footer', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-27 21:28:38', '2020-12-27 21:28:38', '7f504dfe-5429-45d1-85a5-9ea127080883'),
(7, 1, 'Menu Blog', 'menuBlog', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_menublog}}\",\"maxBlocks\":\"5\",\"minBlocks\":\"1\",\"propagationMethod\":\"all\"}', '2020-12-27 21:39:36', '2020-12-27 21:39:44', 'bcd7b15f-d259-40b1-b91e-7d4dd34dd31d'),
(8, NULL, 'Menu Item Link', 'menuItemLink', 'matrixBlockType:2af34bf5-c8e6-49e1-9f1c-310068f1f05c', '', 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":\"\"}', '2020-12-27 21:39:36', '2020-12-27 21:58:07', '3134121c-a5c6-4588-9b66-7aa5a866e077'),
(9, NULL, 'Menu Item Text', 'menuItemText', 'matrixBlockType:2af34bf5-c8e6-49e1-9f1c-310068f1f05c', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-27 21:43:41', '2020-12-29 02:06:47', '8bd28df4-c540-4ea6-b68a-3950dbb0f226'),
(10, 1, 'Newsletter Title', 'newsletterTitle', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-27 22:01:43', '2020-12-27 22:01:43', '98e2edbd-acba-4a11-b710-0b20640153d7'),
(11, 1, 'Newsletter Description', 'newsletterDescription', 'global', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"manual\",\"defaultTransform\":\"\",\"manualConfig\":\"{\\r\\n    \\\"buttons\\\": [\\\"code\\\"],\\r\\n    \\\"breakline\\\": true,\\r\\n    \\\"deniedTags\\\": [\\\"p\\\"],\\r\\n    \\\"enterKey\\\": true,\\r\\n    \\\"paragraphize\\\": false\\r\\n}\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}', '2020-12-27 22:37:36', '2020-12-29 02:19:30', '32b2ad79-e016-4d1a-825e-64775b6673b7'),
(12, 3, 'Foto de perfil', 'profilePicture', 'global', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:faad0dbf-7609-4474-b48a-67f997f65d76\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:faad0dbf-7609-4474-b48a-67f997f65d76\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-12-30 03:31:38', '2020-12-30 03:35:48', '8920d61d-62cb-430b-8ff1-8bf952046b05'),
(13, 3, 'Descripción del autor', 'authorBio', 'global', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"manual\",\"defaultTransform\":\"\",\"manualConfig\":\"{\\r\\n    \\\"buttons\\\": [\\\"code\\\"],\\r\\n    \\\"breakline\\\": true,\\r\\n    \\\"deniedTags\\\": [\\\"p\\\"],\\r\\n    \\\"enterKey\\\": true,\\r\\n    \\\"paragraphize\\\": false\\r\\n}\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}', '2020-12-30 03:36:56', '2020-12-30 03:36:56', '4fe3ee3e-a4ab-44f4-8ceb-76fed960b422'),
(14, 1, 'Perfil de Instagram del autor', 'instagramAuthor', 'global', '', 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":\"\"}', '2020-12-30 03:38:10', '2020-12-30 03:38:10', '11f285e6-92bd-4bde-bf87-1166b12d5b45'),
(15, 1, 'Perfil de LinkedIn del autor', 'linkedinAuthor', 'global', '', 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":\"\"}', '2020-12-30 03:38:32', '2020-12-30 03:38:32', '4d5b9bb1-c53c-4b55-955d-79d6e54676a2'),
(16, 1, 'Perfil de GitHub del autor', 'githubAuthor', 'global', '', 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":\"\"}', '2020-12-30 03:38:56', '2020-12-30 03:38:56', 'f9d161fa-6095-4921-9c4c-e82daeea64e1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_globalsets`
--

CREATE TABLE `amx_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_globalsets`
--

INSERT INTO `amx_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 'Site Info', 'siteInfo', 2, '2020-12-27 02:09:22', '2020-12-27 02:09:22', 'd89e9952-5adf-4287-9055-5c96de44ddc7'),
(26, 'Información del autor', 'siteAuthor', 8, '2020-12-30 03:27:33', '2020-12-30 03:40:34', '36f8d6fb-edac-4e19-b7f9-3f86922399a3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_gqlschemas`
--

CREATE TABLE `amx_gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_gqltokens`
--

CREATE TABLE `amx_gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_info`
--

CREATE TABLE `amx_info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_info`
--

INSERT INTO `amx_info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.5.17.1', '3.5.13', 0, 'yhiwrfgkgmuf', 'fjzclncrgsig', '2020-12-24 05:20:48', '2021-01-06 01:57:31', '8a2f5895-0448-4c0f-845e-0d9f3fe0d445');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_matrixblocks`
--

CREATE TABLE `amx_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_matrixblocks`
--

INSERT INTO `amx_matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(15, 4, 7, 1, 1, 0, '2020-12-27 21:44:19', '2020-12-27 21:44:19', 'e807cb03-6341-4784-9972-241b773b9ee5'),
(16, 4, 7, 1, 1, NULL, '2020-12-27 22:00:29', '2020-12-29 22:59:14', '30d4089b-781a-414e-bf2a-d8ce006431b2'),
(17, 4, 7, 1, 2, NULL, '2020-12-27 22:00:43', '2020-12-29 22:59:14', 'cfb2d071-9a9d-4f43-8179-d2f793635e1d'),
(20, 4, 7, 1, 4, 0, '2020-12-29 02:08:16', '2020-12-29 02:08:16', '8f4a50f9-6fe5-4075-9c01-8f06187eeeea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_matrixblocktypes`
--

CREATE TABLE `amx_matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_matrixblocktypes`
--

INSERT INTO `amx_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 7, 4, 'Menu Elements', 'menuElements', 1, '2020-12-27 21:39:36', '2020-12-27 21:39:36', '2af34bf5-c8e6-49e1-9f1c-310068f1f05c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_matrixcontent_menublog`
--

CREATE TABLE `amx_matrixcontent_menublog` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_menuElements_menuItemLink` varchar(255) DEFAULT NULL,
  `field_menuElements_menuItemText` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_matrixcontent_menublog`
--

INSERT INTO `amx_matrixcontent_menublog` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_menuElements_menuItemLink`, `field_menuElements_menuItemText`) VALUES
(1, 15, 1, '2020-12-27 21:44:19', '2020-12-29 19:55:00', '406bd38c-daf4-41bb-aad9-6118c89fc28d', 'https://anuar.mx', 'Un link'),
(2, 16, 1, '2020-12-27 22:00:29', '2020-12-31 04:30:24', 'f6426eb0-f392-49b4-86a6-2bb095b255f9', '/sobre-mi', 'Sobre mí'),
(3, 17, 1, '2020-12-27 22:00:43', '2020-12-31 04:30:24', 'db0fcb1f-f0fa-435f-b334-9b570acfdfa7', '/contacto', 'Contacto'),
(4, 20, 1, '2020-12-29 02:08:16', '2020-12-29 02:19:43', 'eb4840a8-ca08-4fb6-9740-5f684a63f786', '/log-in', 'Inicia sesión');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_migrations`
--

CREATE TABLE `amx_migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_migrations`
--

INSERT INTO `amx_migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '3625d157-33f6-40d0-890b-8e9abd444194'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '255340ff-17ef-4301-98c2-db50ed235e5a'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '9c2b8dcf-5270-4afd-9279-c47242c3ed63'),
(4, 'craft', 'm150403_184533_field_version', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '1e0154d5-7a5f-4203-a0bc-519072d87fc3'),
(5, 'craft', 'm150403_184729_type_columns', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '6b9e0c77-67d2-4b98-9ccb-cc1566a7c0dc'),
(6, 'craft', 'm150403_185142_volumes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '571d7807-bac9-4897-8f3e-32b0248a4831'),
(7, 'craft', 'm150428_231346_userpreferences', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '7bf97280-ae6d-4b77-933f-c42d54416d15'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '3d24b1f5-0b40-470b-9112-4ca9d3c13a7f'),
(9, 'craft', 'm150617_213829_update_email_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'a7a07187-ba58-4593-87e7-6e39bd08a5dd'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '5a6a4cc3-9c5e-4377-bc95-fff8630b476c'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'bf0eaa14-f1cb-4f15-b168-b1b5a79b897b'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'dcd22b9f-f56e-403f-abe2-85ecc608cea0'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'afb9aa2c-cc18-4577-b7ca-9bd436f3bc70'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '793ed452-ffbd-4643-a578-12cde89a5d7f'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'ab2c5acc-57be-42d8-a72d-9e55915240d8'),
(16, 'craft', 'm151209_000000_move_logo', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'b068c13a-f313-45ee-88c7-e962f5c90c2c'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '0f60209c-fdc3-494f-a839-9d8b5836563a'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'ea8c1752-fbba-4740-953f-0f8770184381'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '610e70d0-78a4-4c99-b1f3-c21adb722392'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '289a69ea-33ee-46ad-be93-03f9d01a1033'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '8c5f5dcf-d625-4dd6-917f-92d2186fafd2'),
(22, 'craft', 'm160727_194637_column_cleanup', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '82dd98be-2e3a-4ac1-8be7-f5b5be401d42'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '568e5a37-aba4-43e9-8c05-603f1f5a9af5'),
(24, 'craft', 'm160807_144858_sites', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'a0b41b0c-d682-42a0-abda-fa80081fdb61'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'b7e98751-45fc-418d-847e-abe4a0737ff4'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'bb13c345-8319-497a-91dc-7c1a83da6f96'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'b2e82cda-e423-4fb1-b6bf-31ca862bee49'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'c359850a-718d-46fd-9788-714b60dbf47e'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'fff186bb-876c-43f7-9643-b48b377e04bd'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '32ce0940-21c0-45c8-8c14-868e59d41f26'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'a59ad867-29f6-4590-96bb-571c3b714117'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'd3613d25-dad1-4d5f-bbaf-0b487551480b'),
(33, 'craft', 'm161007_130653_update_email_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '6779a5ec-15fe-408e-9aae-f1d9ac1bdc7c'),
(34, 'craft', 'm161013_175052_newParentId', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '9e5c83f6-e834-45a8-8034-bb8b64ab6614'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '99b6d5f1-07aa-4179-9f6c-952d4d0afb4d'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'ca436864-6d86-47aa-a696-13c50019679b'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'ec520b98-c704-4a4e-a7ad-26d5aba30a96'),
(38, 'craft', 'm161029_124145_email_message_languages', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'd18cc0ea-64a3-4065-8915-842c029868b0'),
(39, 'craft', 'm161108_000000_new_version_format', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'a3691d0f-becd-42f1-92fe-e0ef7433aaaa'),
(40, 'craft', 'm161109_000000_index_shuffle', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'bd7ded5c-32c5-4d06-a7ad-e8408d4df2cd'),
(41, 'craft', 'm161122_185500_no_craft_app', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2c307da5-701a-4662-bec8-b6213e3621a3'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '8fb226d5-d963-4ec2-9a8c-c2888a45e089'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'bbdb5f19-1507-4c51-9919-3cfc0efbfaaf'),
(44, 'craft', 'm170114_161144_udates_permission', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '4225354b-c133-4127-84ec-62e756b2d69f'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '49f3727a-35b6-4539-a417-107cfd49da7b'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '61a2a789-696a-4607-a98f-de505e0f44bf'),
(47, 'craft', 'm170206_142126_system_name', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'd9a08473-f375-41b0-af5e-702544189ec5'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'a886c765-ca8b-4a0e-ba5c-83966ad95321'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '86b7b9f6-f98b-4f5f-bb54-5b2ac9655f9a'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '9ecfa434-828a-4bdd-a5d5-ce50ac85ae1e'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '31875d2f-adaf-40d6-86fa-9621432e3dcb'),
(52, 'craft', 'm170228_171113_system_messages', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '78cd45f7-2a0f-4c84-a0a7-c650b47924fd'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '30a27436-fd30-4b60-8940-3a721c71ddb3'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '463a9550-bdb5-4897-a529-b1ba64467c19'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '83237f51-5052-40da-bf2c-cd8351e1f7ce'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'eea35859-5dd4-4981-827f-f7f3b5b04516'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'bb8315f9-351d-4a0d-b6f1-d2a0b11b3da5'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '0f485c5f-0517-4bba-8cdb-52f903abddd7'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '243fdbd6-32ca-4a06-b8d3-d95b2f85fc6a'),
(60, 'craft', 'm170704_134916_sites_tables', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'ae6db0e1-7882-4eeb-bead-7b2505e06de9'),
(61, 'craft', 'm170706_183216_rename_sequences', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '8bec07e4-0501-478a-8b95-2a8c169831ae'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '4a984f32-b37b-4c38-bf64-caf8d2ec21fb'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'e98bfa20-744a-4bb8-b36e-d9cf10143449'),
(64, 'craft', 'm170810_201318_create_queue_table', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'db771f5c-9a4f-46a4-b304-1298a5ae1893'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '1fdce0e7-02e5-4f0f-91dd-6d1fce778c86'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'badb1837-89a8-4e02-a500-203e60955939'),
(67, 'craft', 'm171011_214115_site_groups', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '52edde37-c8b7-46f6-bb38-da50280b27f3'),
(68, 'craft', 'm171012_151440_primary_site', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '02cdce08-31db-4b37-aa95-7ff15b3b0e42'),
(69, 'craft', 'm171013_142500_transform_interlace', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'ddc7c10a-6ff0-42fc-8bd2-d8f38e4fd1e6'),
(70, 'craft', 'm171016_092553_drop_position_select', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '1b5a9df7-877c-4681-9e02-57f431eb9685'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '61205708-82e4-490e-a1bb-8f6ca8a17ed5'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '35eb8a44-2447-4eec-8c2e-1e0c4d407263'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'f1281fd5-0c4e-40dd-89b4-4e5314ba3a9c'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '0586e247-a78a-4f98-b6aa-c9805364d0c0'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '46982c6e-8db3-4a7a-af8a-4b76076946e9'),
(76, 'craft', 'm171202_004225_update_email_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'c04221bc-19f9-4366-8dff-59037e454485'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'f32ca5ef-8ca7-4b01-bc41-76380fd687aa'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '73358690-a1ba-496a-9d98-2ed502a83704'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '443900b0-ba7b-4114-aaca-bb60a9ba368c'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'ea59233b-dd84-46f4-b6c0-1e617443d344'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'f88ccd77-c289-4c14-b882-d018217087e0'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2f6002db-8f12-4650-b263-c35f210b80eb'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '73f1db6a-c7c5-484d-9e7d-1bdd1f6efce4'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '142cae4c-b0bd-4d47-989f-89905cef57e8'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '1c8deef7-f4f8-4382-b599-ea2ef4c53bbc'),
(86, 'craft', 'm180217_172123_tiny_ints', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'a363e6ee-620c-4574-9ed5-c1857aa5839e'),
(87, 'craft', 'm180321_233505_small_ints', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '6c3293d2-7789-4af1-aaff-8014235010f6'),
(88, 'craft', 'm180328_115523_new_license_key_statuses', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'bcea292a-74b6-4dcd-ba22-5c8853242312'),
(89, 'craft', 'm180404_182320_edition_changes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'a33f666c-b213-414a-b869-1afad7776c7b'),
(90, 'craft', 'm180411_102218_fix_db_routes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '66950b39-8020-4f56-bd67-480a6bc71096'),
(91, 'craft', 'm180416_205628_resourcepaths_table', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '9683e00f-b210-45fb-a7cd-04636a020f9f'),
(92, 'craft', 'm180418_205713_widget_cleanup', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'c32612cb-c4b7-4094-b961-7fc9e482c42e'),
(93, 'craft', 'm180425_203349_searchable_fields', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'ad84f643-e5f6-4602-879b-cb670423f105'),
(94, 'craft', 'm180516_153000_uids_in_field_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '1c306837-e76f-49d4-a1d6-92b55ca161f5'),
(95, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'c9e01ab4-5746-4072-8ab9-bd4baa21e3b7'),
(96, 'craft', 'm180518_173000_permissions_to_uid', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '600c8f10-eb40-4448-8486-e5a856935d0d'),
(97, 'craft', 'm180520_173000_matrix_context_to_uids', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'ca36fbae-b948-4e2a-b05c-b405f5829359'),
(98, 'craft', 'm180521_172900_project_config_table', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '06461005-fca7-4744-87d2-e0f6c1b66f91'),
(99, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'e5d5954a-1e11-4372-af45-4f71b61165da'),
(100, 'craft', 'm180731_162030_soft_delete_sites', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '087317bd-3634-4102-b3d8-88c347d6726c'),
(101, 'craft', 'm180810_214427_soft_delete_field_layouts', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '8d7e7bfd-bdba-4203-9e06-44857d6116c8'),
(102, 'craft', 'm180810_214439_soft_delete_elements', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'c95c2f92-ba10-431e-8ea5-49e48b041d24'),
(103, 'craft', 'm180824_193422_case_sensitivity_fixes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '90e7be26-fe2e-41a3-b677-8dab770ff346'),
(104, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '4fafba86-e24e-4e14-9f1c-8e0fcdebb9dd'),
(105, 'craft', 'm180904_112109_permission_changes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '946b01b6-ef89-47af-aabb-03db2d611983'),
(106, 'craft', 'm180910_142030_soft_delete_sitegroups', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '4d95f056-ec20-44c6-a2b8-dea26500f02a'),
(107, 'craft', 'm181011_160000_soft_delete_asset_support', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'b8796565-4c0a-4822-9892-3d4a40a47498'),
(108, 'craft', 'm181016_183648_set_default_user_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'dc52d09d-4805-41b6-86a5-4d8408a6a696'),
(109, 'craft', 'm181017_225222_system_config_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '95c00d47-e84f-412f-a5e8-ca592e8243e3'),
(110, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '9c6fef87-5eb2-4ee4-a5f9-69c8cfc73380'),
(111, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '0d32524d-1a9b-41a7-a8f2-e98188fc9571'),
(112, 'craft', 'm181112_203955_sequences_table', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'dd030f02-04da-4c30-9b39-7d2d20c7c4f3'),
(113, 'craft', 'm181121_001712_cleanup_field_configs', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '60cb4bae-2f79-4309-9832-36028b26706a'),
(114, 'craft', 'm181128_193942_fix_project_config', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '257dd89c-b501-47a1-9283-396ed36112e4'),
(115, 'craft', 'm181130_143040_fix_schema_version', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'f47038d1-38fd-4098-a886-f12767e39546'),
(116, 'craft', 'm181211_143040_fix_entry_type_uids', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'd4bc5a7a-22f1-490d-aaf1-aac30b0a86eb'),
(117, 'craft', 'm181217_153000_fix_structure_uids', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'fb3d07e7-2d91-4f63-965c-45674cfb54b2'),
(118, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'a8581ea0-1370-4ce0-aa30-594b60cb2373'),
(119, 'craft', 'm190108_110000_cleanup_project_config', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '065f6c8b-f0d9-4a07-82e3-f653444f0308'),
(120, 'craft', 'm190108_113000_asset_field_setting_change', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '3e2becb8-c434-4633-a3d4-c04ef5c2c9ee'),
(121, 'craft', 'm190109_172845_fix_colspan', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2ae74d57-f11d-4a60-8f97-160bc0a0f8f5'),
(122, 'craft', 'm190110_150000_prune_nonexisting_sites', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'e52845a2-ac94-491f-a242-e01f61148ea2'),
(123, 'craft', 'm190110_214819_soft_delete_volumes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'e3c45a02-ec3f-4b13-9bda-a4669b222d95'),
(124, 'craft', 'm190112_124737_fix_user_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'a8c2a813-f263-4b3d-aa48-486b12eeae20'),
(125, 'craft', 'm190112_131225_fix_field_layouts', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '0534869a-1785-4311-bc87-8999322589eb'),
(126, 'craft', 'm190112_201010_more_soft_deletes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '1be66f2c-5480-4f73-8890-45f2e44a8195'),
(127, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'cb3c8072-935f-4eb7-92d0-757e503225e2'),
(128, 'craft', 'm190121_120000_rich_text_config_setting', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'afbc7e7d-f173-43be-bfe7-1f1df16e710f'),
(129, 'craft', 'm190125_191628_fix_email_transport_password', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'eaa74848-873e-4826-8d41-76d286943268'),
(130, 'craft', 'm190128_181422_cleanup_volume_folders', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'c775387f-c865-49ef-8e40-f785b379ab68'),
(131, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '472794c0-bb78-4282-aded-59ee0788abe1'),
(132, 'craft', 'm190218_143000_element_index_settings_uid', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'e162d8d7-43dc-4522-9584-f043cdea59dd'),
(133, 'craft', 'm190312_152740_element_revisions', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '0fb2bc7b-40f5-4e0a-a556-75fe6845914e'),
(134, 'craft', 'm190327_235137_propagation_method', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'ffc85b17-3296-41de-9aee-e8736153dc8b'),
(135, 'craft', 'm190401_223843_drop_old_indexes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'ccc218a2-71f2-4b68-a592-4652be5b3d2b'),
(136, 'craft', 'm190416_014525_drop_unique_global_indexes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'bf3567fd-fe33-4415-bd1a-c458f647bb3d'),
(137, 'craft', 'm190417_085010_add_image_editor_permissions', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'd4a7cc6a-65fc-432a-9d7f-27b714f268e0'),
(138, 'craft', 'm190502_122019_store_default_user_group_uid', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '03368759-b7d7-43e5-a5af-e87d124e0a98'),
(139, 'craft', 'm190504_150349_preview_targets', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '7731aa72-2efc-4680-ae8f-b6fce0f878ad'),
(140, 'craft', 'm190516_184711_job_progress_label', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '4a31bfda-07e3-41a1-87a0-c2cd83ee2838'),
(141, 'craft', 'm190523_190303_optional_revision_creators', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '29ffe9da-9db8-4ceb-8555-44698df47032'),
(142, 'craft', 'm190529_204501_fix_duplicate_uids', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'fbcfb9d8-bd0d-42a7-b48a-fde8e2aa12b5'),
(143, 'craft', 'm190605_223807_unsaved_drafts', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '050b5b5e-92fb-4eea-b297-1add0fe71416'),
(144, 'craft', 'm190607_230042_entry_revision_error_tables', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '1e704b0a-6ac2-4dd7-897d-b4adf11b23ce'),
(145, 'craft', 'm190608_033429_drop_elements_uid_idx', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'e8f9f92f-de2c-47d7-a01f-5ce04592033b'),
(146, 'craft', 'm190617_164400_add_gqlschemas_table', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'c4111486-3f99-4546-8936-117ea80e1c3f'),
(147, 'craft', 'm190624_234204_matrix_propagation_method', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '6f38fa10-f63c-4bda-bf42-1b8aa374f1fa'),
(148, 'craft', 'm190711_153020_drop_snapshots', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '1eca468b-0cec-4675-b316-9e66592829c0'),
(149, 'craft', 'm190712_195914_no_draft_revisions', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'd7a11da2-0de0-4dbb-8aa3-fbc2eb100d57'),
(150, 'craft', 'm190723_140314_fix_preview_targets_column', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '6d1b28fd-2cc5-4060-961d-1e4d0192de35'),
(151, 'craft', 'm190820_003519_flush_compiled_templates', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '86cdc3f6-a549-4151-853b-bd8c2786fac5'),
(152, 'craft', 'm190823_020339_optional_draft_creators', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'd23aef7c-4237-45c4-b7f0-c4afcaf717f5'),
(153, 'craft', 'm190913_152146_update_preview_targets', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2a5e04d7-3c38-4285-87dc-144067845c0a'),
(154, 'craft', 'm191107_122000_add_gql_project_config_support', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '328c12c5-1c1f-44ca-829d-bc7ffcb88833'),
(155, 'craft', 'm191204_085100_pack_savable_component_settings', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'dc68bc10-70f3-4e25-9ff1-628baee5c644'),
(156, 'craft', 'm191206_001148_change_tracking', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '997bcbba-3de0-47cd-8ec7-ea68477d6e95'),
(157, 'craft', 'm191216_191635_asset_upload_tracking', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '6388804a-8d91-473a-aaee-7d5a93da8e38'),
(158, 'craft', 'm191222_002848_peer_asset_permissions', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '1093f0fd-52d5-4722-921f-aed11c0dc7a0'),
(159, 'craft', 'm200127_172522_queue_channels', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '0a87da09-599c-48d4-955b-c32c3fec210d'),
(160, 'craft', 'm200211_175048_truncate_element_query_cache', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'a223e9f6-f9cc-4c6d-a39e-e393eec81ea7'),
(161, 'craft', 'm200213_172522_new_elements_index', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '7370abaf-0db7-4456-87df-f528bac919f6'),
(162, 'craft', 'm200228_195211_long_deprecation_messages', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '7d06136c-f461-4b48-89b2-cf81f599a62d'),
(163, 'craft', 'm200306_054652_disabled_sites', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '227bc0ad-0fa3-4167-8ec2-b89ad1daf805'),
(164, 'craft', 'm200522_191453_clear_template_caches', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '1a4a3cc3-13aa-49d5-bc41-52590d9330f7'),
(165, 'craft', 'm200606_231117_migration_tracks', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '9ecebb64-278b-4da2-8a1a-b47a82ef5ae0'),
(166, 'craft', 'm200619_215137_title_translation_method', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '9016d359-ff83-4ca5-b68c-b890bb4056fb'),
(167, 'craft', 'm200620_005028_user_group_descriptions', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '26509bfc-aac7-4ce6-bdbe-00e1a91d028a'),
(168, 'craft', 'm200620_230205_field_layout_changes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'c9fa4f4c-8465-4efa-af00-84ae1c147162'),
(169, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'eaa5ae5c-e0a6-4ef0-9c2b-9e3cd8d5b81a'),
(170, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'fb803451-2bf4-4b8b-b2bd-c18b46081825'),
(171, 'craft', 'm200630_183000_drop_configmap', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '9b559869-2b8a-4854-be92-6762b9750c52'),
(172, 'craft', 'm200715_113400_transform_index_error_flag', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '147d424f-88a4-4cbd-837f-39137616875a'),
(173, 'craft', 'm200716_110900_replace_file_asset_permissions', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '7e30d853-e35e-4b6a-970b-09a9e7f9f619'),
(174, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '9f6e8d77-f0d1-44b5-8548-5e4e5e5c8974'),
(175, 'craft', 'm200720_175543_drop_unique_constraints', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', 'a4c8802c-8b2a-4dfe-80a8-bf5d047612f4'),
(176, 'craft', 'm200825_051217_project_config_version', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '388cc9c2-30cd-4377-b4a5-27be5d54cba5'),
(177, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2020-12-27 22:32:29', '2020-12-27 22:32:29', '2020-12-27 22:32:29', '09ec495b-642c-46fa-9112-c3cc70f92392'),
(178, 'plugin:redactor', 'Install', '2020-12-27 22:32:29', '2020-12-27 22:32:29', '2020-12-27 22:32:29', '07f289e9-e2dd-467b-90f1-b1095d049bb8'),
(179, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2020-12-27 22:32:29', '2020-12-27 22:32:29', '2020-12-27 22:32:29', '15dff603-aa49-4901-bc59-1351646ceb77');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_plugins`
--

CREATE TABLE `amx_plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_plugins`
--

INSERT INTO `amx_plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'redactor', '2.8.5', '2.3.0', 'unknown', NULL, '2020-12-27 22:32:29', '2020-12-27 22:32:29', '2021-01-06 01:19:37', 'ea3e4b92-4f56-42e9-b70e-2e97c413e11e'),
(2, 'contact-form', '2.2.7', '1.0.0', 'unknown', NULL, '2021-01-06 01:22:17', '2021-01-06 01:22:17', '2021-01-06 01:22:17', '88181a8c-f861-4519-b760-1eb527d1e183');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_projectconfig`
--

CREATE TABLE `amx_projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_projectconfig`
--

INSERT INTO `amx_projectconfig` (`path`, `value`) VALUES
('dateModified', '1609898251'),
('email.fromEmail', '\"hi@anuar.mx\"'),
('email.fromName', '\"Anuar Reyes\"'),
('email.replyToEmail', 'null'),
('email.template', 'null'),
('email.transportSettings.encryptionMethod', '\"ssl\"'),
('email.transportSettings.host', '\"premium15.web-hosting.com\"'),
('email.transportSettings.password', '\"bam6*s!Aagq$\"'),
('email.transportSettings.port', '\"465\"'),
('email.transportSettings.timeout', '\"10\"'),
('email.transportSettings.useAuthentication', '\"1\"'),
('email.transportSettings.username', '\"hi@anuar.mx\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Smtp\"'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.0.fieldUid', '\"bafdca7e-f371-4ca4-82a0-1ddfaac6d670\"'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.0.instructions', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.0.label', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.0.required', 'false'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.0.tip', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.0.warning', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.0.width', '100'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.autocapitalize', 'true'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.autocomplete', 'false'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.autocorrect', 'true'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.class', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.disabled', 'false'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.id', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.instructions', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.label', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.max', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.min', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.name', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.orientation', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.placeholder', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.readonly', 'false'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.requirable', 'false'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.size', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.step', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.tip', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.title', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.warning', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.elements.1.width', '100'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.name', '\"Content\"'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.fieldLayouts.61107288-0549-4204-8f27-2f57573cae25.tabs.0.sortOrder', '1'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.handle', '\"aboutMe\"'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.hasTitleField', 'false'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.name', '\"Sobre mi\"'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.section', '\"0f3701c1-3eb3-48ad-8abb-20e7acab4406\"'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.sortOrder', '1'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.titleTranslationKeyFormat', 'null'),
('entryTypes.00095364-a40d-4553-b9da-08409b91ffa9.titleTranslationMethod', '\"site\"'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.class', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.disabled', 'false'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.id', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.instructions', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.label', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.max', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.min', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.name', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.orientation', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.readonly', 'false'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.requirable', 'false'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.size', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.step', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.tip', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.title', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.warning', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.elements.0.width', '100'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.name', '\"Content\"'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.fieldLayouts.8e99f0f0-e5ca-47b7-87b7-efb18fd0fce1.tabs.0.sortOrder', '1'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.handle', '\"contact\"'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.hasTitleField', 'false'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.name', '\"Contacto\"'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.section', '\"9ebea7d6-3591-4ded-a32b-28b196114f65\"'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.sortOrder', '1'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.titleTranslationKeyFormat', 'null'),
('entryTypes.1f80c53a-a762-4c61-b0c1-f3438b53219b.titleTranslationMethod', '\"site\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.class', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.disabled', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.id', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.instructions', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.label', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.max', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.min', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.name', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.orientation', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.readonly', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.requirable', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.size', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.step', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.tip', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.title', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.warning', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.width', '100'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.name', '\"Content\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.sortOrder', '1'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.handle', '\"blog\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.hasTitleField', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.name', '\"Blog\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.section', '\"3ce7f791-2895-4d2f-9db0-05026d7c2c93\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.sortOrder', '1'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.titleTranslationKeyFormat', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.titleTranslationMethod', '\"site\"'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.class', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.disabled', 'false'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.id', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.instructions', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.label', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.max', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.min', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.name', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.orientation', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.readonly', 'false'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.requirable', 'false'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.size', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.step', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.tip', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.title', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.warning', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.elements.0.width', '100'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.name', '\"Content\"'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.fieldLayouts.45ae6353-7d3d-43ce-9d04-2ca0c7e513b7.tabs.0.sortOrder', '1'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.handle', '\"thankYou\"'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.hasTitleField', 'false'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.name', '\"Thank You Page\"'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.section', '\"1314f827-6a69-49bd-b23c-968cf9c99f8a\"'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.sortOrder', '1'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.titleTranslationKeyFormat', 'null'),
('entryTypes.67b4d5af-bf1e-4f03-830f-2e0b75a93e3b.titleTranslationMethod', '\"site\"'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.class', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.disabled', 'false'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.id', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.instructions', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.label', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.max', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.min', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.name', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.orientation', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.readonly', 'false'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.requirable', 'false'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.size', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.step', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.tip', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.title', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.warning', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.elements.0.width', '100'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.name', '\"Content\"'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.fieldLayouts.2c33718c-3caa-496a-9a32-742a2fc64c12.tabs.0.sortOrder', '1'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.handle', '\"article\"'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.hasTitleField', 'true'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.name', '\"Articulo\"'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.section', '\"e24e5e8f-a604-4501-83b5-f3d1d5bffcc5\"'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.sortOrder', '1'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.titleFormat', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.titleTranslationKeyFormat', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.titleTranslationMethod', '\"site\"'),
('fieldGroups.5a92ed28-fddb-4c98-9f3e-d44f88687438.name', '\"blog\"'),
('fieldGroups.89e96ba2-3a8a-4bd6-91c6-1e2d58d07def.name', '\"Common\"'),
('fieldGroups.92488251-a1ab-4094-aece-f065a2f2c32c.name', '\"about me\"'),
('fields.11f285e6-92bd-4bde-bf87-1166b12d5b45.contentColumnType', '\"string(255)\"'),
('fields.11f285e6-92bd-4bde-bf87-1166b12d5b45.fieldGroup', '\"89e96ba2-3a8a-4bd6-91c6-1e2d58d07def\"'),
('fields.11f285e6-92bd-4bde-bf87-1166b12d5b45.handle', '\"instagramAuthor\"'),
('fields.11f285e6-92bd-4bde-bf87-1166b12d5b45.instructions', '\"\"'),
('fields.11f285e6-92bd-4bde-bf87-1166b12d5b45.name', '\"Perfil de Instagram del autor\"'),
('fields.11f285e6-92bd-4bde-bf87-1166b12d5b45.searchable', 'false'),
('fields.11f285e6-92bd-4bde-bf87-1166b12d5b45.settings.maxLength', '\"255\"'),
('fields.11f285e6-92bd-4bde-bf87-1166b12d5b45.settings.placeholder', '\"\"'),
('fields.11f285e6-92bd-4bde-bf87-1166b12d5b45.translationKeyFormat', 'null'),
('fields.11f285e6-92bd-4bde-bf87-1166b12d5b45.translationMethod', '\"none\"'),
('fields.11f285e6-92bd-4bde-bf87-1166b12d5b45.type', '\"craft\\\\fields\\\\Url\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.contentColumnType', '\"text\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.fieldGroup', '\"89e96ba2-3a8a-4bd6-91c6-1e2d58d07def\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.handle', '\"newsletterDescription\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.instructions', '\"\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.name', '\"Newsletter Description\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.searchable', 'false'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.availableTransforms', '\"*\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.availableVolumes', '\"*\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.cleanupHtml', 'true'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.columnType', '\"text\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.configSelectionMode', '\"manual\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.defaultTransform', '\"\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.manualConfig', '\"{\\r\\n    \\\"buttons\\\": [\\\"code\\\"],\\r\\n    \\\"breakline\\\": true,\\r\\n    \\\"deniedTags\\\": [\\\"p\\\"],\\r\\n    \\\"enterKey\\\": true,\\r\\n    \\\"paragraphize\\\": false\\r\\n}\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.purifierConfig', '\"\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.purifyHtml', '\"1\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.redactorConfig', '\"\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.removeEmptyTags', '\"1\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.removeInlineStyles', '\"1\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.removeNbsp', '\"1\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.showHtmlButtonForNonAdmins', '\"\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.showUnpermittedFiles', 'false'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.showUnpermittedVolumes', 'false'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.settings.uiMode', '\"enlarged\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.translationKeyFormat', 'null'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.translationMethod', '\"none\"'),
('fields.32b2ad79-e016-4d1a-825e-64775b6673b7.type', '\"craft\\\\redactor\\\\Field\"'),
('fields.4d5b9bb1-c53c-4b55-955d-79d6e54676a2.contentColumnType', '\"string(255)\"'),
('fields.4d5b9bb1-c53c-4b55-955d-79d6e54676a2.fieldGroup', '\"89e96ba2-3a8a-4bd6-91c6-1e2d58d07def\"'),
('fields.4d5b9bb1-c53c-4b55-955d-79d6e54676a2.handle', '\"linkedinAuthor\"'),
('fields.4d5b9bb1-c53c-4b55-955d-79d6e54676a2.instructions', '\"\"'),
('fields.4d5b9bb1-c53c-4b55-955d-79d6e54676a2.name', '\"Perfil de LinkedIn del autor\"'),
('fields.4d5b9bb1-c53c-4b55-955d-79d6e54676a2.searchable', 'false'),
('fields.4d5b9bb1-c53c-4b55-955d-79d6e54676a2.settings.maxLength', '\"255\"'),
('fields.4d5b9bb1-c53c-4b55-955d-79d6e54676a2.settings.placeholder', '\"\"'),
('fields.4d5b9bb1-c53c-4b55-955d-79d6e54676a2.translationKeyFormat', 'null'),
('fields.4d5b9bb1-c53c-4b55-955d-79d6e54676a2.translationMethod', '\"none\"'),
('fields.4d5b9bb1-c53c-4b55-955d-79d6e54676a2.type', '\"craft\\\\fields\\\\Url\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.contentColumnType', '\"text\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.fieldGroup', '\"92488251-a1ab-4094-aece-f065a2f2c32c\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.handle', '\"authorBio\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.instructions', '\"\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.name', '\"Descripción del autor\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.searchable', 'false'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.availableTransforms', '\"*\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.availableVolumes', '\"*\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.cleanupHtml', 'true'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.columnType', '\"text\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.configSelectionMode', '\"manual\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.defaultTransform', '\"\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.manualConfig', '\"{\\r\\n    \\\"buttons\\\": [\\\"code\\\"],\\r\\n    \\\"breakline\\\": true,\\r\\n    \\\"deniedTags\\\": [\\\"p\\\"],\\r\\n    \\\"enterKey\\\": true,\\r\\n    \\\"paragraphize\\\": false\\r\\n}\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.purifierConfig', '\"\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.purifyHtml', '\"1\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.redactorConfig', '\"\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.removeEmptyTags', '\"1\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.removeInlineStyles', '\"1\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.removeNbsp', '\"1\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.showHtmlButtonForNonAdmins', '\"\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.showUnpermittedFiles', 'false'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.showUnpermittedVolumes', 'false'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.settings.uiMode', '\"enlarged\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.translationKeyFormat', 'null'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.translationMethod', '\"none\"'),
('fields.4fe3ee3e-a4ab-44f4-8ceb-76fed960b422.type', '\"craft\\\\redactor\\\\Field\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.contentColumnType', '\"text\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.fieldGroup', '\"89e96ba2-3a8a-4bd6-91c6-1e2d58d07def\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.handle', '\"footer\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.instructions', '\"\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.name', '\"Créditos del footer\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.searchable', 'false'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.settings.byteLimit', 'null'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.settings.charLimit', 'null'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.settings.code', '\"\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.settings.columnType', 'null'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.settings.initialRows', '\"4\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.settings.multiline', '\"\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.settings.placeholder', '\"\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.settings.uiMode', '\"normal\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.translationKeyFormat', 'null'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.translationMethod', '\"none\"'),
('fields.7f504dfe-5429-45d1-85a5-9ea127080883.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.contentColumnType', '\"string\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.fieldGroup', '\"92488251-a1ab-4094-aece-f065a2f2c32c\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.handle', '\"profilePicture\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.instructions', '\"\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.name', '\"Foto de perfil\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.searchable', 'false'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.allowedKinds.0', '\"image\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.allowSelfRelations', 'false'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.allowUploads', 'true'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.defaultUploadLocationSource', '\"volume:faad0dbf-7609-4474-b48a-67f997f65d76\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.defaultUploadLocationSubpath', '\"\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.limit', '\"1\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.localizeRelations', 'false'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.previewMode', '\"full\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.restrictFiles', '\"1\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.selectionLabel', '\"\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.showSiteMenu', 'true'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.showUnpermittedFiles', 'false'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.showUnpermittedVolumes', 'false'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.singleUploadLocationSource', '\"volume:faad0dbf-7609-4474-b48a-67f997f65d76\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.singleUploadLocationSubpath', '\"\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.source', 'null'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.sources', '\"*\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.targetSiteId', 'null'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.useSingleFolder', 'true'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.validateRelatedElements', 'false'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.settings.viewMode', '\"list\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.translationKeyFormat', 'null'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.translationMethod', '\"site\"'),
('fields.8920d61d-62cb-430b-8ff1-8bf952046b05.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.contentColumnType', '\"text\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.fieldGroup', '\"89e96ba2-3a8a-4bd6-91c6-1e2d58d07def\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.handle', '\"newsletterTitle\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.instructions', '\"\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.name', '\"Newsletter Title\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.searchable', 'false'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.settings.byteLimit', 'null'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.settings.charLimit', 'null'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.settings.code', '\"\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.settings.columnType', 'null'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.settings.initialRows', '\"4\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.settings.multiline', '\"\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.settings.placeholder', '\"\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.settings.uiMode', '\"normal\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.translationKeyFormat', 'null'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.translationMethod', '\"none\"'),
('fields.98e2edbd-acba-4a11-b710-0b20640153d7.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.contentColumnType', '\"string\"'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.fieldGroup', '\"89e96ba2-3a8a-4bd6-91c6-1e2d58d07def\"'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.handle', '\"menuBlog\"'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.instructions', '\"\"'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.name', '\"Menu Blog\"'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.searchable', 'false'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.settings.contentTable', '\"{{%matrixcontent_menublog}}\"'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.settings.maxBlocks', '\"5\"'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.settings.minBlocks', '\"1\"'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.settings.propagationMethod', '\"all\"'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.translationKeyFormat', 'null'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.translationMethod', '\"site\"'),
('fields.bcd7b15f-d259-40b1-b91e-7d4dd34dd31d.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.contentColumnType', '\"text\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.fieldGroup', '\"89e96ba2-3a8a-4bd6-91c6-1e2d58d07def\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.handle', '\"siteHeader\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.instructions', '\"\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.name', '\"Site Header\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.searchable', 'false'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.settings.byteLimit', 'null'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.settings.charLimit', 'null'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.settings.code', '\"\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.settings.columnType', 'null'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.settings.initialRows', '\"4\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.settings.multiline', '\"\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.settings.placeholder', '\"\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.settings.uiMode', '\"normal\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.translationKeyFormat', 'null'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.translationMethod', '\"none\"'),
('fields.f994d628-0ddd-4611-972c-f6279e16cbf8.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.f9d161fa-6095-4921-9c4c-e82daeea64e1.contentColumnType', '\"string(255)\"'),
('fields.f9d161fa-6095-4921-9c4c-e82daeea64e1.fieldGroup', '\"89e96ba2-3a8a-4bd6-91c6-1e2d58d07def\"'),
('fields.f9d161fa-6095-4921-9c4c-e82daeea64e1.handle', '\"githubAuthor\"'),
('fields.f9d161fa-6095-4921-9c4c-e82daeea64e1.instructions', '\"\"'),
('fields.f9d161fa-6095-4921-9c4c-e82daeea64e1.name', '\"Perfil de GitHub del autor\"'),
('fields.f9d161fa-6095-4921-9c4c-e82daeea64e1.searchable', 'false'),
('fields.f9d161fa-6095-4921-9c4c-e82daeea64e1.settings.maxLength', '\"255\"'),
('fields.f9d161fa-6095-4921-9c4c-e82daeea64e1.settings.placeholder', '\"\"'),
('fields.f9d161fa-6095-4921-9c4c-e82daeea64e1.translationKeyFormat', 'null'),
('fields.f9d161fa-6095-4921-9c4c-e82daeea64e1.translationMethod', '\"none\"'),
('fields.f9d161fa-6095-4921-9c4c-e82daeea64e1.type', '\"craft\\\\fields\\\\Url\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.0.fieldUid', '\"8920d61d-62cb-430b-8ff1-8bf952046b05\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.0.instructions', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.0.label', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.0.required', 'false'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.0.tip', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.0.warning', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.0.width', '100'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.2.fieldUid', '\"4fe3ee3e-a4ab-44f4-8ceb-76fed960b422\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.2.instructions', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.2.label', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.2.required', 'false'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.2.tip', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.2.warning', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.2.width', '100'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.4.fieldUid', '\"11f285e6-92bd-4bde-bf87-1166b12d5b45\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.4.instructions', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.4.label', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.4.required', 'false'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.4.tip', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.4.warning', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.4.width', '100'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.6.fieldUid', '\"4d5b9bb1-c53c-4b55-955d-79d6e54676a2\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.6.instructions', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.6.label', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.6.required', 'false'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.6.tip', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.6.warning', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.6.width', '100'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.7.type', '\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.8.fieldUid', '\"f9d161fa-6095-4921-9c4c-e82daeea64e1\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.8.instructions', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.8.label', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.8.required', 'false'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.8.tip', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.8.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.8.warning', 'null'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.elements.8.width', '100'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.name', '\"Tab 1\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.fieldLayouts.ccc6a3e8-066a-4ef1-ba53-80882a62e8ef.tabs.0.sortOrder', '1'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.handle', '\"siteAuthor\"'),
('globalSets.36f8d6fb-edac-4e19-b7f9-3f86922399a3.name', '\"Información del autor\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.0.fieldUid', '\"f994d628-0ddd-4611-972c-f6279e16cbf8\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.0.instructions', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.0.label', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.0.required', 'false'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.0.tip', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.0.warning', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.0.width', '100'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.1.fieldUid', '\"bcd7b15f-d259-40b1-b91e-7d4dd34dd31d\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.1.instructions', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.1.label', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.1.required', 'false'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.1.tip', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.1.warning', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.1.width', '100'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.2.fieldUid', '\"98e2edbd-acba-4a11-b710-0b20640153d7\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.2.instructions', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.2.label', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.2.required', 'false'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.2.tip', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.2.warning', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.2.width', '100'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.3.fieldUid', '\"32b2ad79-e016-4d1a-825e-64775b6673b7\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.3.instructions', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.3.label', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.3.required', 'false'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.3.tip', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.3.warning', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.3.width', '100'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.4.fieldUid', '\"7f504dfe-5429-45d1-85a5-9ea127080883\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.4.instructions', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.4.label', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.4.required', 'false'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.4.tip', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.4.warning', 'null'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.elements.4.width', '100'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.name', '\"Tab 1\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.fieldLayouts.bec19259-136b-4808-a6f3-494080fde62f.tabs.0.sortOrder', '1'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.handle', '\"siteInfo\"'),
('globalSets.d89e9952-5adf-4287-9055-5c96de44ddc7.name', '\"Site Info\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.field', '\"bcd7b15f-d259-40b1-b91e-7d4dd34dd31d\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.0.fieldUid', '\"3134121c-a5c6-4588-9b66-7aa5a866e077\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.0.label', 'null');
INSERT INTO `amx_projectconfig` (`path`, `value`) VALUES
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.0.width', '25'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.1.fieldUid', '\"8bd28df4-c540-4ea6-b68a-3950dbb0f226\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.sortOrder', '1'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.3134121c-a5c6-4588-9b66-7aa5a866e077.contentColumnType', '\"string(255)\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.3134121c-a5c6-4588-9b66-7aa5a866e077.fieldGroup', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.3134121c-a5c6-4588-9b66-7aa5a866e077.handle', '\"menuItemLink\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.3134121c-a5c6-4588-9b66-7aa5a866e077.instructions', '\"\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.3134121c-a5c6-4588-9b66-7aa5a866e077.name', '\"Menu Item Link\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.3134121c-a5c6-4588-9b66-7aa5a866e077.searchable', 'false'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.3134121c-a5c6-4588-9b66-7aa5a866e077.settings.maxLength', '\"255\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.3134121c-a5c6-4588-9b66-7aa5a866e077.settings.placeholder', '\"\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.3134121c-a5c6-4588-9b66-7aa5a866e077.translationKeyFormat', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.3134121c-a5c6-4588-9b66-7aa5a866e077.translationMethod', '\"none\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.3134121c-a5c6-4588-9b66-7aa5a866e077.type', '\"craft\\\\fields\\\\Url\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.contentColumnType', '\"text\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.fieldGroup', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.handle', '\"menuItemText\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.instructions', '\"\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.name', '\"Menu Item Text\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.searchable', 'false'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.settings.byteLimit', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.settings.charLimit', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.settings.code', '\"\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.settings.columnType', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.settings.initialRows', '\"4\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.settings.multiline', '\"\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.settings.placeholder', '\"\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.translationKeyFormat', 'null'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.translationMethod', '\"none\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.handle', '\"menuElements\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.name', '\"Menu Elements\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.sortOrder', '1'),
('plugins.contact-form.edition', '\"standard\"'),
('plugins.contact-form.enabled', 'true'),
('plugins.contact-form.schemaVersion', '\"1.0.0\"'),
('plugins.contact-form.settings.allowAttachments', '\"\"'),
('plugins.contact-form.settings.prependSender', '\"Consulta de: \"'),
('plugins.contact-form.settings.prependSubject', '\"Nuevo mensaje desde The Blog\"'),
('plugins.contact-form.settings.successFlashMessage', '\"Tu mensaje ha sido enviado con éxito\"'),
('plugins.contact-form.settings.toEmail', '\"hi@anuar.mx\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.0f3701c1-3eb3-48ad-8abb-20e7acab4406.enableVersioning', 'true'),
('sections.0f3701c1-3eb3-48ad-8abb-20e7acab4406.handle', '\"aboutMe\"'),
('sections.0f3701c1-3eb3-48ad-8abb-20e7acab4406.name', '\"Sobre mi\"'),
('sections.0f3701c1-3eb3-48ad-8abb-20e7acab4406.propagationMethod', '\"all\"'),
('sections.0f3701c1-3eb3-48ad-8abb-20e7acab4406.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.enabledByDefault', 'true'),
('sections.0f3701c1-3eb3-48ad-8abb-20e7acab4406.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.hasUrls', 'true'),
('sections.0f3701c1-3eb3-48ad-8abb-20e7acab4406.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.template', '\"templates/about-me\"'),
('sections.0f3701c1-3eb3-48ad-8abb-20e7acab4406.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.uriFormat', '\"sobre-mi\"'),
('sections.0f3701c1-3eb3-48ad-8abb-20e7acab4406.type', '\"single\"'),
('sections.1314f827-6a69-49bd-b23c-968cf9c99f8a.enableVersioning', 'true'),
('sections.1314f827-6a69-49bd-b23c-968cf9c99f8a.handle', '\"thankYou\"'),
('sections.1314f827-6a69-49bd-b23c-968cf9c99f8a.name', '\"Thank You Page\"'),
('sections.1314f827-6a69-49bd-b23c-968cf9c99f8a.propagationMethod', '\"all\"'),
('sections.1314f827-6a69-49bd-b23c-968cf9c99f8a.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.enabledByDefault', 'true'),
('sections.1314f827-6a69-49bd-b23c-968cf9c99f8a.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.hasUrls', 'true'),
('sections.1314f827-6a69-49bd-b23c-968cf9c99f8a.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.template', '\"templates/thanks\"'),
('sections.1314f827-6a69-49bd-b23c-968cf9c99f8a.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.uriFormat', '\"contacto/thanks\"'),
('sections.1314f827-6a69-49bd-b23c-968cf9c99f8a.type', '\"single\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.enableVersioning', 'true'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.handle', '\"blog\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.name', '\"Blog\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.propagationMethod', '\"all\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.enabledByDefault', 'true'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.hasUrls', 'true'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.template', '\"templates/blog\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.uriFormat', '\"__home__\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.type', '\"single\"'),
('sections.9ebea7d6-3591-4ded-a32b-28b196114f65.enableVersioning', 'true'),
('sections.9ebea7d6-3591-4ded-a32b-28b196114f65.handle', '\"contact\"'),
('sections.9ebea7d6-3591-4ded-a32b-28b196114f65.name', '\"Contacto\"'),
('sections.9ebea7d6-3591-4ded-a32b-28b196114f65.propagationMethod', '\"all\"'),
('sections.9ebea7d6-3591-4ded-a32b-28b196114f65.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.enabledByDefault', 'true'),
('sections.9ebea7d6-3591-4ded-a32b-28b196114f65.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.hasUrls', 'true'),
('sections.9ebea7d6-3591-4ded-a32b-28b196114f65.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.template', '\"templates/contact\"'),
('sections.9ebea7d6-3591-4ded-a32b-28b196114f65.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.uriFormat', '\"contacto\"'),
('sections.9ebea7d6-3591-4ded-a32b-28b196114f65.type', '\"single\"'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.enableVersioning', 'true'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.handle', '\"article\"'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.name', '\"Articulo\"'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.propagationMethod', '\"all\"'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.enabledByDefault', 'true'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.hasUrls', 'true'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.template', '\"templates/article\"'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.uriFormat', '\"article\"'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.type', '\"single\"'),
('siteGroups.cfa2dbc4-0f72-427a-b9ce-6ad4f829f061.name', '\"Anuar Reyes\"'),
('sites.97f57858-b416-4aac-877d-78bebb1bdbe6.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.97f57858-b416-4aac-877d-78bebb1bdbe6.handle', '\"default\"'),
('sites.97f57858-b416-4aac-877d-78bebb1bdbe6.hasUrls', 'true'),
('sites.97f57858-b416-4aac-877d-78bebb1bdbe6.language', '\"en-US\"'),
('sites.97f57858-b416-4aac-877d-78bebb1bdbe6.name', '\"Anuar Reyes\"'),
('sites.97f57858-b416-4aac-877d-78bebb1bdbe6.primary', 'true'),
('sites.97f57858-b416-4aac-877d-78bebb1bdbe6.siteGroup', '\"cfa2dbc4-0f72-427a-b9ce-6ad4f829f061\"'),
('sites.97f57858-b416-4aac-877d-78bebb1bdbe6.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Anuar Reyes\"'),
('system.schemaVersion', '\"3.5.13\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.autocomplete', 'false'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.autocorrect', 'true'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.class', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.disabled', 'false'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.id', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.instructions', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.label', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.max', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.min', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.name', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.orientation', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.placeholder', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.readonly', 'false'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.requirable', 'false'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.size', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.step', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.tip', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.title', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.warning', 'null'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.elements.0.width', '100'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.name', '\"Content\"'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.fieldLayouts.1efaec29-b360-4fb6-81c0-100c05aaf04d.tabs.0.sortOrder', '1'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.handle', '\"siteauthor\"'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.hasUrls', 'true'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.name', '\"siteAuthor\"'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.settings.path', '\"@mediaBasePath/siteauthor\"'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.sortOrder', '1'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.type', '\"craft\\\\volumes\\\\Local\"'),
('volumes.faad0dbf-7609-4474-b48a-67f997f65d76.url', '\"@mediaBaseUrl/siteauthor\"');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_queue`
--

CREATE TABLE `amx_queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_relations`
--

CREATE TABLE `amx_relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_relations`
--

INSERT INTO `amx_relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 12, 26, NULL, 27, 1, '2020-12-30 03:42:45', '2020-12-30 03:42:45', '06013de6-11da-4769-b258-73f2edb7391b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_resourcepaths`
--

CREATE TABLE `amx_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_resourcepaths`
--

INSERT INTO `amx_resourcepaths` (`hash`, `path`) VALUES
('10ef45b8', '@lib/velocity'),
('160b2c5', '@bower/jquery/dist'),
('1b9c5c64', '@craft/web/assets/deprecationerrors/dist'),
('1cf0339c', '@app/web/assets/feed/dist'),
('1dceedce', '@craft/web/assets/updates/dist'),
('241fb298', '@craft/web/assets/dashboard/dist'),
('2d3a67f3', '@app/web/assets/matrixsettings/dist'),
('2ef01930', '@lib/element-resize-detector'),
('3bd551f4', '@craft/web/assets/matrixsettings/dist'),
('461c1dc1', '@app/web/assets/updateswidget/dist'),
('462133be', '@craft/web/assets/editsection/dist'),
('488eb100', '@app/web/assets/craftsupport/dist'),
('4b5f3e98', '@app/web/assets/fieldsettings/dist'),
('4b97098', '@craft/web/assets/editentry/dist'),
('54919e54', '@lib/axios'),
('56494ffe', '@app/web/assets/updater/dist'),
('5a020035', '@craft/redactor/assets/field/dist'),
('5d45542b', '@craft/web/assets/clearcaches/dist'),
('5d5c9453', '@craft/web/assets/feed/dist'),
('5e46de1d', '@lib/jquery-ui'),
('61d56d5c', '@app/web/assets/login/dist'),
('6249a917', '@craft/web/assets/craftsupport/dist'),
('628a67e6', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('65eb7822', '@app/web/assets/cp/dist'),
('6a4f1eda', '@craft/web/assets/login/dist'),
('78a65faf', '@app/web/assets/recententries/dist'),
('7903ab3', '@app/web/assets/utilities/dist'),
('797a3d21', '@lib/vue'),
('7ed33509', '@app/web/assets/pluginstore/dist'),
('828a4465', '@craft/web/assets/queuemanager/dist'),
('836fae13', '@lib/d3'),
('8569be45', '@craft/web/assets/utilities/dist'),
('8640f46e', '@app/web/assets/editentry/dist'),
('88e8b809', '@lib/prismjs'),
('8962d65a', '@app/web/assets/matrix/dist'),
('8a6eb280', '@lib/jquery-touch-events'),
('8db26a3c', '@craft/web/assets/matrix/dist'),
('8dca8e42', '@lib/picturefill'),
('95228fbc', '@lib/fileupload'),
('9981b0ab', '@lib/iframe-resizer'),
('9bb12c66', '@craft/web/assets/sites/dist'),
('a1811820', '@app/web/assets/fields/dist'),
('a551a446', '@craft/web/assets/fields/dist'),
('a5946dab', '@lib/fabric'),
('a6e6366e', '@app/web/assets/dashboard/dist'),
('ac7f5c93', '@craft/web/assets/admintable/dist'),
('b0d2b995', '@lib/garnishjs'),
('c5e55f1e', '@craft/web/assets/updateswidget/dist'),
('c8a67c47', '@craft/web/assets/fieldsettings/dist'),
('cc8ea50', '@lib/jquery.payment'),
('ccca0b45', '@craft/web/assets/generalsettings/dist'),
('cd5b380f', '@craft/redactor/assets/redactor-plugins/dist/video'),
('cf0e2bac', '@craft/redactor/assets/redactor/dist'),
('d2e7dd59', '@craft/web/assets/installer/dist'),
('d3d8e74c', '@lib/xregexp'),
('d6e0b6f2', '@craft/web/assets/pluginstore/dist'),
('d9b4a3c6', '@lib/selectize'),
('df9b868f', '@craft/web/assets/cp/dist'),
('eba54ec', '@app/web/assets/tablesettings/dist'),
('ec27bf39', '@lib/timepicker'),
('ee12b045', '@app/web/assets/editsection/dist'),
('f29c5b2f', '@craft/web/assets/updater/dist'),
('f823f23e', '@app/web/assets/admintable/dist'),
('fb5f1d70', '@craft/web/assets/recententries/dist');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_revisions`
--

CREATE TABLE `amx_revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_revisions`
--

INSERT INTO `amx_revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, NULL),
(3, 2, 1, 3, ''),
(4, 2, 1, 4, NULL),
(5, 2, 1, 5, ''),
(6, 2, 1, 6, NULL),
(7, 2, 1, 7, ''),
(8, 2, 1, 8, ''),
(9, 12, 1, 1, NULL),
(10, 12, 1, 2, NULL),
(11, 18, 1, 1, NULL),
(12, 2, 1, 9, NULL),
(13, 2, 1, 10, ''),
(14, 23, 1, 1, NULL),
(15, 23, 1, 2, NULL),
(16, 23, 1, 3, NULL),
(17, 29, 1, 1, NULL),
(18, 2, 1, 11, NULL),
(19, 18, 1, 2, NULL),
(20, 2, 1, 12, NULL),
(21, 18, 1, 3, NULL),
(22, 18, 1, 4, NULL),
(23, 36, 1, 1, NULL),
(24, 2, 1, 13, NULL),
(25, 18, 1, 5, NULL),
(26, 18, 1, 6, NULL),
(27, 41, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_searchindex`
--

CREATE TABLE `amx_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_searchindex`
--

INSERT INTO `amx_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' anuar mx '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' anuarhdz gmail com '),
(1, 'slug', 0, 1, ''),
(2, 'title', 0, 1, ' blog '),
(4, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ' blog '),
(12, 'slug', 0, 1, ' about me '),
(12, 'title', 0, 1, ' about me '),
(15, 'slug', 0, 1, ''),
(16, 'slug', 0, 1, ''),
(17, 'slug', 0, 1, ''),
(18, 'title', 0, 1, ' blog article '),
(20, 'slug', 0, 1, ''),
(23, 'slug', 0, 1, ' sobre mi '),
(26, 'slug', 0, 1, ''),
(27, 'filename', 0, 1, ' photo jpg '),
(27, 'extension', 0, 1, ' jpg '),
(27, 'kind', 0, 1, ' image '),
(27, 'slug', 0, 1, ''),
(27, 'title', 0, 1, ' photo '),
(23, 'title', 0, 1, ' sobre mi '),
(29, 'title', 0, 1, ' contacto '),
(29, 'slug', 0, 1, ' contacto '),
(18, 'slug', 0, 1, ' blog article '),
(36, 'title', 0, 1, ' home '),
(36, 'slug', 0, 1, ' home '),
(41, 'title', 0, 1, ' thank you page '),
(41, 'slug', 0, 1, ' thank you page ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_sections`
--

CREATE TABLE `amx_sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_sections`
--

INSERT INTO `amx_sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Blog', 'blog', 'single', 1, 'all', NULL, '2020-12-24 05:53:10', '2020-12-31 23:17:40', NULL, '3ce7f791-2895-4d2f-9db0-05026d7c2c93'),
(2, NULL, 'about-me', 'aboutMe', 'single', 1, 'all', NULL, '2020-12-27 02:35:35', '2020-12-27 02:35:35', '2020-12-27 02:40:40', '8d3739f4-9f93-428f-bb7a-dd0009822780'),
(3, NULL, 'Articulo', 'article', 'single', 1, 'all', NULL, '2020-12-27 22:44:14', '2020-12-31 23:18:03', NULL, 'e24e5e8f-a604-4501-83b5-f3d1d5bffcc5'),
(4, NULL, 'Sobre mi', 'aboutMe', 'single', 1, 'all', NULL, '2020-12-29 19:52:48', '2020-12-29 19:52:48', NULL, '0f3701c1-3eb3-48ad-8abb-20e7acab4406'),
(5, NULL, 'Contacto', 'contact', 'single', 1, 'all', NULL, '2020-12-30 22:42:27', '2020-12-30 22:42:27', NULL, '9ebea7d6-3591-4ded-a32b-28b196114f65'),
(6, NULL, 'Home', 'home', 'single', 1, 'all', NULL, '2020-12-31 23:26:11', '2020-12-31 23:26:11', '2021-01-01 19:45:48', 'a152c1bd-0f5c-4745-ba98-ee84213ad983'),
(7, NULL, 'Thank You Page', 'thankYou', 'single', 1, 'all', NULL, '2021-01-06 01:57:31', '2021-01-06 01:57:31', NULL, '1314f827-6a69-49bd-b23c-968cf9c99f8a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_sections_sites`
--

CREATE TABLE `amx_sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_sections_sites`
--

INSERT INTO `amx_sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'templates/blog', 1, '2020-12-24 05:53:10', '2021-01-01 19:45:56', '053902cb-69ea-440f-9a7f-bdc06afdb3fc'),
(2, 2, 1, 1, 'about-me', 'templates/blog', 1, '2020-12-27 02:35:35', '2020-12-27 02:35:35', '03dcc3c6-38e0-42ad-a8dc-4b52cd3dcc8c'),
(3, 3, 1, 1, 'article', 'templates/article', 1, '2020-12-27 22:44:14', '2021-01-01 19:53:09', '633187b5-aeeb-4388-9b1e-1b13464b7ef6'),
(4, 4, 1, 1, 'sobre-mi', 'templates/about-me', 1, '2020-12-29 19:52:48', '2020-12-29 19:52:48', '28b8e2e1-1a48-4f33-b4a6-280437e57652'),
(5, 5, 1, 1, 'contacto', 'templates/contact', 1, '2020-12-30 22:42:27', '2020-12-30 22:42:27', 'ba8a2aa3-b17c-489d-8aa3-93251f1b648e'),
(6, 6, 1, 1, '__home__', 'templates/home', 1, '2020-12-31 23:26:11', '2020-12-31 23:26:11', '8af0ccd6-1ae0-49f9-87f3-fcbeadc4bebe'),
(7, 7, 1, 1, 'contacto/thanks', 'templates/thanks', 1, '2021-01-06 01:57:31', '2021-01-06 01:57:31', 'c182e30c-d613-4315-a74d-830908ee3c02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_sequences`
--

CREATE TABLE `amx_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_sessions`
--

CREATE TABLE `amx_sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_sessions`
--

INSERT INTO `amx_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(8, 1, 'Y0BJWY9veggOnhFUCN1Fngqi98fy_0kM92__QBQopuHhC_8aRjsUv5ibCTcLiB8AMsj4q9Cy6yK8rhBHcvylj_dZMvLTVEGWqNvt', '2021-01-01 19:45:22', '2021-01-01 19:53:09', '7e4877f1-7168-496c-8c2b-10f2dd1bc300'),
(9, 1, '-848d2VCB_ucntHOry2ZK9mESzDNPUxlu38C5g1x-apAaLVxVmNu18PaHsKv1g1bLDgfd7spXrEAejqPAvtUo_r9jw6RkYYmXjV1', '2021-01-06 01:17:52', '2021-01-06 01:57:50', 'c92d889f-4af4-47cd-b606-c7931ecc559c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_shunnedmessages`
--

CREATE TABLE `amx_shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_sitegroups`
--

CREATE TABLE `amx_sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_sitegroups`
--

INSERT INTO `amx_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Anuar Reyes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', NULL, 'cfa2dbc4-0f72-427a-b9ce-6ad4f829f061');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_sites`
--

CREATE TABLE `amx_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_sites`
--

INSERT INTO `amx_sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Anuar Reyes', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2020-12-24 05:20:48', '2020-12-24 05:20:48', NULL, '97f57858-b416-4aac-877d-78bebb1bdbe6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_structureelements`
--

CREATE TABLE `amx_structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_structures`
--

CREATE TABLE `amx_structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_systemmessages`
--

CREATE TABLE `amx_systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_taggroups`
--

CREATE TABLE `amx_taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_tags`
--

CREATE TABLE `amx_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_templatecacheelements`
--

CREATE TABLE `amx_templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_templatecachequeries`
--

CREATE TABLE `amx_templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_templatecaches`
--

CREATE TABLE `amx_templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_tokens`
--

CREATE TABLE `amx_tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_usergroups`
--

CREATE TABLE `amx_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_usergroups_users`
--

CREATE TABLE `amx_usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_userpermissions`
--

CREATE TABLE `amx_userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_userpermissions_usergroups`
--

CREATE TABLE `amx_userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_userpermissions_users`
--

CREATE TABLE `amx_userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_userpreferences`
--

CREATE TABLE `amx_userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_userpreferences`
--

INSERT INTO `amx_userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_users`
--

CREATE TABLE `amx_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_users`
--

INSERT INTO `amx_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'anuar.mx', NULL, NULL, NULL, 'anuarhdz@gmail.com', '$2y$13$6Um7VfD48gyW9bb4bsxeX.92IuNcBSRq.49oRCUg9VXZ/4q3dqsi6', 1, 0, 0, 0, '2021-01-06 01:17:52', NULL, NULL, NULL, '2020-12-31 23:14:49', NULL, 1, NULL, NULL, NULL, 0, '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2021-01-06 01:17:52', 'f5a87f4f-617b-4ea9-aa5a-b37f0c821d1b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_volumefolders`
--

CREATE TABLE `amx_volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_volumefolders`
--

INSERT INTO `amx_volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'siteAuthor', '', '2020-12-30 03:34:55', '2020-12-30 03:34:55', 'bb83bfc8-680e-41d1-93b9-a2a2987adfd0'),
(2, NULL, NULL, 'Temporary source', NULL, '2020-12-30 03:41:58', '2020-12-30 03:41:58', 'acd11a6f-6773-4cfb-9f56-5863379f3ec7'),
(3, 2, NULL, 'user_1', 'user_1/', '2020-12-30 03:41:58', '2020-12-30 03:41:58', 'fd1ddd4d-d34b-4381-813d-eb6ed2d7509e');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_volumes`
--

CREATE TABLE `amx_volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_volumes`
--

INSERT INTO `amx_volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 7, 'siteAuthor', 'siteauthor', 'craft\\volumes\\Local', 1, '@mediaBaseUrl/siteauthor', '{\"path\":\"@mediaBasePath/siteauthor\"}', 1, '2020-12-30 03:34:55', '2020-12-30 03:34:55', NULL, 'faad0dbf-7609-4474-b48a-67f997f65d76');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amx_widgets`
--

CREATE TABLE `amx_widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `amx_widgets`
--

INSERT INTO `amx_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2020-12-24 05:25:30', '2020-12-24 05:25:30', '636e39e8-40ff-4846-96db-8a6a196cd017'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2020-12-24 05:25:30', '2020-12-24 05:25:30', '945b5f1a-6f20-4dff-be94-f3de0b1db531'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2020-12-24 05:25:30', '2020-12-24 05:25:30', 'a3626678-dc5f-432d-9b0e-8451c50f530c'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2020-12-24 05:25:30', '2020-12-24 05:25:30', 'aca9cc48-cc50-4cbe-9b32-127ca9c31a36');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amx_assetindexdata`
--
ALTER TABLE `amx_assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `amx_assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indices de la tabla `amx_assets`
--
ALTER TABLE `amx_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `amx_assets_folderId_idx` (`folderId`),
  ADD KEY `amx_assets_volumeId_idx` (`volumeId`),
  ADD KEY `amx_assets_uploaderId_fk` (`uploaderId`);

--
-- Indices de la tabla `amx_assettransformindex`
--
ALTER TABLE `amx_assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indices de la tabla `amx_assettransforms`
--
ALTER TABLE `amx_assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_assettransforms_name_idx` (`name`),
  ADD KEY `amx_assettransforms_handle_idx` (`handle`);

--
-- Indices de la tabla `amx_categories`
--
ALTER TABLE `amx_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_categories_groupId_idx` (`groupId`),
  ADD KEY `amx_categories_parentId_fk` (`parentId`);

--
-- Indices de la tabla `amx_categorygroups`
--
ALTER TABLE `amx_categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_categorygroups_name_idx` (`name`),
  ADD KEY `amx_categorygroups_handle_idx` (`handle`),
  ADD KEY `amx_categorygroups_structureId_idx` (`structureId`),
  ADD KEY `amx_categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `amx_categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indices de la tabla `amx_categorygroups_sites`
--
ALTER TABLE `amx_categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `amx_categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indices de la tabla `amx_changedattributes`
--
ALTER TABLE `amx_changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `amx_changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `amx_changedattributes_siteId_fk` (`siteId`),
  ADD KEY `amx_changedattributes_userId_fk` (`userId`);

--
-- Indices de la tabla `amx_changedfields`
--
ALTER TABLE `amx_changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `amx_changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `amx_changedfields_siteId_fk` (`siteId`),
  ADD KEY `amx_changedfields_fieldId_fk` (`fieldId`),
  ADD KEY `amx_changedfields_userId_fk` (`userId`);

--
-- Indices de la tabla `amx_content`
--
ALTER TABLE `amx_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `amx_content_siteId_idx` (`siteId`),
  ADD KEY `amx_content_title_idx` (`title`);

--
-- Indices de la tabla `amx_craftidtokens`
--
ALTER TABLE `amx_craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_craftidtokens_userId_fk` (`userId`);

--
-- Indices de la tabla `amx_deprecationerrors`
--
ALTER TABLE `amx_deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indices de la tabla `amx_drafts`
--
ALTER TABLE `amx_drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_drafts_creatorId_fk` (`creatorId`),
  ADD KEY `amx_drafts_sourceId_fk` (`sourceId`);

--
-- Indices de la tabla `amx_elementindexsettings`
--
ALTER TABLE `amx_elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_elementindexsettings_type_unq_idx` (`type`);

--
-- Indices de la tabla `amx_elements`
--
ALTER TABLE `amx_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `amx_elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `amx_elements_type_idx` (`type`),
  ADD KEY `amx_elements_enabled_idx` (`enabled`),
  ADD KEY `amx_elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  ADD KEY `amx_elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  ADD KEY `amx_elements_draftId_fk` (`draftId`),
  ADD KEY `amx_elements_revisionId_fk` (`revisionId`);

--
-- Indices de la tabla `amx_elements_sites`
--
ALTER TABLE `amx_elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `amx_elements_sites_siteId_idx` (`siteId`),
  ADD KEY `amx_elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `amx_elements_sites_enabled_idx` (`enabled`),
  ADD KEY `amx_elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indices de la tabla `amx_entries`
--
ALTER TABLE `amx_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_entries_postDate_idx` (`postDate`),
  ADD KEY `amx_entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `amx_entries_authorId_idx` (`authorId`),
  ADD KEY `amx_entries_sectionId_idx` (`sectionId`),
  ADD KEY `amx_entries_typeId_idx` (`typeId`),
  ADD KEY `amx_entries_parentId_fk` (`parentId`);

--
-- Indices de la tabla `amx_entrytypes`
--
ALTER TABLE `amx_entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `amx_entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `amx_entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `amx_entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `amx_entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indices de la tabla `amx_fieldgroups`
--
ALTER TABLE `amx_fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_fieldgroups_name_idx` (`name`);

--
-- Indices de la tabla `amx_fieldlayoutfields`
--
ALTER TABLE `amx_fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `amx_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `amx_fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `amx_fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indices de la tabla `amx_fieldlayouts`
--
ALTER TABLE `amx_fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `amx_fieldlayouts_type_idx` (`type`);

--
-- Indices de la tabla `amx_fieldlayouttabs`
--
ALTER TABLE `amx_fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `amx_fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indices de la tabla `amx_fields`
--
ALTER TABLE `amx_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_fields_handle_context_idx` (`handle`,`context`),
  ADD KEY `amx_fields_groupId_idx` (`groupId`),
  ADD KEY `amx_fields_context_idx` (`context`);

--
-- Indices de la tabla `amx_globalsets`
--
ALTER TABLE `amx_globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_globalsets_name_idx` (`name`),
  ADD KEY `amx_globalsets_handle_idx` (`handle`),
  ADD KEY `amx_globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indices de la tabla `amx_gqlschemas`
--
ALTER TABLE `amx_gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `amx_gqltokens`
--
ALTER TABLE `amx_gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_gqltokens_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `amx_gqltokens_name_unq_idx` (`name`),
  ADD KEY `amx_gqltokens_schemaId_fk` (`schemaId`);

--
-- Indices de la tabla `amx_info`
--
ALTER TABLE `amx_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `amx_matrixblocks`
--
ALTER TABLE `amx_matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `amx_matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `amx_matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `amx_matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indices de la tabla `amx_matrixblocktypes`
--
ALTER TABLE `amx_matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  ADD KEY `amx_matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  ADD KEY `amx_matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `amx_matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indices de la tabla `amx_matrixcontent_menublog`
--
ALTER TABLE `amx_matrixcontent_menublog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_matrixcontent_menublog_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `amx_matrixcontent_menublog_siteId_fk` (`siteId`);

--
-- Indices de la tabla `amx_migrations`
--
ALTER TABLE `amx_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_migrations_track_name_unq_idx` (`track`,`name`);

--
-- Indices de la tabla `amx_plugins`
--
ALTER TABLE `amx_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_plugins_handle_unq_idx` (`handle`);

--
-- Indices de la tabla `amx_projectconfig`
--
ALTER TABLE `amx_projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indices de la tabla `amx_queue`
--
ALTER TABLE `amx_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `amx_queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indices de la tabla `amx_relations`
--
ALTER TABLE `amx_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `amx_relations_sourceId_idx` (`sourceId`),
  ADD KEY `amx_relations_targetId_idx` (`targetId`),
  ADD KEY `amx_relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indices de la tabla `amx_resourcepaths`
--
ALTER TABLE `amx_resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indices de la tabla `amx_revisions`
--
ALTER TABLE `amx_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `amx_revisions_creatorId_fk` (`creatorId`);

--
-- Indices de la tabla `amx_searchindex`
--
ALTER TABLE `amx_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `amx_searchindex` ADD FULLTEXT KEY `amx_searchindex_keywords_idx` (`keywords`);

--
-- Indices de la tabla `amx_sections`
--
ALTER TABLE `amx_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_sections_handle_idx` (`handle`),
  ADD KEY `amx_sections_name_idx` (`name`),
  ADD KEY `amx_sections_structureId_idx` (`structureId`),
  ADD KEY `amx_sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indices de la tabla `amx_sections_sites`
--
ALTER TABLE `amx_sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `amx_sections_sites_siteId_idx` (`siteId`);

--
-- Indices de la tabla `amx_sequences`
--
ALTER TABLE `amx_sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `amx_sessions`
--
ALTER TABLE `amx_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_sessions_uid_idx` (`uid`),
  ADD KEY `amx_sessions_token_idx` (`token`),
  ADD KEY `amx_sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `amx_sessions_userId_idx` (`userId`);

--
-- Indices de la tabla `amx_shunnedmessages`
--
ALTER TABLE `amx_shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indices de la tabla `amx_sitegroups`
--
ALTER TABLE `amx_sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_sitegroups_name_idx` (`name`);

--
-- Indices de la tabla `amx_sites`
--
ALTER TABLE `amx_sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `amx_sites_handle_idx` (`handle`),
  ADD KEY `amx_sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `amx_sites_groupId_fk` (`groupId`);

--
-- Indices de la tabla `amx_structureelements`
--
ALTER TABLE `amx_structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `amx_structureelements_root_idx` (`root`),
  ADD KEY `amx_structureelements_lft_idx` (`lft`),
  ADD KEY `amx_structureelements_rgt_idx` (`rgt`),
  ADD KEY `amx_structureelements_level_idx` (`level`),
  ADD KEY `amx_structureelements_elementId_idx` (`elementId`);

--
-- Indices de la tabla `amx_structures`
--
ALTER TABLE `amx_structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indices de la tabla `amx_systemmessages`
--
ALTER TABLE `amx_systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `amx_systemmessages_language_idx` (`language`);

--
-- Indices de la tabla `amx_taggroups`
--
ALTER TABLE `amx_taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_taggroups_name_idx` (`name`),
  ADD KEY `amx_taggroups_handle_idx` (`handle`),
  ADD KEY `amx_taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `amx_taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indices de la tabla `amx_tags`
--
ALTER TABLE `amx_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_tags_groupId_idx` (`groupId`);

--
-- Indices de la tabla `amx_templatecacheelements`
--
ALTER TABLE `amx_templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `amx_templatecacheelements_elementId_idx` (`elementId`);

--
-- Indices de la tabla `amx_templatecachequeries`
--
ALTER TABLE `amx_templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `amx_templatecachequeries_type_idx` (`type`);

--
-- Indices de la tabla `amx_templatecaches`
--
ALTER TABLE `amx_templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `amx_templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `amx_templatecaches_siteId_idx` (`siteId`);

--
-- Indices de la tabla `amx_tokens`
--
ALTER TABLE `amx_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_tokens_token_unq_idx` (`token`),
  ADD KEY `amx_tokens_expiryDate_idx` (`expiryDate`);

--
-- Indices de la tabla `amx_usergroups`
--
ALTER TABLE `amx_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_usergroups_handle_idx` (`handle`),
  ADD KEY `amx_usergroups_name_idx` (`name`);

--
-- Indices de la tabla `amx_usergroups_users`
--
ALTER TABLE `amx_usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `amx_usergroups_users_userId_idx` (`userId`);

--
-- Indices de la tabla `amx_userpermissions`
--
ALTER TABLE `amx_userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_userpermissions_name_unq_idx` (`name`);

--
-- Indices de la tabla `amx_userpermissions_usergroups`
--
ALTER TABLE `amx_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `amx_userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indices de la tabla `amx_userpermissions_users`
--
ALTER TABLE `amx_userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `amx_userpermissions_users_userId_idx` (`userId`);

--
-- Indices de la tabla `amx_userpreferences`
--
ALTER TABLE `amx_userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indices de la tabla `amx_users`
--
ALTER TABLE `amx_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_users_uid_idx` (`uid`),
  ADD KEY `amx_users_verificationCode_idx` (`verificationCode`),
  ADD KEY `amx_users_email_idx` (`email`),
  ADD KEY `amx_users_username_idx` (`username`),
  ADD KEY `amx_users_photoId_fk` (`photoId`);

--
-- Indices de la tabla `amx_volumefolders`
--
ALTER TABLE `amx_volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `amx_volumefolders_parentId_idx` (`parentId`),
  ADD KEY `amx_volumefolders_volumeId_idx` (`volumeId`);

--
-- Indices de la tabla `amx_volumes`
--
ALTER TABLE `amx_volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_volumes_name_idx` (`name`),
  ADD KEY `amx_volumes_handle_idx` (`handle`),
  ADD KEY `amx_volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `amx_volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indices de la tabla `amx_widgets`
--
ALTER TABLE `amx_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `amx_assetindexdata`
--
ALTER TABLE `amx_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_assettransformindex`
--
ALTER TABLE `amx_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_assettransforms`
--
ALTER TABLE `amx_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_categorygroups`
--
ALTER TABLE `amx_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_categorygroups_sites`
--
ALTER TABLE `amx_categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_content`
--
ALTER TABLE `amx_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `amx_craftidtokens`
--
ALTER TABLE `amx_craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_deprecationerrors`
--
ALTER TABLE `amx_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_drafts`
--
ALTER TABLE `amx_drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_elementindexsettings`
--
ALTER TABLE `amx_elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_elements`
--
ALTER TABLE `amx_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `amx_elements_sites`
--
ALTER TABLE `amx_elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `amx_entrytypes`
--
ALTER TABLE `amx_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `amx_fieldgroups`
--
ALTER TABLE `amx_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `amx_fieldlayoutfields`
--
ALTER TABLE `amx_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `amx_fieldlayouts`
--
ALTER TABLE `amx_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `amx_fieldlayouttabs`
--
ALTER TABLE `amx_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `amx_fields`
--
ALTER TABLE `amx_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `amx_globalsets`
--
ALTER TABLE `amx_globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `amx_gqlschemas`
--
ALTER TABLE `amx_gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_gqltokens`
--
ALTER TABLE `amx_gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_info`
--
ALTER TABLE `amx_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `amx_matrixblocktypes`
--
ALTER TABLE `amx_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `amx_matrixcontent_menublog`
--
ALTER TABLE `amx_matrixcontent_menublog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `amx_migrations`
--
ALTER TABLE `amx_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT de la tabla `amx_plugins`
--
ALTER TABLE `amx_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `amx_queue`
--
ALTER TABLE `amx_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `amx_relations`
--
ALTER TABLE `amx_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `amx_revisions`
--
ALTER TABLE `amx_revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `amx_sections`
--
ALTER TABLE `amx_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `amx_sections_sites`
--
ALTER TABLE `amx_sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `amx_sessions`
--
ALTER TABLE `amx_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `amx_shunnedmessages`
--
ALTER TABLE `amx_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_sitegroups`
--
ALTER TABLE `amx_sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `amx_sites`
--
ALTER TABLE `amx_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `amx_structureelements`
--
ALTER TABLE `amx_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_structures`
--
ALTER TABLE `amx_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_systemmessages`
--
ALTER TABLE `amx_systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_taggroups`
--
ALTER TABLE `amx_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_templatecacheelements`
--
ALTER TABLE `amx_templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_templatecachequeries`
--
ALTER TABLE `amx_templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_templatecaches`
--
ALTER TABLE `amx_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_tokens`
--
ALTER TABLE `amx_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_usergroups`
--
ALTER TABLE `amx_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_usergroups_users`
--
ALTER TABLE `amx_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_userpermissions`
--
ALTER TABLE `amx_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_userpermissions_usergroups`
--
ALTER TABLE `amx_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_userpermissions_users`
--
ALTER TABLE `amx_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amx_userpreferences`
--
ALTER TABLE `amx_userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `amx_volumefolders`
--
ALTER TABLE `amx_volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `amx_volumes`
--
ALTER TABLE `amx_volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `amx_widgets`
--
ALTER TABLE `amx_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amx_assetindexdata`
--
ALTER TABLE `amx_assetindexdata`
  ADD CONSTRAINT `amx_assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `amx_volumes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_assets`
--
ALTER TABLE `amx_assets`
  ADD CONSTRAINT `amx_assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `amx_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_assets_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `amx_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `amx_volumes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_categories`
--
ALTER TABLE `amx_categories`
  ADD CONSTRAINT `amx_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `amx_categories` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `amx_categorygroups`
--
ALTER TABLE `amx_categorygroups`
  ADD CONSTRAINT `amx_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `amx_structures` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_categorygroups_sites`
--
ALTER TABLE `amx_categorygroups_sites`
  ADD CONSTRAINT `amx_categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `amx_changedattributes`
--
ALTER TABLE `amx_changedattributes`
  ADD CONSTRAINT `amx_changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `amx_changedfields`
--
ALTER TABLE `amx_changedfields`
  ADD CONSTRAINT `amx_changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `amx_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `amx_content`
--
ALTER TABLE `amx_content`
  ADD CONSTRAINT `amx_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `amx_craftidtokens`
--
ALTER TABLE `amx_craftidtokens`
  ADD CONSTRAINT `amx_craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_drafts`
--
ALTER TABLE `amx_drafts`
  ADD CONSTRAINT `amx_drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `amx_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_elements`
--
ALTER TABLE `amx_elements`
  ADD CONSTRAINT `amx_elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `amx_drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `amx_revisions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_elements_sites`
--
ALTER TABLE `amx_elements_sites`
  ADD CONSTRAINT `amx_elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `amx_entries`
--
ALTER TABLE `amx_entries`
  ADD CONSTRAINT `amx_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `amx_entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `amx_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `amx_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_entrytypes`
--
ALTER TABLE `amx_entrytypes`
  ADD CONSTRAINT `amx_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `amx_sections` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_fieldlayoutfields`
--
ALTER TABLE `amx_fieldlayoutfields`
  ADD CONSTRAINT `amx_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `amx_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `amx_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_fieldlayouttabs`
--
ALTER TABLE `amx_fieldlayouttabs`
  ADD CONSTRAINT `amx_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_fields`
--
ALTER TABLE `amx_fields`
  ADD CONSTRAINT `amx_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_globalsets`
--
ALTER TABLE `amx_globalsets`
  ADD CONSTRAINT `amx_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_gqltokens`
--
ALTER TABLE `amx_gqltokens`
  ADD CONSTRAINT `amx_gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `amx_gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `amx_matrixblocks`
--
ALTER TABLE `amx_matrixblocks`
  ADD CONSTRAINT `amx_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `amx_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `amx_matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_matrixblocktypes`
--
ALTER TABLE `amx_matrixblocktypes`
  ADD CONSTRAINT `amx_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `amx_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `amx_matrixcontent_menublog`
--
ALTER TABLE `amx_matrixcontent_menublog`
  ADD CONSTRAINT `amx_matrixcontent_menublog_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_matrixcontent_menublog_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `amx_relations`
--
ALTER TABLE `amx_relations`
  ADD CONSTRAINT `amx_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `amx_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_revisions`
--
ALTER TABLE `amx_revisions`
  ADD CONSTRAINT `amx_revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `amx_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_sections`
--
ALTER TABLE `amx_sections`
  ADD CONSTRAINT `amx_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `amx_structures` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `amx_sections_sites`
--
ALTER TABLE `amx_sections_sites`
  ADD CONSTRAINT `amx_sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `amx_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `amx_sessions`
--
ALTER TABLE `amx_sessions`
  ADD CONSTRAINT `amx_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_shunnedmessages`
--
ALTER TABLE `amx_shunnedmessages`
  ADD CONSTRAINT `amx_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_sites`
--
ALTER TABLE `amx_sites`
  ADD CONSTRAINT `amx_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_sitegroups` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_structureelements`
--
ALTER TABLE `amx_structureelements`
  ADD CONSTRAINT `amx_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `amx_structures` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_taggroups`
--
ALTER TABLE `amx_taggroups`
  ADD CONSTRAINT `amx_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `amx_tags`
--
ALTER TABLE `amx_tags`
  ADD CONSTRAINT `amx_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_templatecacheelements`
--
ALTER TABLE `amx_templatecacheelements`
  ADD CONSTRAINT `amx_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `amx_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_templatecachequeries`
--
ALTER TABLE `amx_templatecachequeries`
  ADD CONSTRAINT `amx_templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `amx_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_templatecaches`
--
ALTER TABLE `amx_templatecaches`
  ADD CONSTRAINT `amx_templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `amx_usergroups_users`
--
ALTER TABLE `amx_usergroups_users`
  ADD CONSTRAINT `amx_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_userpermissions_usergroups`
--
ALTER TABLE `amx_userpermissions_usergroups`
  ADD CONSTRAINT `amx_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `amx_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_userpermissions_users`
--
ALTER TABLE `amx_userpermissions_users`
  ADD CONSTRAINT `amx_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `amx_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_userpreferences`
--
ALTER TABLE `amx_userpreferences`
  ADD CONSTRAINT `amx_userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_users`
--
ALTER TABLE `amx_users`
  ADD CONSTRAINT `amx_users_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `amx_assets` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `amx_volumefolders`
--
ALTER TABLE `amx_volumefolders`
  ADD CONSTRAINT `amx_volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `amx_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `amx_volumes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `amx_volumes`
--
ALTER TABLE `amx_volumes`
  ADD CONSTRAINT `amx_volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `amx_widgets`
--
ALTER TABLE `amx_widgets`
  ADD CONSTRAINT `amx_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
