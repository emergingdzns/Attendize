-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 23, 2019 at 11:40 AM
-- Server version: 5.5.62-cll
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registra_attendize`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone_id` int(10) UNSIGNED DEFAULT NULL,
  `date_format_id` int(10) UNSIGNED DEFAULT NULL,
  `datetime_format_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_date` timestamp NULL DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `email_footer` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `is_beta` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_access_token` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_refresh_token` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_publishable_key` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_data_raw` text COLLATE utf8_unicode_ci,
  `payment_gateway_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `first_name`, `last_name`, `email`, `timezone_id`, `date_format_id`, `datetime_format_id`, `currency_id`, `created_at`, `updated_at`, `deleted_at`, `name`, `last_ip`, `last_login_date`, `address1`, `address2`, `city`, `state`, `postal_code`, `country_id`, `email_footer`, `is_active`, `is_banned`, `is_beta`, `stripe_access_token`, `stripe_refresh_token`, `stripe_secret_key`, `stripe_publishable_key`, `stripe_data_raw`, `payment_gateway_id`) VALUES
(1, 'Andrew', 'Christensen', 'andrew@tildeworks.com', 5, 7, 6, 1, '2018-08-13 07:14:35', '2018-08-14 06:55:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `account_payment_gateways`
--

CREATE TABLE `account_payment_gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `payment_gateway_id` int(10) UNSIGNED NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account_payment_gateways`
--

INSERT INTO `account_payment_gateways` (`id`, `account_id`, `payment_gateway_id`, `config`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 1, 6, '{\"accountId\":\"100604294513\",\"secretKey\":\"ZKA7AHCHF1T75011DTUUR1RRYPO1DNWK\",\"token\":\"disregard\"}', NULL, '2018-08-13 07:35:30', '2018-08-18 04:30:54');

-- --------------------------------------------------------

--
-- Table structure for table `affiliates`
--

CREATE TABLE `affiliates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `visits` int(11) NOT NULL,
  `tickets_sold` int(11) NOT NULL,
  `sales_volume` decimal(10,2) NOT NULL DEFAULT '0.00',
  `last_visit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `account_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendees`
--

CREATE TABLE `attendees` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `private_reference_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `has_arrived` tinyint(1) NOT NULL DEFAULT '0',
  `arrival_time` datetime DEFAULT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `reference_index` int(11) NOT NULL DEFAULT '0',
  `is_refunded` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendees`
--

INSERT INTO `attendees` (`id`, `order_id`, `event_id`, `ticket_id`, `first_name`, `last_name`, `email`, `private_reference_number`, `created_at`, `updated_at`, `deleted_at`, `is_cancelled`, `has_arrived`, `arrival_time`, `account_id`, `reference_index`, `is_refunded`) VALUES
(1, 1, 2, 4, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', 622586275, '2018-08-13 08:31:21', '2018-08-13 08:31:21', NULL, 0, 0, NULL, 1, 1, 0),
(2, 2, 2, 4, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', 590410676, '2018-08-13 09:20:05', '2018-08-13 09:20:05', NULL, 0, 0, NULL, 1, 1, 0),
(3, 3, 2, 4, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', 700016396, '2018-08-14 06:57:02', '2018-08-14 06:57:02', NULL, 0, 0, NULL, 1, 1, 0),
(4, 4, 2, 4, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', 389397902, '2018-08-14 07:01:46', '2018-08-14 07:01:46', NULL, 0, 0, NULL, 1, 1, 0),
(5, 5, 2, 4, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', 860202913, '2018-08-14 07:03:14', '2018-08-14 07:03:14', NULL, 0, 0, NULL, 1, 1, 0),
(6, 6, 4, 8, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', 791632211, '2018-08-20 20:46:53', '2018-08-29 01:10:41', NULL, 0, 1, '2018-08-28 18:10:41', 1, 1, 0),
(7, 6, 4, 8, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', 115680054, '2018-08-20 20:46:53', '2018-08-29 01:10:40', NULL, 0, 1, '2018-08-28 18:10:40', 1, 2, 0),
(8, 6, 4, 8, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', 452338532, '2018-08-20 20:46:53', '2018-08-29 01:10:39', NULL, 0, 1, '2018-08-28 18:10:39', 1, 3, 0),
(9, 7, 4, 8, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', 266711530, '2018-08-20 21:11:42', '2018-09-06 11:28:01', NULL, 1, 1, '2018-08-28 18:10:36', 1, 1, 0),
(10, 8, 7, 11, 'Jenn', 'Kamp', 'jenn@dinecrg.com', 725761000, '2018-09-21 01:26:25', '2018-09-21 01:26:25', NULL, 0, 0, NULL, 1, 1, 0),
(11, 8, 7, 11, 'Samantha', 'Roy', 'samantha@dinecrg.com', 289197128, '2018-09-21 01:26:25', '2018-09-21 01:26:25', NULL, 0, 0, NULL, 1, 2, 0),
(12, 9, 6, 10, 'Andrew', 'Christensen', 'andrew@tildeworks.com', 270304149, '2018-09-30 07:32:42', '2018-09-30 07:32:42', NULL, 0, 0, NULL, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `capital` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `citizenship` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_sub_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso_3166_2` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `iso_3166_3` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `region_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sub_region_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `eea` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `capital`, `citizenship`, `country_code`, `currency`, `currency_code`, `currency_sub_unit`, `full_name`, `iso_3166_2`, `iso_3166_3`, `name`, `region_code`, `sub_region_code`, `eea`) VALUES
(4, 'Kabul', 'Afghan', '004', 'afghani', 'AFN', 'pul', 'Islamic Republic of Afghanistan', 'AF', 'AFG', 'Afghanistan', '142', '034', 0),
(8, 'Tirana', 'Albanian', '008', 'lek', 'ALL', '(qindar (pl. qindarka))', 'Republic of Albania', 'AL', 'ALB', 'Albania', '150', '039', 0),
(10, 'Antartica', 'of Antartica', '010', '', '', '', 'Antarctica', 'AQ', 'ATA', 'Antarctica', '', '', 0),
(12, 'Algiers', 'Algerian', '012', 'Algerian dinar', 'DZD', 'centime', 'People’s Democratic Republic of Algeria', 'DZ', 'DZA', 'Algeria', '002', '015', 0),
(16, 'Pago Pago', 'American Samoan', '016', 'US dollar', 'USD', 'cent', 'Territory of American', 'AS', 'ASM', 'American Samoa', '009', '061', 0),
(20, 'Andorra la Vella', 'Andorran', '020', 'euro', 'EUR', 'cent', 'Principality of Andorra', 'AD', 'AND', 'Andorra', '150', '039', 0),
(24, 'Luanda', 'Angolan', '024', 'kwanza', 'AOA', 'cêntimo', 'Republic of Angola', 'AO', 'AGO', 'Angola', '002', '017', 0),
(28, 'St John’s', 'of Antigua and Barbuda', '028', 'East Caribbean dollar', 'XCD', 'cent', 'Antigua and Barbuda', 'AG', 'ATG', 'Antigua and Barbuda', '019', '029', 0),
(31, 'Baku', 'Azerbaijani', '031', 'Azerbaijani manat', 'AZN', 'kepik (inv.)', 'Republic of Azerbaijan', 'AZ', 'AZE', 'Azerbaijan', '142', '145', 0),
(32, 'Buenos Aires', 'Argentinian', '032', 'Argentine peso', 'ARS', 'centavo', 'Argentine Republic', 'AR', 'ARG', 'Argentina', '019', '005', 0),
(36, 'Canberra', 'Australian', '036', 'Australian dollar', 'AUD', 'cent', 'Commonwealth of Australia', 'AU', 'AUS', 'Australia', '009', '053', 0),
(40, 'Vienna', 'Austrian', '040', 'euro', 'EUR', 'cent', 'Republic of Austria', 'AT', 'AUT', 'Austria', '150', '155', 1),
(44, 'Nassau', 'Bahamian', '044', 'Bahamian dollar', 'BSD', 'cent', 'Commonwealth of the Bahamas', 'BS', 'BHS', 'Bahamas', '019', '029', 0),
(48, 'Manama', 'Bahraini', '048', 'Bahraini dinar', 'BHD', 'fils (inv.)', 'Kingdom of Bahrain', 'BH', 'BHR', 'Bahrain', '142', '145', 0),
(50, 'Dhaka', 'Bangladeshi', '050', 'taka (inv.)', 'BDT', 'poisha (inv.)', 'People’s Republic of Bangladesh', 'BD', 'BGD', 'Bangladesh', '142', '034', 0),
(51, 'Yerevan', 'Armenian', '051', 'dram (inv.)', 'AMD', 'luma', 'Republic of Armenia', 'AM', 'ARM', 'Armenia', '142', '145', 0),
(52, 'Bridgetown', 'Barbadian', '052', 'Barbados dollar', 'BBD', 'cent', 'Barbados', 'BB', 'BRB', 'Barbados', '019', '029', 0),
(56, 'Brussels', 'Belgian', '056', 'euro', 'EUR', 'cent', 'Kingdom of Belgium', 'BE', 'BEL', 'Belgium', '150', '155', 1),
(60, 'Hamilton', 'Bermudian', '060', 'Bermuda dollar', 'BMD', 'cent', 'Bermuda', 'BM', 'BMU', 'Bermuda', '019', '021', 0),
(64, 'Thimphu', 'Bhutanese', '064', 'ngultrum (inv.)', 'BTN', 'chhetrum (inv.)', 'Kingdom of Bhutan', 'BT', 'BTN', 'Bhutan', '142', '034', 0),
(68, 'Sucre (BO1)', 'Bolivian', '068', 'boliviano', 'BOB', 'centavo', 'Plurinational State of Bolivia', 'BO', 'BOL', 'Bolivia, Plurinational State of', '019', '005', 0),
(70, 'Sarajevo', 'of Bosnia and Herzegovina', '070', 'convertible mark', 'BAM', 'fening', 'Bosnia and Herzegovina', 'BA', 'BIH', 'Bosnia and Herzegovina', '150', '039', 0),
(72, 'Gaborone', 'Botswanan', '072', 'pula (inv.)', 'BWP', 'thebe (inv.)', 'Republic of Botswana', 'BW', 'BWA', 'Botswana', '002', '018', 0),
(74, 'Bouvet island', 'of Bouvet island', '074', '', '', '', 'Bouvet Island', 'BV', 'BVT', 'Bouvet Island', '', '', 0),
(76, 'Brasilia', 'Brazilian', '076', 'real (pl. reais)', 'BRL', 'centavo', 'Federative Republic of Brazil', 'BR', 'BRA', 'Brazil', '019', '005', 0),
(84, 'Belmopan', 'Belizean', '084', 'Belize dollar', 'BZD', 'cent', 'Belize', 'BZ', 'BLZ', 'Belize', '019', '013', 0),
(86, 'Diego Garcia', 'Changosian', '086', 'US dollar', 'USD', 'cent', 'British Indian Ocean Territory', 'IO', 'IOT', 'British Indian Ocean Territory', '', '', 0),
(90, 'Honiara', 'Solomon Islander', '090', 'Solomon Islands dollar', 'SBD', 'cent', 'Solomon Islands', 'SB', 'SLB', 'Solomon Islands', '009', '054', 0),
(92, 'Road Town', 'British Virgin Islander;', '092', 'US dollar', 'USD', 'cent', 'British Virgin Islands', 'VG', 'VGB', 'Virgin Islands, British', '019', '029', 0),
(96, 'Bandar Seri Begawan', 'Bruneian', '096', 'Brunei dollar', 'BND', 'sen (inv.)', 'Brunei Darussalam', 'BN', 'BRN', 'Brunei Darussalam', '142', '035', 0),
(100, 'Sofia', 'Bulgarian', '100', 'lev (pl. leva)', 'BGN', 'stotinka', 'Republic of Bulgaria', 'BG', 'BGR', 'Bulgaria', '150', '151', 1),
(104, 'Yangon', 'Burmese', '104', 'kyat', 'MMK', 'pya', 'Union of Myanmar/', 'MM', 'MMR', 'Myanmar', '142', '035', 0),
(108, 'Bujumbura', 'Burundian', '108', 'Burundi franc', 'BIF', 'centime', 'Republic of Burundi', 'BI', 'BDI', 'Burundi', '002', '014', 0),
(112, 'Minsk', 'Belarusian', '112', 'Belarusian rouble', 'BYR', 'kopek', 'Republic of Belarus', 'BY', 'BLR', 'Belarus', '150', '151', 0),
(116, 'Phnom Penh', 'Cambodian', '116', 'riel', 'KHR', 'sen (inv.)', 'Kingdom of Cambodia', 'KH', 'KHM', 'Cambodia', '142', '035', 0),
(120, 'Yaoundé', 'Cameroonian', '120', 'CFA franc (BEAC)', 'XAF', 'centime', 'Republic of Cameroon', 'CM', 'CMR', 'Cameroon', '002', '017', 0),
(124, 'Ottawa', 'Canadian', '124', 'Canadian dollar', 'CAD', 'cent', 'Canada', 'CA', 'CAN', 'Canada', '019', '021', 0),
(132, 'Praia', 'Cape Verdean', '132', 'Cape Verde escudo', 'CVE', 'centavo', 'Republic of Cape Verde', 'CV', 'CPV', 'Cape Verde', '002', '011', 0),
(136, 'George Town', 'Caymanian', '136', 'Cayman Islands dollar', 'KYD', 'cent', 'Cayman Islands', 'KY', 'CYM', 'Cayman Islands', '019', '029', 0),
(140, 'Bangui', 'Central African', '140', 'CFA franc (BEAC)', 'XAF', 'centime', 'Central African Republic', 'CF', 'CAF', 'Central African Republic', '002', '017', 0),
(144, 'Colombo', 'Sri Lankan', '144', 'Sri Lankan rupee', 'LKR', 'cent', 'Democratic Socialist Republic of Sri Lanka', 'LK', 'LKA', 'Sri Lanka', '142', '034', 0),
(148, 'N’Djamena', 'Chadian', '148', 'CFA franc (BEAC)', 'XAF', 'centime', 'Republic of Chad', 'TD', 'TCD', 'Chad', '002', '017', 0),
(152, 'Santiago', 'Chilean', '152', 'Chilean peso', 'CLP', 'centavo', 'Republic of Chile', 'CL', 'CHL', 'Chile', '019', '005', 0),
(156, 'Beijing', 'Chinese', '156', 'renminbi-yuan (inv.)', 'CNY', 'jiao (10)', 'People’s Republic of China', 'CN', 'CHN', 'China', '142', '030', 0),
(158, 'Taipei', 'Taiwanese', '158', 'new Taiwan dollar', 'TWD', 'fen (inv.)', 'Republic of China, Taiwan (TW1)', 'TW', 'TWN', 'Taiwan, Province of China', '142', '030', 0),
(162, 'Flying Fish Cove', 'Christmas Islander', '162', 'Australian dollar', 'AUD', 'cent', 'Christmas Island Territory', 'CX', 'CXR', 'Christmas Island', '', '', 0),
(166, 'Bantam', 'Cocos Islander', '166', 'Australian dollar', 'AUD', 'cent', 'Territory of Cocos (Keeling) Islands', 'CC', 'CCK', 'Cocos (Keeling) Islands', '', '', 0),
(170, 'Santa Fe de Bogotá', 'Colombian', '170', 'Colombian peso', 'COP', 'centavo', 'Republic of Colombia', 'CO', 'COL', 'Colombia', '019', '005', 0),
(174, 'Moroni', 'Comorian', '174', 'Comorian franc', 'KMF', '', 'Union of the Comoros', 'KM', 'COM', 'Comoros', '002', '014', 0),
(175, 'Mamoudzou', 'Mahorais', '175', 'euro', 'EUR', 'cent', 'Departmental Collectivity of Mayotte', 'YT', 'MYT', 'Mayotte', '002', '014', 0),
(178, 'Brazzaville', 'Congolese', '178', 'CFA franc (BEAC)', 'XAF', 'centime', 'Republic of the Congo', 'CG', 'COG', 'Congo', '002', '017', 0),
(180, 'Kinshasa', 'Congolese', '180', 'Congolese franc', 'CDF', 'centime', 'Democratic Republic of the Congo', 'CD', 'COD', 'Congo, the Democratic Republic of the', '002', '017', 0),
(184, 'Avarua', 'Cook Islander', '184', 'New Zealand dollar', 'NZD', 'cent', 'Cook Islands', 'CK', 'COK', 'Cook Islands', '009', '061', 0),
(188, 'San José', 'Costa Rican', '188', 'Costa Rican colón (pl. colones)', 'CRC', 'céntimo', 'Republic of Costa Rica', 'CR', 'CRI', 'Costa Rica', '019', '013', 0),
(191, 'Zagreb', 'Croatian', '191', 'kuna (inv.)', 'HRK', 'lipa (inv.)', 'Republic of Croatia', 'HR', 'HRV', 'Croatia', '150', '039', 1),
(192, 'Havana', 'Cuban', '192', 'Cuban peso', 'CUP', 'centavo', 'Republic of Cuba', 'CU', 'CUB', 'Cuba', '019', '029', 0),
(196, 'Nicosia', 'Cypriot', '196', 'euro', 'EUR', 'cent', 'Republic of Cyprus', 'CY', 'CYP', 'Cyprus', '142', '145', 1),
(203, 'Prague', 'Czech', '203', 'Czech koruna (pl. koruny)', 'CZK', 'halér', 'Czech Republic', 'CZ', 'CZE', 'Czech Republic', '150', '151', 1),
(204, 'Porto Novo (BJ1)', 'Beninese', '204', 'CFA franc (BCEAO)', 'XOF', 'centime', 'Republic of Benin', 'BJ', 'BEN', 'Benin', '002', '011', 0),
(208, 'Copenhagen', 'Danish', '208', 'Danish krone', 'DKK', 'øre (inv.)', 'Kingdom of Denmark', 'DK', 'DNK', 'Denmark', '150', '154', 1),
(212, 'Roseau', 'Dominican', '212', 'East Caribbean dollar', 'XCD', 'cent', 'Commonwealth of Dominica', 'DM', 'DMA', 'Dominica', '019', '029', 0),
(214, 'Santo Domingo', 'Dominican', '214', 'Dominican peso', 'DOP', 'centavo', 'Dominican Republic', 'DO', 'DOM', 'Dominican Republic', '019', '029', 0),
(218, 'Quito', 'Ecuadorian', '218', 'US dollar', 'USD', 'cent', 'Republic of Ecuador', 'EC', 'ECU', 'Ecuador', '019', '005', 0),
(222, 'San Salvador', 'Salvadoran', '222', 'Salvadorian colón (pl. colones)', 'SVC', 'centavo', 'Republic of El Salvador', 'SV', 'SLV', 'El Salvador', '019', '013', 0),
(226, 'Malabo', 'Equatorial Guinean', '226', 'CFA franc (BEAC)', 'XAF', 'centime', 'Republic of Equatorial Guinea', 'GQ', 'GNQ', 'Equatorial Guinea', '002', '017', 0),
(231, 'Addis Ababa', 'Ethiopian', '231', 'birr (inv.)', 'ETB', 'cent', 'Federal Democratic Republic of Ethiopia', 'ET', 'ETH', 'Ethiopia', '002', '014', 0),
(232, 'Asmara', 'Eritrean', '232', 'nakfa', 'ERN', 'cent', 'State of Eritrea', 'ER', 'ERI', 'Eritrea', '002', '014', 0),
(233, 'Tallinn', 'Estonian', '233', 'euro', 'EUR', 'cent', 'Republic of Estonia', 'EE', 'EST', 'Estonia', '150', '154', 1),
(234, 'Tórshavn', 'Faeroese', '234', 'Danish krone', 'DKK', 'øre (inv.)', 'Faeroe Islands', 'FO', 'FRO', 'Faroe Islands', '150', '154', 0),
(238, 'Stanley', 'Falkland Islander', '238', 'Falkland Islands pound', 'FKP', 'new penny', 'Falkland Islands', 'FK', 'FLK', 'Falkland Islands (Malvinas)', '019', '005', 0),
(239, 'King Edward Point (Grytviken)', 'of South Georgia and the South Sandwich Islands', '239', '', '', '', 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 'South Georgia and the South Sandwich Islands', '', '', 0),
(242, 'Suva', 'Fijian', '242', 'Fiji dollar', 'FJD', 'cent', 'Republic of Fiji', 'FJ', 'FJI', 'Fiji', '009', '054', 0),
(246, 'Helsinki', 'Finnish', '246', 'euro', 'EUR', 'cent', 'Republic of Finland', 'FI', 'FIN', 'Finland', '150', '154', 1),
(248, 'Mariehamn', 'Åland Islander', '248', 'euro', 'EUR', 'cent', 'Åland Islands', 'AX', 'ALA', 'Åland Islands', '150', '154', 0),
(250, 'Paris', 'French', '250', 'euro', 'EUR', 'cent', 'French Republic', 'FR', 'FRA', 'France', '150', '155', 1),
(254, 'Cayenne', 'Guianese', '254', 'euro', 'EUR', 'cent', 'French Guiana', 'GF', 'GUF', 'French Guiana', '019', '005', 0),
(258, 'Papeete', 'Polynesian', '258', 'CFP franc', 'XPF', 'centime', 'French Polynesia', 'PF', 'PYF', 'French Polynesia', '009', '061', 0),
(260, 'Port-aux-Francais', 'of French Southern and Antarctic Lands', '260', 'euro', 'EUR', 'cent', 'French Southern and Antarctic Lands', 'TF', 'ATF', 'French Southern Territories', '', '', 0),
(262, 'Djibouti', 'Djiboutian', '262', 'Djibouti franc', 'DJF', '', 'Republic of Djibouti', 'DJ', 'DJI', 'Djibouti', '002', '014', 0),
(266, 'Libreville', 'Gabonese', '266', 'CFA franc (BEAC)', 'XAF', 'centime', 'Gabonese Republic', 'GA', 'GAB', 'Gabon', '002', '017', 0),
(268, 'Tbilisi', 'Georgian', '268', 'lari', 'GEL', 'tetri (inv.)', 'Georgia', 'GE', 'GEO', 'Georgia', '142', '145', 0),
(270, 'Banjul', 'Gambian', '270', 'dalasi (inv.)', 'GMD', 'butut', 'Republic of the Gambia', 'GM', 'GMB', 'Gambia', '002', '011', 0),
(275, NULL, 'Palestinian', '275', NULL, NULL, NULL, NULL, 'PS', 'PSE', 'Palestinian Territory, Occupied', '142', '145', 0),
(276, 'Berlin', 'German', '276', 'euro', 'EUR', 'cent', 'Federal Republic of Germany', 'DE', 'DEU', 'Germany', '150', '155', 1),
(288, 'Accra', 'Ghanaian', '288', 'Ghana cedi', 'GHS', 'pesewa', 'Republic of Ghana', 'GH', 'GHA', 'Ghana', '002', '011', 0),
(292, 'Gibraltar', 'Gibraltarian', '292', 'Gibraltar pound', 'GIP', 'penny', 'Gibraltar', 'GI', 'GIB', 'Gibraltar', '150', '039', 0),
(296, 'Tarawa', 'Kiribatian', '296', 'Australian dollar', 'AUD', 'cent', 'Republic of Kiribati', 'KI', 'KIR', 'Kiribati', '009', '057', 0),
(300, 'Athens', 'Greek', '300', 'euro', 'EUR', 'cent', 'Hellenic Republic', 'GR', 'GRC', 'Greece', '150', '039', 1),
(304, 'Nuuk', 'Greenlander', '304', 'Danish krone', 'DKK', 'øre (inv.)', 'Greenland', 'GL', 'GRL', 'Greenland', '019', '021', 0),
(308, 'St George’s', 'Grenadian', '308', 'East Caribbean dollar', 'XCD', 'cent', 'Grenada', 'GD', 'GRD', 'Grenada', '019', '029', 0),
(312, 'Basse Terre', 'Guadeloupean', '312', 'euro', 'EUR ', 'cent', 'Guadeloupe', 'GP', 'GLP', 'Guadeloupe', '019', '029', 0),
(316, 'Agaña (Hagåtña)', 'Guamanian', '316', 'US dollar', 'USD', 'cent', 'Territory of Guam', 'GU', 'GUM', 'Guam', '009', '057', 0),
(320, 'Guatemala City', 'Guatemalan', '320', 'quetzal (pl. quetzales)', 'GTQ', 'centavo', 'Republic of Guatemala', 'GT', 'GTM', 'Guatemala', '019', '013', 0),
(324, 'Conakry', 'Guinean', '324', 'Guinean franc', 'GNF', '', 'Republic of Guinea', 'GN', 'GIN', 'Guinea', '002', '011', 0),
(328, 'Georgetown', 'Guyanese', '328', 'Guyana dollar', 'GYD', 'cent', 'Cooperative Republic of Guyana', 'GY', 'GUY', 'Guyana', '019', '005', 0),
(332, 'Port-au-Prince', 'Haitian', '332', 'gourde', 'HTG', 'centime', 'Republic of Haiti', 'HT', 'HTI', 'Haiti', '019', '029', 0),
(334, 'Territory of Heard Island and McDonald Islands', 'of Territory of Heard Island and McDonald Islands', '334', '', '', '', 'Territory of Heard Island and McDonald Islands', 'HM', 'HMD', 'Heard Island and McDonald Islands', '', '', 0),
(336, 'Vatican City', 'of the Holy See/of the Vatican', '336', 'euro', 'EUR', 'cent', 'the Holy See/ Vatican City State', 'VA', 'VAT', 'Holy See (Vatican City State)', '150', '039', 0),
(340, 'Tegucigalpa', 'Honduran', '340', 'lempira', 'HNL', 'centavo', 'Republic of Honduras', 'HN', 'HND', 'Honduras', '019', '013', 0),
(344, '(HK3)', 'Hong Kong Chinese', '344', 'Hong Kong dollar', 'HKD', 'cent', 'Hong Kong Special Administrative Region of the People’s Republic of China (HK2)', 'HK', 'HKG', 'Hong Kong', '142', '030', 0),
(348, 'Budapest', 'Hungarian', '348', 'forint (inv.)', 'HUF', '(fillér (inv.))', 'Republic of Hungary', 'HU', 'HUN', 'Hungary', '150', '151', 1),
(352, 'Reykjavik', 'Icelander', '352', 'króna (pl. krónur)', 'ISK', '', 'Republic of Iceland', 'IS', 'ISL', 'Iceland', '150', '154', 1),
(356, 'New Delhi', 'Indian', '356', 'Indian rupee', 'INR', 'paisa', 'Republic of India', 'IN', 'IND', 'India', '142', '034', 0),
(360, 'Jakarta', 'Indonesian', '360', 'Indonesian rupiah (inv.)', 'IDR', 'sen (inv.)', 'Republic of Indonesia', 'ID', 'IDN', 'Indonesia', '142', '035', 0),
(364, 'Tehran', 'Iranian', '364', 'Iranian rial', 'IRR', '(dinar) (IR1)', 'Islamic Republic of Iran', 'IR', 'IRN', 'Iran, Islamic Republic of', '142', '034', 0),
(368, 'Baghdad', 'Iraqi', '368', 'Iraqi dinar', 'IQD', 'fils (inv.)', 'Republic of Iraq', 'IQ', 'IRQ', 'Iraq', '142', '145', 0),
(372, 'Dublin', 'Irish', '372', 'euro', 'EUR', 'cent', 'Ireland (IE1)', 'IE', 'IRL', 'Ireland', '150', '154', 1),
(376, '(IL1)', 'Israeli', '376', 'shekel', 'ILS', 'agora', 'State of Israel', 'IL', 'ISR', 'Israel', '142', '145', 0),
(380, 'Rome', 'Italian', '380', 'euro', 'EUR', 'cent', 'Italian Republic', 'IT', 'ITA', 'Italy', '150', '039', 1),
(384, 'Yamoussoukro (CI1)', 'Ivorian', '384', 'CFA franc (BCEAO)', 'XOF', 'centime', 'Republic of Côte d’Ivoire', 'CI', 'CIV', 'Côte d\'Ivoire', '002', '011', 0),
(388, 'Kingston', 'Jamaican', '388', 'Jamaica dollar', 'JMD', 'cent', 'Jamaica', 'JM', 'JAM', 'Jamaica', '019', '029', 0),
(392, 'Tokyo', 'Japanese', '392', 'yen (inv.)', 'JPY', '(sen (inv.)) (JP1)', 'Japan', 'JP', 'JPN', 'Japan', '142', '030', 0),
(398, 'Astana', 'Kazakh', '398', 'tenge (inv.)', 'KZT', 'tiyn', 'Republic of Kazakhstan', 'KZ', 'KAZ', 'Kazakhstan', '142', '143', 0),
(400, 'Amman', 'Jordanian', '400', 'Jordanian dinar', 'JOD', '100 qirsh', 'Hashemite Kingdom of Jordan', 'JO', 'JOR', 'Jordan', '142', '145', 0),
(404, 'Nairobi', 'Kenyan', '404', 'Kenyan shilling', 'KES', 'cent', 'Republic of Kenya', 'KE', 'KEN', 'Kenya', '002', '014', 0),
(408, 'Pyongyang', 'North Korean', '408', 'North Korean won (inv.)', 'KPW', 'chun (inv.)', 'Democratic People’s Republic of Korea', 'KP', 'PRK', 'Korea, Democratic People\'s Republic of', '142', '030', 0),
(410, 'Seoul', 'South Korean', '410', 'South Korean won (inv.)', 'KRW', '(chun (inv.))', 'Republic of Korea', 'KR', 'KOR', 'Korea, Republic of', '142', '030', 0),
(414, 'Kuwait City', 'Kuwaiti', '414', 'Kuwaiti dinar', 'KWD', 'fils (inv.)', 'State of Kuwait', 'KW', 'KWT', 'Kuwait', '142', '145', 0),
(417, 'Bishkek', 'Kyrgyz', '417', 'som', 'KGS', 'tyiyn', 'Kyrgyz Republic', 'KG', 'KGZ', 'Kyrgyzstan', '142', '143', 0),
(418, 'Vientiane', 'Lao', '418', 'kip (inv.)', 'LAK', '(at (inv.))', 'Lao People’s Democratic Republic', 'LA', 'LAO', 'Lao People\'s Democratic Republic', '142', '035', 0),
(422, 'Beirut', 'Lebanese', '422', 'Lebanese pound', 'LBP', '(piastre)', 'Lebanese Republic', 'LB', 'LBN', 'Lebanon', '142', '145', 0),
(426, 'Maseru', 'Basotho', '426', 'loti (pl. maloti)', 'LSL', 'sente', 'Kingdom of Lesotho', 'LS', 'LSO', 'Lesotho', '002', '018', 0),
(428, 'Riga', 'Latvian', '428', 'euro', 'EUR', 'cent', 'Republic of Latvia', 'LV', 'LVA', 'Latvia', '150', '154', 1),
(430, 'Monrovia', 'Liberian', '430', 'Liberian dollar', 'LRD', 'cent', 'Republic of Liberia', 'LR', 'LBR', 'Liberia', '002', '011', 0),
(434, 'Tripoli', 'Libyan', '434', 'Libyan dinar', 'LYD', 'dirham', 'Socialist People’s Libyan Arab Jamahiriya', 'LY', 'LBY', 'Libya', '002', '015', 0),
(438, 'Vaduz', 'Liechtensteiner', '438', 'Swiss franc', 'CHF', 'centime', 'Principality of Liechtenstein', 'LI', 'LIE', 'Liechtenstein', '150', '155', 1),
(440, 'Vilnius', 'Lithuanian', '440', 'euro', 'EUR', 'cent', 'Republic of Lithuania', 'LT', 'LTU', 'Lithuania', '150', '154', 1),
(442, 'Luxembourg', 'Luxembourger', '442', 'euro', 'EUR', 'cent', 'Grand Duchy of Luxembourg', 'LU', 'LUX', 'Luxembourg', '150', '155', 1),
(446, 'Macao (MO3)', 'Macanese', '446', 'pataca', 'MOP', 'avo', 'Macao Special Administrative Region of the People’s Republic of China (MO2)', 'MO', 'MAC', 'Macao', '142', '030', 0),
(450, 'Antananarivo', 'Malagasy', '450', 'ariary', 'MGA', 'iraimbilanja (inv.)', 'Republic of Madagascar', 'MG', 'MDG', 'Madagascar', '002', '014', 0),
(454, 'Lilongwe', 'Malawian', '454', 'Malawian kwacha (inv.)', 'MWK', 'tambala (inv.)', 'Republic of Malawi', 'MW', 'MWI', 'Malawi', '002', '014', 0),
(458, 'Kuala Lumpur (MY1)', 'Malaysian', '458', 'ringgit (inv.)', 'MYR', 'sen (inv.)', 'Malaysia', 'MY', 'MYS', 'Malaysia', '142', '035', 0),
(462, 'Malé', 'Maldivian', '462', 'rufiyaa', 'MVR', 'laari (inv.)', 'Republic of Maldives', 'MV', 'MDV', 'Maldives', '142', '034', 0),
(466, 'Bamako', 'Malian', '466', 'CFA franc (BCEAO)', 'XOF', 'centime', 'Republic of Mali', 'ML', 'MLI', 'Mali', '002', '011', 0),
(470, 'Valletta', 'Maltese', '470', 'euro', 'EUR', 'cent', 'Republic of Malta', 'MT', 'MLT', 'Malta', '150', '039', 1),
(474, 'Fort-de-France', 'Martinican', '474', 'euro', 'EUR', 'cent', 'Martinique', 'MQ', 'MTQ', 'Martinique', '019', '029', 0),
(478, 'Nouakchott', 'Mauritanian', '478', 'ouguiya', 'MRO', 'khoum', 'Islamic Republic of Mauritania', 'MR', 'MRT', 'Mauritania', '002', '011', 0),
(480, 'Port Louis', 'Mauritian', '480', 'Mauritian rupee', 'MUR', 'cent', 'Republic of Mauritius', 'MU', 'MUS', 'Mauritius', '002', '014', 0),
(484, 'Mexico City', 'Mexican', '484', 'Mexican peso', 'MXN', 'centavo', 'United Mexican States', 'MX', 'MEX', 'Mexico', '019', '013', 0),
(492, 'Monaco', 'Monegasque', '492', 'euro', 'EUR', 'cent', 'Principality of Monaco', 'MC', 'MCO', 'Monaco', '150', '155', 0),
(496, 'Ulan Bator', 'Mongolian', '496', 'tugrik', 'MNT', 'möngö (inv.)', 'Mongolia', 'MN', 'MNG', 'Mongolia', '142', '030', 0),
(498, 'Chisinau', 'Moldovan', '498', 'Moldovan leu (pl. lei)', 'MDL', 'ban', 'Republic of Moldova', 'MD', 'MDA', 'Moldova, Republic of', '150', '151', 0),
(499, 'Podgorica', 'Montenegrin', '499', 'euro', 'EUR', 'cent', 'Montenegro', 'ME', 'MNE', 'Montenegro', '150', '039', 0),
(500, 'Plymouth (MS2)', 'Montserratian', '500', 'East Caribbean dollar', 'XCD', 'cent', 'Montserrat', 'MS', 'MSR', 'Montserrat', '019', '029', 0),
(504, 'Rabat', 'Moroccan', '504', 'Moroccan dirham', 'MAD', 'centime', 'Kingdom of Morocco', 'MA', 'MAR', 'Morocco', '002', '015', 0),
(508, 'Maputo', 'Mozambican', '508', 'metical', 'MZN', 'centavo', 'Republic of Mozambique', 'MZ', 'MOZ', 'Mozambique', '002', '014', 0),
(512, 'Muscat', 'Omani', '512', 'Omani rial', 'OMR', 'baiza', 'Sultanate of Oman', 'OM', 'OMN', 'Oman', '142', '145', 0),
(516, 'Windhoek', 'Namibian', '516', 'Namibian dollar', 'NAD', 'cent', 'Republic of Namibia', 'NA', 'NAM', 'Namibia', '002', '018', 0),
(520, 'Yaren', 'Nauruan', '520', 'Australian dollar', 'AUD', 'cent', 'Republic of Nauru', 'NR', 'NRU', 'Nauru', '009', '057', 0),
(524, 'Kathmandu', 'Nepalese', '524', 'Nepalese rupee', 'NPR', 'paisa (inv.)', 'Nepal', 'NP', 'NPL', 'Nepal', '142', '034', 0),
(528, 'Amsterdam (NL2)', 'Dutch', '528', 'euro', 'EUR', 'cent', 'Kingdom of the Netherlands', 'NL', 'NLD', 'Netherlands', '150', '155', 1),
(531, 'Willemstad', 'Curaçaoan', '531', 'Netherlands Antillean guilder (CW1)', 'ANG', 'cent', 'Curaçao', 'CW', 'CUW', 'Curaçao', '019', '029', 0),
(533, 'Oranjestad', 'Aruban', '533', 'Aruban guilder', 'AWG', 'cent', 'Aruba', 'AW', 'ABW', 'Aruba', '019', '029', 0),
(534, 'Philipsburg', 'Sint Maartener', '534', 'Netherlands Antillean guilder (SX1)', 'ANG', 'cent', 'Sint Maarten', 'SX', 'SXM', 'Sint Maarten (Dutch part)', '019', '029', 0),
(535, NULL, 'of Bonaire, Sint Eustatius and Saba', '535', 'US dollar', 'USD', 'cent', NULL, 'BQ', 'BES', 'Bonaire, Sint Eustatius and Saba', '019', '029', 0),
(540, 'Nouméa', 'New Caledonian', '540', 'CFP franc', 'XPF', 'centime', 'New Caledonia', 'NC', 'NCL', 'New Caledonia', '009', '054', 0),
(548, 'Port Vila', 'Vanuatuan', '548', 'vatu (inv.)', 'VUV', '', 'Republic of Vanuatu', 'VU', 'VUT', 'Vanuatu', '009', '054', 0),
(554, 'Wellington', 'New Zealander', '554', 'New Zealand dollar', 'NZD', 'cent', 'New Zealand', 'NZ', 'NZL', 'New Zealand', '009', '053', 0),
(558, 'Managua', 'Nicaraguan', '558', 'córdoba oro', 'NIO', 'centavo', 'Republic of Nicaragua', 'NI', 'NIC', 'Nicaragua', '019', '013', 0),
(562, 'Niamey', 'Nigerien', '562', 'CFA franc (BCEAO)', 'XOF', 'centime', 'Republic of Niger', 'NE', 'NER', 'Niger', '002', '011', 0),
(566, 'Abuja', 'Nigerian', '566', 'naira (inv.)', 'NGN', 'kobo (inv.)', 'Federal Republic of Nigeria', 'NG', 'NGA', 'Nigeria', '002', '011', 0),
(570, 'Alofi', 'Niuean', '570', 'New Zealand dollar', 'NZD', 'cent', 'Niue', 'NU', 'NIU', 'Niue', '009', '061', 0),
(574, 'Kingston', 'Norfolk Islander', '574', 'Australian dollar', 'AUD', 'cent', 'Territory of Norfolk Island', 'NF', 'NFK', 'Norfolk Island', '009', '053', 0),
(578, 'Oslo', 'Norwegian', '578', 'Norwegian krone (pl. kroner)', 'NOK', 'øre (inv.)', 'Kingdom of Norway', 'NO', 'NOR', 'Norway', '150', '154', 1),
(580, 'Saipan', 'Northern Mariana Islander', '580', 'US dollar', 'USD', 'cent', 'Commonwealth of the Northern Mariana Islands', 'MP', 'MNP', 'Northern Mariana Islands', '009', '057', 0),
(581, 'United States Minor Outlying Islands', 'of United States Minor Outlying Islands', '581', 'US dollar', 'USD', 'cent', 'United States Minor Outlying Islands', 'UM', 'UMI', 'United States Minor Outlying Islands', '', '', 0),
(583, 'Palikir', 'Micronesian', '583', 'US dollar', 'USD', 'cent', 'Federated States of Micronesia', 'FM', 'FSM', 'Micronesia, Federated States of', '009', '057', 0),
(584, 'Majuro', 'Marshallese', '584', 'US dollar', 'USD', 'cent', 'Republic of the Marshall Islands', 'MH', 'MHL', 'Marshall Islands', '009', '057', 0),
(585, 'Melekeok', 'Palauan', '585', 'US dollar', 'USD', 'cent', 'Republic of Palau', 'PW', 'PLW', 'Palau', '009', '057', 0),
(586, 'Islamabad', 'Pakistani', '586', 'Pakistani rupee', 'PKR', 'paisa', 'Islamic Republic of Pakistan', 'PK', 'PAK', 'Pakistan', '142', '034', 0),
(591, 'Panama City', 'Panamanian', '591', 'balboa', 'PAB', 'centésimo', 'Republic of Panama', 'PA', 'PAN', 'Panama', '019', '013', 0),
(598, 'Port Moresby', 'Papua New Guinean', '598', 'kina (inv.)', 'PGK', 'toea (inv.)', 'Independent State of Papua New Guinea', 'PG', 'PNG', 'Papua New Guinea', '009', '054', 0),
(600, 'Asunción', 'Paraguayan', '600', 'guaraní', 'PYG', 'céntimo', 'Republic of Paraguay', 'PY', 'PRY', 'Paraguay', '019', '005', 0),
(604, 'Lima', 'Peruvian', '604', 'new sol', 'PEN', 'céntimo', 'Republic of Peru', 'PE', 'PER', 'Peru', '019', '005', 0),
(608, 'Manila', 'Filipino', '608', 'Philippine peso', 'PHP', 'centavo', 'Republic of the Philippines', 'PH', 'PHL', 'Philippines', '142', '035', 0),
(612, 'Adamstown', 'Pitcairner', '612', 'New Zealand dollar', 'NZD', 'cent', 'Pitcairn Islands', 'PN', 'PCN', 'Pitcairn', '009', '061', 0),
(616, 'Warsaw', 'Polish', '616', 'zloty', 'PLN', 'grosz (pl. groszy)', 'Republic of Poland', 'PL', 'POL', 'Poland', '150', '151', 1),
(620, 'Lisbon', 'Portuguese', '620', 'euro', 'EUR', 'cent', 'Portuguese Republic', 'PT', 'PRT', 'Portugal', '150', '039', 1),
(624, 'Bissau', 'Guinea-Bissau national', '624', 'CFA franc (BCEAO)', 'XOF', 'centime', 'Republic of Guinea-Bissau', 'GW', 'GNB', 'Guinea-Bissau', '002', '011', 0),
(626, 'Dili', 'East Timorese', '626', 'US dollar', 'USD', 'cent', 'Democratic Republic of East Timor', 'TL', 'TLS', 'Timor-Leste', '142', '035', 0),
(630, 'San Juan', 'Puerto Rican', '630', 'US dollar', 'USD', 'cent', 'Commonwealth of Puerto Rico', 'PR', 'PRI', 'Puerto Rico', '019', '029', 0),
(634, 'Doha', 'Qatari', '634', 'Qatari riyal', 'QAR', 'dirham', 'State of Qatar', 'QA', 'QAT', 'Qatar', '142', '145', 0),
(638, 'Saint-Denis', 'Reunionese', '638', 'euro', 'EUR', 'cent', 'Réunion', 'RE', 'REU', 'Réunion', '002', '014', 0),
(642, 'Bucharest', 'Romanian', '642', 'Romanian leu (pl. lei)', 'RON', 'ban (pl. bani)', 'Romania', 'RO', 'ROU', 'Romania', '150', '151', 1),
(643, 'Moscow', 'Russian', '643', 'Russian rouble', 'RUB', 'kopek', 'Russian Federation', 'RU', 'RUS', 'Russian Federation', '150', '151', 0),
(646, 'Kigali', 'Rwandan; Rwandese', '646', 'Rwandese franc', 'RWF', 'centime', 'Republic of Rwanda', 'RW', 'RWA', 'Rwanda', '002', '014', 0),
(652, 'Gustavia', 'of Saint Barthélemy', '652', 'euro', 'EUR', 'cent', 'Collectivity of Saint Barthélemy', 'BL', 'BLM', 'Saint Barthélemy', '019', '029', 0),
(654, 'Jamestown', 'Saint Helenian', '654', 'Saint Helena pound', 'SHP', 'penny', 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', 'Saint Helena, Ascension and Tristan da Cunha', '002', '011', 0),
(659, 'Basseterre', 'Kittsian; Nevisian', '659', 'East Caribbean dollar', 'XCD', 'cent', 'Federation of Saint Kitts and Nevis', 'KN', 'KNA', 'Saint Kitts and Nevis', '019', '029', 0),
(660, 'The Valley', 'Anguillan', '660', 'East Caribbean dollar', 'XCD', 'cent', 'Anguilla', 'AI', 'AIA', 'Anguilla', '019', '029', 0),
(662, 'Castries', 'Saint Lucian', '662', 'East Caribbean dollar', 'XCD', 'cent', 'Saint Lucia', 'LC', 'LCA', 'Saint Lucia', '019', '029', 0),
(663, 'Marigot', 'of Saint Martin', '663', 'euro', 'EUR', 'cent', 'Collectivity of Saint Martin', 'MF', 'MAF', 'Saint Martin (French part)', '019', '029', 0),
(666, 'Saint-Pierre', 'St-Pierrais; Miquelonnais', '666', 'euro', 'EUR', 'cent', 'Territorial Collectivity of Saint Pierre and Miquelon', 'PM', 'SPM', 'Saint Pierre and Miquelon', '019', '021', 0),
(670, 'Kingstown', 'Vincentian', '670', 'East Caribbean dollar', 'XCD', 'cent', 'Saint Vincent and the Grenadines', 'VC', 'VCT', 'Saint Vincent and the Grenadines', '019', '029', 0),
(674, 'San Marino', 'San Marinese', '674', 'euro', 'EUR ', 'cent', 'Republic of San Marino', 'SM', 'SMR', 'San Marino', '150', '039', 0),
(678, 'São Tomé', 'São Toméan', '678', 'dobra', 'STD', 'centavo', 'Democratic Republic of São Tomé and Príncipe', 'ST', 'STP', 'Sao Tome and Principe', '002', '017', 0),
(682, 'Riyadh', 'Saudi Arabian', '682', 'riyal', 'SAR', 'halala', 'Kingdom of Saudi Arabia', 'SA', 'SAU', 'Saudi Arabia', '142', '145', 0),
(686, 'Dakar', 'Senegalese', '686', 'CFA franc (BCEAO)', 'XOF', 'centime', 'Republic of Senegal', 'SN', 'SEN', 'Senegal', '002', '011', 0),
(688, 'Belgrade', 'Serb', '688', 'Serbian dinar', 'RSD', 'para (inv.)', 'Republic of Serbia', 'RS', 'SRB', 'Serbia', '150', '039', 0),
(690, 'Victoria', 'Seychellois', '690', 'Seychelles rupee', 'SCR', 'cent', 'Republic of Seychelles', 'SC', 'SYC', 'Seychelles', '002', '014', 0),
(694, 'Freetown', 'Sierra Leonean', '694', 'leone', 'SLL', 'cent', 'Republic of Sierra Leone', 'SL', 'SLE', 'Sierra Leone', '002', '011', 0),
(702, 'Singapore', 'Singaporean', '702', 'Singapore dollar', 'SGD', 'cent', 'Republic of Singapore', 'SG', 'SGP', 'Singapore', '142', '035', 0),
(703, 'Bratislava', 'Slovak', '703', 'euro', 'EUR', 'cent', 'Slovak Republic', 'SK', 'SVK', 'Slovakia', '150', '151', 1),
(704, 'Hanoi', 'Vietnamese', '704', 'dong', 'VND', '(10 hào', 'Socialist Republic of Vietnam', 'VN', 'VNM', 'Viet Nam', '142', '035', 0),
(705, 'Ljubljana', 'Slovene', '705', 'euro', 'EUR', 'cent', 'Republic of Slovenia', 'SI', 'SVN', 'Slovenia', '150', '039', 1),
(706, 'Mogadishu', 'Somali', '706', 'Somali shilling', 'SOS', 'cent', 'Somali Republic', 'SO', 'SOM', 'Somalia', '002', '014', 0),
(710, 'Pretoria (ZA1)', 'South African', '710', 'rand', 'ZAR', 'cent', 'Republic of South Africa', 'ZA', 'ZAF', 'South Africa', '002', '018', 0),
(716, 'Harare', 'Zimbabwean', '716', 'Zimbabwe dollar (ZW1)', 'ZWL', 'cent', 'Republic of Zimbabwe', 'ZW', 'ZWE', 'Zimbabwe', '002', '014', 0),
(724, 'Madrid', 'Spaniard', '724', 'euro', 'EUR', 'cent', 'Kingdom of Spain', 'ES', 'ESP', 'Spain', '150', '039', 1),
(728, 'Juba', 'South Sudanese', '728', 'South Sudanese pound', 'SSP', 'piaster', 'Republic of South Sudan', 'SS', 'SSD', 'South Sudan', '002', '015', 0),
(729, 'Khartoum', 'Sudanese', '729', 'Sudanese pound', 'SDG', 'piastre', 'Republic of the Sudan', 'SD', 'SDN', 'Sudan', '002', '015', 0),
(732, 'Al aaiun', 'Sahrawi', '732', 'Moroccan dirham', 'MAD', 'centime', 'Western Sahara', 'EH', 'ESH', 'Western Sahara', '002', '015', 0),
(740, 'Paramaribo', 'Surinamese', '740', 'Surinamese dollar', 'SRD', 'cent', 'Republic of Suriname', 'SR', 'SUR', 'Suriname', '019', '005', 0),
(744, 'Longyearbyen', 'of Svalbard', '744', 'Norwegian krone (pl. kroner)', 'NOK', 'øre (inv.)', 'Svalbard and Jan Mayen', 'SJ', 'SJM', 'Svalbard and Jan Mayen', '150', '154', 0),
(748, 'Mbabane', 'Swazi', '748', 'lilangeni', 'SZL', 'cent', 'Kingdom of Swaziland', 'SZ', 'SWZ', 'Swaziland', '002', '018', 0),
(752, 'Stockholm', 'Swedish', '752', 'krona (pl. kronor)', 'SEK', 'öre (inv.)', 'Kingdom of Sweden', 'SE', 'SWE', 'Sweden', '150', '154', 1),
(756, 'Berne', 'Swiss', '756', 'Swiss franc', 'CHF', 'centime', 'Swiss Confederation', 'CH', 'CHE', 'Switzerland', '150', '155', 1),
(760, 'Damascus', 'Syrian', '760', 'Syrian pound', 'SYP', 'piastre', 'Syrian Arab Republic', 'SY', 'SYR', 'Syrian Arab Republic', '142', '145', 0),
(762, 'Dushanbe', 'Tajik', '762', 'somoni', 'TJS', 'diram', 'Republic of Tajikistan', 'TJ', 'TJK', 'Tajikistan', '142', '143', 0),
(764, 'Bangkok', 'Thai', '764', 'baht (inv.)', 'THB', 'satang (inv.)', 'Kingdom of Thailand', 'TH', 'THA', 'Thailand', '142', '035', 0),
(768, 'Lomé', 'Togolese', '768', 'CFA franc (BCEAO)', 'XOF', 'centime', 'Togolese Republic', 'TG', 'TGO', 'Togo', '002', '011', 0),
(772, '(TK2)', 'Tokelauan', '772', 'New Zealand dollar', 'NZD', 'cent', 'Tokelau', 'TK', 'TKL', 'Tokelau', '009', '061', 0),
(776, 'Nuku’alofa', 'Tongan', '776', 'pa’anga (inv.)', 'TOP', 'seniti (inv.)', 'Kingdom of Tonga', 'TO', 'TON', 'Tonga', '009', '061', 0),
(780, 'Port of Spain', 'Trinidadian; Tobagonian', '780', 'Trinidad and Tobago dollar', 'TTD', 'cent', 'Republic of Trinidad and Tobago', 'TT', 'TTO', 'Trinidad and Tobago', '019', '029', 0),
(784, 'Abu Dhabi', 'Emirian', '784', 'UAE dirham', 'AED', 'fils (inv.)', 'United Arab Emirates', 'AE', 'ARE', 'United Arab Emirates', '142', '145', 0),
(788, 'Tunis', 'Tunisian', '788', 'Tunisian dinar', 'TND', 'millime', 'Republic of Tunisia', 'TN', 'TUN', 'Tunisia', '002', '015', 0),
(792, 'Ankara', 'Turk', '792', 'Turkish lira (inv.)', 'TRY', 'kurus (inv.)', 'Republic of Turkey', 'TR', 'TUR', 'Turkey', '142', '145', 0),
(795, 'Ashgabat', 'Turkmen', '795', 'Turkmen manat (inv.)', 'TMT', 'tenge (inv.)', 'Turkmenistan', 'TM', 'TKM', 'Turkmenistan', '142', '143', 0),
(796, 'Cockburn Town', 'Turks and Caicos Islander', '796', 'US dollar', 'USD', 'cent', 'Turks and Caicos Islands', 'TC', 'TCA', 'Turks and Caicos Islands', '019', '029', 0),
(798, 'Funafuti', 'Tuvaluan', '798', 'Australian dollar', 'AUD', 'cent', 'Tuvalu', 'TV', 'TUV', 'Tuvalu', '009', '061', 0),
(800, 'Kampala', 'Ugandan', '800', 'Uganda shilling', 'UGX', 'cent', 'Republic of Uganda', 'UG', 'UGA', 'Uganda', '002', '014', 0),
(804, 'Kiev', 'Ukrainian', '804', 'hryvnia', 'UAH', 'kopiyka', 'Ukraine', 'UA', 'UKR', 'Ukraine', '150', '151', 0),
(807, 'Skopje', 'of the former Yugoslav Republic of Macedonia', '807', 'denar (pl. denars)', 'MKD', 'deni (inv.)', 'the former Yugoslav Republic of Macedonia', 'MK', 'MKD', 'Macedonia, the former Yugoslav Republic of', '150', '039', 0),
(818, 'Cairo', 'Egyptian', '818', 'Egyptian pound', 'EGP', 'piastre', 'Arab Republic of Egypt', 'EG', 'EGY', 'Egypt', '002', '015', 0),
(826, 'London', 'British', '826', 'pound sterling', 'GBP', 'penny (pl. pence)', 'United Kingdom of Great Britain and Northern Ireland', 'GB', 'GBR', 'United Kingdom', '150', '154', 1),
(831, 'St Peter Port', 'of Guernsey', '831', 'Guernsey pound (GG2)', 'GGP (GG2)', 'penny (pl. pence)', 'Bailiwick of Guernsey', 'GG', 'GGY', 'Guernsey', '150', '154', 0),
(832, 'St Helier', 'of Jersey', '832', 'Jersey pound (JE2)', 'JEP (JE2)', 'penny (pl. pence)', 'Bailiwick of Jersey', 'JE', 'JEY', 'Jersey', '150', '154', 0),
(833, 'Douglas', 'Manxman; Manxwoman', '833', 'Manx pound (IM2)', 'IMP (IM2)', 'penny (pl. pence)', 'Isle of Man', 'IM', 'IMN', 'Isle of Man', '150', '154', 0),
(834, 'Dodoma (TZ1)', 'Tanzanian', '834', 'Tanzanian shilling', 'TZS', 'cent', 'United Republic of Tanzania', 'TZ', 'TZA', 'Tanzania, United Republic of', '002', '014', 0),
(840, 'Washington DC', 'American', '840', 'US dollar', 'USD', 'cent', 'United States of America', 'US', 'USA', 'United States', '019', '021', 0),
(850, 'Charlotte Amalie', 'US Virgin Islander', '850', 'US dollar', 'USD', 'cent', 'United States Virgin Islands', 'VI', 'VIR', 'Virgin Islands, U.S.', '019', '029', 0),
(854, 'Ouagadougou', 'Burkinabe', '854', 'CFA franc (BCEAO)', 'XOF', 'centime', 'Burkina Faso', 'BF', 'BFA', 'Burkina Faso', '002', '011', 0),
(858, 'Montevideo', 'Uruguayan', '858', 'Uruguayan peso', 'UYU', 'centésimo', 'Eastern Republic of Uruguay', 'UY', 'URY', 'Uruguay', '019', '005', 0),
(860, 'Tashkent', 'Uzbek', '860', 'sum (inv.)', 'UZS', 'tiyin (inv.)', 'Republic of Uzbekistan', 'UZ', 'UZB', 'Uzbekistan', '142', '143', 0),
(862, 'Caracas', 'Venezuelan', '862', 'bolívar fuerte (pl. bolívares fuertes)', 'VEF', 'céntimo', 'Bolivarian Republic of Venezuela', 'VE', 'VEN', 'Venezuela, Bolivarian Republic of', '019', '005', 0),
(876, 'Mata-Utu', 'Wallisian; Futunan; Wallis and Futuna Islander', '876', 'CFP franc', 'XPF', 'centime', 'Wallis and Futuna', 'WF', 'WLF', 'Wallis and Futuna', '009', '061', 0),
(882, 'Apia', 'Samoan', '882', 'tala (inv.)', 'WST', 'sene (inv.)', 'Independent State of Samoa', 'WS', 'WSM', 'Samoa', '009', '061', 0),
(887, 'San’a', 'Yemenite', '887', 'Yemeni rial', 'YER', 'fils (inv.)', 'Republic of Yemen', 'YE', 'YEM', 'Yemen', '142', '145', 0),
(894, 'Lusaka', 'Zambian', '894', 'Zambian kwacha (inv.)', 'ZMW', 'ngwee (inv.)', 'Republic of Zambia', 'ZM', 'ZMB', 'Zambia', '002', '014', 0);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol_left` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `symbol_right` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `decimal_place` int(11) NOT NULL,
  `value` double(15,8) NOT NULL,
  `decimal_point` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `thousand_point` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `title`, `symbol_left`, `symbol_right`, `code`, `decimal_place`, `value`, `decimal_point`, `thousand_point`, `status`, `created_at`, `updated_at`) VALUES
