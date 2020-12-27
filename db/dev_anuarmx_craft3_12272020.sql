-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 27, 2020 at 11:30 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev_anuarmx_craft3`
--

-- --------------------------------------------------------

--
-- Table structure for table `amx_assetindexdata`
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
-- Table structure for table `amx_assets`
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

-- --------------------------------------------------------

--
-- Table structure for table `amx_assettransformindex`
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
-- Table structure for table `amx_assettransforms`
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
-- Table structure for table `amx_categories`
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
-- Table structure for table `amx_categorygroups`
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
-- Table structure for table `amx_categorygroups_sites`
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
-- Table structure for table `amx_changedattributes`
--

CREATE TABLE `amx_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `amx_changedfields`
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
-- Table structure for table `amx_content`
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
  `field_newsletterDescription` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amx_content`
--

INSERT INTO `amx_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_siteHeader`, `field_footer`, `field_newsletterTitle`, `field_newsletterDescription`) VALUES
(1, 1, 1, NULL, '2020-12-24 05:20:48', '2020-12-24 05:20:48', '956eec72-bf49-4adf-a023-fe00b6777eaf', NULL, NULL, NULL, NULL),
(2, 2, 1, 'blog', '2020-12-24 05:53:10', '2020-12-27 02:32:17', 'cb215c60-c040-499b-b7bd-12bad45978a1', NULL, NULL, NULL, NULL),
(3, 3, 1, 'blog', '2020-12-24 05:53:10', '2020-12-24 05:53:10', '34fdbfb9-3ca8-44c3-b7e5-71351a0d9301', NULL, NULL, NULL, NULL),
(4, 4, 1, NULL, '2020-12-27 02:09:22', '2020-12-27 22:39:52', 'adb131cc-022f-4327-a340-67ee510e3148', 'Lorem ipsum dolor sit amet', '2020 © Anuar Reyes | Developed and designed by me with :heart:️ and ☕️ in CraftCMS.', 'Quisque dui eros?', 'Praesent rutrum sapien vel dolor feugiat, in semper risus condimentum. Mauris dolor sem, rutrum condimentum lorem eu, volutpat viverra arcu. Sed eleifend accumsan volutpat. Aliquam sapien diam.'),
(5, 5, 1, 'blog', '2020-12-27 02:13:58', '2020-12-27 02:13:58', '9964dce9-9651-4667-83d9-2512dcdee831', NULL, NULL, NULL, NULL),
(6, 6, 1, 'blog', '2020-12-27 02:15:54', '2020-12-27 02:15:54', '50e80ddd-8a89-43f6-a4cf-8b71ff668c93', NULL, NULL, NULL, NULL),
(7, 7, 1, 'blog', '2020-12-27 02:24:28', '2020-12-27 02:24:28', '0e989f15-7d1d-4847-a344-f1c8e8e24438', NULL, NULL, NULL, NULL),
(8, 8, 1, 'blog', '2020-12-27 02:24:44', '2020-12-27 02:24:44', 'bcc05cfe-050f-4c09-89c4-e3a3ea03cdb1', NULL, NULL, NULL, NULL),
(9, 9, 1, 'blog', '2020-12-27 02:26:41', '2020-12-27 02:26:41', '57b227c6-b18c-404f-b2a0-0b91c1b42c6c', NULL, NULL, NULL, NULL),
(10, 10, 1, 'blog', '2020-12-27 02:27:50', '2020-12-27 02:27:50', 'ab96e624-e2e7-4357-89f8-61c6e61f8223', NULL, NULL, NULL, NULL),
(11, 11, 1, 'blog', '2020-12-27 02:32:17', '2020-12-27 02:32:17', '26ddd39a-2cc8-4e3e-a445-9361b73d401b', NULL, NULL, NULL, NULL),
(12, 12, 1, 'about-me', '2020-12-27 02:35:35', '2020-12-27 02:37:00', 'a402f539-5731-42fb-9213-633e63b836cd', NULL, NULL, NULL, NULL),
(13, 13, 1, 'about-me', '2020-12-27 02:35:35', '2020-12-27 02:35:35', 'b52fd68d-252c-4737-8d58-dbe1a35be0f5', NULL, NULL, NULL, NULL),
(14, 14, 1, 'about-me', '2020-12-27 02:37:00', '2020-12-27 02:37:00', '49d8f229-091c-4cf2-9eec-6ce421052962', NULL, NULL, NULL, NULL),
(15, 18, 1, 'blog article', '2020-12-27 22:44:33', '2020-12-27 22:44:34', 'ce0aa924-a7bb-4f91-8ce6-e4283833c6c6', NULL, NULL, NULL, NULL),
(16, 19, 1, 'blog article', '2020-12-27 22:44:33', '2020-12-27 22:44:33', '10c669b1-4d34-4b99-af0a-6f65de6b9e9f', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `amx_craftidtokens`
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
-- Table structure for table `amx_deprecationerrors`
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
-- Table structure for table `amx_drafts`
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
-- Table structure for table `amx_elementindexsettings`
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
-- Table structure for table `amx_elements`
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
-- Dumping data for table `amx_elements`
--

INSERT INTO `amx_elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2020-12-24 05:20:48', '2020-12-24 05:20:48', NULL, '5990e293-1a00-47a0-9c96-0a117f476317'),
(2, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-24 05:53:10', '2020-12-27 02:32:17', NULL, '3e6e24e3-ef37-4f49-b5f8-cd2352525f3c'),
(3, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2020-12-24 05:53:10', '2020-12-24 05:53:10', NULL, '58117750-2cf3-4494-a5f4-956d26c5f4c3'),
(4, NULL, NULL, 2, 'craft\\elements\\GlobalSet', 1, 0, '2020-12-27 02:09:22', '2020-12-27 22:39:52', NULL, 'd89e9952-5adf-4287-9055-5c96de44ddc7'),
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
(15, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-27 21:44:19', '2020-12-27 22:39:52', NULL, '311f282c-4c6c-4905-9941-a7f8cccace68'),
(16, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-27 22:00:29', '2020-12-27 22:39:52', NULL, '32722655-f7cf-4c6e-8c30-44522f2589a8'),
(17, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-12-27 22:00:43', '2020-12-27 22:39:52', NULL, '280b518e-4d26-4829-a66d-54e27d8517ed'),
(18, NULL, NULL, 5, 'craft\\elements\\Entry', 1, 0, '2020-12-27 22:44:33', '2020-12-27 22:44:33', NULL, '4ef2360a-c8f5-4b4a-9080-4ac412c52462'),
(19, NULL, 11, 5, 'craft\\elements\\Entry', 1, 0, '2020-12-27 22:44:33', '2020-12-27 22:44:33', NULL, '1d23c5e3-89ac-4051-bb12-2b4af376656d');

-- --------------------------------------------------------

--
-- Table structure for table `amx_elements_sites`
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
-- Dumping data for table `amx_elements_sites`
--

INSERT INTO `amx_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2020-12-24 05:20:48', '2020-12-24 05:20:48', '73e783c9-cb69-40bb-b8e0-9bedd08b24fd'),
(2, 2, 1, 'blog', '__home__', 1, '2020-12-24 05:53:10', '2020-12-24 05:53:10', '1b7f1337-ca0b-4a1f-a53a-a66f8b9a42a7'),
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
(18, 18, 1, 'blog-article', 'article', 1, '2020-12-27 22:44:33', '2020-12-27 22:44:33', 'e7c2b59e-d0a7-47f4-9c90-b7b3bbc209f5'),
(19, 19, 1, 'blog-article', 'article', 1, '2020-12-27 22:44:33', '2020-12-27 22:44:33', 'adb4b46a-4833-4666-9047-1f9b440305fe');

-- --------------------------------------------------------

--
-- Table structure for table `amx_entries`
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
-- Dumping data for table `amx_entries`
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
(19, 3, NULL, 3, NULL, '2020-12-27 22:44:00', NULL, NULL, '2020-12-27 22:44:33', '2020-12-27 22:44:33', 'bc025144-ca62-4d12-b219-82cc3909e22b');

-- --------------------------------------------------------

--
-- Table structure for table `amx_entrytypes`
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
-- Dumping data for table `amx_entrytypes`
--

INSERT INTO `amx_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'blog', 'blog', 0, 'site', NULL, '{section.name|raw}', 1, '2020-12-24 05:53:10', '2020-12-24 05:53:10', NULL, '266de19f-571d-4d6b-a3a6-0889f599a8d0'),
(2, 2, 3, 'about-me', 'aboutMe', 0, 'site', NULL, '{section.name|raw}', 1, '2020-12-27 02:35:35', '2020-12-27 02:35:35', '2020-12-27 02:40:39', '6e73476a-a24f-4fdf-bce4-a3bf33cf520d'),
(3, 3, 5, 'blog article', 'blogArticle', 1, 'site', NULL, NULL, 1, '2020-12-27 22:44:14', '2020-12-27 22:44:14', NULL, 'c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c');

-- --------------------------------------------------------

--
-- Table structure for table `amx_fieldgroups`
--

CREATE TABLE `amx_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amx_fieldgroups`
--

INSERT INTO `amx_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2020-12-24 05:20:48', '2020-12-24 05:20:48', '89e96ba2-3a8a-4bd6-91c6-1e2d58d07def'),
(2, 'blog', '2020-12-27 02:05:43', '2020-12-27 02:05:43', '5a92ed28-fddb-4c98-9f3e-d44f88687438'),
(3, 'about me', '2020-12-27 02:37:36', '2020-12-27 02:37:36', '92488251-a1ab-4094-aece-f065a2f2c32c');

-- --------------------------------------------------------

--
-- Table structure for table `amx_fieldlayoutfields`
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
-- Dumping data for table `amx_fieldlayoutfields`
--

INSERT INTO `amx_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(20, 4, 14, 8, 0, 0, '2020-12-27 21:58:07', '2020-12-27 21:58:07', '54812395-7233-4033-94e1-d9727cf90bca'),
(21, 4, 14, 9, 0, 1, '2020-12-27 21:58:07', '2020-12-27 21:58:07', 'b07dac5f-c7d1-47a4-8d22-14f1f3863e7d'),
(22, 2, 15, 5, 0, 0, '2020-12-27 22:38:46', '2020-12-27 22:38:46', 'd8620331-1982-4106-86cd-cec6eae9bb50'),
(23, 2, 15, 7, 0, 1, '2020-12-27 22:38:46', '2020-12-27 22:38:46', 'c0288648-5142-4828-8161-063050733630'),
(24, 2, 15, 10, 0, 2, '2020-12-27 22:38:46', '2020-12-27 22:38:46', 'fe7cb0f2-860c-40ef-8bb0-8a78fd05bd90'),
(25, 2, 15, 11, 0, 3, '2020-12-27 22:38:46', '2020-12-27 22:38:46', '6fcd8bb5-bc63-48dc-b9c7-01f769cee865'),
(26, 2, 15, 6, 0, 4, '2020-12-27 22:38:46', '2020-12-27 22:38:46', '13b825c8-6d76-4bd5-8eef-96210aa8098b');

-- --------------------------------------------------------

--
-- Table structure for table `amx_fieldlayouts`
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
-- Dumping data for table `amx_fieldlayouts`
--

INSERT INTO `amx_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2020-12-24 05:53:10', '2020-12-24 05:53:10', NULL, '0296914f-54ee-445c-9cee-9e7a35ec1d3c'),
(2, 'craft\\elements\\GlobalSet', '2020-12-27 02:09:22', '2020-12-27 02:09:22', NULL, 'bec19259-136b-4808-a6f3-494080fde62f'),
(3, 'craft\\elements\\Entry', '2020-12-27 02:35:35', '2020-12-27 02:35:35', '2020-12-27 02:40:39', '9f5148ee-ed62-429c-a331-4296a89d42f9'),
(4, 'craft\\elements\\MatrixBlock', '2020-12-27 21:39:36', '2020-12-27 21:39:36', NULL, '54c33367-46e4-4a51-b192-4096f5a1c5c2'),
(5, 'craft\\elements\\Entry', '2020-12-27 22:44:14', '2020-12-27 22:44:14', NULL, '2c33718c-3caa-496a-9a32-742a2fc64c12');

-- --------------------------------------------------------

--
-- Table structure for table `amx_fieldlayouttabs`
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
-- Dumping data for table `amx_fieldlayouttabs`
--

INSERT INTO `amx_fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"be6d086f-56a5-46be-9805-16a1b0d9db3a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"78fe4505-d195-41c0-ae9a-aaab337158ed\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"04e7829c-a3b3-4292-80c0-44b3f3a74692\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f8a32c3d-1c3d-45db-921c-0ec6d49887c3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-27 02:26:41', '2020-12-27 02:26:41', 'ec5c2439-82d9-4811-8820-07f4afa79b67'),
(7, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"be6d086f-56a5-46be-9805-16a1b0d9db3a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-27 02:37:00', '2020-12-27 02:37:00', '6638f99d-ca8b-48c2-b797-1da569451f70'),
(14, 4, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"fieldUid\":\"3134121c-a5c6-4588-9b66-7aa5a866e077\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8bd28df4-c540-4ea6-b68a-3950dbb0f226\"}]', 1, '2020-12-27 21:58:07', '2020-12-27 21:58:07', '62fa36e8-639c-411c-9244-c39e2a013f4f'),
(15, 2, 'Tab 1', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f994d628-0ddd-4611-972c-f6279e16cbf8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bcd7b15f-d259-40b1-b91e-7d4dd34dd31d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"98e2edbd-acba-4a11-b710-0b20640153d7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"32b2ad79-e016-4d1a-825e-64775b6673b7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7f504dfe-5429-45d1-85a5-9ea127080883\"}]', 1, '2020-12-27 22:38:46', '2020-12-27 22:38:46', 'd62186bd-f1cc-4131-a47d-5aaade521172'),
(16, 5, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-12-27 22:44:14', '2020-12-27 22:44:14', 'f2f822ae-dab8-41ca-bf98-6d93a90e576a');

-- --------------------------------------------------------

--
-- Table structure for table `amx_fields`
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
-- Dumping data for table `amx_fields`
--

INSERT INTO `amx_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 1, 'Site Header', 'siteHeader', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-27 21:28:02', '2020-12-27 21:28:02', 'f994d628-0ddd-4611-972c-f6279e16cbf8'),
(6, 1, 'Créditos del footer', 'footer', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-27 21:28:38', '2020-12-27 21:28:38', '7f504dfe-5429-45d1-85a5-9ea127080883'),
(7, 1, 'Menu Blog', 'menuBlog', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_menublog}}\",\"maxBlocks\":\"5\",\"minBlocks\":\"1\",\"propagationMethod\":\"all\"}', '2020-12-27 21:39:36', '2020-12-27 21:39:44', 'bcd7b15f-d259-40b1-b91e-7d4dd34dd31d'),
(8, NULL, 'Menu Item Link', 'menuItemLink', 'matrixBlockType:2af34bf5-c8e6-49e1-9f1c-310068f1f05c', '', 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":\"\"}', '2020-12-27 21:39:36', '2020-12-27 21:58:07', '3134121c-a5c6-4588-9b66-7aa5a866e077'),
(9, NULL, 'Menu Item Name', 'menuItemName', 'matrixBlockType:2af34bf5-c8e6-49e1-9f1c-310068f1f05c', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-27 21:43:41', '2020-12-27 21:43:41', '8bd28df4-c540-4ea6-b68a-3950dbb0f226'),
(10, 1, 'Newsletter Title', 'newsletterTitle', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-12-27 22:01:43', '2020-12-27 22:01:43', '98e2edbd-acba-4a11-b710-0b20640153d7'),
(11, 1, 'Newsletter Description', 'newsletterDescription', 'global', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"manual\",\"defaultTransform\":\"\",\"manualConfig\":\"{\\r\\n    \\\"buttons\\\": [\\\"code\\\"],\\r\\n    \\\"breakline\\\": true,\\r\\n    \\\"deniedTags\\\": [\\\"p\\\"],\\r\\n    \\\"enterKey\\\": true,\\r\\n    \\\"paragraphize\\\": false\\r\\n}\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}', '2020-12-27 22:37:36', '2020-12-27 22:38:08', '32b2ad79-e016-4d1a-825e-64775b6673b7');

-- --------------------------------------------------------

--
-- Table structure for table `amx_globalsets`
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
-- Dumping data for table `amx_globalsets`
--

INSERT INTO `amx_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 'Site Info', 'siteInfo', 2, '2020-12-27 02:09:22', '2020-12-27 02:09:22', 'd89e9952-5adf-4287-9055-5c96de44ddc7');

-- --------------------------------------------------------

--
-- Table structure for table `amx_gqlschemas`
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
-- Table structure for table `amx_gqltokens`
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
-- Table structure for table `amx_info`
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
-- Dumping data for table `amx_info`
--

INSERT INTO `amx_info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.5.17.1', '3.5.13', 0, 'roumhsbymasm', 'ytliakutcotu', '2020-12-24 05:20:48', '2020-12-27 22:44:33', '8a2f5895-0448-4c0f-845e-0d9f3fe0d445');

-- --------------------------------------------------------

--
-- Table structure for table `amx_matrixblocks`
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
-- Dumping data for table `amx_matrixblocks`
--

INSERT INTO `amx_matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(15, 4, 7, 1, 1, NULL, '2020-12-27 21:44:19', '2020-12-27 21:44:19', 'e807cb03-6341-4784-9972-241b773b9ee5'),
(16, 4, 7, 1, 2, NULL, '2020-12-27 22:00:29', '2020-12-27 22:00:29', '30d4089b-781a-414e-bf2a-d8ce006431b2'),
(17, 4, 7, 1, 3, NULL, '2020-12-27 22:00:43', '2020-12-27 22:00:43', 'cfb2d071-9a9d-4f43-8179-d2f793635e1d');

-- --------------------------------------------------------

--
-- Table structure for table `amx_matrixblocktypes`
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
-- Dumping data for table `amx_matrixblocktypes`
--

INSERT INTO `amx_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 7, 4, 'Menu Elements', 'menuElements', 1, '2020-12-27 21:39:36', '2020-12-27 21:39:36', '2af34bf5-c8e6-49e1-9f1c-310068f1f05c');

-- --------------------------------------------------------

--
-- Table structure for table `amx_matrixcontent_menublog`
--

CREATE TABLE `amx_matrixcontent_menublog` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_menuElements_menuItemLink` varchar(255) DEFAULT NULL,
  `field_menuElements_menuItemName` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amx_matrixcontent_menublog`
--

INSERT INTO `amx_matrixcontent_menublog` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_menuElements_menuItemLink`, `field_menuElements_menuItemName`) VALUES
(1, 15, 1, '2020-12-27 21:44:19', '2020-12-27 22:39:52', '406bd38c-daf4-41bb-aad9-6118c89fc28d', 'https://anuar.mx', 'Un link'),
(2, 16, 1, '2020-12-27 22:00:29', '2020-12-27 22:39:52', 'f6426eb0-f392-49b4-86a6-2bb095b255f9', '/about-me', 'About me'),
(3, 17, 1, '2020-12-27 22:00:43', '2020-12-27 22:39:52', 'db0fcb1f-f0fa-435f-b334-9b570acfdfa7', '/contact', 'Contact');

-- --------------------------------------------------------

--
-- Table structure for table `amx_migrations`
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
-- Dumping data for table `amx_migrations`
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
-- Table structure for table `amx_plugins`
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
-- Dumping data for table `amx_plugins`
--

INSERT INTO `amx_plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'redactor', '2.8.5', '2.3.0', 'unknown', NULL, '2020-12-27 22:32:29', '2020-12-27 22:32:29', '2020-12-27 22:32:29', 'ea3e4b92-4f56-42e9-b70e-2e97c413e11e');

-- --------------------------------------------------------

--
-- Table structure for table `amx_projectconfig`
--

CREATE TABLE `amx_projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amx_projectconfig`
--

INSERT INTO `amx_projectconfig` (`path`, `value`) VALUES
('dateModified', '1609109073'),
('email.fromEmail', '\"anuarhdz@gmail.com\"'),
('email.fromName', '\"Anuar Reyes\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.fieldUid', '\"be6d086f-56a5-46be-9805-16a1b0d9db3a\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.instructions', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.label', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.required', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.tip', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.warning', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.0.width', '100'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.1.fieldUid', '\"78fe4505-d195-41c0-ae9a-aaab337158ed\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.1.instructions', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.1.label', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.1.required', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.1.tip', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.1.warning', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.1.width', '100'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.2.fieldUid', '\"04e7829c-a3b3-4292-80c0-44b3f3a74692\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.2.instructions', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.2.label', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.2.required', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.2.tip', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.2.warning', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.2.width', '100'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.3.fieldUid', '\"f8a32c3d-1c3d-45db-921c-0ec6d49887c3\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.3.instructions', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.3.label', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.3.required', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.3.tip', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.3.warning', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.3.width', '100'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.autocapitalize', 'true'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.autocomplete', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.autocorrect', 'true'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.class', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.disabled', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.id', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.instructions', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.label', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.max', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.min', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.name', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.orientation', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.placeholder', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.readonly', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.requirable', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.size', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.step', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.tip', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.title', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.warning', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.elements.4.width', '100'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.name', '\"Content\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.fieldLayouts.0296914f-54ee-445c-9cee-9e7a35ec1d3c.tabs.0.sortOrder', '1'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.handle', '\"blog\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.hasTitleField', 'false'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.name', '\"blog\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.section', '\"3ce7f791-2895-4d2f-9db0-05026d7c2c93\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.sortOrder', '1'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.titleTranslationKeyFormat', 'null'),
('entryTypes.266de19f-571d-4d6b-a3a6-0889f599a8d0.titleTranslationMethod', '\"site\"'),
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
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.handle', '\"blogArticle\"'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.hasTitleField', 'true'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.name', '\"blog article\"'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.section', '\"e24e5e8f-a604-4501-83b5-f3d1d5bffcc5\"'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.sortOrder', '1'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.titleFormat', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.titleTranslationKeyFormat', 'null'),
('entryTypes.c65f8cd3-c8e1-41bf-95fd-d6a0ae82ff2c.titleTranslationMethod', '\"site\"'),
('fieldGroups.5a92ed28-fddb-4c98-9f3e-d44f88687438.name', '\"blog\"'),
('fieldGroups.89e96ba2-3a8a-4bd6-91c6-1e2d58d07def.name', '\"Common\"'),
('fieldGroups.92488251-a1ab-4094-aece-f065a2f2c32c.name', '\"about me\"'),
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
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fieldLayouts.54c33367-46e4-4a51-b192-4096f5a1c5c2.tabs.0.elements.0.label', 'null'),
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
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.handle', '\"menuItemName\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.instructions', '\"\"'),
('matrixBlockTypes.2af34bf5-c8e6-49e1-9f1c-310068f1f05c.fields.8bd28df4-c540-4ea6-b68a-3950dbb0f226.name', '\"Menu Item Name\"'),
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
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.enableVersioning', 'true'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.handle', '\"blog\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.name', '\"blog\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.propagationMethod', '\"all\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.enabledByDefault', 'true'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.hasUrls', 'true'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.template', '\"templates/blog\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.siteSettings.97f57858-b416-4aac-877d-78bebb1bdbe6.uriFormat', '\"__home__\"'),
('sections.3ce7f791-2895-4d2f-9db0-05026d7c2c93.type', '\"single\"'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.enableVersioning', 'true'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.handle', '\"blogArticle\"'),
('sections.e24e5e8f-a604-4501-83b5-f3d1d5bffcc5.name', '\"blog article\"'),
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
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `amx_queue`
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
-- Table structure for table `amx_relations`
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

-- --------------------------------------------------------

--
-- Table structure for table `amx_resourcepaths`
--

CREATE TABLE `amx_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amx_resourcepaths`
--

INSERT INTO `amx_resourcepaths` (`hash`, `path`) VALUES
('10ef45b8', '@lib/velocity'),
('160b2c5', '@bower/jquery/dist'),
('1b9c5c64', '@craft/web/assets/deprecationerrors/dist'),
('1dceedce', '@craft/web/assets/updates/dist'),
('241fb298', '@craft/web/assets/dashboard/dist'),
('2ef01930', '@lib/element-resize-detector'),
('3bd551f4', '@craft/web/assets/matrixsettings/dist'),
('462133be', '@craft/web/assets/editsection/dist'),
('4b5f3e98', '@app/web/assets/fieldsettings/dist'),
('4b97098', '@craft/web/assets/editentry/dist'),
('54919e54', '@lib/axios'),
('5a020035', '@craft/redactor/assets/field/dist'),
('5d45542b', '@craft/web/assets/clearcaches/dist'),
('5d5c9453', '@craft/web/assets/feed/dist'),
('5e46de1d', '@lib/jquery-ui'),
('6249a917', '@craft/web/assets/craftsupport/dist'),
('65eb7822', '@app/web/assets/cp/dist'),
('6a4f1eda', '@craft/web/assets/login/dist'),
('797a3d21', '@lib/vue'),
('828a4465', '@craft/web/assets/queuemanager/dist'),
('836fae13', '@lib/d3'),
('8569be45', '@craft/web/assets/utilities/dist'),
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
('ac7f5c93', '@craft/web/assets/admintable/dist'),
('b0d2b995', '@lib/garnishjs'),
('c5e55f1e', '@craft/web/assets/updateswidget/dist'),
('c8a67c47', '@craft/web/assets/fieldsettings/dist'),
('cc8ea50', '@lib/jquery.payment'),
('ccca0b45', '@craft/web/assets/generalsettings/dist'),
('cf0e2bac', '@craft/redactor/assets/redactor/dist'),
('d2e7dd59', '@craft/web/assets/installer/dist'),
('d3d8e74c', '@lib/xregexp'),
('d6e0b6f2', '@craft/web/assets/pluginstore/dist'),
('d9b4a3c6', '@lib/selectize'),
('df9b868f', '@craft/web/assets/cp/dist'),
('ee12b045', '@app/web/assets/editsection/dist'),
('f29c5b2f', '@craft/web/assets/updater/dist'),
('f823f23e', '@app/web/assets/admintable/dist'),
('fb5f1d70', '@craft/web/assets/recententries/dist');

-- --------------------------------------------------------

--
-- Table structure for table `amx_revisions`
--

CREATE TABLE `amx_revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amx_revisions`
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
(11, 18, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `amx_searchindex`
--

CREATE TABLE `amx_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amx_searchindex`
--

INSERT INTO `amx_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' anuar mx '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' anuarhdz gmail com '),
(1, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ' blog '),
(4, 'slug', 0, 1, ''),
(2, 'title', 0, 1, ' blog '),
(12, 'slug', 0, 1, ' about me '),
(12, 'title', 0, 1, ' about me '),
(15, 'slug', 0, 1, ''),
(16, 'slug', 0, 1, ''),
(17, 'slug', 0, 1, ''),
(18, 'title', 0, 1, ' blog article '),
(18, 'slug', 0, 1, ' blog article ');

-- --------------------------------------------------------

--
-- Table structure for table `amx_sections`
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
-- Dumping data for table `amx_sections`
--

INSERT INTO `amx_sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'blog', 'blog', 'single', 1, 'all', NULL, '2020-12-24 05:53:10', '2020-12-24 05:53:10', NULL, '3ce7f791-2895-4d2f-9db0-05026d7c2c93'),
(2, NULL, 'about-me', 'aboutMe', 'single', 1, 'all', NULL, '2020-12-27 02:35:35', '2020-12-27 02:35:35', '2020-12-27 02:40:40', '8d3739f4-9f93-428f-bb7a-dd0009822780'),
(3, NULL, 'blog article', 'blogArticle', 'single', 1, 'all', NULL, '2020-12-27 22:44:14', '2020-12-27 22:44:33', NULL, 'e24e5e8f-a604-4501-83b5-f3d1d5bffcc5');

-- --------------------------------------------------------

--
-- Table structure for table `amx_sections_sites`
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
-- Dumping data for table `amx_sections_sites`
--

INSERT INTO `amx_sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'templates/blog', 1, '2020-12-24 05:53:10', '2020-12-24 05:53:10', '053902cb-69ea-440f-9a7f-bdc06afdb3fc'),
(2, 2, 1, 1, 'about-me', 'templates/blog', 1, '2020-12-27 02:35:35', '2020-12-27 02:35:35', '03dcc3c6-38e0-42ad-a8dc-4b52cd3dcc8c'),
(3, 3, 1, 1, 'article', 'templates/article', 1, '2020-12-27 22:44:14', '2020-12-27 22:44:33', '633187b5-aeeb-4388-9b1e-1b13464b7ef6');

-- --------------------------------------------------------

--
-- Table structure for table `amx_sequences`
--

CREATE TABLE `amx_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `amx_sessions`
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
-- Dumping data for table `amx_sessions`
--

INSERT INTO `amx_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 1, 'WMJeWyXqZ9KjfYltyEvZImAypy3uk_9uE1m9eVXzivXSRuu9sT6hgvCnESp1zTeWkUAn94PINjNgJ8uYuYfbz45W_ljZyZIWG2ST', '2020-12-27 20:36:39', '2020-12-27 22:44:34', '465d14ed-47e8-4956-b0c6-52a3e4650ab8');

-- --------------------------------------------------------

--
-- Table structure for table `amx_shunnedmessages`
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
-- Table structure for table `amx_sitegroups`
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
-- Dumping data for table `amx_sitegroups`
--

INSERT INTO `amx_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Anuar Reyes', '2020-12-24 05:20:48', '2020-12-24 05:20:48', NULL, 'cfa2dbc4-0f72-427a-b9ce-6ad4f829f061');

-- --------------------------------------------------------

--
-- Table structure for table `amx_sites`
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
-- Dumping data for table `amx_sites`
--

INSERT INTO `amx_sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Anuar Reyes', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2020-12-24 05:20:48', '2020-12-24 05:20:48', NULL, '97f57858-b416-4aac-877d-78bebb1bdbe6');

-- --------------------------------------------------------

--
-- Table structure for table `amx_structureelements`
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
-- Table structure for table `amx_structures`
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
-- Table structure for table `amx_systemmessages`
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
-- Table structure for table `amx_taggroups`
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
-- Table structure for table `amx_tags`
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
-- Table structure for table `amx_templatecacheelements`
--

CREATE TABLE `amx_templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `amx_templatecachequeries`
--

CREATE TABLE `amx_templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `amx_templatecaches`
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
-- Table structure for table `amx_tokens`
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
-- Table structure for table `amx_usergroups`
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
-- Table structure for table `amx_usergroups_users`
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
-- Table structure for table `amx_userpermissions`
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
-- Table structure for table `amx_userpermissions_usergroups`
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
-- Table structure for table `amx_userpermissions_users`
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
-- Table structure for table `amx_userpreferences`
--

CREATE TABLE `amx_userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amx_userpreferences`
--

INSERT INTO `amx_userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `amx_users`
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
-- Dumping data for table `amx_users`
--

INSERT INTO `amx_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'anuar.mx', NULL, NULL, NULL, 'anuarhdz@gmail.com', '$2y$13$6Um7VfD48gyW9bb4bsxeX.92IuNcBSRq.49oRCUg9VXZ/4q3dqsi6', 1, 0, 0, 0, '2020-12-27 20:36:39', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2020-12-24 05:20:48', '2020-12-24 05:20:48', '2020-12-27 20:36:39', 'f5a87f4f-617b-4ea9-aa5a-b37f0c821d1b');

-- --------------------------------------------------------

--
-- Table structure for table `amx_volumefolders`
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

-- --------------------------------------------------------

--
-- Table structure for table `amx_volumes`
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

-- --------------------------------------------------------

--
-- Table structure for table `amx_widgets`
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
-- Dumping data for table `amx_widgets`
--

INSERT INTO `amx_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2020-12-24 05:25:30', '2020-12-24 05:25:30', '636e39e8-40ff-4846-96db-8a6a196cd017'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2020-12-24 05:25:30', '2020-12-24 05:25:30', '945b5f1a-6f20-4dff-be94-f3de0b1db531'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2020-12-24 05:25:30', '2020-12-24 05:25:30', 'a3626678-dc5f-432d-9b0e-8451c50f530c'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2020-12-24 05:25:30', '2020-12-24 05:25:30', 'aca9cc48-cc50-4cbe-9b32-127ca9c31a36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amx_assetindexdata`
--
ALTER TABLE `amx_assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `amx_assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `amx_assets`
--
ALTER TABLE `amx_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `amx_assets_folderId_idx` (`folderId`),
  ADD KEY `amx_assets_volumeId_idx` (`volumeId`),
  ADD KEY `amx_assets_uploaderId_fk` (`uploaderId`);

--
-- Indexes for table `amx_assettransformindex`
--
ALTER TABLE `amx_assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `amx_assettransforms`
--
ALTER TABLE `amx_assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_assettransforms_name_idx` (`name`),
  ADD KEY `amx_assettransforms_handle_idx` (`handle`);

--
-- Indexes for table `amx_categories`
--
ALTER TABLE `amx_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_categories_groupId_idx` (`groupId`),
  ADD KEY `amx_categories_parentId_fk` (`parentId`);

--
-- Indexes for table `amx_categorygroups`
--
ALTER TABLE `amx_categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_categorygroups_name_idx` (`name`),
  ADD KEY `amx_categorygroups_handle_idx` (`handle`),
  ADD KEY `amx_categorygroups_structureId_idx` (`structureId`),
  ADD KEY `amx_categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `amx_categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `amx_categorygroups_sites`
--
ALTER TABLE `amx_categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `amx_categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `amx_changedattributes`
--
ALTER TABLE `amx_changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `amx_changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `amx_changedattributes_siteId_fk` (`siteId`),
  ADD KEY `amx_changedattributes_userId_fk` (`userId`);

--
-- Indexes for table `amx_changedfields`
--
ALTER TABLE `amx_changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `amx_changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `amx_changedfields_siteId_fk` (`siteId`),
  ADD KEY `amx_changedfields_fieldId_fk` (`fieldId`),
  ADD KEY `amx_changedfields_userId_fk` (`userId`);

--
-- Indexes for table `amx_content`
--
ALTER TABLE `amx_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `amx_content_siteId_idx` (`siteId`),
  ADD KEY `amx_content_title_idx` (`title`);

--
-- Indexes for table `amx_craftidtokens`
--
ALTER TABLE `amx_craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `amx_deprecationerrors`
--
ALTER TABLE `amx_deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `amx_drafts`
--
ALTER TABLE `amx_drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_drafts_creatorId_fk` (`creatorId`),
  ADD KEY `amx_drafts_sourceId_fk` (`sourceId`);

--
-- Indexes for table `amx_elementindexsettings`
--
ALTER TABLE `amx_elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `amx_elements`
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
-- Indexes for table `amx_elements_sites`
--
ALTER TABLE `amx_elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `amx_elements_sites_siteId_idx` (`siteId`),
  ADD KEY `amx_elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `amx_elements_sites_enabled_idx` (`enabled`),
  ADD KEY `amx_elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `amx_entries`
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
-- Indexes for table `amx_entrytypes`
--
ALTER TABLE `amx_entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `amx_entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `amx_entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `amx_entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `amx_entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `amx_fieldgroups`
--
ALTER TABLE `amx_fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_fieldgroups_name_idx` (`name`);

--
-- Indexes for table `amx_fieldlayoutfields`
--
ALTER TABLE `amx_fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `amx_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `amx_fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `amx_fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `amx_fieldlayouts`
--
ALTER TABLE `amx_fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `amx_fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `amx_fieldlayouttabs`
--
ALTER TABLE `amx_fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `amx_fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `amx_fields`
--
ALTER TABLE `amx_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_fields_handle_context_idx` (`handle`,`context`),
  ADD KEY `amx_fields_groupId_idx` (`groupId`),
  ADD KEY `amx_fields_context_idx` (`context`);

--
-- Indexes for table `amx_globalsets`
--
ALTER TABLE `amx_globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_globalsets_name_idx` (`name`),
  ADD KEY `amx_globalsets_handle_idx` (`handle`),
  ADD KEY `amx_globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `amx_gqlschemas`
--
ALTER TABLE `amx_gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amx_gqltokens`
--
ALTER TABLE `amx_gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_gqltokens_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `amx_gqltokens_name_unq_idx` (`name`),
  ADD KEY `amx_gqltokens_schemaId_fk` (`schemaId`);

--
-- Indexes for table `amx_info`
--
ALTER TABLE `amx_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amx_matrixblocks`
--
ALTER TABLE `amx_matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `amx_matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `amx_matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `amx_matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `amx_matrixblocktypes`
--
ALTER TABLE `amx_matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  ADD KEY `amx_matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  ADD KEY `amx_matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `amx_matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `amx_matrixcontent_menublog`
--
ALTER TABLE `amx_matrixcontent_menublog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_matrixcontent_menublog_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `amx_matrixcontent_menublog_siteId_fk` (`siteId`);

--
-- Indexes for table `amx_migrations`
--
ALTER TABLE `amx_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_migrations_track_name_unq_idx` (`track`,`name`);

--
-- Indexes for table `amx_plugins`
--
ALTER TABLE `amx_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `amx_projectconfig`
--
ALTER TABLE `amx_projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `amx_queue`
--
ALTER TABLE `amx_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `amx_queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `amx_relations`
--
ALTER TABLE `amx_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `amx_relations_sourceId_idx` (`sourceId`),
  ADD KEY `amx_relations_targetId_idx` (`targetId`),
  ADD KEY `amx_relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `amx_resourcepaths`
--
ALTER TABLE `amx_resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `amx_revisions`
--
ALTER TABLE `amx_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `amx_revisions_creatorId_fk` (`creatorId`);

--
-- Indexes for table `amx_searchindex`
--
ALTER TABLE `amx_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `amx_searchindex` ADD FULLTEXT KEY `amx_searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `amx_sections`
--
ALTER TABLE `amx_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_sections_handle_idx` (`handle`),
  ADD KEY `amx_sections_name_idx` (`name`),
  ADD KEY `amx_sections_structureId_idx` (`structureId`),
  ADD KEY `amx_sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `amx_sections_sites`
--
ALTER TABLE `amx_sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `amx_sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `amx_sequences`
--
ALTER TABLE `amx_sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `amx_sessions`
--
ALTER TABLE `amx_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_sessions_uid_idx` (`uid`),
  ADD KEY `amx_sessions_token_idx` (`token`),
  ADD KEY `amx_sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `amx_sessions_userId_idx` (`userId`);

--
-- Indexes for table `amx_shunnedmessages`
--
ALTER TABLE `amx_shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `amx_sitegroups`
--
ALTER TABLE `amx_sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_sitegroups_name_idx` (`name`);

--
-- Indexes for table `amx_sites`
--
ALTER TABLE `amx_sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `amx_sites_handle_idx` (`handle`),
  ADD KEY `amx_sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `amx_sites_groupId_fk` (`groupId`);

--
-- Indexes for table `amx_structureelements`
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
-- Indexes for table `amx_structures`
--
ALTER TABLE `amx_structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `amx_systemmessages`
--
ALTER TABLE `amx_systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `amx_systemmessages_language_idx` (`language`);

--
-- Indexes for table `amx_taggroups`
--
ALTER TABLE `amx_taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_taggroups_name_idx` (`name`),
  ADD KEY `amx_taggroups_handle_idx` (`handle`),
  ADD KEY `amx_taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `amx_taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `amx_tags`
--
ALTER TABLE `amx_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_tags_groupId_idx` (`groupId`);

--
-- Indexes for table `amx_templatecacheelements`
--
ALTER TABLE `amx_templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `amx_templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `amx_templatecachequeries`
--
ALTER TABLE `amx_templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `amx_templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `amx_templatecaches`
--
ALTER TABLE `amx_templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `amx_templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `amx_templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `amx_tokens`
--
ALTER TABLE `amx_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_tokens_token_unq_idx` (`token`),
  ADD KEY `amx_tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `amx_usergroups`
--
ALTER TABLE `amx_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_usergroups_handle_idx` (`handle`),
  ADD KEY `amx_usergroups_name_idx` (`name`);

--
-- Indexes for table `amx_usergroups_users`
--
ALTER TABLE `amx_usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `amx_usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `amx_userpermissions`
--
ALTER TABLE `amx_userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `amx_userpermissions_usergroups`
--
ALTER TABLE `amx_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `amx_userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `amx_userpermissions_users`
--
ALTER TABLE `amx_userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `amx_userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `amx_userpreferences`
--
ALTER TABLE `amx_userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `amx_users`
--
ALTER TABLE `amx_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_users_uid_idx` (`uid`),
  ADD KEY `amx_users_verificationCode_idx` (`verificationCode`),
  ADD KEY `amx_users_email_idx` (`email`),
  ADD KEY `amx_users_username_idx` (`username`),
  ADD KEY `amx_users_photoId_fk` (`photoId`);

--
-- Indexes for table `amx_volumefolders`
--
ALTER TABLE `amx_volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amx_volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `amx_volumefolders_parentId_idx` (`parentId`),
  ADD KEY `amx_volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `amx_volumes`
--
ALTER TABLE `amx_volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_volumes_name_idx` (`name`),
  ADD KEY `amx_volumes_handle_idx` (`handle`),
  ADD KEY `amx_volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `amx_volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `amx_widgets`
--
ALTER TABLE `amx_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amx_widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amx_assetindexdata`
--
ALTER TABLE `amx_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_assettransformindex`
--
ALTER TABLE `amx_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_assettransforms`
--
ALTER TABLE `amx_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_categorygroups`
--
ALTER TABLE `amx_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_categorygroups_sites`
--
ALTER TABLE `amx_categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_content`
--
ALTER TABLE `amx_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `amx_craftidtokens`
--
ALTER TABLE `amx_craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_deprecationerrors`
--
ALTER TABLE `amx_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_drafts`
--
ALTER TABLE `amx_drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_elementindexsettings`
--
ALTER TABLE `amx_elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_elements`
--
ALTER TABLE `amx_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `amx_elements_sites`
--
ALTER TABLE `amx_elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `amx_entrytypes`
--
ALTER TABLE `amx_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `amx_fieldgroups`
--
ALTER TABLE `amx_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `amx_fieldlayoutfields`
--
ALTER TABLE `amx_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `amx_fieldlayouts`
--
ALTER TABLE `amx_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `amx_fieldlayouttabs`
--
ALTER TABLE `amx_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `amx_fields`
--
ALTER TABLE `amx_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `amx_globalsets`
--
ALTER TABLE `amx_globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `amx_gqlschemas`
--
ALTER TABLE `amx_gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_gqltokens`
--
ALTER TABLE `amx_gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_info`
--
ALTER TABLE `amx_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `amx_matrixblocktypes`
--
ALTER TABLE `amx_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `amx_matrixcontent_menublog`
--
ALTER TABLE `amx_matrixcontent_menublog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `amx_migrations`
--
ALTER TABLE `amx_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `amx_plugins`
--
ALTER TABLE `amx_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `amx_queue`
--
ALTER TABLE `amx_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `amx_relations`
--
ALTER TABLE `amx_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_revisions`
--
ALTER TABLE `amx_revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `amx_sections`
--
ALTER TABLE `amx_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `amx_sections_sites`
--
ALTER TABLE `amx_sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `amx_sessions`
--
ALTER TABLE `amx_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `amx_shunnedmessages`
--
ALTER TABLE `amx_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_sitegroups`
--
ALTER TABLE `amx_sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `amx_sites`
--
ALTER TABLE `amx_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `amx_structureelements`
--
ALTER TABLE `amx_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_structures`
--
ALTER TABLE `amx_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_systemmessages`
--
ALTER TABLE `amx_systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_taggroups`
--
ALTER TABLE `amx_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_templatecacheelements`
--
ALTER TABLE `amx_templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_templatecachequeries`
--
ALTER TABLE `amx_templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_templatecaches`
--
ALTER TABLE `amx_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_tokens`
--
ALTER TABLE `amx_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_usergroups`
--
ALTER TABLE `amx_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_usergroups_users`
--
ALTER TABLE `amx_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_userpermissions`
--
ALTER TABLE `amx_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_userpermissions_usergroups`
--
ALTER TABLE `amx_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_userpermissions_users`
--
ALTER TABLE `amx_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_userpreferences`
--
ALTER TABLE `amx_userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `amx_volumefolders`
--
ALTER TABLE `amx_volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_volumes`
--
ALTER TABLE `amx_volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amx_widgets`
--
ALTER TABLE `amx_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amx_assetindexdata`
--
ALTER TABLE `amx_assetindexdata`
  ADD CONSTRAINT `amx_assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `amx_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_assets`
--
ALTER TABLE `amx_assets`
  ADD CONSTRAINT `amx_assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `amx_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_assets_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `amx_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `amx_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_categories`
--
ALTER TABLE `amx_categories`
  ADD CONSTRAINT `amx_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `amx_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `amx_categorygroups`
--
ALTER TABLE `amx_categorygroups`
  ADD CONSTRAINT `amx_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `amx_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_categorygroups_sites`
--
ALTER TABLE `amx_categorygroups_sites`
  ADD CONSTRAINT `amx_categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `amx_changedattributes`
--
ALTER TABLE `amx_changedattributes`
  ADD CONSTRAINT `amx_changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `amx_changedfields`
--
ALTER TABLE `amx_changedfields`
  ADD CONSTRAINT `amx_changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `amx_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `amx_content`
--
ALTER TABLE `amx_content`
  ADD CONSTRAINT `amx_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `amx_craftidtokens`
--
ALTER TABLE `amx_craftidtokens`
  ADD CONSTRAINT `amx_craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_drafts`
--
ALTER TABLE `amx_drafts`
  ADD CONSTRAINT `amx_drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `amx_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_elements`
--
ALTER TABLE `amx_elements`
  ADD CONSTRAINT `amx_elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `amx_drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `amx_revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_elements_sites`
--
ALTER TABLE `amx_elements_sites`
  ADD CONSTRAINT `amx_elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `amx_entries`
--
ALTER TABLE `amx_entries`
  ADD CONSTRAINT `amx_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `amx_entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `amx_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `amx_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_entrytypes`
--
ALTER TABLE `amx_entrytypes`
  ADD CONSTRAINT `amx_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `amx_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_fieldlayoutfields`
--
ALTER TABLE `amx_fieldlayoutfields`
  ADD CONSTRAINT `amx_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `amx_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `amx_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_fieldlayouttabs`
--
ALTER TABLE `amx_fieldlayouttabs`
  ADD CONSTRAINT `amx_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_fields`
--
ALTER TABLE `amx_fields`
  ADD CONSTRAINT `amx_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_globalsets`
--
ALTER TABLE `amx_globalsets`
  ADD CONSTRAINT `amx_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_gqltokens`
--
ALTER TABLE `amx_gqltokens`
  ADD CONSTRAINT `amx_gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `amx_gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `amx_matrixblocks`
--
ALTER TABLE `amx_matrixblocks`
  ADD CONSTRAINT `amx_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `amx_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `amx_matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_matrixblocktypes`
--
ALTER TABLE `amx_matrixblocktypes`
  ADD CONSTRAINT `amx_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `amx_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `amx_matrixcontent_menublog`
--
ALTER TABLE `amx_matrixcontent_menublog`
  ADD CONSTRAINT `amx_matrixcontent_menublog_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_matrixcontent_menublog_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `amx_relations`
--
ALTER TABLE `amx_relations`
  ADD CONSTRAINT `amx_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `amx_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amx_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_revisions`
--
ALTER TABLE `amx_revisions`
  ADD CONSTRAINT `amx_revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `amx_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amx_revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_sections`
--
ALTER TABLE `amx_sections`
  ADD CONSTRAINT `amx_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `amx_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `amx_sections_sites`
--
ALTER TABLE `amx_sections_sites`
  ADD CONSTRAINT `amx_sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `amx_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `amx_sessions`
--
ALTER TABLE `amx_sessions`
  ADD CONSTRAINT `amx_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_shunnedmessages`
--
ALTER TABLE `amx_shunnedmessages`
  ADD CONSTRAINT `amx_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_sites`
--
ALTER TABLE `amx_sites`
  ADD CONSTRAINT `amx_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_structureelements`
--
ALTER TABLE `amx_structureelements`
  ADD CONSTRAINT `amx_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `amx_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_taggroups`
--
ALTER TABLE `amx_taggroups`
  ADD CONSTRAINT `amx_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `amx_tags`
--
ALTER TABLE `amx_tags`
  ADD CONSTRAINT `amx_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_templatecacheelements`
--
ALTER TABLE `amx_templatecacheelements`
  ADD CONSTRAINT `amx_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `amx_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_templatecachequeries`
--
ALTER TABLE `amx_templatecachequeries`
  ADD CONSTRAINT `amx_templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `amx_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_templatecaches`
--
ALTER TABLE `amx_templatecaches`
  ADD CONSTRAINT `amx_templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `amx_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `amx_usergroups_users`
--
ALTER TABLE `amx_usergroups_users`
  ADD CONSTRAINT `amx_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_userpermissions_usergroups`
--
ALTER TABLE `amx_userpermissions_usergroups`
  ADD CONSTRAINT `amx_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `amx_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `amx_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_userpermissions_users`
--
ALTER TABLE `amx_userpermissions_users`
  ADD CONSTRAINT `amx_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `amx_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_userpreferences`
--
ALTER TABLE `amx_userpreferences`
  ADD CONSTRAINT `amx_userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_users`
--
ALTER TABLE `amx_users`
  ADD CONSTRAINT `amx_users_id_fk` FOREIGN KEY (`id`) REFERENCES `amx_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `amx_assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `amx_volumefolders`
--
ALTER TABLE `amx_volumefolders`
  ADD CONSTRAINT `amx_volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `amx_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amx_volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `amx_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `amx_volumes`
--
ALTER TABLE `amx_volumes`
  ADD CONSTRAINT `amx_volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `amx_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `amx_widgets`
--
ALTER TABLE `amx_widgets`
  ADD CONSTRAINT `amx_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `amx_users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
