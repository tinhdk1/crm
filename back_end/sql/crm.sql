-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-04-27 08:59:02
-- 服务器版本： 5.7.18-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--

-- --------------------------------------------------------

--
-- 表的结构 `disease`
--

CREATE TABLE `disease` (
  `id` tinyint(3) NOT NULL,
  `name` char(10) NOT NULL,
  `childs` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='病种';

-- --------------------------------------------------------

--
-- 表的结构 `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` char(20) NOT NULL,
  `introduction` text COMMENT '介绍',
  `state` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='专家';

--
-- 转存表中的数据 `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `introduction`, `state`) VALUES
(1, 'doctor1', '..', 1),
(2, 'doctor2', '..', 1),
(3, 'doctor3', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `json`
--

CREATE TABLE `json` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `json` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `log`
--

CREATE TABLE `log` (
  `id` tinyint(4) NOT NULL,
  `ip` char(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `des` text COLLATE utf8mb4_unicode_ci,
  `admin` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='行为日志';

-- --------------------------------------------------------

--
-- 表的结构 `media`
--

CREATE TABLE `media` (
  `id` int(3) NOT NULL,
  `name` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='病患来源';

--
-- 转存表中的数据 `media`
--

INSERT INTO `media` (`id`, `name`) VALUES
(1, 'baidu'),
(2, 'google'),
(3, '360'),
(4, 'sougou');

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE `menu` (
  `id` tinyint(4) UNSIGNED NOT NULL,
  `title` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `power` tinyint(4) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单';

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `title`, `name`, `url`, `power`) VALUES
(1, '仪表盘', '1', 'dashboard', 0),
(2, '客户池', '2', '', 0),
(3, '登记用户', '2-1', 'patients_regsiter', 0),
(4, '数据报表', '3', '', 1),
(5, '绩效数据', '3-1', 't_report_data', 1),
(6, '业绩报表', '3-2', 'c_report_data', 1),
(7, '信息管理', '4', '', 1),
(8, '医生管理', '4-1', 'doctor_info', 1),
(9, '病种科室', '4-2', 'disease_info', 1),
(10, '来源渠道', '4-3', 'info_media', 1),
(11, '咨询方式', '4-4', 'info_advisory', 1),
(12, '系统设置', '5', '', 1),
(13, '权限组管理', '5-1', 'system_permission', 2),
(14, '用户列表', '5-2', 'system_user', 2),
(15, '行为日志', '5-3', 'system_log', 1),
(16, '通知管理', '5-4', 'system_notice', 1),
(17, '参数设置', '5-5', 'system_config', 2);

-- --------------------------------------------------------

--
-- 表的结构 `patient`
--

CREATE TABLE `patient` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT '0',
  `tel` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` tinyint(3) UNSIGNED DEFAULT NULL,
  `wechat` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qq` int(13) UNSIGNED DEFAULT NULL,
  `add_time` char(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '添加时间',
  `order_time` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '预约时间',
  `reach_time` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '到诊时间',
  `disease_id` tinyint(3) UNSIGNED DEFAULT NULL COMMENT '病人id',
  `author_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL,
  `mediaFrom_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `doctor_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `advisory_way` tinyint(3) UNSIGNED DEFAULT NULL,
  `advisory_content` text COLLATE utf8mb4_unicode_ci,
  `area` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `patient`
--

INSERT INTO `patient` (`id`, `name`, `sex`, `tel`, `age`, `wechat`, `qq`, `add_time`, `order_time`, `reach_time`, `disease_id`, `author_id`, `state`, `mediaFrom_id`, `doctor_id`, `advisory_way`, `advisory_content`, `area`, `remarks`) VALUES
(18, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979349', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(19, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979414', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(21, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979934', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(22, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979934', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(23, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979934', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(24, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979935', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(25, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979935', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(26, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979935', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(27, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979935', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(28, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979935', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(29, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979935', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(30, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979935', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(31, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979936', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(32, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979936', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(33, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979936', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(34, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979936', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(35, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979937', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(36, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979937', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(37, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979937', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(38, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979937', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(39, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979938', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(40, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979938', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(41, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979938', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(42, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979938', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(43, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979939', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(44, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979940', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(45, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979940', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(46, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979940', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(47, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(48, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(49, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(50, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(51, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(52, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(53, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(54, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(55, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(56, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(57, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(58, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(59, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(60, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(61, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(62, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(63, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(64, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(65, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(66, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(67, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(68, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(69, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(70, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(71, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(72, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(73, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(74, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(75, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(76, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(77, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(78, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(79, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(80, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(81, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(82, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(83, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(84, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(85, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(86, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(87, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(88, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(89, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(90, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(91, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(92, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(93, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(94, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(95, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(96, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(97, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(98, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(99, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(100, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(101, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(102, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(103, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(104, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(105, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(106, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(107, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(108, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(109, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(110, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(111, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(112, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(113, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(114, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(115, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(116, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(117, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(118, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(119, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(120, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(121, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(122, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(123, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(124, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(125, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(126, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(127, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(128, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(129, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(130, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(131, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(132, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(133, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(134, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(135, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(136, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(137, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(138, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(139, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(140, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(141, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(142, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(143, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(144, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(145, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(146, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(147, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(148, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(149, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(150, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(151, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(152, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(153, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(154, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(155, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(156, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(157, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(158, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(159, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(160, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(161, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(162, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(163, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(164, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(165, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(166, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(167, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(168, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(169, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(170, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(171, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(172, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(173, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(174, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(175, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(176, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(177, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(178, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(179, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(180, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(181, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(182, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(183, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(184, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(185, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(186, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(187, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(188, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(189, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(190, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(191, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(192, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(193, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(194, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(195, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(196, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(197, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(198, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(199, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(200, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(201, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(202, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(203, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(204, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(205, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(206, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(207, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(208, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(209, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(210, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(211, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(212, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(213, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(214, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(215, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(216, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(217, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(218, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(219, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(220, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(221, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(222, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(223, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(224, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(225, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(226, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(227, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(228, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(229, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(230, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(231, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(232, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(233, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(234, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(235, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(236, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(237, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(238, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(239, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(240, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(241, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(242, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(243, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(244, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(245, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(246, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(247, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(248, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(249, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(250, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(251, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(252, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(253, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(254, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(255, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(256, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(257, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(258, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(259, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(260, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(261, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(262, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(263, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(264, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(265, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(266, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(267, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(268, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(269, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(270, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(271, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(272, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(273, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(274, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(275, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(276, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(277, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(278, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(279, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(280, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(281, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(282, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(283, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(284, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(285, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(286, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(287, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(288, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(289, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(290, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(291, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(292, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(293, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(294, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(295, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(296, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(297, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(298, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(299, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(300, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(301, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(302, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(303, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(304, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(305, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(306, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(307, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(308, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(309, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(310, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(311, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(312, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(313, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(314, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(315, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(316, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(317, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(318, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(319, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(320, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(321, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(322, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(323, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(324, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(325, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(326, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(327, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(328, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(329, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(330, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(331, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(332, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(333, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(334, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(335, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(336, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(337, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(338, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(339, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(340, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(341, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(342, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(343, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(344, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(345, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(346, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(347, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(348, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(349, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(350, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(351, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(352, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(353, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(354, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(355, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(356, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(357, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...');
INSERT INTO `patient` (`id`, `name`, `sex`, `tel`, `age`, `wechat`, `qq`, `add_time`, `order_time`, `reach_time`, `disease_id`, `author_id`, `state`, `mediaFrom_id`, `doctor_id`, `advisory_way`, `advisory_content`, `area`, `remarks`) VALUES
(358, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(359, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(360, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(361, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(362, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(363, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(364, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(365, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(366, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(367, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(368, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(369, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(370, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(371, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(372, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(373, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(374, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(375, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(376, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(377, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(378, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(379, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(380, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(381, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(382, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(383, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(384, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(385, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(386, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(387, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(388, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(389, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(390, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(391, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(392, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(393, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(394, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(395, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(396, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(397, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(398, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(399, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(400, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(401, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(402, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(403, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(404, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(405, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(406, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(407, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(408, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(409, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(410, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(411, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(412, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(413, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(414, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(415, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(416, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(417, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(418, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(419, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(420, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(421, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(422, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(423, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(424, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(425, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(426, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(427, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(428, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(429, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(430, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(431, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(432, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(433, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(434, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(435, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(436, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(437, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(438, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(439, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(440, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(441, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(442, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(443, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(444, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(445, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(446, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(447, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(448, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(449, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(450, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(451, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(452, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(453, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(454, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(455, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(456, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(457, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(458, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(459, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(460, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(461, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(462, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(463, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(464, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(465, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(466, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(467, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(468, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(469, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(470, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(471, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(472, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(473, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(474, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(475, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(476, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(477, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(478, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(479, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(480, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(481, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(482, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(483, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(484, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(485, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(486, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(487, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(488, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(489, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(490, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(491, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(492, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(493, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(494, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(495, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(496, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(497, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(498, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(499, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(500, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(501, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(502, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(503, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(504, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(505, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(506, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(507, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(508, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(509, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(510, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(511, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(512, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(513, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(514, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(515, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(516, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(517, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(518, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(519, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(520, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(521, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(522, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(523, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(524, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(525, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(526, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(527, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(528, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(529, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(530, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(531, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(532, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(533, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(534, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(535, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(536, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(537, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(538, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(539, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(540, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(541, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(542, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(543, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(544, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(545, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(546, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(547, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(548, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(549, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(550, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(551, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(552, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(553, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(554, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(555, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(556, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(557, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(558, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(559, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(560, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(561, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(562, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(563, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(564, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(565, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(566, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(567, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(568, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(569, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(570, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(571, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(572, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(573, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(574, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(575, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(576, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(577, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(578, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(579, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(580, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(581, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(582, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(583, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(584, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(585, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(586, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(587, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(588, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(589, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(590, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(591, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(592, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(593, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(594, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(595, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(596, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(597, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(598, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(599, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(600, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(601, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(602, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(603, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(604, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(605, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(606, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(607, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(608, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(609, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(610, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(611, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(612, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(613, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(614, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(615, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(616, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(617, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(618, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(619, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(620, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(621, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(622, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(623, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(624, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(625, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(626, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(627, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(628, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(629, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(630, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(631, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(632, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(633, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(634, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(635, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(636, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(637, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(638, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(639, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(640, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(641, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(642, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(643, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(644, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(645, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(646, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(647, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(648, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(649, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(650, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(651, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(652, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(653, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(654, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(655, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(656, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(657, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(658, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(659, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(660, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(661, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(662, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(663, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(664, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(665, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(666, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(667, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(668, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(669, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(670, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(671, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(672, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(673, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(674, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(675, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(676, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(677, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(678, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(679, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(680, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(681, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(682, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(683, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(684, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(685, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(686, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(687, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(688, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(689, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(690, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(691, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(692, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(693, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(694, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(695, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...');
INSERT INTO `patient` (`id`, `name`, `sex`, `tel`, `age`, `wechat`, `qq`, `add_time`, `order_time`, `reach_time`, `disease_id`, `author_id`, `state`, `mediaFrom_id`, `doctor_id`, `advisory_way`, `advisory_content`, `area`, `remarks`) VALUES
(696, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(697, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(698, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(699, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(700, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(701, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(702, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(703, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(704, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(705, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(706, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(707, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(708, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(709, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(710, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(711, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(712, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(713, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(714, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(715, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(716, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(717, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(718, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(719, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(720, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(721, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(722, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(723, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(724, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(725, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(726, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(727, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(728, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(729, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(730, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(731, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(732, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(733, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(734, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(735, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(736, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(737, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(738, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(739, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(740, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(741, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(742, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(743, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(744, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(745, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(746, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(747, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(748, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(749, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(750, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(751, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(752, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(753, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(754, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(755, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(756, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(757, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(758, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(759, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(760, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(761, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(762, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(763, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(764, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(765, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(766, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(767, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(768, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(769, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(770, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(771, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(772, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(773, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(774, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(775, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(776, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(777, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(778, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(779, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(780, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(781, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(782, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(783, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(784, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(785, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(786, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(787, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(788, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(789, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(790, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(791, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(792, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(793, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(794, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(795, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(796, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(797, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(798, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(799, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(800, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(801, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(802, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(803, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(804, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(805, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(806, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(807, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(808, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(809, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(810, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(811, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(812, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(813, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(814, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(815, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(816, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(817, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(818, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(819, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(820, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(821, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(822, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(823, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(824, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(825, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(826, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(827, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(828, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(829, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(830, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(831, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(832, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(833, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(834, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(835, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(836, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(837, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(838, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(839, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(840, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(841, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(842, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(843, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(844, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(845, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(846, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(847, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(848, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(849, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(850, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(851, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(852, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(853, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(854, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(855, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(856, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(857, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(858, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(859, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(860, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(861, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(862, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(863, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(864, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(865, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(866, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(867, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(868, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(869, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(870, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(871, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(872, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(873, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(874, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(875, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(876, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(877, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(878, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(879, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(880, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(881, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(882, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(883, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(884, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(885, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(886, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(887, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(888, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(889, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(890, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(891, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(892, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(893, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(894, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(895, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(896, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(897, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(898, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(899, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(900, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(901, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(902, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(903, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(904, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(905, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(906, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(907, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(908, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(909, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(910, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(911, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(912, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(913, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(914, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(915, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(916, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(917, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(918, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(919, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(920, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(921, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(922, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(923, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(924, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(925, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(926, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(927, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(928, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(929, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(930, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(931, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(932, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(933, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(934, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(935, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(936, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(937, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(938, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(939, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(940, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(941, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(942, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(943, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(944, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(945, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(946, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(947, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(948, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(949, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(950, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(951, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(952, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(953, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(954, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(955, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(956, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(957, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(958, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(959, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(960, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(961, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(962, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(963, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(964, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(965, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(966, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(967, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(968, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(969, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(970, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(971, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(972, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(973, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(974, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(975, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(976, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(977, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(978, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(979, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(980, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(981, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(982, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(983, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(984, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(985, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(986, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(987, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(988, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(989, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(990, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(991, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(992, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(993, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(994, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(995, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(996, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(997, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(998, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(999, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1000, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1001, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1002, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1003, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1004, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1005, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491979941', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1006, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491983314', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1007, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491983355', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1008, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491985421', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1009, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491985445', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1010, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491985445', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1011, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491985563', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1012, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491985581', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1013, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491985587', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1014, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491985627', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1015, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491985652', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1016, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1491985671', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1017, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153701', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1018, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153702', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1019, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153702', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1020, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153703', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1021, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153703', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1022, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153703', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1023, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153703', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1024, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153703', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1025, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153704', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1026, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153708', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1027, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153708', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1028, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153708', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...'),
(1029, 'patient1', 0, '13566666666', 20, 'patient1-13566666666', 666666, '1492153708', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '温州', '苟...');

-- --------------------------------------------------------

--
-- 表的结构 `permission`
--

CREATE TABLE `permission` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限名称',
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限说明',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT '父节点id',
  `level` tinyint(4) UNSIGNED NOT NULL DEFAULT '1' COMMENT '权限的层级关系',
  `key` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限表';

--
-- 转存表中的数据 `permission`
--

INSERT INTO `permission` (`id`, `name`, `title`, `parent_id`, `level`, `key`) VALUES
(1, 'index', '系统后台', 0, 1, '-'),
(2, 'index/home', '控制台', 1, 2, '1-'),
(3, 'index/rank', '排行', 1, 2, '1-'),
(4, 'patient', '客户信息查看编辑操作', 0, 1, '-'),
(5, 'patient_edit_info', '允许编辑客户信息', 4, 2, '2-'),
(6, 'patient_edit_name', '允许修改客户姓名', 5, 3, '2-1-'),
(7, 'patient_edit_sex', '允许修改客户性别', 5, 3, '2-1-'),
(8, 'patient_edit_tel', '允许修改客户电话', 5, 3, '2-1-'),
(9, 'patient_edit_age', '允许修改客户年龄', 5, 3, '2-1-'),
(10, 'patient_edit_wechat', '允许修改客户微信', 5, 3, '2-1-'),
(11, 'patient_edit_qq', '允许修改客户QQ', 5, 3, '2-1-'),
(12, 'patient_edit_order_time', '允许修改客户预约时间', 5, 3, '2-1-'),
(13, 'patient_edit_reach_time', '允许修改客户到诊时间', 5, 3, '2-1-'),
(14, 'patient_edit_disease', '允许修改客户预约病种', 5, 3, '2-1-'),
(15, 'patient_edit_media', '允许修改客户渠道来源', 5, 3, '2-1-'),
(16, 'patient_edit_doctor', '允许修改客户预约医生', 5, 3, '2-1-'),
(17, 'patient_edit_advisory_way', '允许修改客户咨询方式', 5, 3, '2-1-'),
(18, 'patient_edit_advisory_content', '允许修改客户咨询内容', 5, 3, '2-1-'),
(19, 'patient_edit_area', '允许修改客户所在地址', 5, 3, '2-1-'),
(20, 'patient_edit_remark', '允许修改客户预约备注', 5, 3, '2-1-'),
(21, 'patient_edit_oth', '允许编辑TA人登记信息', 4, 2, '2-'),
(22, 'patient_add_info', '允许新增客户信息', 4, 2, '2-'),
(23, 'patient_show_info', '允许查看客户信息', 4, 2, '2-'),
(24, 'patient_show_oth', '允许查看TA人登记信息', 23, 3, '2-4-'),
(25, 'patient_show_tell', '允许查看客户完整电话', 23, 3, '2-4-'),
(26, 'patient_huif_info', '允许回访客户', 4, 2, '2-'),
(27, 'patient_huif_oth', '允许回访TA人客户', 4, 2, '2-'),
(28, 'patient_check_info', '允许确认状态', 4, 2, '2-'),
(29, 'patient_check_doc', '允许设置客户接诊医生', 4, 2, '2-'),
(30, 'info', '信息管理', 0, 1, '-'),
(31, 'info_doctor', '医生管理', 30, 2, '3-'),
(32, 'add_info_doctor', '新增医生', 31, 3, '3-1-'),
(33, 'rm_info_doctor', '删除医生', 31, 3, '3-1-'),
(34, 'edit_info_doctor', '编辑医生详情', 31, 3, '3-1-'),
(35, 'info_disease', '病种科室管理', 30, 2, '3-'),
(36, 'add_info_disease', '新增病种科室', 35, 3, '3-2-'),
(37, 'rm_info_disease', '删除病种科室', 35, 3, '3-2-'),
(38, 'edit_info_disease', '编辑病种科室', 35, 3, '3-2-'),
(39, 'info_media', '来源渠道管理', 30, 2, '3-'),
(40, 'add_info_media', '新增来源渠道', 39, 3, '3-3-'),
(41, 'rm_info_media', '删除来源渠道', 39, 3, '3-3-'),
(42, 'edit_info_media', '编辑来源渠道', 39, 3, '3-3-'),
(43, 'info_advisory', '咨询方式管理', 30, 2, '3-'),
(44, 'add_info_advisory', '新增咨询方式', 43, 3, '3-4-'),
(45, 'rm_info_advisory', '删除咨询方式', 43, 3, '3-4-'),
(46, 'edit_info_advisory', '编辑咨询方式', 43, 3, '3-4-'),
(47, 'data', '数据中心', 0, 1, '-'),
(48, 'group_data', '分组数据', 47, 2, '4-'),
(49, 'group_data_mid', '客服数据', 48, 3, '4-1-'),
(50, 'group_data_disease', '病种数据', 48, 3, '4-1-'),
(51, 'group_data_media', '渠道数据', 48, 3, '4-1-'),
(52, 't_report_data', '绩效数据(文本)', 47, 3, '4-'),
(53, 't_report_data_mid', '客服数据', 52, 3, '4-2-'),
(54, 't_report_data_disease', '病种数据', 52, 3, '4-2-'),
(55, 't_report_data_media', '渠道数据', 52, 3, '4-2-'),
(56, 'c_report_data', '绩效数据(图形)', 47, 2, '4-'),
(57, 'c_report_data_mid', '客服数据', 56, 3, '4-3-'),
(58, 'c_report_data_disease', '病种数据', 56, 3, '4-3-'),
(59, 'c_report_data_media', '渠道数据', 56, 3, '4-3-'),
(60, 'system', '系统设置', 0, 1, '-'),
(61, 'system_permission', '权限组管理', 60, 2, '5-'),
(62, 'system_user', '用户列表', 60, 2, '5-'),
(63, 'system_log', '行为日志', 60, 2, '5-'),
(64, 'system_notice', '通知管理', 60, 2, '5-'),
(65, 'system_config', '参数设置', 60, 2, '5-');

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE `role` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色组名称',
  `permission` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `name`, `permission`) VALUES
(1, 'root组', '11111111111111111111111111111111111111111111111111111111111111111'),
(2, '录入用户组', '11111111111111111111111111111000000000000000000000000000000000000');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` tinyint(3) UNSIGNED NOT NULL COMMENT '用户id',
  `username` varchar(15) NOT NULL COMMENT '用户名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `token` char(250) DEFAULT NULL COMMENT '用户认证识别短期密令',
  `exp` int(10) UNSIGNED DEFAULT NULL COMMENT 'token有效期限',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='用户信息';

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `token`, `exp`, `role_id`) VALUES
(1, 'root', '63a9f0ea7bb98050796b649e85481845', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJyb290Iiwic3ViIjoiand0IiwiZXhwIjoxNDkzMTk3OTQ1fQ.OTZmNGUxZTY4NDRkZTc0YTllNmNmODUwMDI1OGM5MDI0YWRlYzY1MmU4MTQxNGJhOWY1OTVlMzYyMWE2YjBjYw', 2493197945, 1),
(2, 'kefu', '0444e11e0501438bda1af664f36974de', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJrZWZ1Iiwic3ViIjoiand0IiwiZXhwIjoxNDkzMTc1NTY0fQ.Y2Y1NTAzMDZlN2U2NjYwYTcxMjE0ZjMxM2UzOWM5ZTE5Y2JjMWQxMTBhNWQ0NmE0NWUwMzIzOTdmYmI3MjQ3OA', 1493175564, 2),
(3, 'kefu2', '0444e11e0501438bda1af664f36974de', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJrZWZ1Iiwic3ViIjoiand0IiwiZXhwIjoxNDkxOTA2MjMwfQ.ZWY2ZjFmYWFlMTViYmMyYWVlN2M0NDNiYmQ1ZmYyMzM5NmQ5YWQ5N2I3NGRlYzljZmY3MDYwNTJlOTA1NGY3Zg', 1491906230, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `json`
--
ALTER TABLE `json`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_name_uindex` (`name`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_group_name_uindex` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_username_uindex` (`username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `disease`
--
ALTER TABLE `disease`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `json`
--
ALTER TABLE `json`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `log`
--
ALTER TABLE `log`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `media`
--
ALTER TABLE `media`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1030;
--
-- 使用表AUTO_INCREMENT `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- 使用表AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id', AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