(1, 'U.S. Dollar', '$', '', 'USD', 2, 1.00000000, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(2, 'Euro', '€', '', 'EUR', 2, 0.74970001, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(3, 'Pound Sterling', '£', '', 'GBP', 2, 0.62220001, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(4, 'Australian Dollar', '$', '', 'AUD', 2, 0.94790000, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(5, 'Canadian Dollar', '$', '', 'CAD', 2, 0.98500001, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(6, 'Czech Koruna', '', 'Kč ', 'CZK', 2, 19.16900063, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(7, 'Danish Krone', 'kr ', '', 'DKK', 2, 5.59420013, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(8, 'Hong Kong Dollar', '$', '', 'HKD', 2, 7.75290012, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(9, 'Hungarian Forint', 'Ft ', '', 'HUF', 2, 221.27000427, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(10, 'Israeli New Sheqel', '?', '', 'ILS', 2, 3.73559999, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(11, 'Japanese Yen', '¥', '', 'JPY', 2, 88.76499939, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(12, 'Mexican Peso', '$', '', 'MXN', 2, 12.63899994, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(13, 'Norwegian Krone', 'kr ', '', 'NOK', 2, 5.52229977, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(14, 'New Zealand Dollar', '$', '', 'NZD', 2, 1.18970001, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(15, 'Philippine Peso', 'Php ', '', 'PHP', 2, 40.58000183, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(16, 'Polish Zloty', '', 'zł', 'PLN', 2, 3.08590007, ',', '.', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(17, 'Singapore Dollar', '$', '', 'SGD', 2, 1.22560000, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(18, 'Swedish Krona', 'kr ', '', 'SEK', 2, 6.45870018, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(19, 'Swiss Franc', 'CHF ', '', 'CHF', 2, 0.92259997, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(20, 'Taiwan New Dollar', 'NT$', '', 'TWD', 2, 28.95199966, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(21, 'Thai Baht', '฿', '', 'THB', 2, 30.09499931, '.', ',', 1, '2013-11-30 03:51:38', '2013-11-30 03:51:38'),
(22, 'Ukrainian hryvnia', '₴', '', 'UAH', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(23, 'Icelandic króna', 'kr ', '', 'ISK', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(24, 'Croatian kuna', 'kn ', '', 'HRK', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(25, 'Romanian leu', 'lei ', '', 'RON', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(26, 'Bulgarian lev', 'лв.', '', 'BGN', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(27, 'Turkish lira', '₺', '', 'TRY', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(28, 'Chilean peso', '$', '', 'CLP', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(29, 'South African rand', 'R', '', 'ZAR', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(30, 'Brazilian real', 'R$', '', 'BRL', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(31, 'Malaysian ringgit', 'RM ', '', 'MYR', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(32, 'Russian ruble', '₽', '', 'RUB', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(33, 'Indonesian rupiah', 'Rp ', '', 'IDR', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(34, 'Indian rupee', '₹', '', 'INR', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(35, 'Korean won', '₩', '', 'KRW', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30'),
(36, 'Renminbi', '¥', '', 'CNY', 2, 0.00000000, '.', ',', 1, '2015-07-23 06:25:30', '2015-07-23 06:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `datetime_formats`
--

CREATE TABLE `datetime_formats` (
  `id` int(10) UNSIGNED NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picker_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `datetime_formats`
--

INSERT INTO `datetime_formats` (`id`, `format`, `picker_format`, `label`) VALUES
(1, 'd/M/Y g:i a', '', '10/Mar/2016'),
(2, 'd-M-Y g:i a', '', '10-Mar-2016'),
(3, 'd/F/Y g:i a', '', '10/March/2016'),
(4, 'd-F-Y g:i a', '', '10-March-2016'),
(5, 'M j, Y g:i a', '', 'Mar 10, 2016 6:15 pm'),
(6, 'F j, Y g:i a', '', 'March 10, 2016 6:15 pm'),
(7, 'D M jS, Y g:ia', '', 'Mon March 10th, 2016 6:15 pm');

-- --------------------------------------------------------

--
-- Table structure for table `date_formats`
--

CREATE TABLE `date_formats` (
  `id` int(10) UNSIGNED NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picker_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `date_formats`
--

INSERT INTO `date_formats` (`id`, `format`, `picker_format`, `label`) VALUES
(1, 'd/M/Y', 'dd/M/yyyy', '10/Mar/2013'),
(2, 'd-M-Y', 'dd-M-yyyy', '10-Mar-2013'),
(3, 'd/F/Y', 'dd/MM/yyyy', '10/March/2013'),
(4, 'd-F-Y', 'dd-MM-yyyy', '10-March-2013'),
(5, 'M j, Y', 'M d, yyyy', 'Mar 10, 2013'),
(6, 'F j, Y', 'MM d, yyyy', 'March 10, 2013'),
(7, 'D M j, Y', 'D MM d, yyyy', 'Mon March 10, 2013');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bg_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'color',
  `bg_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#B23333',
  `bg_image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `on_sale_date` datetime DEFAULT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `sales_volume` decimal(13,2) NOT NULL DEFAULT '0.00',
  `organiser_fees_volume` decimal(13,2) NOT NULL DEFAULT '0.00',
  `organiser_fee_fixed` decimal(13,2) NOT NULL DEFAULT '0.00',
  `organiser_fee_percentage` decimal(4,3) NOT NULL DEFAULT '0.000',
  `organiser_id` int(10) UNSIGNED NOT NULL,
  `venue_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `venue_name_full` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_address` varchar(355) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_address_line_1` varchar(355) COLLATE utf8_unicode_ci NOT NULL,
  `location_address_line_2` varchar(355) COLLATE utf8_unicode_ci NOT NULL,
  `location_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_post_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_street_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_lat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_long` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_google_place_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_order_display_message` text COLLATE utf8_unicode_ci,
  `post_order_display_message` text COLLATE utf8_unicode_ci,
  `social_share_text` text COLLATE utf8_unicode_ci,
  `social_show_facebook` tinyint(1) NOT NULL DEFAULT '1',
  `social_show_linkedin` tinyint(1) NOT NULL DEFAULT '1',
  `social_show_twitter` tinyint(1) NOT NULL DEFAULT '1',
  `social_show_email` tinyint(1) NOT NULL DEFAULT '1',
  `social_show_googleplus` tinyint(1) NOT NULL DEFAULT '1',
  `location_is_manual` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_live` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `barcode_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'QRCODE',
  `ticket_border_color` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000000',
  `ticket_bg_color` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `ticket_text_color` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000000',
  `ticket_sub_text_color` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#999999',
  `social_show_whatsapp` tinyint(1) NOT NULL DEFAULT '1',
  `questions_collection_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'buyer',
  `checkout_timeout_after` int(11) NOT NULL DEFAULT '8',
  `is_1d_barcode_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `enable_offline_payments` tinyint(1) NOT NULL DEFAULT '0',
  `offline_payment_instructions` text COLLATE utf8_unicode_ci,
  `charge_tax` tinyint(1) NOT NULL DEFAULT '0',
  `gratuity_fixed` decimal(13,2) NOT NULL DEFAULT '0.00',
  `gratuity_percentage` decimal(4,3) NOT NULL DEFAULT '0.000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `location`, `bg_type`, `bg_color`, `bg_image_path`, `description`, `start_date`, `end_date`, `on_sale_date`, `account_id`, `user_id`, `currency_id`, `sales_volume`, `organiser_fees_volume`, `organiser_fee_fixed`, `organiser_fee_percentage`, `organiser_id`, `venue_name`, `venue_name_full`, `location_address`, `location_address_line_1`, `location_address_line_2`, `location_country`, `location_country_code`, `location_state`, `location_post_code`, `location_street_number`, `location_lat`, `location_long`, `location_google_place_id`, `pre_order_display_message`, `post_order_display_message`, `social_share_text`, `social_show_facebook`, `social_show_linkedin`, `social_show_twitter`, `social_show_email`, `social_show_googleplus`, `location_is_manual`, `is_live`, `created_at`, `updated_at`, `deleted_at`, `barcode_type`, `ticket_border_color`, `ticket_bg_color`, `ticket_text_color`, `ticket_sub_text_color`, `social_show_whatsapp`, `questions_collection_type`, `checkout_timeout_after`, `is_1d_barcode_enabled`, `enable_offline_payments`, `offline_payment_instructions`, `charge_tax`, `gratuity_fixed`, `gratuity_percentage`) VALUES
(2, 'Sweet Suds & Savory Sips at Vintana', NULL, 'image', '#B23333', 'assets/images/public/EventPage/backgrounds/12.jpg', 'Enjoy an evening of create-your-own sugar body scrubs and wine!  Join us at Vintana Tuesday, August 14th from 6-8pm for a sugar body scrub making class.  Ticket price is $30 per person and includes all materials to create one scrub and a glass of red or white wine.  To reserve your seat, please call 760-745-7777. ', '2018-08-14 18:00:00', '2018-08-14 20:00:00', NULL, 1, 1, 1, '150.00', '0.00', '0.00', '0.000', 1, 'Vintana Wine + Dine', 'Vintana Wine + Dine, Auto Park Way, Escondido, CA, USA', '1205 Auto Park Way, Escondido, CA 92029, USA', 'Auto Park Way', 'Escondido', 'United States', 'US', 'California', '92029', '1205', '33.10717380000001', '-117.09673140000001', 'ChIJ2R1niIn024ARUTbpQ6TNOMo', NULL, NULL, '', 1, 0, 1, 1, 0, 0, 1, '2018-08-13 08:12:50', '2018-08-14 07:03:14', NULL, 'QRCODE', '#000000', '#ffffff', '#000000', '#999999', 1, 'buyer', 8, 1, 0, NULL, 0, '0.00', '0.000'),
(3, 'Namaste on the Bay – Yoga & Brunch', NULL, 'image', '#B23333', 'assets/images/public/EventPage/backgrounds/5.jpg', 'Calling all yogis! Join us at Coasterra Sunday, August 19th on Harbor Float for our third addition of yoga and brunch on the bay. CorePower Yoga’s talented instructors will lead an all levels flow from 10-11am followed by delicious Coasterra brunch bites, Boochcraft boozy kombucha & Suja mimosas from 11am-12:30pm. Check in will begin at 9:30am. Tickets for the event are $39.95. Space is limited -- our last event sold out VERY fast, so purchase your tickets now before they sell out! For additional information, contact samantha@dinecrg.com. ', '2018-08-19 10:00:00', '2018-08-19 11:00:00', NULL, 1, 1, 1, '0.00', '0.00', '0.00', '0.000', 1, 'Coasterra', 'Coasterra, Harbor Island Drive, San Diego, CA, USA', '880 Harbor Island Dr, San Diego, CA 92101, USA', 'Harbor Island Drive', 'San Diego', 'United States', 'US', 'California', '92101', '880', '32.7243776', '-117.18809629999998', 'ChIJUyrzgUar3oARS0vU1_MTV7Y', NULL, NULL, NULL, 1, 0, 1, 1, 0, 0, 1, '2018-08-18 04:33:59', '2018-08-18 04:40:18', NULL, 'QRCODE', '#000000', '#FFFFFF', '#000000', '#999999', 1, 'buyer', 8, 0, 0, NULL, 0, '0.00', '0.000'),
(4, '​“School of Fish” Sustainable Seafood Dinner at 333 Pacific', NULL, 'image', '#B23333', 'assets/images/public/EventPage/backgrounds/5.jpg', 'Enjoy and learn about seafood sustainability at 333 Pacific!  Join us Tuesday, August 21st at 6pm for our “School of Fish” Dinner featuring 6 courses and wine pairings.  Indulge in Mustard Glazed Skuna Bay Salmon, Hokkaido Scallop Crudo and more paired with savory wines!  Dinner is priced at $70 per person, excluding tax, gratuity and surcharge.  For reservations, please call 760-433-3333.', '2018-08-21 18:00:00', '2018-08-21 20:00:00', NULL, 1, 1, 1, '142.00', '0.00', '0.00', '0.000', 1, '333 N Pacific St', '333 North Pacific Street, Oceanside, CA, USA', '333 N Pacific St, Oceanside, CA 92054, USA', 'North Pacific Street', 'Oceanside', 'United States', 'US', 'California', '92054', '333', '33.195061', '-117.38358449999998', 'ChIJaU596jdu3IARS_c-rB6s7zE', NULL, NULL, '', 1, 0, 1, 1, 1, 0, 1, '2018-08-20 20:27:36', '2018-09-06 11:28:01', NULL, 'QRCODE', '#000000', '#FFFFFF', '#000000', '#999999', 0, 'buyer', 8, 0, 0, NULL, 0, '0.00', '0.000'),
(5, 'test date format', NULL, 'image', '#B23333', 'assets/images/public/EventPage/backgrounds/5.jpg', 'test', '2018-08-23 15:00:00', '2018-08-23 17:00:00', NULL, 1, 1, 1, '0.00', '0.00', '0.00', '0.000', 1, 'Vintana Wine + Dine', 'Vintana Wine + Dine, Auto Park Way, Escondido, CA, USA', '1205 Auto Park Way, Escondido, CA 92029, USA', 'Auto Park Way', 'Escondido', 'United States', 'US', 'California', '92029', '1205', '33.10717380000001', '-117.09673140000001', 'ChIJ2R1niIn024ARUTbpQ6TNOMo', NULL, NULL, NULL, 1, 1, 1, 1, 1, 0, 0, '2018-08-20 22:05:00', '2018-08-20 22:05:00', NULL, 'QRCODE', '#000000', '#FFFFFF', '#000000', '#999999', 1, 'buyer', 8, 0, 0, NULL, 0, '0.00', '0.000'),
(6, 'alksdf', NULL, 'image', '#B23333', 'assets/images/public/EventPage/backgrounds/5.jpg', 'asdfasdf', '2018-10-21 10:48:00', '2018-10-22 14:44:00', NULL, 1, 1, 1, '45.00', '0.00', '0.00', '0.000', 3, 'Prado', 'Prado, El Prado, San Diego, CA, USA', '1549 El Prado, San Diego, CA 92101, USA', 'El Prado', 'San Diego', 'United States', 'US', 'California', '92101', '1549', '32.7310061', '-117.1497354', 'ChIJ-WjoiL1U2YARRjBWbjJdeOM', NULL, NULL, NULL, 1, 1, 1, 1, 1, 0, 1, '2018-09-21 00:45:20', '2018-09-30 07:32:42', NULL, 'QRCODE', '#000000', '#FFFFFF', '#000000', '#999999', 1, 'buyer', 8, 0, 0, NULL, 0, '0.00', '0.000'),
(7, 'The Prado’s Sessions in the Park – Dinner in the Spreckels Organ Pavilion', NULL, 'image', '#B23333', 'assets/images/public/EventPage/backgrounds/5.jpg', 'Meet us under the colonnades!  Join us as we host our second Sessions in the Park Friday, September 28th from 6-8:30pm.  This intimate dinner will be served in a beautiful outdoor setting under the Spreckels Organ Pavilion colonnades.  Enjoy a delicious 4-course menu featuring locally sourced seasonal dishes accompanied by DAOU wines and Jim Beam cocktail pairings.  Guest will be greeted with a welcome cocktail accompanied with live organ playing by San Diego Civic Organist Raúl Prieto Ramírez from 6-6:30pm.  Tickets for this event are priced at $85 per person.  VIP Tickets are priced at $125 per person and include exclusive on-stage seating, meet and greet with Raúl Prieto Ramírez and a special gift bag.  To purchase tickets today, click here.  Don’t miss this unique event celebrating one of San Diego’s most historic sites!  Space is limited. For additional information, please email cynthia@pradobalboa.com or call 619-557-9441.', '2018-09-28 18:00:00', '2018-09-28 20:30:00', NULL, 1, 1, 1, '170.00', '0.00', '0.00', '0.000', 3, 'Prado', 'Prado, El Prado, San Diego, CA, USA', '1549 El Prado, San Diego, CA 92101, USA', 'El Prado', 'San Diego', 'United States', 'US', 'California', '92101', '1549', '32.7310061', '-117.1497354', 'ChIJ-WjoiL1U2YARRjBWbjJdeOM', NULL, NULL, NULL, 1, 1, 1, 1, 1, 0, 1, '2018-09-21 01:14:07', '2018-09-21 01:26:25', NULL, 'QRCODE', '#000000', '#FFFFFF', '#000000', '#999999', 1, 'buyer', 8, 0, 0, NULL, 0, '0.00', '0.000'),
(8, 'Test event', NULL, 'image', '#B23333', 'assets/images/public/EventPage/backgrounds/5.jpg', 'asdfasdf', '2018-11-11 20:17:00', '2018-11-11 22:17:00', NULL, 1, 1, 1, '0.00', '0.00', '0.00', '0.000', 2, 'Vintana Wine + Dine', 'Vintana Wine + Dine, Auto Park Way, Escondido, CA, USA', '1205 Auto Park Way, Escondido, CA 92029, USA', 'Auto Park Way', 'Escondido', 'United States', 'US', 'California', '92029', '1205', '33.10717380000001', '-117.09673140000001', 'ChIJ2R1niIn024ARUTbpQ6TNOMo', NULL, NULL, NULL, 1, 1, 1, 1, 1, 0, 0, '2018-10-12 10:17:45', '2018-10-12 10:17:45', NULL, 'QRCODE', '#000000', '#FFFFFF', '#000000', '#999999', 1, 'buyer', 8, 0, 0, NULL, 0, '0.00', '0.000'),
(9, 'Newton Vineyard Wine Dinner at Vintana', NULL, 'image', '#B23333', 'assets/images/public/EventPage/backgrounds/5.jpg', 'Enjoy Newton wines in North County!  Join us at Vintana Friday, October 19th for our Newton Vineyard Wine Dinner from 6-9pm.  Indulge in this delectable 4-course menu featuring Pan Seared Halibut, Charred and Roasted Trip-Tip and more paired with delicious Newton Wines.  Menu is priced at $69 per person, excluding tax, gratuity and surcharge.  For reservations, please call 760-745-7777.', '2019-10-19 18:00:00', '2019-10-19 21:00:00', NULL, 1, 2, 1, '0.00', '0.00', '0.00', '0.000', 2, 'Vintana Wine + Dine', 'Vintana Wine + Dine, Auto Park Way, Escondido, CA, USA', '1205 Auto Park Way, Escondido, CA 92029, USA', 'Auto Park Way', 'Escondido', 'United States', 'US', 'California', '92029', '1205', '33.10717380000001', '-117.09673140000001', 'ChIJ2R1niIn024ARUTbpQ6TNOMo', NULL, NULL, NULL, 1, 1, 1, 1, 1, 0, 0, '2018-10-24 01:16:31', '2019-01-19 02:08:43', NULL, 'QRCODE', '#000000', '#FFFFFF', '#000000', '#999999', 1, 'buyer', 8, 0, 0, NULL, 0, '0.00', '0.000');

-- --------------------------------------------------------

--
-- Table structure for table `event_images`
--

CREATE TABLE `event_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_images`
--

INSERT INTO `event_images` (`id`, `image_path`, `created_at`, `updated_at`, `event_id`, `account_id`, `user_id`) VALUES
(1, 'user_content/event_images/event_image-8a154d0db7f9d6eb999fdac1f61f6a38.jpg', '2018-10-24 01:16:32', '2018-10-24 01:16:32', 9, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `event_question`
--

CREATE TABLE `event_question` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_stats`
--

CREATE TABLE `event_stats` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `unique_views` int(11) NOT NULL DEFAULT '0',
  `tickets_sold` int(11) NOT NULL DEFAULT '0',
  `sales_volume` decimal(13,2) NOT NULL DEFAULT '0.00',
  `organiser_fees_volume` decimal(13,2) NOT NULL DEFAULT '0.00',
  `event_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_stats`
--

INSERT INTO `event_stats` (`id`, `date`, `views`, `unique_views`, `tickets_sold`, `sales_volume`, `organiser_fees_volume`, `event_id`) VALUES
(1, '2018-08-12', 0, 0, 2, '60.00', '0.00', 2),
(2, '2018-08-13', 17, 3, 3, '90.00', '0.00', 2),
(3, '2018-08-17', 2, 2, 0, '0.00', '0.00', 2),
(4, '2018-08-17', 9, 2, 0, '0.00', '0.00', 3),
(5, '2018-08-20', 8, 4, 3, '213.00', '0.00', 4),
(6, '2018-09-20', 2, 1, 0, '0.00', '0.00', 6),
(7, '2018-09-20', 1, 1, 2, '170.00', '0.00', 7),
(8, '2018-09-29', 3, 1, 1, '45.00', '0.00', 6);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recipients` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `is_sent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sent_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_03_26_180116_create_users_table', 1),
('2014_04_08_232044_setup_countries_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2014_11_07_132018_add_affiliates_table', 1),
('2014_11_17_011806_create_failed_jobs_table', 1),
('2016_03_09_221103_add_ticket_design_options', 1),
('2016_03_16_193757_create_gateways_table', 1),
('2016_03_16_213041_add_account_payment_id', 1),
('2016_03_16_215709_add_gateway_id_accounts_table', 1),
('2016_03_22_021114_add_whatsapp_share_option_events', 1),
('2016_03_25_114646_organiser_page_design_update', 1),
('2016_03_26_103318_create_attendees_questions', 1),
('2016_03_27_223733_add_organiser_page_toggle', 1),
('2016_04_03_172528_order_page_update', 1),
('2016_04_03_221050_add_question_answers_table', 1),
('2016_04_13_151256_add_api_key_users_table', 1),
('2016_05_05_201200_remove_instructions_field_questions_table', 1),
('2016_05_12_143324_fix_messages_table', 1),
('2016_05_16_142730_update_questions_table', 1),
('2016_05_22_041458_remove_ask_for_in_events', 1),
('2016_05_25_145857_attendee_ref_fix', 1),
('2016_05_28_084338_add_sort_order_tickets_table', 1),
('2016_06_14_115337_add_is_refunded_column_to_attendees', 1),
('2016_07_07_143106_add_1d_barcode_option_to_events_table', 1),
('2016_07_08_133056_add_support_for_offline_payments', 1),
('2016_09_16_221455_add_google_analytics_code_to_organiser', 1),
('2016_10_22_150532_add_is_hidden_tickets_table', 1),
('2018_02_26_172146_add_tax_to_organizers', 1),
('2018_02_27_175149_add_taxamt_to_orders_table', 1),
('2018_03_01_150711_add_taxid_to_organisers', 1),
('2018_07_09_133243_additional_tax_field_rename_current_tax_fields', 1),
('2018_08_16_131955_drop_coinbase_and_migs_as_defaults', 2),
('2018_09_02_164757_add_organiser_user_pivot', 3),
('2018_09_28_123740_add_event_charge_tax', 4),
('2018_09_29_233353_create_jobs_table', 4),
('2018_10_12_032134_add_deposit_fields', 5),
('2018_10_12_132826_add_balance_due_column', 5),
('2019_01_29_124914_add_gratuity_fields', 6),
('2019_01_29_151227_add_gratuity_to_order', 6),
('2019_01_29_152035_add_unit_gratuity', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `order_status_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ticket_pdf_path` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_reference` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `booking_fee` decimal(8,2) DEFAULT NULL,
  `organiser_booking_fee` decimal(8,2) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `is_partially_refunded` tinyint(1) NOT NULL DEFAULT '0',
  `is_refunded` tinyint(1) NOT NULL DEFAULT '0',
  `amount` decimal(13,2) NOT NULL,
  `amount_refunded` decimal(13,2) DEFAULT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `payment_gateway_id` int(10) UNSIGNED DEFAULT NULL,
  `is_payment_received` tinyint(1) NOT NULL DEFAULT '0',
  `taxamt` double(8,2) NOT NULL,
  `balance_due` decimal(13,2) NOT NULL DEFAULT '0.00',
  `gratuity` decimal(13,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `account_id`, `order_status_id`, `created_at`, `updated_at`, `deleted_at`, `first_name`, `last_name`, `email`, `ticket_pdf_path`, `order_reference`, `transaction_id`, `discount`, `booking_fee`, `organiser_booking_fee`, `order_date`, `notes`, `is_deleted`, `is_cancelled`, `is_partially_refunded`, `is_refunded`, `amount`, `amount_refunded`, `event_id`, `payment_gateway_id`, `is_payment_received`, `taxamt`, `balance_due`, `gratuity`) VALUES
(1, 1, 1, '2018-08-13 08:31:21', '2018-08-13 08:31:21', NULL, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', NULL, '143EM138', '5b70df69c1a1e', '0.00', '0.00', '0.00', NULL, NULL, 0, 0, 0, 0, '30.00', NULL, 2, NULL, 1, 0.00, '0.00', '0.00'),
(2, 1, 1, '2018-08-13 09:20:05', '2018-08-13 09:20:05', NULL, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', NULL, 'H1F2C138', '5b70ead51b9e5', '0.00', '0.00', '0.00', NULL, NULL, 0, 0, 0, 0, '30.00', NULL, 2, NULL, 1, 0.00, '0.00', '0.00'),
(3, 1, 1, '2018-08-14 06:57:02', '2018-08-14 06:57:02', NULL, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', NULL, 'O9KMK138', '5b721ace395c8', '0.00', '0.00', '0.00', NULL, NULL, 0, 0, 0, 0, '30.00', NULL, 2, NULL, 1, 0.00, '0.00', '0.00'),
(4, 1, 1, '2018-08-14 07:01:46', '2018-08-14 07:01:46', NULL, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', NULL, 'CBRIY148', '5b721bea6c625', '0.00', '0.00', '0.00', NULL, NULL, 0, 0, 0, 0, '30.00', NULL, 2, NULL, 1, 0.00, '0.00', '0.00'),
(5, 1, 1, '2018-08-14 07:03:14', '2018-08-14 07:03:14', NULL, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', NULL, 'SGYZV148', '5b721c4244ce7', '0.00', '0.00', '0.00', NULL, NULL, 0, 0, 0, 0, '30.00', NULL, 2, NULL, 1, 0.00, '0.00', '0.00'),
(6, 1, 1, '2018-08-20 20:46:53', '2018-08-20 20:46:53', NULL, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', NULL, 'HIWOD208', '100605050111', '0.00', '0.00', '0.00', NULL, NULL, 0, 0, 0, 0, '213.00', NULL, 4, 6, 1, 0.00, '0.00', '0.00'),
(7, 1, 2, '2018-08-20 21:11:42', '2018-09-06 11:28:01', NULL, 'Andrew', 'Christensen', 'awc@emergingdesigns.com', NULL, 'DRU4X208', '100605058704', '0.00', '0.00', '0.00', NULL, NULL, 0, 0, 0, 1, '0.00', '71.00', 4, 6, 1, 0.00, '0.00', '0.00'),
(8, 1, 1, '2018-09-21 01:26:25', '2018-09-21 01:26:25', NULL, 'Andrew', 'Christensen', 'andrew@tildeworks.com', NULL, 'FF5ET209', '100618473219', '0.00', '0.00', '0.00', NULL, NULL, 0, 0, 0, 0, '170.00', NULL, 7, 6, 1, 13.18, '0.00', '0.00'),
(9, 1, 1, '2018-09-30 07:32:42', '2018-09-30 07:32:42', NULL, 'Andrew', 'Christensen', 'andrew@tildeworks.com', NULL, 'FWAPC309', '100622353528', '0.00', '0.00', '0.00', NULL, NULL, 0, 0, 0, 0, '45.00', NULL, 6, 6, 1, 0.00, '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(13,2) NOT NULL,
  `unit_booking_fee` decimal(13,2) DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `unit_gratuity` decimal(13,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `title`, `quantity`, `unit_price`, `unit_booking_fee`, `order_id`, `deleted_at`, `unit_gratuity`) VALUES
(1, 'Make your own scrub', 1, '30.00', '0.00', 1, NULL, '0.00'),
(2, 'Make your own scrub', 1, '30.00', '0.00', 2, NULL, '0.00'),
(3, 'Make your own scrub', 1, '30.00', '0.00', 3, NULL, '0.00'),
(4, 'Make your own scrub', 1, '30.00', '0.00', 4, NULL, '0.00'),
(5, 'Make your own scrub', 1, '30.00', '0.00', 5, NULL, '0.00'),
(6, '6-Course Dinner and Wine Pairings', 3, '71.00', '0.00', 6, NULL, '0.00'),
(7, '6-Course Dinner and Wine Pairings', 1, '71.00', '0.00', 7, NULL, '0.00'),
(8, 'General Admission', 2, '85.00', '0.00', 8, NULL, '0.00'),
(9, 'ticket 1', 1, '45.00', '0.00', 9, NULL, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `name`) VALUES
(5, 'Awaiting Payment'),
(1, 'Completed'),
(2, 'Refunded'),
(3, 'Partially Refunded'),
(4, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `organisers`
--

CREATE TABLE `organisers` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `about` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_key` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `show_twitter_widget` tinyint(1) NOT NULL DEFAULT '0',
  `show_facebook_widget` tinyint(1) NOT NULL DEFAULT '0',
  `page_header_bg_color` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#76a867',
  `page_bg_color` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EEEEEE',
  `page_text_color` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `enable_organiser_page` tinyint(1) NOT NULL DEFAULT '1',
  `google_analytics_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `tax_value` double NOT NULL,
  `tax_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `charge_tax` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `organisers`
--

INSERT INTO `organisers` (`id`, `created_at`, `updated_at`, `deleted_at`, `account_id`, `name`, `about`, `email`, `phone`, `confirmation_key`, `facebook`, `twitter`, `logo_path`, `is_email_confirmed`, `show_twitter_widget`, `show_facebook_widget`, `page_header_bg_color`, `page_bg_color`, `page_text_color`, `enable_organiser_page`, `google_analytics_code`, `tax_name`, `tax_value`, `tax_id`, `charge_tax`) VALUES
(1, '2018-08-13 07:32:35', '2019-02-05 02:37:25', NULL, 1, 'CRG', 'Main Admin', 'andrew@tildeworks.com', NULL, '0duOM6cuVmgXlqx', '', '', NULL, 0, 0, 0, '#53318f', '#eeeeee', '#ffffff', 0, '', 'CA Sales Tax', 7.75, '33-0709920', 1),
(2, '2018-08-29 00:25:28', '2019-02-05 02:35:51', NULL, 1, 'Vintana', 'Vintana', 'vintana@dinecrg.com', NULL, 'n49kJllVmVUFbXa', '', '', 'user_content/organiser_images/vintana-logo-2.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, '', 'CA Sales Tax', 7.75, '33-0549041', 1),
(3, '2018-09-21 00:44:36', '2019-02-09 02:18:22', NULL, 1, 'The Prado', '', 'info@dinecrg.com', NULL, 'AaYsNsxfvsc1vR6', '', '', 'user_content/organiser_images/the-prado-logo-3.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, '', 'Sales Tax', 7.75, '33-0329733', 1),
(4, '2019-02-05 02:34:50', '2019-02-05 02:34:50', NULL, 1, 'Corvette Diner', '', 'corvette@dinecrg.com', NULL, 'GEoC37HInxFlwI5', '', '', 'user_content/organiser_images/corvette-diner-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0195101', 1),
(5, '2019-02-05 02:38:41', '2019-02-05 02:38:41', NULL, 1, 'BO-beau kitchen + bar', '', 'bobeakb@dinecrg.com', NULL, 'AtUA7xR80LDhyLS', '', '', 'user_content/organiser_images/bo-beau-kitchen-bar-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0195101', 1),
(6, '2019-02-05 02:39:46', '2019-02-05 02:39:46', NULL, 1, 'Coin Haus', '', 'coinhaus@dinecrg.com', NULL, '57UUxpWSVCMdTMr', '', '', 'user_content/organiser_images/coin-haus-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 8.5, '33-0195101', 1),
(7, '2019-02-05 02:41:34', '2019-02-05 02:41:34', NULL, 1, 'Tea Pavilion', '', 'teapavilion@dinecrg.com', NULL, 'cotaZ8TLnQO8oNX', '', '', 'user_content/organiser_images/tea-pavilion-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0329733', 1),
(8, '2019-02-05 02:42:55', '2019-02-05 02:42:55', NULL, 1, 'Melting Pot', '', 'meltingpot@dinecrg.com', NULL, 'v4C5a3YgP92TWdo', '', '', 'user_content/organiser_images/melting-pot-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0498693', 1),
(9, '2019-02-05 02:43:51', '2019-02-05 02:43:51', NULL, 1, 'Blue Point', '', 'bluepoint@dinecrg.com', NULL, 'jUTwwneIDZZTMw8', '', '', 'user_content/organiser_images/blue-point-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0498693', 1),
(10, '2019-02-05 02:44:41', '2019-02-05 02:44:41', NULL, 1, '333 Pacific', '', '333pacific@dinecrg.com', NULL, 'i8voerFm6m8OJGz', '', '', 'user_content/organiser_images/333-pacific-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0498693', 1),
(11, '2019-02-05 02:45:42', '2019-02-05 02:45:42', NULL, 1, 'ZigZag Pizza', '', 'zigzag@dinecrg.com', NULL, 'UyO3ZoBxJF5waiI', '', '', 'user_content/organiser_images/zigzag-pizza-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0498693', 1),
(12, '2019-02-05 02:47:55', '2019-02-05 02:47:55', NULL, 1, 'SEA180˚', '', 'sea180@dinecrg.com', NULL, 'YG7W4XWre1MU80m', '', '', 'user_content/organiser_images/sea180-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0498693', 1),
(13, '2019-02-05 02:48:42', '2019-02-05 02:48:42', NULL, 1, 'Coaster Saloon', '', 'coaster@dinecrg.com', NULL, 'aSDNhasCWZHU1He', '', '', 'user_content/organiser_images/coaster-saloon-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0498693', 1),
(14, '2019-02-05 02:49:57', '2019-02-05 02:49:57', NULL, 1, 'Indigo Grill', '', 'indigo@dinecrg.com', NULL, 'WLFOVZ5pUxwj3V6', '', '', 'user_content/organiser_images/indigo-grill-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0549041', 1),
(15, '2019-02-05 02:50:43', '2019-02-05 02:50:43', NULL, 1, 'Island Prime', '', 'islandprime@dinecrg.com', NULL, '6Nh3Zjy001lNlMR', '', '', 'user_content/organiser_images/island-prime-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0549041', 1),
(16, '2019-02-05 02:51:34', '2019-02-05 02:51:34', NULL, 1, 'Coasterra', '', 'coasterra@dinecrg.com', NULL, '51ciYMmPjHRN3fl', '', '', 'user_content/organiser_images/coasterra-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0549041', 1),
(17, '2019-02-05 02:52:26', '2019-02-05 02:52:26', NULL, 1, 'Gaslamp Strip Club', '', 'gaslamp@dinecrg.com', NULL, '5g6Wj7wfs8QrV8L', '', '', 'user_content/organiser_images/gaslamp-strip-club-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0765079', 1),
(18, '2019-02-05 02:53:24', '2019-02-05 02:53:24', NULL, 1, 'Draft Republic La Jolla', '', 'drlj@dinecrg.com', NULL, 'E6JoPEF3Wp7LfRF', '', '', 'user_content/organiser_images/draft-republic-la-jolla-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0765079', 1),
(19, '2019-02-05 02:54:50', '2019-02-05 02:58:53', NULL, 1, 'BO-beau kitchen + rooftap', '', 'bbkrt@dinecrg.com', NULL, '94swypU6klOiEFJ', '', '', 'user_content/organiser_images/bo-beau-kitchen-rooftap-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, '', 'CA Sales Tax', 10.25, '33-0765079', 1),
(20, '2019-02-05 02:55:43', '2019-02-05 02:55:43', NULL, 1, 'Draft Republic Carlsbad', '', 'drcb@dinecrg.com', NULL, 'u5IJKgfsNv8ojBD', '', '', 'user_content/organiser_images/draft-republic-carlsbad-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0765079', 1),
(21, '2019-02-05 02:57:17', '2019-02-05 02:57:17', NULL, 1, 'BO-beau Kitchen + Cache', '', 'bbkc@dinecrg.com', NULL, 'k8e1rEA4dYj0fBo', '', '', 'user_content/organiser_images/bo-beau-kitchen-cache-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 7.75, '33-0329733', 1),
(22, '2019-02-05 02:58:32', '2019-02-05 02:58:32', NULL, 1, 'BO-beau kitchen + garden', '', 'bbkg@dinecrg.com', NULL, '4nyHJJbrSL0kUO8', '', '', 'user_content/organiser_images/bo-beau-kitchen-garden-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, 'CA Sales Tax', 8.5, '46-2831374', 1),
(23, '2019-02-05 02:59:37', '2019-02-05 02:59:37', NULL, 1, 'Plantation House', '', 'plantationhouse@dinecrg.com', NULL, 'ZYFSHZUYO3rMVoU', '', '', 'user_content/organiser_images/plantation-house-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, '', 0, '', 0),
(24, '2019-02-05 03:00:07', '2019-02-05 03:00:07', NULL, 1, 'Castaway Cafe', '', 'castaway@dinecrg.com', NULL, 'CpnzaurxT6e1kcE', '', '', 'user_content/organiser_images/castaway-cafe-logo-.jpg', 0, 0, 0, '#76a867', '#EEEEEE', '#FFFFFF', 1, NULL, '', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `organiser_user`
--

CREATE TABLE `organiser_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `organiser_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('billy@dinecrg.com', '$2y$10$QcDsw.ECwEcy6bnbMheRUO7rXJM5M5aWpx8QWLsbTNDWKvzjjL426', '2018-10-13 08:41:40'),
('debbie@dinecrg.com', '$2y$10$be/DOcFtqr5jcRsrs.g9YO7EhiYULfFqjLJgyhuyBZnGv.YsvI1ni', '2018-10-13 08:42:09'),
('joel@dinecrg.com', '$2y$10$NEAaWmDIZw76BhyfaFS/.eTK2APrTQ551zCeVtDD5IE0WCGNVXo/O', '2018-10-13 08:42:57'),
('samantha@dinecrg.com', '$2y$10$aapLN2R6B3i8xsEK6WPagufe0SKWu8N2GFpgU5RL/tE8dNBmWBWWu', '2018-11-07 09:29:27');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `provider_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_on_site` tinyint(1) NOT NULL,
  `can_refund` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `provider_name`, `provider_url`, `is_on_site`, `can_refund`, `name`) VALUES
(1, 'Stripe', 'https://www.stripe.com', 0, 0, 'Stripe'),
(2, 'PayPal Express', 'https://www.paypal.com', 0, 0, 'PayPal_Express'),
(5, 'Payeezy', 'https://www.payeezy.com/content/payeezy/www/en_us/index.html', 0, 0, 'Payeezy'),
(6, 'Blue Pay', 'https://www.bluepay.com/', 1, 1, 'BluePay');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question_type_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `is_required` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_answers`
--

CREATE TABLE `question_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `attendee_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `answer_text` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_ticket`
--

CREATE TABLE `question_ticket` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_types`
--

CREATE TABLE `question_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `has_options` tinyint(1) NOT NULL DEFAULT '0',
  `allow_multiple` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `question_types`
--

INSERT INTO `question_types` (`id`, `alias`, `name`, `has_options`, `allow_multiple`) VALUES
(1, 'text', 'Single-line text box', 0, 0),
(2, 'textarea', 'Multi-line text box', 0, 0),
(3, 'dropdown', 'Dropdown (single selection)', 1, 0),
(4, 'dropdown_multiple', 'Dropdown (multiple selection)', 1, 1),
(5, 'checkbox', 'Checkbox', 1, 1),
(6, 'radio', 'Radio input', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reserved_tickets`
--

CREATE TABLE `reserved_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `quantity_reserved` int(11) NOT NULL,
  `expires` datetime NOT NULL,
  `session_id` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reserved_tickets`
--

INSERT INTO `reserved_tickets` (`id`, `ticket_id`, `event_id`, `quantity_reserved`, `expires`, `session_id`, `created_at`, `updated_at`) VALUES
(2, 4, 2, 1, '2018-08-13 02:25:58', '29ff7ff8feae105ce1e7ec46922afbc54aa484de', '2018-08-13 09:19:58', '2018-08-13 09:19:58'),
(8, 5, 2, 2, '2018-08-14 01:32:09', '72d0aab57c9e53c80f1c4f078e272e1023a81b92', '2018-08-14 08:26:09', '2018-08-14 08:26:09'),
(13, 5, 2, 2, '2018-08-14 03:00:59', 'f955761584c9c1bf6bfb887f2b19304f52fe8175', '2018-08-14 09:54:59', '2018-08-14 09:54:59'),
(15, 5, 2, 2, '2018-08-14 05:38:01', 'b59d91f96bf01c1c6c8d86be076045a56d706161', '2018-08-14 12:32:01', '2018-08-14 12:32:01'),
(23, 6, 3, 2, '2018-08-18 02:34:11', '893806d7b7fc105fa00651b96c65ebe592e28ee8', '2018-08-18 09:28:11', '2018-08-18 09:28:11'),
(28, 8, 4, 1, '2018-08-20 15:35:20', '853ed188a8ca366c6b588434880ff66cef639f71', '2018-08-20 22:29:20', '2018-08-20 22:29:20'),
(29, 8, 4, 2, '2018-08-20 15:51:07', '95a1de2905b82f65499c5789fbec78b269b3303c', '2018-08-20 22:45:07', '2018-08-20 22:45:07'),
(30, 11, 7, 2, '2018-09-20 18:48:58', 'sblgPj74cuoIt5Kbgm15I1wZyGuZvpBnjuZJaxKa', '2018-09-21 01:18:58', '2018-09-21 01:18:58'),
(31, 10, 6, 1, '2018-09-30 01:02:27', 'ouxuNDjUKoOBsclVV8iGCLUkP8PNVSbpmrSPNUtL', '2018-09-30 07:32:27', '2018-09-30 07:32:27'),
(32, 14, 9, 4, '2019-01-18 18:40:07', '5SIZ2NtoulRbqdyyNK3VHxUo8ny89bsUwu7b2x1P', '2019-01-19 02:10:07', '2019-01-19 02:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `edited_by_user_id` int(10) UNSIGNED DEFAULT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `max_per_person` int(11) DEFAULT NULL,
  `min_per_person` int(11) DEFAULT NULL,
  `quantity_available` int(11) DEFAULT NULL,
  `quantity_sold` int(11) NOT NULL DEFAULT '0',
  `start_sale_date` datetime DEFAULT NULL,
  `end_sale_date` datetime DEFAULT NULL,
  `sales_volume` decimal(13,2) NOT NULL DEFAULT '0.00',
  `organiser_fees_volume` decimal(13,2) NOT NULL DEFAULT '0.00',
  `is_paused` tinyint(4) NOT NULL DEFAULT '0',
  `public_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `full_price` decimal(13,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `created_at`, `updated_at`, `deleted_at`, `edited_by_user_id`, `account_id`, `order_id`, `event_id`, `title`, `description`, `price`, `max_per_person`, `min_per_person`, `quantity_available`, `quantity_sold`, `start_sale_date`, `end_sale_date`, `sales_volume`, `organiser_fees_volume`, `is_paused`, `public_id`, `user_id`, `sort_order`, `is_hidden`, `is_deposit`, `full_price`) VALUES
(6, '2018-08-18 04:34:42', '2018-08-18 04:34:42', NULL, NULL, 1, NULL, 3, 'Front Row', '', '32.00', 4, 1, 12, 0, NULL, NULL, '0.00', '0.00', 0, NULL, 1, 0, 0, 0, '0.00'),
(7, '2018-08-18 04:35:58', '2018-08-18 04:42:47', NULL, NULL, 1, NULL, 3, 'Standard Tickets', '', '27.00', 4, 1, 38, 0, NULL, NULL, '0.00', '0.00', 0, NULL, 1, 0, 0, 0, '0.00'),
(5, '2018-08-13 08:14:06', '2018-08-13 08:14:06', NULL, NULL, 1, NULL, 2, 'Make two scrubs!', '', '37.00', 4, 1, 20, 0, NULL, NULL, '0.00', '0.00', 0, NULL, 1, 0, 0, 0, '0.00'),
(4, '2018-08-13 08:13:32', '2018-08-14 07:03:14', NULL, NULL, 1, NULL, 2, 'Make your own scrub', '', '30.00', 4, 1, 50, 5, NULL, NULL, '150.00', '0.00', 0, NULL, 1, 0, 0, 0, '0.00'),
(8, '2018-08-20 20:28:32', '2018-09-06 11:28:01', NULL, NULL, 1, NULL, 4, '6-Course Dinner and Wine Pairings', '', '71.00', 30, 1, 40, 3, NULL, NULL, '213.00', '0.00', 0, NULL, 1, 0, 0, 0, '0.00'),
(9, '2018-08-20 20:31:55', '2018-08-20 22:35:35', NULL, NULL, 1, NULL, 4, '6-Course Dinner and Wine Pairings - Chef Table', '', '83.50', 2, 1, 20, 0, NULL, NULL, '0.00', '0.00', 0, NULL, 1, 0, 0, 0, '0.00'),
(10, '2018-09-21 00:46:07', '2018-09-30 07:32:42', NULL, NULL, 1, NULL, 6, 'ticket 1', 'test', '45.00', 30, 1, 25, 1, NULL, NULL, '45.00', '0.00', 0, NULL, 1, 0, 0, 0, '0.00'),
(11, '2018-09-21 01:14:52', '2018-09-21 01:26:25', NULL, NULL, 1, NULL, 7, 'General Admission', '', '85.00', 30, 1, 25, 2, NULL, NULL, '170.00', '0.00', 0, NULL, 1, 0, 0, 0, '0.00'),
(12, '2018-09-21 01:15:30', '2018-09-21 01:16:11', NULL, NULL, 1, NULL, 7, 'VIP Admission', 'Premier Seating on Stage & Gift Bag', '125.00', 30, 1, 10, 0, NULL, NULL, '0.00', '0.00', 0, NULL, 1, 0, 0, 0, '0.00'),
(13, '2018-10-24 01:20:56', '2018-10-24 01:20:56', NULL, NULL, 1, NULL, 9, 'Newton Vineyard Wine Dinner', '4 Course Menu + Wine Pairings', '69.00', 30, 1, 30, 0, NULL, NULL, '0.00', '0.00', 0, NULL, 2, 0, 0, 0, '0.00'),
(14, '2019-01-19 02:07:52', '2019-01-19 02:09:32', NULL, NULL, 1, NULL, 9, 'Registration for Wine Dinner', '', '25.00', 30, 1, 30, 0, NULL, NULL, '0.00', '0.00', 0, NULL, 1, 0, 0, 1, '69.99');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_order`
--

CREATE TABLE `ticket_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_statuses`
--

CREATE TABLE `ticket_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_statuses`
--

INSERT INTO `ticket_statuses` (`id`, `name`) VALUES
(1, 'Sold Out'),
(2, 'Sales Have Ended'),
(3, 'Not On Sale Yet'),
(4, 'On Sale'),
(5, 'On Sale');

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `name`, `location`) VALUES
(1, 'Pacific/Midway', '(GMT-11:00) Midway Island'),
(2, 'US/Samoa', '(GMT-11:00) Samoa'),
(3, 'US/Hawaii', '(GMT-10:00) Hawaii'),
(4, 'US/Alaska', '(GMT-09:00) Alaska'),
(5, 'US/Pacific', '(GMT-08:00) Pacific Time (US &amp; Canada)'),
(6, 'America/Tijuana', '(GMT-08:00) Tijuana'),
(7, 'US/Arizona', '(GMT-07:00) Arizona'),
(8, 'US/Mountain', '(GMT-07:00) Mountain Time (US &amp; Canada)'),
(9, 'America/Chihuahua', '(GMT-07:00) Chihuahua'),
(10, 'America/Mazatlan', '(GMT-07:00) Mazatlan'),
(11, 'America/Mexico_City', '(GMT-06:00) Mexico City'),
(12, 'America/Monterrey', '(GMT-06:00) Monterrey'),
(13, 'Canada/Saskatchewan', '(GMT-06:00) Saskatchewan'),
(14, 'US/Central', '(GMT-06:00) Central Time (US &amp; Canada)'),
(15, 'US/Eastern', '(GMT-05:00) Eastern Time (US &amp; Canada)'),
(16, 'US/East-Indiana', '(GMT-05:00) Indiana (East)'),
(17, 'America/Bogota', '(GMT-05:00) Bogota'),
(18, 'America/Lima', '(GMT-05:00) Lima'),
(19, 'America/Caracas', '(GMT-04:30) Caracas'),
(20, 'Canada/Atlantic', '(GMT-04:00) Atlantic Time (Canada)'),
(21, 'America/La_Paz', '(GMT-04:00) La Paz'),
(22, 'America/Santiago', '(GMT-04:00) Santiago'),
(23, 'Canada/Newfoundland', '(GMT-03:30) Newfoundland'),
(24, 'America/Buenos_Aires', '(GMT-03:00) Buenos Aires'),
(25, 'Greenland', '(GMT-03:00) Greenland'),
(26, 'Atlantic/Stanley', '(GMT-02:00) Stanley'),
(27, 'Atlantic/Azores', '(GMT-01:00) Azores'),
(28, 'Atlantic/Cape_Verde', '(GMT-01:00) Cape Verde Is.'),
(29, 'Africa/Casablanca', '(GMT) Casablanca'),
(30, 'Europe/Dublin', '(GMT) Dublin'),
(31, 'Europe/Lisbon', '(GMT) Lisbon'),
(32, 'Europe/London', '(GMT) London'),
(33, 'Africa/Monrovia', '(GMT) Monrovia'),
(34, 'Europe/Amsterdam', '(GMT+01:00) Amsterdam'),
(35, 'Europe/Belgrade', '(GMT+01:00) Belgrade'),
(36, 'Europe/Berlin', '(GMT+01:00) Berlin'),
(37, 'Europe/Bratislava', '(GMT+01:00) Bratislava'),
(38, 'Europe/Brussels', '(GMT+01:00) Brussels'),
(39, 'Europe/Budapest', '(GMT+01:00) Budapest'),
(40, 'Europe/Copenhagen', '(GMT+01:00) Copenhagen'),
(41, 'Europe/Ljubljana', '(GMT+01:00) Ljubljana'),
(42, 'Europe/Madrid', '(GMT+01:00) Madrid'),
(43, 'Europe/Paris', '(GMT+01:00) Paris'),
(44, 'Europe/Prague', '(GMT+01:00) Prague'),
(45, 'Europe/Rome', '(GMT+01:00) Rome'),
(46, 'Europe/Sarajevo', '(GMT+01:00) Sarajevo'),
(47, 'Europe/Skopje', '(GMT+01:00) Skopje'),
(48, 'Europe/Stockholm', '(GMT+01:00) Stockholm'),
(49, 'Europe/Vienna', '(GMT+01:00) Vienna'),
(50, 'Europe/Warsaw', '(GMT+01:00) Warsaw'),
(51, 'Europe/Zagreb', '(GMT+01:00) Zagreb'),
(52, 'Europe/Athens', '(GMT+02:00) Athens'),
(53, 'Europe/Bucharest', '(GMT+02:00) Bucharest'),
(54, 'Africa/Cairo', '(GMT+02:00) Cairo'),
(55, 'Africa/Harare', '(GMT+02:00) Harare'),
(56, 'Europe/Helsinki', '(GMT+02:00) Helsinki'),
(57, 'Europe/Istanbul', '(GMT+02:00) Istanbul'),
(58, 'Asia/Jerusalem', '(GMT+02:00) Jerusalem'),
(59, 'Europe/Kiev', '(GMT+02:00) Kyiv'),
(60, 'Europe/Minsk', '(GMT+02:00) Minsk'),
(61, 'Europe/Riga', '(GMT+02:00) Riga'),
(62, 'Europe/Sofia', '(GMT+02:00) Sofia'),
(63, 'Europe/Tallinn', '(GMT+02:00) Tallinn'),
(64, 'Europe/Vilnius', '(GMT+02:00) Vilnius'),
(65, 'Asia/Baghdad', '(GMT+03:00) Baghdad'),
(66, 'Asia/Kuwait', '(GMT+03:00) Kuwait'),
(67, 'Africa/Nairobi', '(GMT+03:00) Nairobi'),
(68, 'Asia/Riyadh', '(GMT+03:00) Riyadh'),
(69, 'Asia/Tehran', '(GMT+03:30) Tehran'),
(70, 'Europe/Moscow', '(GMT+04:00) Moscow'),
(71, 'Asia/Baku', '(GMT+04:00) Baku'),
(72, 'Europe/Volgograd', '(GMT+04:00) Volgograd'),
(73, 'Asia/Muscat', '(GMT+04:00) Muscat'),
(74, 'Asia/Tbilisi', '(GMT+04:00) Tbilisi'),
(75, 'Asia/Yerevan', '(GMT+04:00) Yerevan'),
(76, 'Asia/Kabul', '(GMT+04:30) Kabul'),
(77, 'Asia/Karachi', '(GMT+05:00) Karachi'),
(78, 'Asia/Tashkent', '(GMT+05:00) Tashkent'),
(79, 'Asia/Kolkata', '(GMT+05:30) Kolkata'),
(80, 'Asia/Kathmandu', '(GMT+05:45) Kathmandu'),
(81, 'Asia/Yekaterinburg', '(GMT+06:00) Ekaterinburg'),
(82, 'Asia/Almaty', '(GMT+06:00) Almaty'),
(83, 'Asia/Dhaka', '(GMT+06:00) Dhaka'),
(84, 'Asia/Novosibirsk', '(GMT+07:00) Novosibirsk'),
(85, 'Asia/Bangkok', '(GMT+07:00) Bangkok'),
(86, 'Asia/Jakarta', '(GMT+07:00) Jakarta'),
(87, 'Asia/Krasnoyarsk', '(GMT+08:00) Krasnoyarsk'),
(88, 'Asia/Chongqing', '(GMT+08:00) Chongqing'),
(89, 'Asia/Hong_Kong', '(GMT+08:00) Hong Kong'),
(90, 'Asia/Kuala_Lumpur', '(GMT+08:00) Kuala Lumpur'),
(91, 'Australia/Perth', '(GMT+08:00) Perth'),
(92, 'Asia/Singapore', '(GMT+08:00) Singapore'),
(93, 'Asia/Taipei', '(GMT+08:00) Taipei'),
(94, 'Asia/Ulaanbaatar', '(GMT+08:00) Ulaan Bataar'),
(95, 'Asia/Urumqi', '(GMT+08:00) Urumqi'),
(96, 'Asia/Irkutsk', '(GMT+09:00) Irkutsk'),
(97, 'Asia/Seoul', '(GMT+09:00) Seoul'),
(98, 'Asia/Tokyo', '(GMT+09:00) Tokyo'),
(99, 'Australia/Adelaide', '(GMT+09:30) Adelaide'),
(100, 'Australia/Darwin', '(GMT+09:30) Darwin'),
(101, 'Asia/Yakutsk', '(GMT+10:00) Yakutsk'),
(102, 'Australia/Brisbane', '(GMT+10:00) Brisbane'),
(103, 'Australia/Canberra', '(GMT+10:00) Canberra'),
(104, 'Pacific/Guam', '(GMT+10:00) Guam'),
(105, 'Australia/Hobart', '(GMT+10:00) Hobart'),
(106, 'Australia/Melbourne', '(GMT+10:00) Melbourne'),
(107, 'Pacific/Port_Moresby', '(GMT+10:00) Port Moresby'),
(108, 'Australia/Sydney', '(GMT+10:00) Sydney'),
(109, 'Asia/Vladivostok', '(GMT+11:00) Vladivostok'),
(110, 'Asia/Magadan', '(GMT+12:00) Magadan'),
(111, 'Pacific/Auckland', '(GMT+12:00) Auckland'),
(112, 'Pacific/Fiji', '(GMT+12:00) Fiji');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_registered` tinyint(1) NOT NULL DEFAULT '0',
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `is_parent` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `account_id`, `created_at`, `updated_at`, `deleted_at`, `first_name`, `last_name`, `phone`, `email`, `password`, `confirmation_code`, `is_registered`, `is_confirmed`, `is_parent`, `remember_token`, `api_token`) VALUES
(1, 1, '2018-08-13 07:14:35', '2018-08-13 07:31:26', NULL, 'Andrew', 'Christensen', NULL, 'andrew@tildeworks.com', '$2y$10$Ejgudd3Iv2x536ao/T5C0.ZGM/PgvIAlbXFTz33pZ/vw9Tc0tb1J.', 'x13SNYKYPvStBMQl', 1, 0, 1, 'yxeTf5U6irThMYakESYBNs3CNS3HC83jXLezv5cYtxwKl88WozIA3abi51Jf', 'QfTI25577KFrZZ9pBH4xV7nQ3J5X3PCVgNB0tRbqpJjMu5fFg9qnOctO9QtO'),
(2, 1, '2018-08-29 00:26:51', '2018-10-18 06:29:06', NULL, 'Jenn', 'Kamp', NULL, 'jenn@dinecrg.com', '$2y$10$EyDEjdc39bw5GuAmnv7Nb.xjvRHybctf7nRg0EhO18Kat0BQEry1O', '1Ed4mn3gFUs6rbVc', 0, 0, 0, '7iIoL7krzPMEhf29pLnTmMyIFRkfyhlH6Gx6R95Ov4bP0L6mZ7xZS81M1iwA', 'NrIKHK0BCiUqt7bsl6KsR515C0RiZDaP8u9JiwVOC89xks3JrwAoUTSJy9gE'),
(3, 1, '2018-08-29 00:29:53', '2018-08-29 00:31:35', NULL, 'Samantha', 'Roy', NULL, 'samantha@dinecrg.com', '$2y$10$JrDMeX4r2EDsTp3ww.422OaKHNogGzxrafux2EUQVlAFNkC5DH1L.', 'K6gQfkaCdiz2owtR', 0, 0, 0, 'Mo5PAmIZOiFm7NJYG0ZUBTDODMywfNKLOlwqiP8y5GAoMuSQGAH41Q58sWNP', 'gM1B8xzDj6mlfu3deNgWxQcr10UwwsrScXa1ztz2HTaIgCPU0DX1a3EnFoeQ'),
(4, 1, '2018-08-29 01:37:16', '2018-08-29 01:37:16', NULL, 'Debbie', 'Shumaker', NULL, 'debbie@dinecrg.com', '$2y$10$qFtnwM5EFDuctn6tR0EDfuFpdLUmr6AREUHTgxi2Cd/l0Vbz9b13e', 'GSFCkfac3ubJmoyA', 0, 0, 0, NULL, 'XK33rrIcvtpqyKBCrIYreS5kxX4MxAFexJfp1MItvTSeLVbcPDYNPbW8jiQo'),
(5, 1, '2018-08-29 01:37:28', '2018-08-29 01:37:28', NULL, 'Billy', 'Anderson', NULL, 'billy@dinecrg.com', '$2y$10$M4a4czxQrG/V/XvSl9z9VOVPxK90PPkyyafWZYc6nZ4TcxfLAhluS', 'xq5XqOl1LoRNiVpO', 0, 0, 0, NULL, 'V08Ws4BTPdx0zB9JxIyBgywA4rV7yhK5tkUk4VkKVhWW3rf593C2R0jhjdVI'),
(6, 1, '2018-09-21 00:05:26', '2018-09-21 00:05:26', NULL, 'Joel', 'Urbina', NULL, 'joel@dinecrg.com', '$2y$10$g6JA8ORpkyw5LBDGufCLm.qBS9NqJ.cqI8VIQFk7psGeETwSASxxC', 'YJmre47cISchvPQj', 0, 0, 0, 'nESaGJA2dzKQInOcObVm4t4pKnk07PnQAIUvKsiRBu1Ve3ToXBPNVYlHj6yI', 'b2dmd1snQ2pWDznWS28vSUbV5rVvwDifaG87LURq14AfsHurYKCWbx13IBmS'),
(7, 1, '2019-01-19 02:44:38', '2019-01-22 03:29:44', NULL, 'Jennie', 'Maltby', NULL, 'jennie@dinecrg.com', '$2y$10$RQIldeW2GUVYKYeawgz23.77gb3f4s2UgoBVQ8YxbTDoGBv3NDroy', 'RpGKpswkPKyCE4a5', 0, 0, 0, 'e2bYIlZQuzDyBtK8sHQPjWzMpHisfEI9qbVg7jJjGfm6Tcg3FO3ubsvwqQft', 'pGIgugo9zwerjl8ODG5Wv6RDwDAOdBMCOfClEmNmgn4BfAw3A8a9b1xeMBDZ'),
(8, 1, '2019-01-19 02:44:51', '2019-01-19 02:44:51', NULL, NULL, NULL, NULL, 'sammyjane@dinecrg.com', '$2y$10$Lhlx6zov3IwYhlR6AodLKOREVjjfxpcIMW/Q51qmb0Bty9yNSsHMW', '5zjXymlr7TSLuc70', 0, 0, 0, NULL, 'er3r2lHr8QNXXDVMnlykL014vNtx4Q8ZDyAhLNXorypnoSIpOWOem0bygH6D'),
(9, 1, '2019-03-24 00:59:33', '2019-03-24 01:00:19', NULL, 'George', 'Garcia', NULL, 'georgegarcia846@gmail.com', '$2y$10$63eyMe5LhEBett9c7CTksODqzgundm0b2Zd7RQEliG2FMOzVVOzf.', 'IY0uRx4xjYn83Szv', 0, 0, 0, NULL, 'AP5g23UhOLGxa5cGYaNitWsfYjsDZ1sJ4MiL0AnoB3Xdtfil0Y6hCi7UCxrH');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_timezone_id_foreign` (`timezone_id`),
  ADD KEY `accounts_date_format_id_foreign` (`date_format_id`),
  ADD KEY `accounts_datetime_format_id_foreign` (`datetime_format_id`),
  ADD KEY `accounts_currency_id_foreign` (`currency_id`),
  ADD KEY `accounts_payment_gateway_id_foreign` (`payment_gateway_id`);

--
-- Indexes for table `account_payment_gateways`
--
ALTER TABLE `account_payment_gateways`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_payment_gateways_payment_gateway_id_foreign` (`payment_gateway_id`),
  ADD KEY `account_payment_gateways_account_id_foreign` (`account_id`);

--
-- Indexes for table `affiliates`
--
ALTER TABLE `affiliates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliates_event_id_foreign` (`event_id`),
  ADD KEY `affiliates_account_id_index` (`account_id`);

--
-- Indexes for table `attendees`
--
ALTER TABLE `attendees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendees_order_id_index` (`order_id`),
  ADD KEY `attendees_event_id_index` (`event_id`),
  ADD KEY `attendees_ticket_id_index` (`ticket_id`),
  ADD KEY `attendees_private_reference_number_index` (`private_reference_number`),
  ADD KEY `attendees_account_id_index` (`account_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_id_index` (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datetime_formats`
--
ALTER TABLE `datetime_formats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `date_formats`
--
ALTER TABLE `date_formats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_user_id_foreign` (`user_id`),
  ADD KEY `events_currency_id_foreign` (`currency_id`),
  ADD KEY `events_organiser_id_foreign` (`organiser_id`),
  ADD KEY `events_account_id_index` (`account_id`);

--
-- Indexes for table `event_images`
--
ALTER TABLE `event_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_images_event_id_foreign` (`event_id`),
  ADD KEY `event_images_account_id_foreign` (`account_id`),
  ADD KEY `event_images_user_id_foreign` (`user_id`);

--
-- Indexes for table `event_question`
--
ALTER TABLE `event_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_question_event_id_index` (`event_id`),
  ADD KEY `event_question_question_id_index` (`question_id`);

--
-- Indexes for table `event_stats`
--
ALTER TABLE `event_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_stats_id_index` (`id`),
  ADD KEY `event_stats_event_id_index` (`event_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_event_id_foreign` (`event_id`),
  ADD KEY `messages_user_id_foreign` (`user_id`),
  ADD KEY `messages_account_id_index` (`account_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_order_status_id_foreign` (`order_status_id`),
  ADD KEY `orders_account_id_index` (`account_id`),
  ADD KEY `orders_event_id_index` (`event_id`),
  ADD KEY `orders_payment_gateway_id_foreign` (`payment_gateway_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisers`
--
ALTER TABLE `organisers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organisers_id_index` (`id`),
  ADD KEY `organisers_account_id_index` (`account_id`);

--
-- Indexes for table `organiser_user`
--
ALTER TABLE `organiser_user`
  ADD KEY `organiser_user_user_id_organiser_id_index` (`user_id`,`organiser_id`),
  ADD KEY `organiser_user_user_id_index` (`user_id`),
  ADD KEY `organiser_user_organiser_id_index` (`organiser_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_question_type_id_foreign` (`question_type_id`),
  ADD KEY `questions_account_id_index` (`account_id`);

--
-- Indexes for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_answers_attendee_id_index` (`attendee_id`),
  ADD KEY `question_answers_event_id_index` (`event_id`),
  ADD KEY `question_answers_question_id_index` (`question_id`),
  ADD KEY `question_answers_account_id_index` (`account_id`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_options_question_id_index` (`question_id`);

--
-- Indexes for table `question_ticket`
--
ALTER TABLE `question_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_ticket_question_id_index` (`question_id`),
  ADD KEY `question_ticket_ticket_id_index` (`ticket_id`);

--
-- Indexes for table `question_types`
--
ALTER TABLE `question_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reserved_tickets`
--
ALTER TABLE `reserved_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_order_id_foreign` (`order_id`),
  ADD KEY `tickets_edited_by_user_id_foreign` (`edited_by_user_id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_account_id_index` (`account_id`),
  ADD KEY `tickets_event_id_index` (`event_id`),
  ADD KEY `tickets_public_id_index` (`public_id`);

--
-- Indexes for table `ticket_order`
--
ALTER TABLE `ticket_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_order_order_id_index` (`order_id`),
  ADD KEY `ticket_order_ticket_id_index` (`ticket_id`);

--
-- Indexes for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`),
  ADD KEY `users_account_id_index` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_payment_gateways`
--
ALTER TABLE `account_payment_gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `affiliates`
--
ALTER TABLE `affiliates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendees`
--
ALTER TABLE `attendees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `datetime_formats`
--
ALTER TABLE `datetime_formats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `date_formats`
--
ALTER TABLE `date_formats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `event_images`
--
ALTER TABLE `event_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_question`
--
ALTER TABLE `event_question`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_stats`
--
ALTER TABLE `event_stats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `organisers`
--
ALTER TABLE `organisers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_answers`
--
ALTER TABLE `question_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_ticket`
--
ALTER TABLE `question_ticket`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_types`
--
ALTER TABLE `question_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reserved_tickets`
--
ALTER TABLE `reserved_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ticket_order`
--
ALTER TABLE `ticket_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
