-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Фев 01 2021 г., 15:20
-- Версия сервера: 8.0.22
-- Версия PHP: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kinle`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(26, '2021_01_31_161327_create_categories_table', 1),
(27, '2021_01_31_161440_create_tags_table', 1),
(28, '2021_01_31_161702_create_products_table', 1),
(29, '2021_01_31_161756_create_product_tag_table', 1),
(30, '2021_01_31_162429_create_pages_table', 1),
(31, '2021_01_31_204149_create_templates_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `template_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_page_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `h1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_text` text COLLATE utf8mb4_unicode_ci,
  `counter` int UNSIGNED NOT NULL DEFAULT '0',
  `thumb_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `template_type`, `template_page_id`, `name`, `h1`, `title`, `description`, `slug`, `full_text`, `counter`, `thumb_image`, `created_at`, `updated_at`) VALUES
(1, 'product', 1, 'Насос Иртыш ПД-1111', NULL, NULL, NULL, '111', NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `product_tag`
--

CREATE TABLE `product_tag` (
  `id` int UNSIGNED NOT NULL,
  `tag_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sections`
--

CREATE TABLE `sections` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `h1` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `noindex` tinyint DEFAULT '0',
  `smalltext` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `fulltext` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `virtual_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_id` int DEFAULT '1',
  `num` int NOT NULL DEFAULT '0',
  `show` smallint NOT NULL DEFAULT '1',
  `counter` bigint NOT NULL,
  `s_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `width` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `height` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blocked_admin` int DEFAULT NULL,
  `blocked_manager` int NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_rus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  `timestamp` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `sections`
--

INSERT INTO `sections` (`id`, `parent_id`, `name`, `title`, `h1`, `keywords`, `description`, `noindex`, `smalltext`, `fulltext`, `virtual_name`, `template_id`, `num`, `show`, `counter`, `s_image`, `m_image`, `width`, `height`, `blocked_admin`, `blocked_manager`, `url`, `url_rus`, `date`, `timestamp`) VALUES
(1, 0, 'Главная', 'Насосы Иртыш, купить, цена', '', '0', 'Насосы серии Иртыш завода ОДО Взлет по ценам ниже производителя от официального дилера! Доставка по РФ и СНГ, звоните.', 0, '', '<div class=\"tov_block tov_block1\">\n<div class=\"lable\">\n<p><a href=\"/katalog/nasos-irtysh-pf2-pf-pf1/\">Насосы ПФ Иртыш</a></p>\n</div>\n<div class=\"image_text\">\n<div class=\"image_tov\"><img src=\"/image/nasosy-pf-pfs-irtysh.png\" alt=\"Насосы ПФ(ПФС) Иртыш\" /></div>\n<div class=\"text_tov\">\n<p><span>Основным предназначением фекального насоса Иртыш является перекачка загрязненных вод с возможным содержанием в них крупноволокнистых и механических компонентов.&nbsp; Данная серия погружных насосов прекрасно подходит для эксплуатации в тяжелых условиях пребывания при минимальном их обслуживании.&nbsp;</span></p>\n<a href=\"/katalog/nasos-irtysh-pf2-pf-pf1/\">Перейти &raquo;</a></div>\n</div>\n</div>\n<div class=\"tov_block tov_block1\">\n<div class=\"lable\">\n<p><a href=\"/katalog/nasos-irtysh-pfs/\">Насосы ПФС Иртыш</a></p>\n</div>\n<div class=\"image_text\">\n<div class=\"image_tov\"><img src=\"/image/nasos-irtysh-pfs.png\" alt=\"Насосы ПФС Иртыш\" /></div>\n<div class=\"text_tov\">\n<p><span>Фекальный погружной насос Иртыш ПФС со свободновихревым рабочим колесом применяется для перекачки как бытовых, так и промышленных жидкостей в виде фекальных масс, сточных вод или промышленных отходов. При этом в жидкости допускается содержание взвешенных  абразивных и неабразивных частиц.</span></p>\n<a href=\"/katalog/nasos-irtysh-pfs/\">Перейти &raquo;</a></div>\n</div>\n</div>\n<div class=\"tov_block tov_block2\">\n<div class=\"lable\">\n<p><a href=\"/katalog/nasos-irtysh-pd/\">Насосы ПД Иртыш</a></p>\n</div>\n<div class=\"image_text\">\n<div class=\"image_tov\"><img src=\"/image/nasosy-pd-irtysh.png\" alt=\"Насосы ПД Иртыш\" /></div>\n<div class=\"text_tov\">\n<p>Моноблочные погружные центробежные электрические насосы повышенной мощности. Разработаны для откачивания вод без примесей (ПД) и жидкостей со схожими свойствами. Эффективны при откачивании грунтовых вод и ликвидации затоплений. Значительная мощность и большой ресурс делают их продуктивным звеном при организации насосного водоснабжения и объясняют широкое внедрение на станциях очистки канализационных стоков.</p>\n<a href=\"/katalog/nasos-irtysh-pd/\">Перейти &raquo;</a></div>\n</div>\n</div>\n<div class=\"tov_block tov_block2\">\n<div class=\"lable\">\n<p><a href=\"/katalog/nasos-irtysh-nf2-nf/\">Насосы НФ Иртыш</a></p>\n</div>\n<div class=\"image_text\">\n<div class=\"image_tov\"><img src=\"/image/nasos-irtysh-nf2-nf.png\" alt=\"Насосы НФ Иртыш\" /></div>\n<div class=\"text_tov\">\n<p><span>Фекальный насос Иртыш НФ с закрытым рабочем колесом используется для перекачки промышленных и бытовых вод. В воде допускается присутствие взвешенных &nbsp;абразивных и неабразивных частиц.&nbsp;</span><span>Так же допускается эксплуатация насоса в аварийной ситуации, когда срочно необходимо откачать воду из затопленного подвала или колодца. Или произвести осушение, орошение земель сельскохозяйственного назначения.</span></p>\n<a href=\"/katalog/nasos-irtysh-nf2-nf/\">Перейти &raquo;</a></div>\n</div>\n</div>\n<div class=\"tov_block tov_block2\">\n<div class=\"lable\">\n<p><a href=\"/katalog/nasosy-irtysh-nfs/\">Насосы НФС Иртыш</a></p>\n</div>\n<div class=\"image_text\">\n<div class=\"image_tov\"><img src=\"/image/nasos-irtysh-nfs.png\" alt=\"Насосы НФС Иртыш\" /></div>\n<div class=\"text_tov\">\n<p><span>Фекальный насос Иртыш НФ с закрытым рабочем колесом используется для перекачки промышленных и бытовых вод. В воде допускается присутствие взвешенных &nbsp;абразивных и неабразивных частиц.&nbsp;</span><span>Так же допускается эксплуатация насоса в аварийной ситуации, когда срочно необходимо откачать воду из затопленного подвала или колодца. Или произвести осушение, орошение земель сельскохозяйственного назначения.</span></p>\n<a href=\"/katalog/nasosy-irtysh-nfs/\">Перейти &raquo;</a></div>\n</div>\n</div>\n<div class=\"tov_block tov_block2\">\n<div class=\"lable\">\n<p><a href=\"/katalog/nasos-irtysh-cmk/\">Насосы ЦМК Иртыш</a></p>\n</div>\n<div class=\"image_text\">\n<div class=\"image_tov\"><img src=\"/image//nasos-irtysh-cmk.jpg\" alt=\"Насосы ЦМК Иртыш\" width=\"150\" /></div>\n<div class=\"text_tov\">\n<p><span>Насос Иртыш ЦМК &ndash; это центробежный моноблочный консольный насос унифицированного ряда, используемый в стационарных условиях и предназначенный для перекачки незагрязненной жидкости с возможным содержанием твердых включений объемом не более 0,1% и размером не более 0,2 миллиметров.</span></p>\n<a href=\"/katalog/nasos-irtysh-cmk/\">Перейти &raquo;</a></div>\n</div>\n</div>\n<div class=\"tov_block tov_block2\">\n<div class=\"lable\">\n<p><a href=\"/katalog/nasos-irtysh-cml/\">Насосы ЦМЛ Иртыш</a></p>\n</div>\n<div class=\"image_text\">\n<div class=\"image_tov\"><img src=\"/image/nasos-irtysh-cml.jpg\" alt=\"Насосы ЦМЛ Иртыш\" width=\"200\" /></div>\n<div class=\"text_tov\">\n<p><span>Центробежный моноблочный линейный насос ЦМЛ используется при работе в стационарных условиях и применяется для перекачки различного рода жидкостей сходной по своим характеристикам с чистой водой.&nbsp;</span><span>Насос Иртыш ЦМЛ относится к классификации насосов сухого типа, всасывание и напор расположены на одной линии с трубопроводом. Данный вид насосов используется при техническом сооружении зданий. Монтаж насоса происходит непосредственно на самом трубопроводе или закрепляется на фундаменте строения.</span></p>\n<a href=\"/katalog/nasos-irtysh-cml/\">Перейти &raquo;</a></div>\n</div>\n</div>\n<div class=\"tov_block tov_block2\">\n<div class=\"lable\">\n<p><a href=\"/katalog/nasos-irtysh-cnk/\">Насосы ЦНК Иртыш</a></p>\n</div>\n<div class=\"image_text\">\n<div class=\"image_tov\"><img src=\"/image//nasos-irtysh-cnk.jpg\" alt=\"Насосы ЦНК Иртыш\" width=\"150\" /></div>\n<div class=\"text_tov\">\n<p><span>Насос Иртыш ЦМК &ndash; это центробежный моноблочный консольный насос унифицированного ряда, используемый в стационарных условиях и предназначенный для перекачки незагрязненной жидкости с возможным содержанием твердых включений объемом не более 0,1% и размером не более 0,2 миллиметров.</span></p>\n<a href=\"/katalog/nasos-irtysh-cnk/\">Перейти &raquo;</a></div>\n</div>\n</div>\n<div class=\"tov_block tov_block3\">\n<div class=\"lable\">\n<p>О компании</p>\n</div>\n</div>\n<div class=\"seo_block\">\n<p>Наша компания &ndash; крупный поставщик продукции завода ОДО &laquo;Взлет&raquo; и его официальный представитель. Предприятие входит в число лидеров отечественного рынка насосного оборудования различного назначения. Насосы успешно выдерживают сложные условия работы, что обуславливает постоянный спрос.</p>\n<p>Все линейки насосов &laquo;Иртыш&raquo; проходят строгий контроль качества, чем обеспечивается продолжительная и бесперебойная эксплуатация под нагрузкой в промышленном секторе, в системах водоотведения и водоснабжения. В случаях заказных поставок предусмотрено доукомплектование моделей дополнительными опциями.</p>\n</div>', 'index', 1, 100, 1, 0, NULL, '', '144', '172', NULL, 0, '', '', '0000-00-00', 0),
(131, 130, 'НФ2 50/200.180-11/2-210', '', '', '0', '', 0, 'Подача, м3/ч: 45; Напор, м: 34; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 3000;', '', 'nf2-50-200-180-11-2-210', 4, 0, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(132, 130, 'НФ2 50/200.195-15/2-210', '', '', '0', '', 0, 'Подача, м3/ч: 55; Напор, м: 42; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 3000;', '', 'nf2-50-200-195-15-2-210', 4, 1, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(133, 130, 'НФ2 50/200.212-18,5/2-210', '', '', '0', '', 0, 'Подача, м3/ч: 60; Напор, м: 50; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 3000;', '', 'nf2-50-200-212-18-5-2-210', 4, 2, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(134, 130, 'НФ2 65/180.130-4/2-210', '', '', '0', '', 0, 'Подача, м3/ч: 30; Напор, м: 15; Мощность двигателя, кВт: 4; Частота вращения, об/мин: 3000;', '', 'nf2-65-180-130-4-2-210', 4, 3, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(135, 130, 'НФ2 65/180.130-5,5/2-210', '', '', '0', '', 0, 'Подача, м3/ч: 60; Напор, м: 12; Мощность двигателя, кВт: 5,5; Частота вращения, об/мин: 3000;', '', 'nf2-65-180-130-5-5-2-210', 4, 4, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(136, 130, 'НФ2 65/180.140-7,5/2-210', '', '', '0', '', 0, 'Подача, м3/ч: 60; Напор, м: 15; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 3000;', '', 'nf2-65-180-140-7-5-2-210', 4, 5, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(137, 130, 'НФ2 65/200.190-18,5/2-210', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 32; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 3000;', '', 'nf2-65-200-190-18-5-2-210', 4, 6, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(138, 130, 'НФ2 65/200.195-30/2-210', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 40; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 3000;', '', 'nf2-65-200-195-30-2-210', 4, 7, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(139, 130, 'НФ2 65/200.210-37/2-210', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 50; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 3000;', '', 'nf2-65-200-210-37-2-210', 4, 8, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(140, 130, 'НФ2 65/250.240-5,5/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 50; Напор, м: 15; Мощность двигателя, кВт: 5,5; Частота вращения, об/мин: 1500;', '', 'nf2-65-250-240-5-5-4-210', 4, 9, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(141, 130, 'НФ2 65/250.258-7,5/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 60; Напор, м: 19; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 1500;', '', 'nf2-65-250-258-7-5-4-210', 4, 10, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(142, 130, 'НФ2 80/315.280-11/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 80; Напор, м: 22; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 1500;', '', 'nf2-80-315-280-11-4-210', 4, 11, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(143, 130, 'НФ2 80/315.290-15/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 25; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 1500;', '', 'nf2-80-315-290-15-4-210', 4, 12, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(144, 130, 'НФ2 80/315.312-18,5/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 30; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 1500;', '', 'nf2-80-315-312-18-5-4-210', 4, 13, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(145, 130, 'НФ1 100/240.238-7,5/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 11; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 1500;', '', 'nf1-100-240-238-7-5-4-210', 4, 14, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(146, 130, 'НФ3 100/250.230-7,5/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 80; Напор, м: 14; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 1500;', '', 'nf3-100-250-230-7-5-4-210', 4, 15, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(7, 5, 'Насосы Иртыш ПД', 'Погружной дренажный насос Иртыш ПД', 'Насос Иртыш ПД', '0', 'Погружной дренажный насос Иртыш ПД предназначен для перекачки чистой или слабо загрязненной воды с возможным содержанием в ней абразивных включений диаметром до 2 миллиметров и концентрацией не более 0,1% от объема.', 0, '', '<p class=\"MsoNormal\">Основным предназначением насоса Иртыш ПД является перекачка чистой или сходной по плотности и химическому составу воды с возможным содержанием в ней твердых и волокнистых включений. Дренажный насос Иртыш ПД является полностью мобильным и дает возможность его установки в любых местах эксплуатации.</p>\n<p class=\"MsoNormal\"><strong>В роли загрязненных жидкостей могут выступать:</strong></p>\n<ul>\n<li>Вода в затопленных помещениях,</li>\n<li>Вода из бассейнов, аквариумов и ванн,</li>\n<li>Вода из небольших канализационных отстойников.</li>\n</ul>\n<p>Так же погружные насосы серии Иртыш ПД прекрасно подходят для орошения земли из водных накопителей и организации подачи воды в небольшие садовые фонтаны.</p>\n<h2 style=\"text-align: center;\"><strong>Иртыш ПД &ndash; состав и принцип работы</strong></h2>\n<p class=\"MsoNormal\">Погружной дренажный насос Иртыш представляет собой моноблочное устройство вертикального погружения, созданное из прочного антикоррозийного материала. В состав насоса входит асинхронный, трехфазный двигатель, который оснащен специальными термодатчиками. Двигатель располагается непосредственно над гидравлической частью насоса и охлаждается перекачиваемой жидкостью.</p>\n<h2 style=\"text-align: center;\"><span>Технические характеристики насосов Иртыш ПД</span></h2>\n<ul>\n<li class=\"MsoNormal\">Водородный показатель, <span lang=\"EN-US\">pH</span> &ndash; от 6,5 до 9,</li>\n<li class=\"MsoNormal\">Температура среды по Цельсию &ndash; до 50      градусов,</li>\n<li class=\"MsoNormal\">Плотность жидкости &ndash; 1&nbsp;000 кг<span lang=\"EN-US\">/</span>м<sup>3</sup>,</li>\n<li class=\"MsoNormal\">Абразивные включения (концентрация не      более 0,1% от объема) &ndash; до 2 миллиметров,</li>\n<li class=\"MsoNormal\">Степень защиты &ndash; <span lang=\"EN-US\">IP68.</span></li>\n<li class=\"MsoNormal\">Мощность двигателя, кВт - от 1,1 до 315,</li>\n<li class=\"MsoNormal\">Обороты двигаителя, об./мин. - от 1 460 до 2 940,</li>\n<li class=\"MsoNormal\">Напор, м. - от 14 до 150 метров,</li>\n<li class=\"MsoNormal\">Длина кабеля, м. - от 10 до 100 метров,</li>\n<li class=\"MsoNormal\">Производительность, м3/ч - от 13 до 1 600.</li>\n</ul>\n<h2 style=\"text-align: center;\">Условное обозначение - Иртыш ПД&nbsp;</h2>\n<p><strong>Вид обозначения:</strong>&nbsp;ИРТЫШ ПД 32/125.110-1,1/2-016</p>\n<ul>\n<li><strong>ИРТЫШ&nbsp;</strong>- серия насоса,</li>\n<li><strong>П&nbsp;</strong>- тип электродвигателя,</li>\n<li><strong>Д&nbsp;</strong>- тип гидравлической части насоса,</li>\n<li><strong>32&nbsp;</strong>- номинальный диаметр напорного патрубка,</li>\n<li><strong>125&nbsp;</strong>- номинальный диаметр рабочего колеса,</li>\n<li><strong>110&nbsp;</strong>- фактический диаметр рабочего колеса,</li>\n</ul>\n<p><span style=\"font-weight: bold;\">Конструктивные особенности:</span></p>\n<ul>\n<li><strong><strong>1,1</strong>&nbsp;</strong>- Номинальная мощность электродвигателя,</li>\n<li><strong><strong>2</strong></strong>&nbsp;- Число полюсов электродвигателя,</li>\n<li><strong><strong>0</strong> -&nbsp;</strong>Вариант монтажа насоса,</li>\n<li><strong><strong>1</strong> -&nbsp;</strong>Исполнение щита управления,</li>\n<li><strong><strong>6</strong> -&nbsp;</strong>Способ защиты двигателя.</li>\n</ul>\n<h2 style=\"text-align: center;\"><strong>Состав насоса Иртыш ПД</strong><strong><span lang=\"EN-US\">:</span></strong></h2>\n<ul>\n<li class=\"MsoNormal\">Электродвигатель,</li>\n<li class=\"MsoNormal\">Гидравлическая часть,</li>\n<li class=\"MsoNormal\">Система влаго и термозащиты,</li>\n<li class=\"MsoNormal\">Щит управления;</li>\n<li class=\"MsoNormal\">Поплавковый выключатель,</li>\n<li class=\"MsoNormal\">Дополнительные устройства.</li>\n</ul>\n<h2 style=\"text-align: center;\">Схема насоса Иртыш ПД</h2>\n<p style=\"text-align: right;\"><a class=\"lightview\" title=\"shema-nasos-irtish-pd\" rel=\"lightbox\" href=\"/image_upload/nasos/2c3d41324116512f238ae8e8710d3978.jpg\"></a>&nbsp;</p>\n<p><img class=\"modalL\" style=\"float: right; margin-left: 10px; margin-right: 10px;\" title=\"Схема дренажного насоса Иртыш ПД\" src=\"/image_upload/nasos/.thumbs/2c3d41324116512f238ae8e8710d3978_0_500_0.jpg\" alt=\"Схема дренажного насоса Иртыш ПД\" width=\"288\" height=\"500\" /></p>\n<ul>\n<li>1 - Электродвигатель,&nbsp;</li>\n<li>2 - Колесо рабочее,&nbsp;</li>\n<li>3 - Корпус спиральный,&nbsp;</li>\n<li>4 - Торцовое уплотнение (манжета),&nbsp;</li>\n<li>5 - Торцовое уплотнение,&nbsp;</li>\n<li>6 - Встроенный кабель (-ли),&nbsp;</li>\n<li>7 - Поплавковый выключатель,&nbsp;</li>\n<li>8 - Пробка масляной камеры,&nbsp;</li>\n<li>9 - Метизы крепления корпуса камеры и стакана подшипника к корпусу электродвигателя,&nbsp;</li>\n<li>10 - Метизы крепления колеса рабочего (с шайбой),&nbsp;</li>\n<li>11 - Подшипник,&nbsp;</li>\n<li>12 - Подшипник (-ки),&nbsp;</li>\n<li>13 - Датчик влажности,&nbsp;</li>\n<li>14 - Подставка-фильтр,&nbsp;</li>\n<li>15 - Корпус камеры,&nbsp;</li>\n<li>16 - Метизы крепления корпуса камеры (корпуса электродвигателя для насосов &laquo;Иртыш&raquo; ПД 50/125 &ndash; 3/2) к корпусу спиральному,&nbsp;</li>\n<li>17 - Стакан подшипника,&nbsp;</li>\n<li>18 - Корпус электродвигателя,&nbsp;</li>\n<li>19 - Метизы крепления крышки камеры к корпусу камеры,&nbsp;</li>\n<li>20 - Крышка камеры.</li>\n</ul>\n<p>&nbsp;</p>', 'nasos-irtysh-pd', 3, 20, 1, 0, 'nasosy-pd-irtysh.png', 'nasos-irtysh-pd.png', '144', '172', 0, 0, '', '', '2017-01-31', 0),
(2, 0, 'Доставка', 'Доставка', 'Доставка', NULL, 'Доставка удобной вам транспортной компанией по РФ и СНГ, до терминала - бесплатно.', 0, NULL, '<div class=\"dostavka_text\">\n    <img src=\"/image/dostavka.jpg\" alt=\"\">\n    <p>Организуем доставку в любую точку России и СНГ удобной для вас транспортной компанией. Доставка до терминала бесплатно.</p>\n    <p><a href=\"#\">Автотрейдинг</a>    <a href=\"#\">Байкал-Сервис</a>   <a href=\"#\">Деловые линии</a>    <a href=\"#\">ЖелдорАльянс</a>    <a href=\"#\">ЖелДорЭкспедиция</a>    <a href=\"#\">ПЭК</a></p>\n    <p>По Вашему желанию можем организовать экспресс-доставку ведущими компаниями:</p>\n    <p><a href=\"#\">Гарантпост</a>    <a href=\"#\">СПСР-Экспресс</a>   <a href=\"#\">Спецсвязь России</a>    <a href=\"#\">Даймэкс</a>    <a href=\"#\">DHL</a>    <a href=\"#\">UPS</a></p>\n</div>', 'dostavka', 1, 0, 1, 0, NULL, '', '', '', NULL, 0, '', '', '0000-00-00', 0),
(3, 0, 'Контакты', 'Контакты', 'Контакты', '0', 'Наш адрес: 39406, Россия, г. Воронеж, ул. Солнечная, д. 12в, оф. 46. Тел./факс: +7 (473) 254-08-01', 0, '', '<div class=\"dostavka_text\">\n<br/><br/><br/><br/><br/>\n<p><strong>Адрес:</strong></p>\n<p>394026, Россия, г. Воронеж, ул. Солнечная, д. 12в, оф. 46</p>\n<p><strong>Часы работы:</strong></p>\n<p>Рабочие дни: Пн - Пт с 9.00 - 18.00 (по МСК)&nbsp;</p>\n<p>Выходные дни: Сб, Вс.</p>\n<p><strong>Тел./факс:</strong></p>\n<p>+7 (473) 254-08-01</p>\n<p>+7 (473) 254-08-15</p>\n<p><strong>E-mail:</strong></p>\n<p>ptsvrn@mail.ru - для заявок.</p>\n<p><strong>Схема проезда:</strong></p>\n<!--<script type=\"text/javascript\" charset=\"utf-8\" src=\"//api-maps.yandex.ru/services/constructor/1.0/js/?sid=ARZWQHRSkIQ543y9boAAMFayNxkElcF5&width=600&height=450\"></script>-->\n<a class=\"dg-widget-link\" href=\"https://2gis.ru/voronezh/firm/4363391420487516/center/39.16561603546143,51.68919924626442/zoom/16?utm_medium=widget-source&utm_campaign=firmsonmap&utm_source=bigMap\">Посмотреть на карте Воронежа</a><div class=\"dg-widget-link\"><a href=\"https://2gis.ru/voronezh/center/39.165615,51.688266/zoom/16/routeTab/rsType/bus/to/39.165615,51.688266╎ПромТеплоСтрой, ООО, компания?utm_medium=widget-source&utm_campaign=firmsonmap&utm_source=route\">Найти проезд до ПромТеплоСтрой, ООО, компания</a></div><script charset=\"utf-8\" src=\"https://widgets.2gis.com/js/DGWidgetLoader.js\"></script><script charset=\"utf-8\">new DGWidgetLoader({\"width\":600,\"height\":450,\"borderColor\":\"#a3a3a3\",\"pos\":{\"lat\":51.68919924626442,\"lon\":39.16561603546143,\"zoom\":16},\"opt\":{\"city\":\"voronezh\"},\"org\":[{\"id\":\"4363391420487516\"}]});</script><noscript style=\"color:#c00;font-size:16px;font-weight:bold;\">Виджет карты использует JavaScript. Включите его в настройках вашего браузера.</noscript></div>', 'contacts', 1, 100, 1, 0, NULL, '', '144', '172', NULL, 0, '', '', '0000-00-00', 0),
(220, 5, 'Насосы Иртыш ЦМК', 'Центробежный моноблочный консольный насос Иртыш ЦМК', 'Насос ЦМК Иртыш ', '0', 'Центробежный моноблочный консольный насос унифицированного ряда Иртыш ЦМК предназначен для перегона чистый воды в стационарных условиях. Насосы серии ЦМК являются насосами сухого типа.', 0, '', '<p class=\"MsoNormal\"><span>Насос Иртыш ЦМК &ndash; это центробежный моноблочный консольный насос унифицированного ряда, используемый в стационарных условиях и предназначенный для перекачки незагрязненной жидкости с возможным содержанием твердых включений объемом не более 0,1% и размером не более 0,2 миллиметров.</span></p>\n<p class=\"MsoNormal\"><span style=\"font-weight: bold;\">В роли жидкостей могут выступать:</span></p>\n<ul>\n<li>Вода в отопительных системах</li>\n<li>Чистая производственно-техническая вода</li>\n<li>Водогликолевая смесь</li>\n</ul>\n<h2 style=\"text-align: center;\"><span>&nbsp;</span><strong>Области применения насоса ЦМК:</strong></h2>\n<ul>\n<li>Водоснабжение (горячее, холодное)</li>\n<li>Отопительные системы</li>\n<li>Системы промышленного назначения</li>\n<li>Системы кондиционирования воздуха и охлаждения</li>\n<li>Орошающие установки и установки пожаротушения</li>\n</ul>\n<p>Данный вид насосов является насосом сухого типа и используется при техническом оборудовании зданий и сооружений.</p>\n<h2 style=\"text-align: center;\"><strong><span>Насос ЦМК &ndash; состав и принцип работы</span></strong></h2>\n<p class=\"MsoNormal\"><span>Одноступенчатый циркуляционный насос ЦМК подразумевает под собой центробежный моноблочный консольный насос низкого давления, имеющий при работе всего одну скорость.</span></p>\n<p class=\"MsoNormal\"><span>Насосы серии ЦМК изготавливаются из чугуна СЧ20 (серый чугун) и имеют компактное исполнение в отличие от своих аналогов. </span></p>\n<p class=\"MsoNormal\">Технические характеристики ротора электрического двигателя выполнены так, что он одновременно является и валом насоса, необходимый для установки на него рабочего колеса закрытого типа и скользящего торцевого уплотнения. При работе ротора его вращение происходит строго по часовой стрелке.</p>\n<p class=\"MsoNormal\">Запрещается эксплуатация насоса при подаче большей технически допустимой. За счет увеличения давления на вал насоса, может произойти перегрузка самого двигателя и при этом резко ухудшится всасывающая способность насоса ЦМК.</p>\n<h2 style=\"text-align: center;\"><strong><span>Технические характеристики насосов ЦМК:</span></strong><strong>&nbsp;</strong></h2>\n<ul>\n<li class=\"MsoNormal\"><span>Водородный показатель,</span><span>&nbsp;</span><span lang=\"EN-US\">pH</span><span>&nbsp;</span><span>&ndash; от 6 до 9</span></li>\n<li class=\"MsoNormal\"><span>Температура среды по Цельсию &ndash; от      -10 до +140 градусов</span></li>\n<li class=\"MsoNormal\"><span>Температура окружающий среды по      Цельсию - +40 градусов</span></li>\n<li class=\"MsoNormal\"><span>Степень защиты &ndash;</span><span>&nbsp;</span><span lang=\"EN-US\">IP54,</span></li>\n<li class=\"MsoNormal\"><span>Мощность двигателя, кВт - от      1,1 до 200</span></li>\n<li class=\"MsoNormal\"><span>Обороты двигаителя, об./мин. -      от 1 500 до 3 000</span></li>\n<li class=\"MsoNormal\"><span>Напор, м. - от 4 до 150 метров</span></li>\n<li class=\"MsoNormal\"><span>Длина кабеля, м. - от 10 до 100      метров</span></li>\n<li class=\"MsoNormal\"><span>Производительность, м3/ч - от 5      до 1 600</span></li>\n</ul>\n<h2 style=\"text-align: center;\"><strong><span>Условное обозначение&nbsp;</span></strong></h2>\n<p class=\"MsoNormal\"><strong><span>Вид обозначения:</span></strong><span>&nbsp;ИРТЫШ-ЦМК1 32/125-1,5/2</span></p>\n<ul>\n<li class=\"MsoNormal\"><strong>ИРТЫШ&nbsp;</strong><span>- серия насоса</span></li>\n<li class=\"MsoNormal\"><strong><span>ЦМК&nbsp;</span></strong><span>- Центробежный Моноблочный Консольный      насос</span></li>\n<li class=\"MsoNormal\"><strong><span>1&nbsp;</span></strong><span>- вариант подрезки рабочего      колеса </span></li>\n<li class=\"MsoNormal\"><strong><span>32&nbsp;</span></strong><span>- условный проход напорного      патрубка </span></li>\n<li class=\"MsoNormal\"><strong><span>125&nbsp;</span></strong><span>- номинальный диаметр рабочего      колеса</span></li>\n<li class=\"MsoNormal\"><strong><span>1,5&nbsp;</span></strong><span>- номинальная мощность      электродвигателя</span></li>\n<li class=\"MsoNormal\"><strong><span>2 </span></strong><span>- число полюсов      электродвигателя</span></li>\n</ul>\n<h2 style=\"text-align: center;\"><span>&nbsp;</span><strong>Состав насоса Иртыш ЦМК</strong><strong><span lang=\"EN-US\">:</span></strong><span style=\"font-weight: bold;\">&nbsp;</span></h2>\n<ul>\n<li class=\"MsoNormal\"><span>Корпус насоса</span></li>\n<li class=\"MsoNormal\"><span>Двигатель с удлиненным валом</span></li>\n<li class=\"MsoNormal\"><span>Рабочее колесо</span></li>\n<li class=\"MsoNormal\"><span>Уплотнитель вала</span></li>\n</ul>\n<h2 style=\"text-align: center;\">&nbsp;<strong>Насос Иртыш ЦМК</strong><strong><span lang=\"EN-US\">:</span></strong><span style=\"font-weight: bold;\">&nbsp;</span></h2>\n<p><span style=\"font-weight: bold;\"><img class=\"modalL\" style=\"float: right; margin-left: 10px; margin-right: 10px;\" title=\"Схема насоса Иртыш ЦМК\" src=\"/image_upload/nasos/shema-nasos-irtysh-cmk.jpg\" alt=\"Схема насоса Иртыш ЦМК\" width=\"400\" height=\"225\" /></span></p>\n<ul>\n<li>1 &ndash; корпус спиральный</li>\n<li>2 &ndash; рабочее колесо&nbsp;</li>\n<li>3 &ndash; торцовое уплотнение&nbsp;</li>\n<li>4 &ndash; прокладка&nbsp;</li>\n<li>5 &ndash; метизы крепления корпуса спирального и фланца проставки&nbsp;</li>\n<li>6 &ndash; спецболт крепления колеса рабочего&nbsp;</li>\n<li>7 &ndash; кран Маевского&nbsp;</li>\n<li>8 &ndash; электродвигатель</li>\n<li>9 &ndash; проставка&nbsp;</li>\n<li>10 &ndash; отбойник&nbsp;</li>\n<li>11 &ndash; рым-болт&nbsp;</li>\n<li>12 &ndash; фланец&nbsp;</li>\n<li>13 &ndash; метизы крепления простаки и корпуса электродвигателя&nbsp;</li>\n<li>14 &ndash; метизы крепления проставки и фланца</li>\n</ul>\n<p>&nbsp;</p>\n<p class=\"MsoNormal\"><span>&nbsp;</span></p>', 'nasos-irtysh-cmk', 3, 100, 1, 0, 'nasos-irtysh-cmk.jpg', 'nasos-irtysh-cmk.png', '144', '172', 0, 0, '', '', '2017-06-25', 0),
(5, 0, 'Каталог', '', '', '0', 'Каталог продукции насосов серии Иртыш ПФ, ПФС, НФ, НФС, ПД и другие.', 0, '', '', 'katalog', 2, 100, 1, 0, '', '', '144', '172', 0, 0, '', '', '2017-01-24', 0),
(6, 5, 'Насосы Иртыш ПФ', 'Фекальный погружной насос Иртыш ПФ2, ПФ1, ПФ', 'Насос Иртыш ПФ', '0', 'Фекальный погружной насос Иртыш ПФ, ПФ1, ПФ2 предназначен для перекачки загрязненных вод с возможным включением твердых, неабразивных частиц. Допускается эксплуатация в тяжелых условиях при минимальном его техническом обслуживании. \n', 0, '', '<p class=\"MsoNormal\">Основным предназначением фекального насоса Иртыш является перекачка загрязненных вод с возможным содержанием в них крупноволокнистых и механических компонентов.&nbsp; Данная серия погружных насосов прекрасно подходит для эксплуатации в тяжелых условиях пребывания при минимальном их обслуживании.&nbsp;</p>\n<p class=\"MsoNormal\"><strong>В роли загрязненных жидкостей могут выступать:</strong></p>\n<ul>\n<li>Сточные воды промышленного и бытового характера,</li>\n<li>Фекальные и грязевые воды,</li>\n<li>Воды с содержанием в них твердых неабразивных частиц.</li>\n</ul>\n<p>Так же насосы Иртыш ПФ, Иртыш ПФ1 и Иртыш ПФ2 прекрасно подходят для забора воды из водохранилищ, озер и рек.</p>\n<h2 style=\"text-align: center;\">Насос Иртыш &ndash; состав и принцип работы</h2>\n<p class=\"MsoNormal\">Фекальный насос Иртыш представляет собой моноблочное устройство вертикального погружения, созданное из прочного антикоррозийного материала. В состав насоса входит асинхронный, промышленный двигатель, имеющий высокую степень защиты - <span lang=\"EN-US\">IP</span>68. Ряд моделей так же имеют дополнение в виде специального устройства для измельчения крупноволокнистых включений от 3 до 100 миллиметров, в зависимости от типа насоса.</p>\n<h2 style=\"text-align: center;\"><span style=\"font-weight: bold;\">Технические характеристики насосов Иртыш ПФ:</span></h2>\n<ul>\n<li class=\"MsoNormal\">Водородный показатель, <span lang=\"EN-US\">pH</span> &ndash; от 6 до 9,</li>\n<li class=\"MsoNormal\">Температура среды по Цельсию &ndash; до 50      градусов,</li>\n<li class=\"MsoNormal\">Плотность жидкости &ndash; 1&nbsp;100 кг/м<sup>3</sup>,</li>\n<li class=\"MsoNormal\">Абразивные включения (концентрация не      более одного процента от объема) &ndash; до 5 миллиметров,</li>\n<li class=\"MsoNormal\">Степень защиты &ndash; <span lang=\"EN-US\">IP68,</span></li>\n<li class=\"MsoNormal\">Мощность двигателя, кВт - от 1,1 до 200,</li>\n<li class=\"MsoNormal\">Обороты двигаителя, об./мин. - от 750 до 3 000,</li>\n<li class=\"MsoNormal\">Напор, м. - от 4 до 80 метров,</li>\n<li class=\"MsoNormal\">Длина кабеля, м. - от 10 до 100 метров</li>\n<li class=\"MsoNormal\">Производительность, м3/ч - от 7 до 2 200</li>\n</ul>\n<h2 style=\"text-align: center;\">Условное обозначение - Иртыш ПФ1, ПФ2&nbsp;</h2>\n<p><strong>Вид обозначения:</strong> ИРТЫШ ПФ2 65/135.120 - 3/2 - 016</p>\n<ul>\n<li><strong>ИРТЫШ&nbsp;</strong>- серия насоса</li>\n<li><strong>П&nbsp;</strong>- тип электродвигателя</li>\n<li><strong>Ф&nbsp;</strong>- тип гидравлической части насоса</li>\n<li><strong>2&nbsp;</strong>- тип рабочего колеса</li>\n<li><strong>65&nbsp;</strong>- номинальный диаметр напорного патрубка</li>\n<li><strong>135&nbsp;</strong>- номинальный диаметр рабочего колеса</li>\n<li><strong>120&nbsp;</strong>- фактический диаметр рабочего колеса</li>\n</ul>\n<p><span style=\"font-weight: bold;\">Конструктивные особенности:</span></p>\n<ul>\n<li><strong>3&nbsp;</strong>- наминальная мощность электродвигателя</li>\n<li><strong>2&nbsp;</strong>- число плюсов электродвигателя</li>\n<li><strong>0&nbsp;</strong>- мобильный погружной</li>\n<li><strong>1&nbsp;</strong>- ручное управление</li>\n<li><strong>6&nbsp;</strong>- влаготермозащита</li>\n</ul>\n<h2 style=\"text-align: center;\">Состав насоса Иртыш входит<span lang=\"EN-US\">:</span></h2>\n<ul>\n<li class=\"MsoNormal\">Электродвигатель,</li>\n<li class=\"MsoNormal\">Гидравлическая часть,</li>\n<li class=\"MsoNormal\">Система влаго и термозащиты,</li>\n<li class=\"MsoNormal\">Щита управления;</li>\n<li class=\"MsoNormal\">Поплавковый выключатель,</li>\n<li class=\"MsoNormal\">Дополнительные устройства.</li>\n</ul>\n<h2 style=\"text-align: center;\">Схема насоса Иртыш<span lang=\"EN-US\">:</span></h2>\n<p><strong><strong><span lang=\"EN-US\"><img class=\"modalL\" style=\"float: right;\" title=\"Состав насоса - Иртыш ПФ (ПФС)\" src=\"/image_upload/nasos/4a7aa2aec9a2a920e5d35e4d992f6d18.jpg\" alt=\"Состав насоса - Иртыш ПФ (ПФС)\" width=\"207\" height=\"300\" /></span></strong></strong></p>\n<ul>\n<li>1 - Зажим кабеля</li>\n<li>2 - Уплотнитель кабеля</li>\n<li>3 - Кабель</li>\n<li>4 - Подшипник</li>\n<li>5 - Стакан подшипника</li>\n<li>6 - Датчик влажности</li>\n<li>7 - Рабочее колесо</li>\n<li>8 - Подставка</li>\n<li>9 - Крышка уплотнительная</li>\n<li>10 - Крышка верхняя</li>\n<li>11 - Колодка клемная</li>\n<li>12 - Опора подшипника</li>\n<li>13 - Датчик температуры (терморезистр)</li>\n<li>14 - Ротор с валом</li>\n<li>15 - Корпус со статором</li>\n<li>16 - Торцевое уплотнение</li>\n<li>17 - Корпус масляной камеры</li>\n<li>18 - Корпус спиральный</li>\n</ul>\n<p>Благодаря своим малогабаритным характеристикам они так же прекрасно подходят для аварийного запаса при обслуживании канализационных систем или орошения полей в сельском хозяйстве.&nbsp;</p>', 'nasos-irtysh-pf2-pf-pf1', 3, 10, 1, 0, 'nasosy-pf-pfs-irtysh.png', 'nasos-irtysh-pf.png', '144', '172', 0, 0, '', '', '2017-01-24', 0),
(8, 5, 'Насосы Иртыш НФС', 'Насос Иртыш НФС - фекальный, с вихревым колесом', 'Насос Иртыш НФС', '0', 'Насос Иртыш НФС – это фекальный насос, с вихревым колесом. Используется для перекачки сточных и промышленных вод. Данная серия насосов оснащаются защищенными общепромышленными двигателями.', 0, '', '<p class=\"MsoNormal\">Фекальный, с вихревым колесом насос серии Иртыш НФС успешно применяется для перекачки вод промышленного и бытового назначения с возможным содержанием в них взвешенных, неабразивных и взвешенных абразивных частиц.</p>\n<p class=\"MsoNormal\"><strong>Виды загрязненных жидкостей:</strong></p>\n<ul>\n<li>Фекальные воды</li>\n<li>Сточные воды</li>\n<li>Промышленные отходы</li>\n</ul>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p><span style=\"font-weight: bold;\">Область применения насосов Иртыш НФС:</span></p>\n<ul>\n<li>Водное хозяйство и ЖКХ</li>\n<li>Бытовое применение</li>\n<li>Промышленные системы</li>\n</ul>\n<p>Данная серия насосов так же применяется в случае аварийных ситуаций, когда срочно требуется произвести откачку различного рода жидкостей из затопленных подвалов или колодцев.&nbsp;</p>\n<p>Так же Иртыш НФС прекрасно используется для орошения или осушения земель сельскохозяйственного назначения.</p>\n<h2 style=\"text-align: center;\"><strong>Насос Иртыш НФС &ndash; состав и принцип работы</strong></h2>\n<p class=\"MsoNormal\">Насосы фекальные с вихревым колесом Иртыш НФС представляют собой лопастное моноблочное устройство с электроприводом и открытым рабочим колесом. Имеют вертикальное исполнение и изготавливаются из специальных антикоррозионных материалов, за счет которых достигается долговечность эксплуатации насоса и его надежность при эксплуатации.&nbsp;</p>\n<p class=\"MsoNormal\">Внутри насоса находится трехфазный, общепромышленный асинхронный двигатель, который имеет высокую степень своей защищенности &ndash; IP54. В зависимости от своей комплектации, насосы серии Иртыш НФС могут обладать встроенными в обмотку термическими датчиками, которые в случае превышения допустимых показателей температуры произведут моментальное отключение электродвигателя насоса и сохранят его работоспособность. Так как охлаждение электродвигателя происходит за счет окружающей его среды.</p>\n<h2 style=\"text-align: center;\"><span style=\"font-weight: bold;\">Технические характеристики насоса Иртыш НФС:</span></h2>\n<ul>\n<li>Водородный показатель, pH &ndash; от 6 до 9,</li>\n<li>Температура среды по Цельсию &ndash; до 50 градусов,</li>\n<li>Температура окружающей среды по Цельсию &ndash; до 40 градусов,</li>\n<li>Плотность жидкости &ndash; 1 100 кг/м3,</li>\n<li>Абразивные включения (концентрация не более одного процента от объема) &ndash; до 5 миллиметров,</li>\n<li>Неабразивные, коротковолокнистые включения, концентрация по массе &ndash; до 2 процентов,</li>\n<li>Степень защиты &ndash; IP54.</li>\n</ul>\n<p>&nbsp;</p>\n<h2 style=\"text-align: center;\">Условное обозначение - Иртыш НФС&nbsp;</h2>\n<p><strong>Вид обозначения:</strong> ИРТЫШ НФС 50/125.98 - 1,1/2 - 311</p>\n<ul>\n<li><strong>ИРТЫШ&nbsp;</strong>- серия насоса</li>\n<li><strong>Н&nbsp;</strong>- тип электродвигателя, наружный</li>\n<li><strong>Ф&nbsp;</strong>- тип гидравлической части насоса, Ф - для сточных масс</li>\n<li><strong>С&nbsp;</strong>- тип рабочего колеса, вихревое рабочее колесо</li>\n<li><strong>50&nbsp;</strong>- номинальный диаметр напорного патрубка</li>\n<li><strong>125&nbsp;</strong>- номинальный диаметр рабочего колеса</li>\n<li><strong>98&nbsp;</strong>- фактический диаметр рабочего колеса</li>\n</ul>\n<p><span style=\"font-weight: bold;\">Конструктивные особенности:</span></p>\n<ul>\n<li><strong>1,1&nbsp;</strong>- наминальная мощность электродвигателя</li>\n<li><strong>2&nbsp;</strong>- число плюсов электродвигателя</li>\n<li><strong>3&nbsp;</strong>- стационарный моноблочный вертикальный</li>\n<li><strong>1&nbsp;</strong>- ручное управление</li>\n<li><strong>1&nbsp;</strong>- термозащита</li>\n</ul>\n<h2 style=\"text-align: center;\">Состав насоса НФС<span lang=\"EN-US\">:</span></h2>\n<ul>\n<li class=\"MsoNormal\">Электродвигатель,</li>\n<li class=\"MsoNormal\">Гидравлическая часть,</li>\n<li class=\"MsoNormal\">Система влаго и термозащиты,</li>\n<li class=\"MsoNormal\">Щита управления;</li>\n<li class=\"MsoNormal\">Поплавковый выключатель,</li>\n<li class=\"MsoNormal\">Дополнительные устройства.</li>\n</ul>\n<h2 style=\"text-align: center;\">Схема насоса Иртыш НФС<span lang=\"EN-US\">:</span></h2>\n<p><strong><strong><span lang=\"EN-US\"><img class=\"modalL\" style=\"float: right;\" title=\"Состав насоса - Иртыш НФС\" src=\"/image_upload/files/sostav-nasos-irtysh-nf2-nf.jpg\" alt=\"Состав насоса - Иртыш НФС\" width=\"240\" /></span></strong></strong></p>\n<ul>\n<li>1 - корпус &nbsp;спиральный</li>\n<li>2 - колесо &nbsp;рабочее &nbsp;(свободновихревое &nbsp;открытого &nbsp;типа для электронасоса \"Иртыш\" НФс)</li>\n<li>3 - торцовое уплотнение</li>\n<li>4 - патрубок входной</li>\n<li>5 - винт крепления корпуса спирального</li>\n<li>6 - винт крепления колеса рабочего</li>\n<li>7 - кран Маевского</li>\n<li>8 - электродвигатель</li>\n<li>9 - пробка</li>\n<li>10 - проставка</li>\n<li>11 - строповочная проушина</li>\n</ul>\n<p>&nbsp;</p>', 'nasosy-irtysh-nfs', 3, 100, 1, 0, 'nasos-irtysh-nfs.png', 'nasos-irtysh-nf.png', '144', '172', 0, 0, '', '', '2017-01-31', 0),
(10, 6, 'ПФ2 50/140.138-3/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 22; Мощность двигателя, кВт: 3; Частота вращения, об/мин: 3000;', '', 'pf2-50-140-138-3-2-016', 4, 0, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(11, 6, 'ПФ2 50/140.138-3/2-036', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 22; Мощность двигателя, кВт: 3; Частота вращения, об/мин: 3000;', '', 'pf2-50-140-138-3-2-036', 4, 1, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(12, 6, 'ПФ2 50/200.180-11/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 45; Напор, м: 34; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 3000;', '', 'pf2-50-200-180-11-2-016', 4, 2, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(13, 6, 'ПФ2 50/200.195-15/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 55; Напор, м: 42; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 3000;', '', 'pf2-50-200-195-15-2-016', 4, 3, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(14, 6, 'ПФ2 50/200.212-18,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 60; Напор, м: 50; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 3000;', '', 'pf2-50-200-212-18-5-2-016', 4, 4, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(15, 6, 'ПФ2 65/135.132-4/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 45; Напор, м: 15; Мощность двигателя, кВт: 4; Частота вращения, об/мин: 3000;', '', 'pf2-65-135-132-4-2-016', 4, 5, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(16, 6, 'ПФ2 65/155.153-5,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 50; Напор, м: 22; Мощность двигателя, кВт: 5,5; Частота вращения, об/мин: 3000;', '', 'pf2-65-155-153-5-5-2-016', 4, 6, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(17, 6, 'ПФ1 65/160.132-3/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 15; Мощность двигателя, кВт: 3; Частота вращения, об/мин: 3000;', '', 'pf1-65-160-132-3-2-016', 4, 7, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(18, 6, 'ПФ1 65/160.132-3/2-036', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 15; Мощность двигателя, кВт: 3; Частота вращения, об/мин: 3000;', '', 'pf1-65-160-132-3-2-036', 4, 8, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(19, 6, 'ПФ2 65/165.165-7,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 40; Напор, м: 30; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 3000;', '', 'pf2-65-165-165-7-5-2-016', 4, 9, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(20, 6, 'ПФ2 65/180.130-4/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 30; Напор, м: 15; Мощность двигателя, кВт: 4; Частота вращения, об/мин: 3000;', '', 'pf2-65-180-130-4-2-016', 4, 10, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(21, 6, 'ПФ2 65/180.130-5,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 60; Напор, м: 12; Мощность двигателя, кВт: 5,5; Частота вращения, об/мин: 3000;', '', 'pf2-65-180-130-5-5-2-016', 4, 11, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(22, 6, 'ПФ2 65/180.140-7,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 60; Напор, м: 15; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 3000;', '', 'pf2-65-180-140-7-5-2-016', 4, 12, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(23, 6, 'ПФ2 65/200.180-18,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 80; Напор, м: 34; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 3000;', '', 'pf2-65-200-180-18-5-2-016', 4, 13, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(24, 6, 'ПФ2 65/200.180-22/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 32; Мощность двигателя, кВт: 22; Частота вращения, об/мин: 3000;', '', 'pf2-65-200-180-22-2-016', 4, 14, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(25, 6, 'ПФ2 65/200.195-30/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 40; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 3000;', '', 'pf2-65-200-195-30-2-016', 4, 15, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(26, 6, 'ПФ2 65/200.210-37/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 110; Напор, м: 50; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 3000;', '', 'pf2-65-200-210-37-2-016', 4, 16, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(27, 6, 'ПФ2 65/250.240-37/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 70; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 3000;', '', 'pf2-65-250-240-37-2-016', 4, 17, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(28, 6, 'ПФ2 65/250.258-5,5/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 40; Напор, м: 21; Мощность двигателя, кВт: 5,5; Частота вращения, об/мин: 1500;', '', 'pf2-65-250-258-5-5-4-016', 4, 18, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(29, 6, 'ПФ2 65/250.258-7,5/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 60; Напор, м: 19; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 1500;', '', 'pf2-65-250-258-7-5-4-016', 4, 19, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(30, 6, 'ПФ2 65/250.258-45/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 80; Мощность двигателя, кВт: 45; Частота вращения, об/мин: 3000;', '', 'pf2-65-250-258-45-2-016', 4, 20, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(31, 6, 'ПФ2 80/315.250-7,5/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 70; Напор, м: 16; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 1500;', '', 'pf2-80-315-250-7-5-4-016', 4, 21, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(32, 6, 'ПФ2 80/315.280-11/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 80; Напор, м: 22; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 1500;', '', 'pf2-80-315-280-11-4-016', 4, 22, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(33, 6, 'ПФ2 80/315.290-15/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 25; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 1500;', '', 'pf2-80-315-290-15-4-016', 4, 23, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(34, 6, 'ПФ2 80/315.312-18,5/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 30; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 1500;', '', 'pf2-80-315-312-18-5-4-016', 4, 24, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(35, 6, 'ПФ2 100/150.150-7,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 70; Напор, м: 22; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 3000;', '', 'pf2-100-150-150-7-5-2-016', 4, 25, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(36, 6, 'ПФ1 100/240.238-5,5/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 70; Напор, м: 12; Мощность двигателя, кВт: 5,5; Частота вращения, об/мин: 1500;', '', 'pf1-100-240-238-5-5-4-016', 4, 26, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(37, 6, 'ПФ1 100/240.238-7,5/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 11; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 1500;', '', 'pf1-100-240-238-7-5-4-016', 4, 27, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(38, 6, 'ПФ2 100/310.310-15/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 87; Напор, м: 28; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 1500;', '', 'pf2-100-310-310-15-4-016', 4, 28, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(39, 6, 'ПФ2 125/315.290-18,5/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 160; Напор, м: 25; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 1500;', '', 'pf2-125-315-290-18-5-4-016', 4, 29, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(40, 6, 'ПФ2 125/315.290-22/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 22; Мощность двигателя, кВт: 22; Частота вращения, об/мин: 1500;', '', 'pf2-125-315-290-22-4-016', 4, 30, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(41, 6, 'ПФ2 125/315.300-30/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 250; Напор, м: 20; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 1500;', '', 'pf2-125-315-300-30-4-016', 4, 31, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(42, 6, 'ПФ2 125/315.336-11/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 150; Напор, м: 15; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 1000;', '', 'pf2-125-315-336-11-6-016', 4, 32, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(43, 6, 'ПФ2 125/315.336-37/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 250; Напор, м: 30; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 1500;', '', 'pf2-125-315-336-37-4-016', 4, 33, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(44, 6, 'ПФ2 125/400.340-37/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 32; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 1500;', '', 'pf2-125-400-340-37-4-016', 4, 34, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(45, 6, 'ПФ2 125/400.360-11/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 125; Напор, м: 15; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 1000;', '', 'pf2-125-400-360-11-6-016', 4, 35, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(46, 6, 'ПФ2 125/400.370-45/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 40; Мощность двигателя, кВт: 45; Частота вращения, об/мин: 1500;', '', 'pf2-125-400-370-45-4-016', 4, 36, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(47, 6, 'ПФ2 125/400.380-15/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 150; Напор, м: 18; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 1000;', '', 'pf2-125-400-380-15-6-016', 4, 37, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(48, 6, 'ПФ2 125/400.406-18,5/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 125; Напор, м: 22; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 1000;', '', 'pf2-125-400-406-18-5-6-016', 4, 38, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(49, 6, 'ПФ2 125/400.406-45/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 160; Напор, м: 50; Мощность двигателя, кВт: 45; Частота вращения, об/мин: 1500;', '', 'pf2-125-400-406-45-4-016', 4, 39, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(50, 6, 'ПФ2 125/400.406-55/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 52; Мощность двигателя, кВт: 55; Частота вращения, об/мин: 1500;', '', 'pf2-125-400-406-55-4-016', 4, 40, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(51, 6, 'ПФ2 150/205.205-7,5/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 7; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 1500;', '', 'pf2-150-205-205-7-5-4-016', 4, 41, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(52, 6, 'ПФ2 150/315.315-37/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 350; Напор, м: 16; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 1500;', '', 'pf2-150-315-315-37-4-016', 4, 42, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(53, 6, 'ПФ2 150/315.320-11/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 9; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 1000;', '', 'pf2-150-315-320-11-6-016', 4, 43, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(54, 6, 'ПФ2 150/315.325-45/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 350; Напор, м: 20; Мощность двигателя, кВт: 45; Частота вращения, об/мин: 1500;', '', 'pf2-150-315-325-45-4-016', 4, 44, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(55, 6, 'ПФ2 150/315.332-18,5/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 250; Напор, м: 10; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 1000;', '', 'pf2-150-315-332-18-5-6-016', 4, 45, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(56, 6, 'ПФ2 150/315.332-45/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 350; Напор, м: 23; Мощность двигателя, кВт: 45; Частота вращения, об/мин: 1500;', '', 'pf2-150-315-332-45-4-016', 4, 46, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(57, 6, 'ПФ2 150/315.340-55/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 450; Напор, м: 20; Мощность двигателя, кВт: 55; Частота вращения, об/мин: 1500;', '', 'pf2-150-315-340-55-4-016', 4, 47, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(58, 6, 'ПФ2 150/315.365-15/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 15; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 1000;', '', 'pf2-150-315-365-15-6-016', 4, 48, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(59, 6, 'ПФ2 150/315.365-22/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 250; Напор, м: 14; Мощность двигателя, кВт: 22; Частота вращения, об/мин: 1000;', '', 'pf2-150-315-365-22-6-016', 4, 49, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0);
INSERT INTO `sections` (`id`, `parent_id`, `name`, `title`, `h1`, `keywords`, `description`, `noindex`, `smalltext`, `fulltext`, `virtual_name`, `template_id`, `num`, `show`, `counter`, `s_image`, `m_image`, `width`, `height`, `blocked_admin`, `blocked_manager`, `url`, `url_rus`, `date`, `timestamp`) VALUES
(60, 6, 'ПФ3 150/400.370-15/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 14; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 1000;', '', 'pf3-150-400-370-15-6-016', 4, 50, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(61, 6, 'ПФ3 150/400.370-18,5/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 250; Напор, м: 9; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 1000;', '', 'pf3-150-400-370-18-5-6-016', 4, 51, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(62, 6, 'ПФ3 150/400.390-22/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 18; Мощность двигателя, кВт: 22; Частота вращения, об/мин: 1000;', '', 'pf3-150-400-390-22-6-016', 4, 52, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(63, 6, 'ПФ3 150/400.410-30/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 270; Напор, м: 21; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 1000;', '', 'pf3-150-400-410-30-6-016', 4, 53, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(64, 6, 'ПФ2 150/470.468-30/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 28; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 1000;', '', 'pf2-150-470-468-30-6-016', 4, 54, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(65, 6, 'ПФ4 150/500.465-160/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 400; Напор, м: 70; Мощность двигателя, кВт: 160; Частота вращения, об/мин: 1500;', '', 'pf4-150-500-465-160-4-016', 4, 55, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(66, 6, 'ПФ4 150/500.500-200/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 400; Напор, м: 80; Мощность двигателя, кВт: 200; Частота вращения, об/мин: 1500;', '', 'pf4-150-500-500-200-4-016', 4, 56, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(67, 6, 'ПФ2 200/220.218-11/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 300; Напор, м: 7; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 1500;', '', 'pf2-200-220-218-11-4-016', 4, 57, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(68, 6, 'ПФ2 200/265.265-18,5/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 250; Напор, м: 15; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 1500;', '', 'pf2-200-265-265-18-5-4-016', 4, 58, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(69, 6, 'ПФ2 200/360.338-22/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 400; Напор, м: 10; Мощность двигателя, кВт: 22; Частота вращения, об/мин: 1000;', '', 'pf2-200-360-338-22-6-016', 4, 59, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(70, 6, 'ПФ3 200/400.470-200/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 800; Напор, м: 60; Мощность двигателя, кВт: 200; Частота вращения, об/мин: 1500;', '', 'pf3-200-400-470-200-4-016', 4, 60, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(71, 6, 'ПФ3 200/400.490-250/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 800; Напор, м: 70; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 1500;', '', 'pf3-200-400-490-250-4-016', 4, 61, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(72, 6, 'ПФ2 200/450.440-37/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 350; Напор, м: 24; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 1000;', '', 'pf2-200-450-440-37-6-016', 4, 62, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(73, 6, 'ПФ2 200/450.440-45/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 550; Напор, м: 20; Мощность двигателя, кВт: 45; Частота вращения, об/мин: 1000;', '', 'pf2-200-450-440-45-6-016', 4, 63, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(74, 6, 'ПФ2 250/400.394-30/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 600; Напор, м: 15; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 1000;', '', 'pf2-250-400-394-30-6-016', 4, 64, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(75, 6, 'ПФ2 250/470.500-75/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 600; Напор, м: 30; Мощность двигателя, кВт: 75; Частота вращения, об/мин: 1000;', '', 'pf2-250-470-500-75-6-016', 4, 65, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(76, 6, 'ПФ2 250/470.500-90/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 720; Напор, м: 26; Мощность двигателя, кВт: 90; Частота вращения, об/мин: 1000;', '', 'pf2-250-470-500-90-6-016', 4, 66, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(77, 6, 'ПФ2 250/500.543-110/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 800; Напор, м: 30; Мощность двигателя, кВт: 110; Частота вращения, об/мин: 1000;', '', 'pf2-250-500-543-110-6-016', 4, 67, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(78, 6, 'ПФ2 250/750.740-132/8-016', '', '', '0', '', 0, 'Подача, м3/ч: 700; Напор, м: 42; Мощность двигателя, кВт: 132; Частота вращения, об/мин: 750;', '', 'pf2-250-750-740-132-8-016', 4, 68, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(79, 6, 'ПФ2 300/400.400-55/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 800; Напор, м: 15; Мощность двигателя, кВт: 55; Частота вращения, об/мин: 1000;', '', 'pf2-300-400-400-55-6-016', 4, 69, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(80, 6, 'ПФ2 350/450.450-90/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 1500; Напор, м: 14; Мощность двигателя, кВт: 90; Частота вращения, об/мин: 1000;', '', 'pf2-350-450-450-90-6-016', 4, 70, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(81, 6, 'ПФ2 400/650.670-132/8-016', '', '', '0', '', 0, 'Подача, м3/ч: 1500; Напор, м: 24; Мощность двигателя, кВт: 132; Частота вращения, об/мин: 750;', '', 'pf2-400-650-670-132-8-016', 4, 71, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(82, 6, 'ПФ2 400/750.750-250/8-016', '', '', '0', '', 0, 'Подача, м3/ч: 2400; Напор, м: 22; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 750;', '', 'pf2-400-750-750-250-8-016', 4, 72, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(83, 6, 'ПФ2 400/750.750-6.250/8-016', '', '', '0', '', 0, 'Подача, м3/ч: 2400; Напор, м: 22; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 750;', '', 'pf2-400-750-750-6-250-8-016', 4, 73, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(84, 6, 'ПФ2 450/500.470-110/6-016', '', '', '0', '', 0, 'Подача, м3/ч: 2200; Напор, м: 10; Мощность двигателя, кВт: 110; Частота вращения, об/мин: 1000;', '', 'pf2-450-500-470-110-6-016', 4, 74, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(85, 6, 'ПФ2 500/650.640-250/8-016', '', '', '0', '', 0, 'Подача, м3/ч: 2650; Напор, м: 24; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 750;', '', 'pf2-500-650-640-250-8-016', 4, 75, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(86, 6, 'ПФ2 500/650.640-6.250/8-016', '', '', '0', '', 0, 'Подача, м3/ч: 2650; Напор, м: 24; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 750;', '', 'pf2-500-650-640-6-250-8-016', 4, 76, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(87, 6, 'ПФ2 500/650.680-315/8-016', '', '', '0', '', 0, 'Подача, м3/ч: 3000; Напор, м: 25; Мощность двигателя, кВт: 315; Частота вращения, об/мин: 750;', '', 'pf2-500-650-680-315-8-016', 4, 77, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(88, 6, 'ПФ2 500/650.680-6.315/8-016', '', '', '0', '', 0, 'Подача, м3/ч: 3000; Напор, м: 25; Мощность двигателя, кВт: 315; Частота вращения, об/мин: 750;', '', 'pf2-500-650-680-6-315-8-016', 4, 78, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(89, 7, 'ПД 32/125.110-1,1/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 13; Напор, м: 15; Мощность двигателя, кВт: 1,1; Частота вращения, об/мин: 3000;', '', 'pd-32-125-110-1-1-2-016', 4, 0, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(90, 7, 'ПД 32/125.110-1,1/2-026', '', '', '0', '', 0, 'Подача, м3/ч: 13; Напор, м: 15; Мощность двигателя, кВт: 1,1; Частота вращения, об/мин: 3000;', '', 'pd-32-125-110-1-1-2-026', 4, 1, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(91, 7, 'ПД 32/160.158-3/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 14; Напор, м: 30; Мощность двигателя, кВт: 3; Частота вращения, об/мин: 3000;', '', 'pd-32-160-158-3-2-016', 4, 2, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(92, 7, 'ПД 32/160.158-3/2-026', '', '', '0', '', 0, 'Подача, м3/ч: 14; Напор, м: 30; Мощность двигателя, кВт: 3; Частота вращения, об/мин: 3000;', '', 'pd-32-160-158-3-2-026', 4, 3, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(93, 7, 'ПД 32/200.196-5,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 12; Напор, м: 50; Мощность двигателя, кВт: 5,5; Частота вращения, об/мин: 3000;', '', 'pd-32-200-196-5-5-2-016', 4, 4, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(94, 7, 'ПД 32/250.247-11/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 12; Напор, м: 80; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 3000;', '', 'pd-32-250-247-11-2-016', 4, 5, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(95, 7, 'ПД 40/200.191-7,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 50; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 3000;', '', 'pd-40-200-191-7-5-2-016', 4, 6, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(96, 7, 'ПД 40/250.242-15/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 80; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 3000;', '', 'pd-40-250-242-15-2-016', 4, 7, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(97, 7, 'ПД 40/315.315-30/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 125; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 3000;', '', 'pd-40-315-315-30-2-016', 4, 8, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(98, 7, 'ПД 50/125.140-3/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 20; Мощность двигателя, кВт: 3; Частота вращения, об/мин: 3000;', '', 'pd-50-125-140-3-2-016', 4, 9, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(99, 7, 'ПД 50/125.140-3/2-026', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 20; Мощность двигателя, кВт: 3; Частота вращения, об/мин: 3000;', '', 'pd-50-125-140-3-2-026', 4, 10, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(100, 7, 'ПД 50/160.161-4/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 32; Мощность двигателя, кВт: 4; Частота вращения, об/мин: 3000;', '', 'pd-50-160-161-4-2-016', 4, 11, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(101, 7, 'ПД 50/200.180-11/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 46; Напор, м: 44; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 3000;', '', 'pd-50-200-180-11-2-016', 4, 12, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(102, 7, 'ПД 50/200.209-15/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 50; Напор, м: 50; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 3000;', '', 'pd-50-200-209-15-2-016', 4, 13, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(103, 7, 'ПД 50/250.240-22/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 50; Напор, м: 80; Мощность двигателя, кВт: 22; Частота вращения, об/мин: 3000;', '', 'pd-50-250-240-22-2-016', 4, 14, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(104, 7, 'ПД 50/315.292-37/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 50; Напор, м: 125; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 3000;', '', 'pd-50-315-292-37-2-016', 4, 15, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(105, 7, 'ПД 50/330.324-75/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 80; Напор, м: 150; Мощность двигателя, кВт: 75; Частота вращения, об/мин: 3000;', '', 'pd-50-330-324-75-2-016', 4, 16, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(106, 7, 'ПД 65/125.136-5,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 50; Напор, м: 20; Мощность двигателя, кВт: 5,5; Частота вращения, об/мин: 3000;', '', 'pd-65-125-136-5-5-2-016', 4, 17, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(107, 7, 'ПД 65/160.164-7,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 50; Напор, м: 32; Мощность двигателя, кВт: 7,5; Частота вращения, об/мин: 3000;', '', 'pd-65-160-164-7-5-2-016', 4, 18, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(108, 7, 'ПД 65/200.190-18,5/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 93; Напор, м: 44; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 3000;', '', 'pd-65-200-190-18-5-2-016', 4, 19, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(109, 7, 'ПД 65/200.208-22/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 50; Мощность двигателя, кВт: 22; Частота вращения, об/мин: 3000;', '', 'pd-65-200-208-22-2-016', 4, 20, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(110, 7, 'ПД 65/250.246-37/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 80; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 3000;', '', 'pd-65-250-246-37-2-016', 4, 21, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(111, 7, 'ПД 65/315.307-75/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 125; Мощность двигателя, кВт: 75; Частота вращения, об/мин: 3000;', '', 'pd-65-315-307-75-2-016', 4, 22, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(112, 7, 'ПД 80/125.140-11/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 20; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 3000;', '', 'pd-80-125-140-11-2-016', 4, 23, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(113, 7, 'ПД 80/160.160-11/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 93; Напор, м: 28; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 3000;', '', 'pd-80-160-160-11-2-016', 4, 24, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(114, 7, 'ПД 80/160.174-15/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 32; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 3000;', '', 'pd-80-160-174-15-2-016', 4, 25, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(115, 7, 'ПД 100/200.206-45/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 50; Мощность двигателя, кВт: 45; Частота вращения, об/мин: 3000;', '', 'pd-100-200-206-45-2-016', 4, 26, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(116, 7, 'ПД 100/250.253-75/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 80; Мощность двигателя, кВт: 75; Частота вращения, об/мин: 3000;', '', 'pd-100-250-253-75-2-016', 4, 27, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(117, 7, 'ПД 100/315.317-110/2-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 125; Мощность двигателя, кВт: 110; Частота вращения, об/мин: 3000;', '', 'pd-100-315-317-110-2-016', 4, 28, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(118, 7, 'ПД 125/250.250-15/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 15; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 1500;', '', 'pd-125-250-250-15-4-016', 4, 29, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(119, 7, 'ПД 125/315.325-30/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 32; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 1500;', '', 'pd-125-315-325-30-4-016', 4, 30, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(120, 7, 'ПД 150/250.290-37/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 400; Напор, м: 20; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 1500;', '', 'pd-150-250-290-37-4-016', 4, 31, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(121, 7, 'ПД 150/315.349-55/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 400; Напор, м: 32; Мощность двигателя, кВт: 55; Частота вращения, об/мин: 1500;', '', 'pd-150-315-349-55-4-016', 4, 32, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(122, 7, 'ПД 150/400.400-90/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 400; Напор, м: 50; Мощность двигателя, кВт: 90; Частота вращения, об/мин: 1500;', '', 'pd-150-400-400-90-4-016', 4, 33, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(123, 7, 'ПД 150/500.443-90/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 300; Напор, м: 66; Мощность двигателя, кВт: 90; Частота вращения, об/мин: 1500;', '', 'pd-150-500-443-90-4-016', 4, 34, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(124, 7, 'ПД 200/400.434-160/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 630; Напор, м: 54; Мощность двигателя, кВт: 160; Частота вращения, об/мин: 1500;', '', 'pd-200-400-434-160-4-016', 4, 35, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(125, 7, 'ПД 250/400.419-200/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 1000; Напор, м: 50; Мощность двигателя, кВт: 200; Частота вращения, об/мин: 1500;', '', 'pd-250-400-419-200-4-016', 4, 36, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(126, 7, 'ПД 250/415.415-250/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 1000; Напор, м: 65; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 1500;', '', 'pd-250-415-415-250-4-016', 4, 37, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(127, 7, 'ПД 300/330.330-200/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 1600; Напор, м: 35; Мощность двигателя, кВт: 200; Частота вращения, об/мин: 1500;', '', 'pd-300-330-330-200-4-016', 4, 38, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(128, 7, 'ПД 300/400.400-315/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 1600; Напор, м: 50; Мощность двигателя, кВт: 315; Частота вращения, об/мин: 1500;', '', 'pd-300-400-400-315-4-016', 4, 39, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(129, 7, 'ПД 300/400.415-315/4-016', '', '', '0', '', 0, 'Подача, м3/ч: 1600; Напор, м: 55; Мощность двигателя, кВт: 315; Частота вращения, об/мин: 1500;', '', 'pd-300-400-415-315-4-016', 4, 40, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(130, 5, 'Насосы Иртыш НФ', 'Фекальный наружный насос Иртыш НФ2, НФ', 'Насос Иртыш НФ', '0', 'Фекальные насосы серии Иртыш НФ предназначены для перекачки фекальных и загрязненных сточных вод с возможным содержанием в них абразивных и неабразивных частиц. Идеально подходит для перекачки фекальных, сточных и промышленных вод.\n', 0, '', '<p class=\"MsoNormal\">Фекальный насос Иртыш НФ с закрытым рабочем колесом используется для перекачки промышленных и бытовых вод. В воде допускается присутствие взвешенных &nbsp;абразивных и неабразивных частиц.</p>\n<p class=\"MsoNormal\"><strong>В роли загрязненных жидкостей могут выступать следующие виды вод:</strong></p>\n<ul>\n<li>Фекальные</li>\n<li>Сточные</li>\n<li>Промышленные</li>\n</ul>\n<p><span style=\"font-weight: bold;\">Данная серия фекальных насосов имеет широкую область применения:</span></p>\n<ul>\n<li>Канализация бытового сектора</li>\n<li>Канализация предприятий</li>\n<li>Сельское хозяйство</li>\n<li>Медицинские учреждения</li>\n<li>Промышленность</li>\n</ul>\n<p>Так же допускается эксплуатация насоса в аварийной ситуации, когда срочно необходимо откачать воду из затопленного подвала или колодца. Или произвести осушение, орошение земель сельскохозяйственного назначения.</p>\n<h2 style=\"text-align: center;\"><strong>Насос Иртыш НФ &ndash; состав и принцип работы</strong></h2>\n<p class=\"MsoNormal\">Фекальный насос Иртыш является моноблочным устройством вертикального исполнения. По спецзаказу допускается изготовление насоса горизонтального исполнения. Создается данная серия насосов из специального, антикоррозийного материала, который является достаточно прочным и долговечным по своим характеристикам.</p>\n<p class=\"MsoNormal\">В состав насоса входит асинхронный, общепромышленный двигатель с удлиненным валом и имеющий высокую степень защиты &ndash; <span lang=\"EN-US\">IP</span>68. Двигатель охлаждается окружающей средой и имеет встроенные в обмотку термо датчики в зависимости от своего исполнения.</p>\n<h2 style=\"text-align: center;\"><span style=\"font-weight: bold;\">Технические характеристики насоса Иртыш НФ2 (НФ):</span></h2>\n<ul>\n<li>Водородный показатель, pH &ndash; от 6 до 9,</li>\n<li>Температура среды по Цельсию &ndash; до 50 градусов,</li>\n<li>Температура окружающей среды по Цельсию &ndash; до 40 градусов,</li>\n<li>Плотность жидкости &ndash; 1 100 кг/м3,</li>\n<li>Абразивные включения (концентрация не более одного процента от объема) &ndash; до 5 миллиметров,</li>\n<li>Неабразивные, коротковолокнистые включения, концентрация по массе &ndash; до 2 процентов,</li>\n<li>Степень защиты &ndash; IP68.</li>\n</ul>\n<p>&nbsp;</p>\n<h2 style=\"text-align: center;\">Условное обозначение - Иртыш НФ, НФ2&nbsp;</h2>\n<p><strong>Вид обозначения:</strong> ИРТЫШ НФ2 50/200.180 - 11/2 - 210</p>\n<ul>\n<li><strong>ИРТЫШ&nbsp;</strong>- серия насоса</li>\n<li><strong>Н&nbsp;</strong>- тип электродвигателя, наружный</li>\n<li><strong>Ф&nbsp;</strong>- тип гидравлической части насоса, Ф - для сточных масс</li>\n<li><strong>2&nbsp;</strong>- тип рабочего колеса, 2 канальное, закрытое рабочее колесо</li>\n<li><strong>50&nbsp;</strong>- номинальный диаметр напорного патрубка</li>\n<li><strong>200&nbsp;</strong>- номинальный диаметр рабочего колеса</li>\n<li><strong>180&nbsp;</strong>- фактический диаметр рабочего колеса</li>\n</ul>\n<p><span style=\"font-weight: bold;\">Конструктивные особенности:</span></p>\n<ul>\n<li><strong>11&nbsp;</strong>- наминальная мощность электродвигателя</li>\n<li><strong>2&nbsp;</strong>- число плюсов электродвигателя</li>\n<li><strong>2&nbsp;</strong>- горизнотальное исполнение</li>\n<li><strong>1&nbsp;</strong>- ручное управление</li>\n<li><strong>0&nbsp;</strong>- без защиы</li>\n</ul>\n<h2 style=\"text-align: center;\">Состав насоса Иртыш входит<span lang=\"EN-US\">:</span></h2>\n<ul>\n<li class=\"MsoNormal\">Электродвигатель,</li>\n<li class=\"MsoNormal\">Гидравлическая часть,</li>\n<li class=\"MsoNormal\">Система влаго и термозащиты,</li>\n<li class=\"MsoNormal\">Щита управления;</li>\n<li class=\"MsoNormal\">Поплавковый выключатель,</li>\n<li class=\"MsoNormal\">Дополнительные устройства.</li>\n</ul>\n<h2 style=\"text-align: center;\">Схема насоса Иртыш<span lang=\"EN-US\">:</span></h2>\n<p><strong><strong><span lang=\"EN-US\"><img class=\"modalL\" style=\"float: right;\" title=\"Состав насоса - Иртыш НФ\" src=\"/image_upload/files/sostav-nasos-irtysh-nf2-nf.jpg\" alt=\"Состав насоса - Иртыш НФ\" width=\"240\" /></span></strong></strong></p>\n<ul>\n<li>1 - корпус &nbsp;спиральный</li>\n<li>2 - &nbsp;колесо &nbsp;рабочее &nbsp;(свободновихревое &nbsp;открытого &nbsp;типа для электронасоса \"Иртыш\" НФс)</li>\n<li>3 - торцовое уплотнение</li>\n<li>4 - патрубок входной</li>\n<li>5 - винт крепления корпуса спирального</li>\n<li>6 - винт крепления колеса рабочего</li>\n<li>7 - кран Маевского</li>\n<li>8 - электродвигатель</li>\n<li>9 - пробка</li>\n<li>10 - проставка</li>\n<li>11 - строповочная проушина</li>\n</ul>\n<p>&nbsp;</p>', 'nasos-irtysh-nf2-nf', 3, 100, 1, 0, 'nasos-irtysh-nf2-nf.png', 'nasos-irtysh-nf.png', '144', '172', 0, 0, '', '', '2017-05-30', 0),
(195, 5, 'Насосы Иртыш ПФС', 'Фекальный погружной насос Иртыш ПФС', 'Насос Иртыш ПФС', '0', 'Основным предназначением погружного насоса Иртыш ПФС со свободновихревым рабочим колесом служит перекачка бытовой и промышленной жидкости. Допускается содержание взвешенных абразивных и неабразивных частиц.\n', 0, '', '<p class=\"MsoNormal\">Фекальный погружной насос Иртыш ПФС со свободновихревым рабочим колесом используется для откачивания как бытовой, так и промышленной жидкости в виде фекальной массы, сточной воды или промышленных отходов. При этом в жидкости допускается содержание взвешенных &nbsp;абразивных и неабразивных частиц.</p>\n<p class=\"MsoNormal\">Фекальный насос Иртыш широко применяется для водного, жилищно-коммунального хозяйства и промышленных систем.</p>\n<p class=\"MsoNormal\">Погружной насос Иртыш так же может использоваться и для забора воды из водохранилищ, озер или рек.</p>\n<h2 style=\"text-align: center;\">Насос ПФС &ndash; состав и принцип работы</h2>\n<p class=\"MsoNormal\">Насос ПФС - это моноблочное устройство вертикального исполнения с открытым рабочим колесом. В работе насоса используется асинхронный двигатель промышленного назначения, который имеет высокую степень своей защиты - IP68. При производстве насосов серии Иртыш используется также высококачественный антикоррозийный материал, что значительно увеличивает срок его эксплуатации от имеющихся на рынке аналогов.</p>\n<h2 style=\"text-align: center;\"><span style=\"font-weight: bold;\">Технические характеристики насосов Иртыш ПФС:</span></h2>\n<ul>\n<li class=\"MsoNormal\">Водородный показатель, pH &ndash; от 6 до 9</li>\n<li class=\"MsoNormal\">Температура среды по Цельсию &ndash; до 50      градусов</li>\n<li class=\"MsoNormal\">Плотность жидкости &ndash; 1&nbsp;100 кг<span lang=\"EN-US\">/</span>м<sup>3</sup></li>\n<li class=\"MsoNormal\">Абразивные включения (концентрация не      более одного процента от объема) &ndash; до 5 миллиметров</li>\n<li class=\"MsoNormal\">Неабразивные, коротковолокнистые      включения, концентрация по массе &ndash; до 2 процентов,</li>\n<li class=\"MsoNormal\">Степень защиты &ndash; <span lang=\"EN-US\">IP68</span></li>\n<li class=\"MsoNormal\"><span>Мощность двигателя, кВт - от      1,1 до 3</span></li>\n<li class=\"MsoNormal\"><span>Обороты двигаителя, об./мин. - 3      000</span></li>\n<li class=\"MsoNormal\"><span>Напор, м. - от 4 до 14 метров</span></li>\n<li class=\"MsoNormal\"><span>Длина кабеля, м. - от 10 (штатная)      до 100 (по заказу) метров</span></li>\n<li class=\"MsoNormal\"><span>Производительность,      м3/ч - от 7 до 25</span></li>\n</ul>\n<h2 style=\"text-align: center;\">Условное обозначение - Иртыш ПФС&nbsp;</h2>\n<p><strong>Вид обозначения:</strong>&nbsp;ИРТЫШ ПФС 50/125.98 - 1.1/2 - 016</p>\n<ul>\n<li><strong>ИРТЫШ&nbsp;</strong>- серия насоса</li>\n<li><strong>П&nbsp;</strong>- тип электродвигателя, погружной</li>\n<li><strong>Ф&nbsp;</strong>- тип гидравлической части насоса, Ф - для сточных масс</li>\n<li><strong>С&nbsp;</strong>- тип рабочего колеса, вихревое рабочее колесо</li>\n<li><strong>50&nbsp;</strong>- номинальный диаметр напорного патрубка</li>\n<li><strong>125&nbsp;</strong>- номинальный диаметр рабочего колеса</li>\n<li><strong>98</strong>- фактический диаметр рабочего колеса</li>\n</ul>\n<p><span>Конструктивные особенности:</span></p>\n<ul>\n<li><strong>1.1&nbsp;</strong>- наминальная мощность электродвигателя</li>\n<li><strong>2&nbsp;</strong>- число плюсов электродвигателя</li>\n<li><strong>0&nbsp;</strong>- мобильный погружной</li>\n<li><strong>1&nbsp;</strong>- ручное управление</li>\n<li><strong>6&nbsp;</strong>- влаго-термозащита</li>\n</ul>\n<ul>\n</ul>\n<h2 style=\"text-align: center;\">Состав насоса Иртыш ПФС входит<span lang=\"EN-US\">:</span></h2>\n<ul>\n<li class=\"MsoNormal\">Электродвигатель</li>\n<li class=\"MsoNormal\">Гидравлическая часть</li>\n<li class=\"MsoNormal\">Система влаго и термозащиты</li>\n<li class=\"MsoNormal\">Щита управления</li>\n<li class=\"MsoNormal\">Поплавковый выключатель</li>\n</ul>\n<h2 style=\"text-align: center;\">Схема насоса Иртыш ПФС<span lang=\"EN-US\">:</span></h2>\n<p><strong><strong><span lang=\"EN-US\"><img class=\"modalL\" style=\"float: right;\" title=\"Состав насоса - Иртыш ПФС\" src=\"/image_upload/nasos/d5c5adc51099685244c598ad016d4953.png\" alt=\"Состав насоса - Иртыш ПФС\" width=\"300\" /></span></strong></strong></p>\n<ul>\n<li>1 - Электродвигатель&nbsp;</li>\n<li>2 - Колесо рабочее&nbsp;</li>\n<li>3 - Корпус спиральный&nbsp;</li>\n<li>4 - Торцовое уплотнение (манжета)&nbsp;</li>\n<li>5 - Торцовое уплотнение&nbsp;</li>\n<li>6 - Встроенный кабель (-ли)&nbsp;</li>\n<li>7 - Поплавковый выключатель&nbsp;</li>\n<li>8 - Пробка масляной камеры&nbsp;</li>\n<li>9 - Метизы крепления корпуса камеры и стакана подшипника к корпусу электродвигателя&nbsp;</li>\n<li>10 - Метизы крепления колеса рабочего (с шайбой)&nbsp;</li>\n<li>11 - Подшипник&nbsp;</li>\n<li>12 - Подшипник (-ки)&nbsp;</li>\n<li>13 - Датчик влажности&nbsp;</li>\n<li>14 - Подставка&nbsp;</li>\n<li>15 - Корпус камеры&nbsp;</li>\n<li>16 - Метизы крепления корпуса камеры (корпуса электродвигателя для насосов &laquo;Иртыш&raquo; ПФ1 65/160 &ndash; 3/2 ПФс 65/160 &ndash; 3/2) к корпусу спиральному (проставке)&nbsp;</li>\n<li>17 - Стакан подшипника</li>\n<li>18 - Корпус электродвигателя&nbsp;</li>\n<li>19 - Метизы крепления крышки камеры к корпусу камеры&nbsp;</li>\n<li>20 - Крышка камеры&nbsp;</li>\n<li>21 - Метизы крепления проставки к корпусу спиральному&nbsp;</li>\n<li>22 - Проставка</li>\n</ul>\n<p class=\"MsoNormal\">Данная серия насосов так же может использоваться в качестве аварийного запаса для обслуживания канализационных систем, либо орошения земли в сельском хозяйстве.&nbsp;</p>', 'nasos-irtysh-pfs', 3, 100, 1, 0, 'nasos-irtysh-pfs.png', 'nasos-irtysh-pf.png', '144', '172', 0, 0, '', '', '2017-06-02', 0),
(147, 130, 'НФ3 100/250.240-11/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 15; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 1500;', '', 'nf3-100-250-240-11-4-210', 4, 16, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(148, 130, 'НФ3 100/250.250-15/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 100; Напор, м: 20; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 1500;', '', 'nf3-100-250-250-15-4-210', 4, 17, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(149, 130, 'НФ2 125/315.290-22/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 22; Мощность двигателя, кВт: 22; Частота вращения, об/мин: 1500;', '', 'nf2-125-315-290-22-4-210', 4, 18, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(150, 130, 'НФ2 125/315.320-30/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 25; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 1500;', '', 'nf2-125-315-320-30-4-210', 4, 19, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(151, 130, 'НФ2 125/315.336-11/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 150; Напор, м: 15; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 1000;', '', 'nf2-125-315-336-11-6-210', 4, 20, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(152, 130, 'НФ2 125/315.336-37/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 250; Напор, м: 30; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 1500;', '', 'nf2-125-315-336-37-4-210', 4, 21, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(153, 130, 'НФ2 125/400.340-11/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 125; Напор, м: 14; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 1000;', '', 'nf2-125-400-340-11-6-210', 4, 22, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(154, 130, 'НФ2 125/400.370-15/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 125; Напор, м: 18; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 1000;', '', 'nf2-125-400-370-15-6-210', 4, 23, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(155, 130, 'НФ2 125/400.370-45/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 40; Мощность двигателя, кВт: 45; Частота вращения, об/мин: 1500;', '', 'nf2-125-400-370-45-4-210', 4, 24, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(156, 130, 'НФ2 125/400.406-18,5/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 125; Напор, м: 22; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 1000;', '', 'nf2-125-400-406-18-5-6-210', 4, 25, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(157, 130, 'НФ2 125/400.406-55/4-212', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 52; Мощность двигателя, кВт: 55; Частота вращения, об/мин: 1500;', '', 'nf2-125-400-406-55-4-212', 4, 26, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(158, 130, 'НФ2 150/315.325-11/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 9; Мощность двигателя, кВт: 11; Частота вращения, об/мин: 1000;', '', 'nf2-150-315-325-11-6-210', 4, 27, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(159, 130, 'НФ2 150/315.325-45/4-210', '', '', '0', '', 0, 'Подача, м3/ч: 350; Напор, м: 20; Мощность двигателя, кВт: 45; Частота вращения, об/мин: 1500;', '', 'nf2-150-315-325-45-4-210', 4, 28, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(160, 130, 'НФ2 150/315.340-55/4-212', '', '', '0', '', 0, 'Подача, м3/ч: 450; Напор, м: 20; Мощность двигателя, кВт: 55; Частота вращения, об/мин: 1500;', '', 'nf2-150-315-340-55-4-212', 4, 29, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(161, 130, 'НФ2 150/315.365-15/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 15; Мощность двигателя, кВт: 15; Частота вращения, об/мин: 1000;', '', 'nf2-150-315-365-15-6-210', 4, 30, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(162, 130, 'НФ2 150/315.365-18,5/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 260; Напор, м: 12; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 1000;', '', 'nf2-150-315-365-18-5-6-210', 4, 31, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(163, 130, 'НФ2 150/315.365-75/4-212', '', '', '0', '', 0, 'Подача, м3/ч: 400; Напор, м: 32; Мощность двигателя, кВт: 75; Частота вращения, об/мин: 1500;', '', 'nf2-150-315-365-75-4-212', 4, 32, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(164, 130, 'НФ3 150/400.370-18,5/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 250; Напор, м: 9; Мощность двигателя, кВт: 18,5; Частота вращения, об/мин: 1000;', '', 'nf3-150-400-370-18-5-6-210', 4, 33, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(165, 130, 'НФ3 150/400.390-22/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 18; Мощность двигателя, кВт: 22; Частота вращения, об/мин: 1000;', '', 'nf3-150-400-390-22-6-210', 4, 34, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(166, 130, 'НФ3 150/400.390-90/4-212', '', '', '0', '', 0, 'Подача, м3/ч: 300; Напор, м: 40; Мощность двигателя, кВт: 90; Частота вращения, об/мин: 1500;', '', 'nf3-150-400-390-90-4-212', 4, 35, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(167, 130, 'НФ3 150/400.410-30/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 270; Напор, м: 21; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 1000;', '', 'nf3-150-400-410-30-6-210', 4, 36, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(168, 130, 'НФ3 150/400.410-110/4-212', '', '', '0', '', 0, 'Подача, м3/ч: 400; Напор, м: 50; Мощность двигателя, кВт: 110; Частота вращения, об/мин: 1500;', '', 'nf3-150-400-410-110-4-212', 4, 37, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(169, 130, 'НФ2 150/470.468-30/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 200; Напор, м: 30; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 1000;', '', 'nf2-150-470-468-30-6-210', 4, 38, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(170, 130, 'НФ4 150/500.475-110/4-212', '', '', '0', '', 0, 'Подача, м3/ч: 350; Напор, м: 50; Мощность двигателя, кВт: 110; Частота вращения, об/мин: 1500;', '', 'nf4-150-500-475-110-4-212', 4, 39, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(171, 130, 'НФ4 150/500.485-160/4-212', '', '', '0', '', 0, 'Подача, м3/ч: 350; Напор, м: 65; Мощность двигателя, кВт: 160; Частота вращения, об/мин: 1500;', '', 'nf4-150-500-485-160-4-212', 4, 40, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(172, 130, 'НФ4 150/500.500-200/4-212', '', '', '0', '', 0, 'Подача, м3/ч: 400; Напор, м: 80; Мощность двигателя, кВт: 200; Частота вращения, об/мин: 1500;', '', 'nf4-150-500-500-200-4-212', 4, 41, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(173, 130, 'НФ4 150/540.540-250/4-212', '', '', '0', '', 0, 'Подача, м3/ч: 450; Напор, м: 95; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 1500;', '', 'nf4-150-540-540-250-4-212', 4, 42, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(174, 130, 'НФ2 200/360.338-22/6-200', '', '', '0', '', 0, 'Подача, м3/ч: 400; Напор, м: 10; Мощность двигателя, кВт: 22; Частота вращения, об/мин: 1000;', '', 'nf2-200-360-338-22-6-200', 4, 43, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(175, 130, 'НФ3 200/400.470-200/4-400', '', '', '0', '', 0, 'Подача, м3/ч: 800; Напор, м: 60; Мощность двигателя, кВт: 200; Частота вращения, об/мин: 1500;', '', 'nf3-200-400-470-200-4-400', 4, 44, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(176, 130, 'НФ3 200/400.490-250/4-400', '', '', '0', '', 0, 'Подача, м3/ч: 800; Напор, м: 70; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 1500;', '', 'nf3-200-400-490-250-4-400', 4, 45, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(177, 130, 'НФ2 200/450.440-37/6-212', '', '', '0', '', 0, 'Подача, м3/ч: 350; Напор, м: 24; Мощность двигателя, кВт: 37; Частота вращения, об/мин: 1000;', '', 'nf2-200-450-440-37-6-212', 4, 46, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(178, 130, 'НФ2 200/450.440-45/6-212', '', '', '0', '', 0, 'Подача, м3/ч: 550; Напор, м: 20; Мощность двигателя, кВт: 45; Частота вращения, об/мин: 1000;', '', 'nf2-200-450-440-45-6-212', 4, 47, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(179, 130, 'НФ2 250/400.394-30/6-210', '', '', '0', '', 0, 'Подача, м3/ч: 600; Напор, м: 15; Мощность двигателя, кВт: 30; Частота вращения, об/мин: 1000;', '', 'nf2-250-400-394-30-6-210', 4, 48, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(180, 130, 'НФ2 250/470.500-90/6-212', '', '', '0', '', 0, 'Подача, м3/ч: 600; Напор, м: 30; Мощность двигателя, кВт: 90; Частота вращения, об/мин: 1000;', '', 'nf2-250-470-500-90-6-212', 4, 49, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(181, 130, 'НФ2 250/500.543-110/6-212', '', '', '0', '', 0, 'Подача, м3/ч: 800; Напор, м: 30; Мощность двигателя, кВт: 110; Частота вращения, об/мин: 1000;', '', 'nf2-250-500-543-110-6-212', 4, 50, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(182, 130, 'НФ2 300/400.400-55/6-212', '', '', '0', '', 0, 'Подача, м3/ч: 800; Напор, м: 15; Мощность двигателя, кВт: 55; Частота вращения, об/мин: 1000;', '', 'nf2-300-400-400-55-6-212', 4, 51, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(183, 130, 'НФ2 350/450.450-90/6-212', '', '', '0', '', 0, 'Подача, м3/ч: 1500; Напор, м: 14; Мощность двигателя, кВт: 90; Частота вращения, об/мин: 1000;', '', 'nf2-350-450-450-90-6-212', 4, 52, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(184, 130, 'НФ3 400/650.670-132/8-212', '', '', '0', '', 0, 'Подача, м3/ч: 1500; Напор, м: 24; Мощность двигателя, кВт: 132; Частота вращения, об/мин: 750;', '', 'nf3-400-650-670-132-8-212', 4, 53, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(185, 130, 'НФ2 400/750.750-250/8-400', '', '', '0', '', 0, 'Подача, м3/ч: 2400; Напор, м: 22; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 750;', '', 'nf2-400-750-750-250-8-400', 4, 54, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(186, 130, 'НФ2 400/750.750-6.250/8-400', '', '', '0', '', 0, 'Подача, м3/ч: 2400; Напор, м: 22; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 750;', '', 'nf2-400-750-750-6-250-8-400', 4, 55, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(187, 130, 'НФ2 450/500.470-110/6-212', '', '', '0', '', 0, 'Подача, м3/ч: 2200; Напор, м: 10; Мощность двигателя, кВт: 110; Частота вращения, об/мин: 1000;', '', 'nf2-450-500-470-110-6-212', 4, 56, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(188, 130, 'НФ2 500/650.640-250/8-400', '', '', '0', '', 0, 'Подача, м3/ч: 2650; Напор, м: 24; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 750;', '', 'nf2-500-650-640-250-8-400', 4, 57, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(189, 130, 'НФ2 500/650.640-6.250/8-400', '', '', '0', '', 0, 'Подача, м3/ч: 2650; Напор, м: 24; Мощность двигателя, кВт: 250; Частота вращения, об/мин: 750;', '', 'nf2-500-650-640-6-250-8-400', 4, 58, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(190, 130, 'НФ2 500/650.680-315/8-400', '', '', '0', '', 0, 'Подача, м3/ч: 3000; Напор, м: 25; Мощность двигателя, кВт: 315; Частота вращения, об/мин: 750;', '', 'nf2-500-650-680-315-8-400', 4, 59, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(191, 130, 'НФ2 500/650.680-6.315/8-400', '', '', '0', '', 0, 'Подача, м3/ч: 3000; Напор, м: 25; Мощность двигателя, кВт: 315; Частота вращения, об/мин: 750;', '', 'nf2-500-650-680-6-315-8-400', 4, 60, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(192, 130, 'НФС 65/160.132-3/2-311', '', '', '0', '', 0, 'Подача, м3/ч: 20; Напор, м: 12; Мощность двигателя, кВт: 3; Частота вращения, об/мин: 3000;', '', 'nfs-65-160-132-3-2-311', 4, 61, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(193, 130, 'НФС 65/160.148-3/2 Ex-300', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 14; Мощность двигателя, кВт: 3; Частота вращения, об/мин: 3000;', '', 'nfs-65-160-148-3-2-ex-300', 4, 62, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(194, 130, 'НФС 65/160.148-3/2-311', '', '', '0', '', 0, 'Подача, м3/ч: 25; Напор, м: 14; Мощность двигателя, кВт: 3; Частота вращения, об/мин: 3000;', '', 'nfs-65-160-148-3-2-311', 4, 63, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(208, 195, 'ПФС 50/125.98-1,1/2-016', '', '', '0', '', 0, '7, м3/ч; 4, м; 1,1, кВт; 3000, об/мин;', '', 'pfs-50-125-98-1-1-2-016', 4, 0, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(209, 195, 'ПФС 50/125.98-1,1/2-036', '', '', '0', '', 0, '7, м3/ч; 4, м; 1,1, кВт; 3000, об/мин;', '', 'pfs-50-125-98-1-1-2-036', 4, 1, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(210, 195, 'ПФС 50/125.98-М1,1/2-016', '', '', '0', '', 0, '7, м3/ч; 4, м; 1,1, кВт; 3000, об/мин;', '', 'pfs-50-125-98-m1-1-2-016', 4, 2, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(211, 195, 'ПФС 50/125.98-М1,1/2-036', '', '', '0', '', 0, '7, м3/ч; 4, м; 1,1, кВт; 3000, об/мин;', '', 'pfs-50-125-98-m1-1-2-036', 4, 3, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(212, 195, 'ПФС 50/125.120-1,1/2-016', '', '', '0', '', 0, '16, м3/ч; 6, м; 1,1, кВт; 3000, об/мин;', '', 'pfs-50-125-120-1-1-2-016', 4, 4, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(213, 195, 'ПФС 50/125.120-1,1/2-036', '', '', '0', '', 0, '16, м3/ч; 6, м; 1,1, кВт; 3000, об/мин;', '', 'pfs-50-125-120-1-1-2-036', 4, 5, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(214, 195, 'ПФС 50/125.120-М1,1/2-016', '', '', '0', '', 0, '16, м3/ч; 6, м; 1,1, кВт; 3000, об/мин;', '', 'pfs-50-125-120-m1-1-2-016', 4, 6, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(215, 195, 'ПФС 50/125.120-М1,1/2-036', '', '', '0', '', 0, '16, м3/ч; 6, м; 1,1, кВт; 3000, об/мин;', '', 'pfs-50-125-120-m1-1-2-036', 4, 7, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(216, 195, 'ПФС 65/160.132-3/2-016', '', '', '0', '', 0, '20, м3/ч; 12, м; 3, кВт; 3000, об/мин;', '', 'pfs-65-160-132-3-2-016', 4, 8, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(217, 195, 'ПФС 65/160.132-3/2-036', '', '', '0', '', 0, '20, м3/ч; 12, м; 3, кВт; 3000, об/мин;', '', 'pfs-65-160-132-3-2-036', 4, 9, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(218, 195, 'ПФС 65/160.148-3/2-016', '', '', '0', '', 0, '25, м3/ч; 14, м; 3, кВт; 3000, об/мин;', '', 'pfs-65-160-148-3-2-016', 4, 10, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(219, 195, 'ПФС 65/160.148-3/2-036', '', '', '0', '', 0, '25, м3/ч; 14, м; 3, кВт; 3000, об/мин;', '', 'pfs-65-160-148-3-2-036', 4, 11, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(450, 220, 'ЦМК 50/160-5,5/2', '', '', '0', '', 0, '25, м3/ч; 32, м; 5,5, кВт; 3000, об/мин;', '', 'cmk-50-160-5-5-2', 4, 47, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(451, 220, 'ЦМК1 50/200-1,5/4', '', '', '0', '', 0, '23, м3/ч; 11, м; 1,5, кВт; 1500, об/мин;', '', 'cmk1-50-200-1-5-4', 4, 48, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(452, 220, 'ЦМК2 50/200-1,5/4', '', '', '0', '', 0, '21, м3/ч; 9, м; 1,5, кВт; 1500, об/мин;', '', 'cmk2-50-200-1-5-4', 4, 49, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(453, 220, 'ЦМК 50/200-2,2/4', '', '', '0', '', 0, '25, м3/ч; 12, м; 2,2, кВт; 1500, об/мин;', '', 'cmk-50-200-2-2-4', 4, 50, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(454, 220, 'ЦМК1 50/200-11/2', '', '', '0', '', 0, '46, м3/ч; 44, м; 11, кВт; 3000, об/мин;', '', 'cmk1-50-200-11-2', 4, 51, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(455, 220, 'ЦМК2 50/200-11/2', '', '', '0', '', 0, '43, м3/ч; 38, м; 11, кВт; 3000, об/мин;', '', 'cmk2-50-200-11-2', 4, 52, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(456, 220, 'ЦМК 50/200-15/2', '', '', '0', '', 0, '50, м3/ч; 50, м; 15, кВт; 3000, об/мин;', '', 'cmk-50-200-15-2', 4, 53, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(457, 220, 'ЦМК2 50/250-2,2/4', '', '', '0', '', 0, '21, м3/ч; 15, м; 2,2, кВт; 1500, об/мин;', '', 'cmk2-50-250-2-2-4', 4, 54, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(458, 220, 'ЦМК 50/250-3/4', '', '', '0', '', 0, '25, м3/ч; 20, м; 3, кВт; 1500, об/мин;', '', 'cmk-50-250-3-4', 4, 55, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(459, 220, 'ЦМК1 50/250-3/4', '', '', '0', '', 0, '23, м3/ч; 17, м; 3, кВт; 1500, об/мин;', '', 'cmk1-50-250-3-4', 4, 56, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(460, 220, 'ЦМК2 50/250-15/2', '', '', '0', '', 0, '43, м3/ч; 60, м; 15, кВт; 3000, об/мин;', '', 'cmk2-50-250-15-2', 4, 57, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(461, 220, 'ЦМК1 50/250-18,5/2', '', '', '0', '', 0, '46, м3/ч; 70, м; 18,5, кВт; 3000, об/мин;', '', 'cmk1-50-250-18-5-2', 4, 58, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(462, 220, 'ЦМК 50/250-22/2', '', '', '0', '', 0, '50, м3/ч; 80, м; 22, кВт; 3000, об/мин;', '', 'cmk-50-250-22-2', 4, 59, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(463, 220, 'ЦМК 50/315-5,5/4', '', '', '0', '', 0, '25, м3/ч; 32, м; 5,5, кВт; 1500, об/мин;', '', 'cmk-50-315-5-5-4', 4, 60, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(464, 220, 'ЦМК1 50/315-5,5/4', '', '', '0', '', 0, '23, м3/ч; 29, м; 5,5, кВт; 1500, об/мин;', '', 'cmk1-50-315-5-5-4', 4, 61, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(465, 220, 'ЦМК2 50/315-5,5/4', '', '', '0', '', 0, '22, м3/ч; 26, м; 5,5, кВт; 1500, об/мин;', '', 'cmk2-50-315-5-5-4', 4, 62, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(466, 220, 'ЦМК2 50/315-30/2', '', '', '0', '', 0, '45, м3/ч; 103, м; 30, кВт; 3000, об/мин;', '', 'cmk2-50-315-30-2', 4, 63, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(467, 220, 'ЦМК 50/315-37/2', '', '', '0', '', 0, '50, м3/ч; 125, м; 37, кВт; 3000, об/мин;', '', 'cmk-50-315-37-2', 4, 64, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(468, 220, 'ЦМК1 50/315-37/2', '', '', '0', '', 0, '47, м3/ч; 114, м; 37, кВт; 3000, об/мин;', '', 'cmk1-50-315-37-2', 4, 65, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(469, 220, 'ЦМК2 50/330-7,5/4', '', '', '0', '', 0, '34, м3/ч; 27, м; 7,5, кВт; 1500, об/мин;', '', 'cmk2-50-330-7-5-4', 4, 66, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(470, 220, 'ЦМК 50/330-11/4', '', '', '0', '', 0, '40, м3/ч; 37, м; 11, кВт; 1500, об/мин;', '', 'cmk-50-330-11-4', 4, 67, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(471, 220, 'ЦМК1 50/330-11/4', '', '', '0', '', 0, '38, м3/ч; 34, м; 11, кВт; 1500, об/мин;', '', 'cmk1-50-330-11-4', 4, 68, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(472, 220, 'ЦМК2 50/330-45/2', '', '', '0', '', 0, '69, м3/ч; 111, м; 45, кВт; 3000, об/мин;', '', 'cmk2-50-330-45-2', 4, 69, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(473, 220, 'ЦМК1 50/330-55/2', '', '', '0', '', 0, '76, м3/ч; 136, м; 55, кВт; 3000, об/мин;', '', 'cmk1-50-330-55-2', 4, 70, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(474, 220, 'ЦМК 50/330-75/2', '', '', '0', '', 0, '80, м3/ч; 150, м; 75, кВт; 3000, об/мин;', '', 'cmk-50-330-75-2', 4, 71, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(475, 220, 'ЦМК 65/125-1,1/4', '', '', '0', '', 0, '25, м3/ч; 5, м; 1,1, кВт; 1500, об/мин;', '', 'cmk-65-125-1-1-4', 4, 72, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(476, 220, 'ЦМК1 65/125-1,1/4', '', '', '0', '', 0, '22, м3/ч; 4, м; 1,1, кВт; 1500, об/мин;', '', 'cmk1-65-125-1-1-4', 4, 73, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(477, 220, 'ЦМК1 65/125-4/2', '', '', '0', '', 0, '44, м3/ч; 16, м; 4, кВт; 3000, об/мин;', '', 'cmk1-65-125-4-2', 4, 74, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(478, 220, 'ЦМК 65/125-5,5/2', '', '', '0', '', 0, '50, м3/ч; 20, м; 5,5, кВт; 3000, об/мин;', '', 'cmk-65-125-5-5-2', 4, 75, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(479, 220, 'ЦМК 65/160-1,1/4', '', '', '0', '', 0, '25, м3/ч; 8, м; 1,1, кВт; 1500, об/мин;', '', 'cmk-65-160-1-1-4', 4, 76, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(480, 220, 'ЦМК1 65/160-1,1/4', '', '', '0', '', 0, '23, м3/ч; 7, м; 1,1, кВт; 1500, об/мин;', '', 'cmk1-65-160-1-1-4', 4, 77, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(481, 220, 'ЦМК2 65/160-1,1/4', '', '', '0', '', 0, '21, м3/ч; 6, м; 1,1, кВт; 1500, об/мин;', '', 'cmk2-65-160-1-1-4', 4, 78, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(482, 220, 'ЦМК2 65/160-5,5/2', '', '', '0', '', 0, '43, м3/ч; 24, м; 5,5, кВт; 3000, об/мин;', '', 'cmk2-65-160-5-5-2', 4, 79, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(483, 220, 'ЦМК 65/160-7,5/2', '', '', '0', '', 0, '50, м3/ч; 32, м; 7,5, кВт; 3000, об/мин;', '', 'cmk-65-160-7-5-2', 4, 80, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(484, 220, 'ЦМК1 65/160-7,5/2', '', '', '0', '', 0, '46, м3/ч; 28, м; 7,5, кВт; 3000, об/мин;', '', 'cmk1-65-160-7-5-2', 4, 81, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(485, 220, 'ЦМК2 65/200-2,2/4', '', '', '0', '', 0, '43, м3/ч; 9, м; 2,2, кВт; 1500, об/мин;', '', 'cmk2-65-200-2-2-4', 4, 82, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0);
INSERT INTO `sections` (`id`, `parent_id`, `name`, `title`, `h1`, `keywords`, `description`, `noindex`, `smalltext`, `fulltext`, `virtual_name`, `template_id`, `num`, `show`, `counter`, `s_image`, `m_image`, `width`, `height`, `blocked_admin`, `blocked_manager`, `url`, `url_rus`, `date`, `timestamp`) VALUES
(486, 220, 'ЦМК1 65/200-3/4', '', '', '0', '', 0, '46, м3/ч; 11, м; 3, кВт; 1500, об/мин;', '', 'cmk1-65-200-3-4', 4, 83, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(487, 220, 'ЦМК 65/200-4/4', '', '', '0', '', 0, '50, м3/ч; 12, м; 4, кВт; 1500, об/мин;', '', 'cmk-65-200-4-4', 4, 84, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(488, 220, 'ЦМК2 65/200-15/2', '', '', '0', '', 0, '86, м3/ч; 28, м; 15, кВт; 3000, об/мин;', '', 'cmk2-65-200-15-2', 4, 85, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(489, 220, 'ЦМК1 65/200-18,5/2', '', '', '0', '', 0, '93, м3/ч; 44, м; 18,5, кВт; 3000, об/мин;', '', 'cmk1-65-200-18-5-2', 4, 86, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(490, 220, 'ЦМК 65/200-22/2', '', '', '0', '', 0, '100, м3/ч; 50, м; 22, кВт; 3000, об/мин;', '', 'cmk-65-200-22-2', 4, 87, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(491, 220, 'ЦМК2 65/250-4/4', '', '', '0', '', 0, '43, м3/ч; 15, м; 4, кВт; 1500, об/мин;', '', 'cmk2-65-250-4-4', 4, 88, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(492, 220, 'ЦМК 65/250-5,5/4', '', '', '0', '', 0, '50, м3/ч; 20, м; 5,5, кВт; 1500, об/мин;', '', 'cmk-65-250-5-5-4', 4, 89, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(493, 220, 'ЦМК1 65/250-5,5/4', '', '', '0', '', 0, '46, м3/ч; 17, м; 5,5, кВт; 1500, об/мин;', '', 'cmk1-65-250-5-5-4', 4, 90, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(494, 220, 'ЦМК1 65/250-30/2', '', '', '0', '', 0, '93, м3/ч; 70, м; 30, кВт; 3000, об/мин;', '', 'cmk1-65-250-30-2', 4, 91, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(495, 220, 'ЦМК2 65/250-30/2', '', '', '0', '', 0, '86, м3/ч; 60, м; 30, кВт; 3000, об/мин;', '', 'cmk2-65-250-30-2', 4, 92, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(496, 220, 'ЦМК 65/250-37/2', '', '', '0', '', 0, '100, м3/ч; 80, м; 37, кВт; 3000, об/мин;', '', 'cmk-65-250-37-2', 4, 93, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(497, 220, 'ЦМК1 65/315-7,5/4', '', '', '0', '', 0, '47, м3/ч; 28, м; 7,5, кВт; 1500, об/мин;', '', 'cmk1-65-315-7-5-4', 4, 94, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(498, 220, 'ЦМК2 65/315-7,5/4', '', '', '0', '', 0, '42, м3/ч; 23, м; 7,5, кВт; 1500, об/мин;', '', 'cmk2-65-315-7-5-4', 4, 95, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(499, 220, 'ЦМК 65/315-11/4', '', '', '0', '', 0, '50, м3/ч; 32, м; 11, кВт; 1500, об/мин;', '', 'cmk-65-315-11-4', 4, 96, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(500, 220, 'ЦМК2 65/315-45/2', '', '', '0', '', 0, '85, м3/ч; 92, м; 45, кВт; 3000, об/мин;', '', 'cmk2-65-315-45-2', 4, 97, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(501, 220, 'ЦМК1 65/315-55/2', '', '', '0', '', 0, '95, м3/ч; 114, м; 55, кВт; 3000, об/мин;', '', 'cmk1-65-315-55-2', 4, 98, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(502, 220, 'ЦМК 65/315-75/2', '', '', '0', '', 0, '100, м3/ч; 125, м; 75, кВт; 3000, об/мин;', '', 'cmk-65-315-75-2', 4, 99, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(503, 220, 'ЦМК1 65/330-11/4', '', '', '0', '', 0, '62, м3/ч; 34, м; 11, кВт; 1500, об/мин;', '', 'cmk1-65-330-11-4', 4, 100, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(504, 220, 'ЦМК2 65/330-11/4', '', '', '0', '', 0, '59, м3/ч; 31, м; 11, кВт; 1500, об/мин;', '', 'cmk2-65-330-11-4', 4, 101, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(505, 220, 'ЦМК 65/330-15/4', '', '', '0', '', 0, '65, м3/ч; 37, м; 15, кВт; 1500, об/мин;', '', 'cmk-65-330-15-4', 4, 102, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(506, 220, 'ЦМК2 65/330-75/2', '', '', '0', '', 0, '118, м3/ч; 124, м; 75, кВт; 3000, об/мин;', '', 'cmk2-65-330-75-2', 4, 103, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(507, 220, 'ЦМК 65/330-90/2', '', '', '0', '', 0, '130, м3/ч; 150, м; 90, кВт; 3000, об/мин;', '', 'cmk-65-330-90-2', 4, 104, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(508, 220, 'ЦМК1 65/330-90/2', '', '', '0', '', 0, '124, м3/ч; 136, м; 90, кВт; 3000, об/мин;', '', 'cmk1-65-330-90-2', 4, 105, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(509, 220, 'ЦМК 80/125-1,1/4', '', '', '0', '', 0, '50, м3/ч; 5, м; 1,1, кВт; 1500, об/мин;', '', 'cmk-80-125-1-1-4', 4, 106, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(510, 220, 'ЦМК1 80/125-1,1/4', '', '', '0', '', 0, '44, м3/ч; 4, м; 1,1, кВт; 1500, об/мин;', '', 'cmk1-80-125-1-1-4', 4, 107, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(511, 220, 'ЦМК1 80/125-7,5/2', '', '', '0', '', 0, '89, м3/ч; 16, м; 7,5, кВт; 3000, об/мин;', '', 'cmk1-80-125-7-5-2', 4, 108, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(512, 220, 'ЦМК 80/125-11/2', '', '', '0', '', 0, '100, м3/ч; 20, м; 11, кВт; 3000, об/мин;', '', 'cmk-80-125-11-2', 4, 109, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(513, 220, 'ЦМК2 80/160-1,5/4', '', '', '0', '', 0, '43, м3/ч; 6, м; 1,5, кВт; 1500, об/мин;', '', 'cmk2-80-160-1-5-4', 4, 110, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(514, 220, 'ЦМК 80/160-2,2/4', '', '', '0', '', 0, '50, м3/ч; 8, м; 2,2, кВт; 1500, об/мин;', '', 'cmk-80-160-2-2-4', 4, 111, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(515, 220, 'ЦМК1 80/160-2,2/4', '', '', '0', '', 0, '46, м3/ч; 7, м; 2,2, кВт; 1500, об/мин;', '', 'cmk1-80-160-2-2-4', 4, 112, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(516, 220, 'ЦМК1 80/160-11/2', '', '', '0', '', 0, '93, м3/ч; 28, м; 11, кВт; 3000, об/мин;', '', 'cmk1-80-160-11-2', 4, 113, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(517, 220, 'ЦМК2 80/160-11/2', '', '', '0', '', 0, '86, м3/ч; 24, м; 11, кВт; 3000, об/мин;', '', 'cmk2-80-160-11-2', 4, 114, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(518, 220, 'ЦМК 80/160-15/2', '', '', '0', '', 0, '100, м3/ч; 32, м; 15, кВт; 3000, об/мин;', '', 'cmk-80-160-15-2', 4, 115, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(519, 220, 'ЦМК2 100/200-4/4', '', '', '0', '', 0, '86, м3/ч; 9, м; 4, кВт; 1500, об/мин;', '', 'cmk2-100-200-4-4', 4, 116, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(520, 220, 'ЦМК1 100/200-5,5/4', '', '', '0', '', 0, '93, м3/ч; 11, м; 5,5, кВт; 1500, об/мин;', '', 'cmk1-100-200-5-5-4', 4, 117, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(521, 220, 'ЦМК 100/200-7,5/4', '', '', '0', '', 0, '100, м3/ч; 12, м; 7,5, кВт; 1500, об/мин;', '', 'cmk-100-200-7-5-4', 4, 118, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(522, 220, 'ЦМК2 100/200-30/2', '', '', '0', '', 0, '173, м3/ч; 38, м; 30, кВт; 3000, об/мин;', '', 'cmk2-100-200-30-2', 4, 119, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(523, 220, 'ЦМК1 100/200-37/2', '', '', '0', '', 0, '187, м3/ч; 44, м; 37, кВт; 3000, об/мин;', '', 'cmk1-100-200-37-2', 4, 120, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(524, 220, 'ЦМК 100/200-45/2', '', '', '0', '', 0, '200, м3/ч; 50, м; 45, кВт; 3000, об/мин;', '', 'cmk-100-200-45-2', 4, 121, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(525, 220, 'ЦМК1 100/250-7,5/4', '', '', '0', '', 0, '93, м3/ч; 17, м; 7,5, кВт; 1500, об/мин;', '', 'cmk1-100-250-7-5-4', 4, 122, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(526, 220, 'ЦМК2 100/250-7,5/4', '', '', '0', '', 0, '86, м3/ч; 15, м; 7,5, кВт; 1500, об/мин;', '', 'cmk2-100-250-7-5-4', 4, 123, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(527, 220, 'ЦМК 100/250-11/4', '', '', '0', '', 0, '100, м3/ч; 20, м; 11, кВт; 1500, об/мин;', '', 'cmk-100-250-11-4', 4, 124, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(528, 220, 'ЦМК2 100/250-45/2', '', '', '0', '', 0, '173, м3/ч; 60, м; 45, кВт; 3000, об/мин;', '', 'cmk2-100-250-45-2', 4, 125, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(529, 220, 'ЦМК1 100/250-55/2', '', '', '0', '', 0, '187, м3/ч; 70, м; 55, кВт; 3000, об/мин;', '', 'cmk1-100-250-55-2', 4, 126, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(530, 220, 'ЦМК 100/250-75/2', '', '', '0', '', 0, '200, м3/ч; 80, м; 75, кВт; 3000, об/мин;', '', 'cmk-100-250-75-2', 4, 127, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(531, 220, 'ЦМК1 100/315-11/4', '', '', '0', '', 0, '90, м3/ч; 25, м; 11, кВт; 1500, об/мин;', '', 'cmk1-100-315-11-4', 4, 128, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(532, 220, 'ЦМК2 100/315-11/4', '', '', '0', '', 0, '85, м3/ч; 23, м; 11, кВт; 1500, об/мин;', '', 'cmk2-100-315-11-4', 4, 129, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(533, 220, 'ЦМК 100/315-15/4', '', '', '0', '', 0, '100, м3/ч; 32, м; 15, кВт; 1500, об/мин;', '', 'cmk-100-315-15-4', 4, 130, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(534, 220, 'ЦМК2 100/315-75/2', '', '', '0', '', 0, '171, м3/ч; 92, м; 75, кВт; 3000, об/мин;', '', 'cmk2-100-315-75-2', 4, 131, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(535, 220, 'ЦМК1 100/315-90/2', '', '', '0', '', 0, '181, м3/ч; 103, м; 90, кВт; 3000, об/мин;', '', 'cmk1-100-315-90-2', 4, 132, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(536, 220, 'ЦМК 100/315-110/2', '', '', '0', '', 0, '200, м3/ч; 125, м; 110, кВт; 3000, об/мин;', '', 'cmk-100-315-110-2', 4, 133, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(537, 220, 'ЦМК2 125/250-3/6', '', '', '0', '', 0, '110, м3/ч; 5, м; 3, кВт; 1000, об/мин;', '', 'cmk2-125-250-3-6', 4, 134, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(538, 220, 'ЦМК1 125/250-4/6', '', '', '0', '', 0, '130, м3/ч; 6, м; 4, кВт; 1000, об/мин;', '', 'cmk1-125-250-4-6', 4, 135, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(539, 220, 'ЦМК 125/250-5,5/6', '', '', '0', '', 0, '140, м3/ч; 8, м; 5,5, кВт; 1000, об/мин;', '', 'cmk-125-250-5-5-6', 4, 136, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(540, 220, 'ЦМК2 125/250-11/4', '', '', '0', '', 0, '173, м3/ч; 15, м; 11, кВт; 1500, об/мин;', '', 'cmk2-125-250-11-4', 4, 137, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(541, 220, 'ЦМК1 125/250-15/4', '', '', '0', '', 0, '187, м3/ч; 17, м; 15, кВт; 1500, об/мин;', '', 'cmk1-125-250-15-4', 4, 138, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(542, 220, 'ЦМК 125/250-18,5/4', '', '', '0', '', 0, '200, м3/ч; 20, м; 18,5, кВт; 1500, об/мин;', '', 'cmk-125-250-18-5-4', 4, 139, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(543, 220, 'ЦМК2 125/315-5,5/6', '', '', '0', '', 0, '135, м3/ч; 8, м; 5,5, кВт; 1000, об/мин;', '', 'cmk2-125-315-5-5-6', 4, 140, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(544, 220, 'ЦМК1 125/315-7,5/6', '', '', '0', '', 0, '135, м3/ч; 11, м; 7,5, кВт; 1000, об/мин;', '', 'cmk1-125-315-7-5-6', 4, 141, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(545, 220, 'ЦМК 125/315-11/6', '', '', '0', '', 0, '135, м3/ч; 14, м; 11, кВт; 1000, об/мин;', '', 'cmk-125-315-11-6', 4, 142, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(546, 220, 'ЦМК2 125/315-18,5/4', '', '', '0', '', 0, '173, м3/ч; 24, м; 18,5, кВт; 1500, об/мин;', '', 'cmk2-125-315-18-5-4', 4, 143, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(547, 220, 'ЦМК1 125/315-22/4', '', '', '0', '', 0, '187, м3/ч; 28, м; 22, кВт; 1500, об/мин;', '', 'cmk1-125-315-22-4', 4, 144, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(548, 220, 'ЦМК 125/315-30/4', '', '', '0', '', 0, '200, м3/ч; 32, м; 30, кВт; 1500, об/мин;', '', 'cmk-125-315-30-4', 4, 145, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(549, 220, 'ЦМК2 150/250-7,5/6', '', '', '0', '', 0, '230, м3/ч; 6, м; 7,5, кВт; 1000, об/мин;', '', 'cmk2-150-250-7-5-6', 4, 146, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(550, 220, 'ЦМК1 150/250-11/6', '', '', '0', '', 0, '250, м3/ч; 7, м; 11, кВт; 1000, об/мин;', '', 'cmk1-150-250-11-6', 4, 147, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(551, 220, 'ЦМК 150/250-15/6', '', '', '0', '', 0, '260, м3/ч; 8,5, м; 15, кВт; 1000, об/мин;', '', 'cmk-150-250-15-6', 4, 148, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(552, 220, 'ЦМК2 150/250-22/4', '', '', '0', '', 0, '346, м3/ч; 15, м; 22, кВт; 1500, об/мин;', '', 'cmk2-150-250-22-4', 4, 149, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(553, 220, 'ЦМК1 150/250-30/4', '', '', '0', '', 0, '374, м3/ч; 17, м; 30, кВт; 1500, об/мин;', '', 'cmk1-150-250-30-4', 4, 150, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(554, 220, 'ЦМК 150/250-37/4', '', '', '0', '', 0, '400, м3/ч; 20, м; 37, кВт; 1500, об/мин;', '', 'cmk-150-250-37-4', 4, 151, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(555, 220, 'ЦМК1 150/315-15/6', '', '', '0', '', 0, '250, м3/ч; 12, м; 15, кВт; 1000, об/мин;', '', 'cmk1-150-315-15-6', 4, 152, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(556, 220, 'ЦМК2 150/315-15/6', '', '', '0', '', 0, '230, м3/ч; 10, м; 15, кВт; 1000, об/мин;', '', 'cmk2-150-315-15-6', 4, 153, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(557, 220, 'ЦМК 150/315-18,5/6', '', '', '0', '', 0, '260, м3/ч; 14, м; 18,5, кВт; 1000, об/мин;', '', 'cmk-150-315-18-5-6', 4, 154, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(558, 220, 'ЦМК2 150/315-37/4', '', '', '0', '', 0, '346, м3/ч; 24, м; 37, кВт; 1500, об/мин;', '', 'cmk2-150-315-37-4', 4, 155, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(559, 220, 'ЦМК1 150/315-45/4', '', '', '0', '', 0, '374, м3/ч; 28, м; 45, кВт; 1500, об/мин;', '', 'cmk1-150-315-45-4', 4, 156, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(560, 220, 'ЦМК 150/315-55/4', '', '', '0', '', 0, '400, м3/ч; 32, м; 55, кВт; 1500, об/мин;', '', 'cmk-150-315-55-4', 4, 157, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(561, 220, 'ЦМК2 150/400-22/6', '', '', '0', '', 0, '240, м3/ч; 16, м; 22, кВт; 1000, об/мин;', '', 'cmk2-150-400-22-6', 4, 158, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(562, 220, 'ЦМК 150/400-30/6', '', '', '0', '', 0, '260, м3/ч; 22, м; 30, кВт; 1000, об/мин;', '', 'cmk-150-400-30-6', 4, 159, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(563, 220, 'ЦМК1 150/400-30/6', '', '', '0', '', 0, '250, м3/ч; 19, м; 30, кВт; 1000, об/мин;', '', 'cmk1-150-400-30-6', 4, 160, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(564, 220, 'ЦМК2 150/400-55/4', '', '', '0', '', 0, '346, м3/ч; 38, м; 55, кВт; 1500, об/мин;', '', 'cmk2-150-400-55-4', 4, 161, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(565, 220, 'ЦМК1 150/400-75/4', '', '', '0', '', 0, '374, м3/ч; 44, м; 75, кВт; 1500, об/мин;', '', 'cmk1-150-400-75-4', 4, 162, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(566, 220, 'ЦМК 150/400-90/4', '', '', '0', '', 0, '400, м3/ч; 50, м; 90, кВт; 1500, об/мин;', '', 'cmk-150-400-90-4', 4, 163, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(567, 220, 'ЦМК2 150/500-55/4', '', '', '0', '', 0, '263, м3/ч; 49, м; 55, кВт; 1500, об/мин;', '', 'cmk2-150-500-55-4', 4, 164, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(568, 220, 'ЦМК1 150/500-75/4', '', '', '0', '', 0, '280, м3/ч; 56, м; 75, кВт; 1500, об/мин;', '', 'cmk1-150-500-75-4', 4, 165, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(569, 220, 'ЦМК 150/500-90/4', '', '', '0', '', 0, '300, м3/ч; 66, м; 90, кВт; 1500, об/мин;', '', 'cmk-150-500-90-4', 4, 166, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(570, 220, 'ЦМК2 200/400-90/4', '', '', '0', '', 0, '530, м3/ч; 35, м; 90, кВт; 1500, об/мин;', '', 'cmk2-200-400-90-4', 4, 167, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(571, 220, 'ЦМК1 200/400-110/4', '', '', '0', '', 0, '600, м3/ч; 45, м; 110, кВт; 1500, об/мин;', '', 'cmk1-200-400-110-4', 4, 168, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(572, 220, 'ЦМК 200/400-132/4', '', '', '0', '', 0, '630, м3/ч; 50, м; 132, кВт; 1500, об/мин;', '', 'cmk-200-400-132-4', 4, 169, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(573, 220, 'ЦМК 200/415-160/4', '', '', '0', '', 0, '630, м3/ч; 54, м; 160, кВт; 1500, об/мин;', '', 'cmk-200-415-160-4', 4, 170, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(574, 220, 'ЦМК2 250/315-90/4', '', '', '0', '', 0, '880, м3/ч; 25, м; 90, кВт; 1500, об/мин;', '', 'cmk2-250-315-90-4', 4, 171, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(575, 220, 'ЦМК 250/315-110/4', '', '', '0', '', 0, '1000, м3/ч; 32, м; 110, кВт; 1500, об/мин;', '', 'cmk-250-315-110-4', 4, 172, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(576, 220, 'ЦМК1 250/315-110/4', '', '', '0', '', 0, '940, м3/ч; 28, м; 110, кВт; 1500, об/мин;', '', 'cmk1-250-315-110-4', 4, 173, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(577, 220, 'ЦМК 250/330-132/4', '', '', '0', '', 0, '1000, м3/ч; 37,5, м; 132, кВт; 1500, об/мин;', '', 'cmk-250-330-132-4', 4, 174, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(578, 220, 'ЦМК2 250/400-132/4', '', '', '0', '', 0, '840, м3/ч; 35, м; 132, кВт; 1500, об/мин;', '', 'cmk2-250-400-132-4', 4, 175, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(579, 220, 'ЦМК1 250/400-160/4', '', '', '0', '', 0, '890, м3/ч; 40, м; 160, кВт; 1500, об/мин;', '', 'cmk1-250-400-160-4', 4, 176, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(580, 220, 'ЦМК 250/400-200/4', '', '', '0', '', 0, '1000, м3/ч; 50, м; 200, кВт; 1500, об/мин;', '', 'cmk-250-400-200-4', 4, 177, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(581, 220, 'ЦМК2 300/315-132/4', '', '', '0', '', 0, '1410, м3/ч; 25, м; 132, кВт; 1500, об/мин;', '', 'cmk2-300-315-132-4', 4, 178, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(582, 220, 'ЦМК1 300/315-160/4', '', '', '0', '', 0, '1510, м3/ч; 28, м; 160, кВт; 1500, об/мин;', '', 'cmk1-300-315-160-4', 4, 179, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(583, 220, 'ЦМК 300/315-200/4', '', '', '0', '', 0, '1600, м3/ч; 32, м; 200, кВт; 1500, об/мин;', '', 'cmk-300-315-200-4', 4, 180, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(584, 220, 'ЦМК 300/330-200/4', '', '', '0', '', 0, '1600, м3/ч; 36, м; 200, кВт; 1500, об/мин;', '', 'cmk-300-330-200-4', 4, 181, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(585, 8, 'НФС 50/125.98-1,1/2-311', '', '', '0', '', 0, 'Подача, м3/ч: 7; Напор, м: 4; Мощность двигателя, кВт: 1,1; Частота вращения, об/мин: 3 000;', '', 'nfs-5012598-112-311', 4, 100, 1, 0, '', '', '144', '172', 0, 0, '', '', '2017-07-23', 0),
(586, 8, 'НФС 50/125.98-М1,1/2-310', '', '', '0', '', 0, 'Подача, м3/ч: 7; Напор, м: 4; Мощность двигателя, кВт: 1,1; Частота вращения, об/мин: 3 000;', '', 'nfs-5012598-m112-310', 4, 100, 1, 0, '', '', '144', '172', 0, 0, '', '', '2017-07-23', 0),
(587, 8, 'НФС 50/125.120-1,1/2 Ex-300', '', '', '0', '', 0, 'Подача, м3/ч: 16; Напор, м: 6; Мощность двигателя, кВт: 1,1; Частота вращения, об/мин: 3 000;', '', 'nfs-50125120-112-x-300', 4, 100, 1, 0, '', '', '144', '172', 0, 0, '', '', '2017-07-23', 0),
(588, 8, 'НФС 50/125.120-1,1/2-311', '', '', '0', '', 0, 'Подача, м3/ч: 16; Напор, м: 6; Мощность двигателя, кВт: 1,1; Частота вращения, об/мин: 3 000;', '', 'nfs-50125120-112-311', 4, 100, 1, 0, '', '', '144', '172', 0, 0, '', '', '2017-07-23', 0),
(589, 8, 'НФС 50/125.120-М1,1/2-310', '', '', '0', '', 0, 'Подача, м3/ч: 16; Напор, м: 6; Мощность двигателя, кВт: 1,1; Частота вращения, об/мин: 3 000;', '', 'nfs-50125120-m112-310', 4, 100, 1, 0, '', '', '144', '172', 0, 0, '', '', '2017-07-23', 0),
(590, 5, 'Насосы Иртыш ЦМЛ', 'Иртыш ЦМЛ - насос центробежный моноблочный линейный', 'Насос Иртыш ЦМЛ', '0', 'Насосы серии ЦМЛ применяются в стационарных условиях для перекачивания различного рода жидкостей схожей по составу с чистой водой или с содержанием в ней гликоля. Используется данный вид насосов Иртыш при сооружении различного рода зданий и сооружений.\n', 0, '', '<p class=\"MsoNormal\"><span>Центробежный моноблочный линейный насос ЦМЛ используется при работе в стационарных условиях и применяется для перекачки различного рода жидкостей сходной по своим характеристикам с чистой водой. </span></p>\n<p class=\"MsoNormal\"><strong><span>В роли жидкостей могут выступать:</span></strong></p>\n<ul>\n<li>Чистая производственно-техническая вода (за исключением морской воды)</li>\n<li>Холодная и конденсационная вода</li>\n<li>Вода хозяйственного назначения</li>\n<li>Вода в отопительных системах</li>\n<li>Вода с содержанием гликоля</li>\n<li>Иная жидкость, схожая по своему составу и характеристикам с чистой водой.</li>\n</ul>\n<p>Насос Иртыш ЦМЛ относится к насосам сухого типа, всасывание и напор находятся на одной линии с трубопроводом. Данный вид насосов используется при техническом сооружении зданий. Установка насоса осуществляется непосредственно на самом трубо-проводе или закрепляется на фундаменте строения.</p>\n<h2 style=\"text-align: center;\"><strong><span>Насос Иртыш &ndash; состав и принцип работы</span></strong></h2>\n<p class=\"MsoNormal\"><span>Насосы серии ЦМЛ представляют профессиональное моноблочное, одноступенчатое устройство низкого давления, которое прекрасно подходит для современного оборудования зданий и сооружений. Основным его преимуществам по отношению к своим конкурентам является его компактность. Внутри самого насоса располагается асинхронный, общепромышленный, трехфазный электродвигатель, который приводит насос в действие. Корпус насоса имеет спиралевидное линейное исполнение. Изготавливаются они из высококачественного серого чугуна. Фланцы имеют вывод для установки на них датчика давления жидкости. </span></p>\n<h2 style=\"text-align: center;\"><strong><span>Технические характеристики насоса ЦМЛ:</span></strong><strong>&nbsp;</strong></h2>\n<ul>\n<li>Диапазон температур по Цельсию &ndash; -10 до +140 градусов</li>\n<li>Температура окружающей среды по Цельсию &ndash; до 40 градусов</li>\n<li>Водородный показатель,&nbsp;<span lang=\"EN-US\">pH</span>&nbsp;&ndash; от 6 до 9</li>\n<li>Максимальное давление рабочее</li>\n<li>Абразивные включения (концентрация не более одного процента от объема) &ndash; до 0.2 миллиметров</li>\n<li>Степень защиты &ndash;&nbsp;<span lang=\"EN-US\">IP</span>54</li>\n<li>Мощность двигателя, кВт - от 1,5 до 200</li>\n<li>Обороты двигаителя, об./мин. - от 1 000 до 3 000</li>\n<li>Напор, м. - от 10 до 125 метров</li>\n<li>Максимальное рабочее давление, МПа &ndash; 1,3</li>\n<li>Производительность, м3/ч - от 10 до 10 80</li>\n</ul>\n<p>&nbsp;</p>\n<h2 style=\"text-align: center;\"><strong><span>Условное обозначение - Иртыш ЦМЛ</span></strong><strong><span lang=\"EN-US\">:</span></strong><strong><span>&nbsp;</span></strong></h2>\n<p class=\"MsoNormal\"><strong><span>Вид обозначения:</span></strong><span>&nbsp;Иртыш ЦМЛ 50/200 - 1,5/2 Ех</span></p>\n<ul>\n<li><strong>ИРТЫШ&nbsp;</strong>- серия насоса</li>\n<li><strong>ЦМЛ&nbsp;</strong>- тип насоса</li>\n<li><strong><span lang=\"EN-US\">50</span></strong><strong>&nbsp;</strong>- номинальный диаметр трубного присоединения</li>\n<li><strong><span lang=\"EN-US\">200</span></strong><strong>&nbsp;</strong>- номинальный диаметр рабочего колеса</li>\n<li><strong>1,5&nbsp;</strong>- номинальная мощность электродвигателя</li>\n<li><strong>2 </strong>&ndash; количество полюсов электродвигателя</li>\n<li><strong><span lang=\"EN-US\">Ex </span></strong>&ndash; исполнение двигателя                 \n<ul>\n<li>Ех &ndash; взрывозащищенного исполнения;</li>\n<li>Без обозначения &ndash; базовый электродвигатель</li>\n</ul>\n</li>\n</ul>\n<h2 style=\"text-align: center;\">Схема насоса Иртыш<span lang=\"EN-US\">:</span></h2>\n<p><span lang=\"EN-US\"><img class=\"modalL\" style=\"float: right; margin-left: 10px; margin-right: 10px;\" title=\"Схема - Насос Иртыш ЦМЛ\" src=\"/image_upload/nasos/.thumbs/294cde2cec1adc14696f3df6e42ea9a4_500_0_0.jpg\" alt=\"Схема - Насос Иртыш ЦМЛ\" width=\"250\" height=\"249\" />&nbsp;</span></p>\n<ul>\n<li>1 &ndash; крышка вентилятора</li>\n<li>2 &ndash; электродвигатель</li>\n<li>3 &ndash; проставка</li>\n<li>4 &ndash; прокладка</li>\n<li>5 &ndash; корпус спиральный</li>\n<li>6 &ndash; кран Маевского</li>\n<li>7 &ndash; торцовое уплотнение</li>\n<li>8 &ndash; вывод на датчик давления с резьбовой пробкой</li>\n<li>9 &ndash; рабочее колесо</li>\n<li>10 &ndash; шайба</li>\n<li>11 &ndash; гайка</li>\n<li>12 &ndash; болт</li>\n<li>13 &ndash; вал</li>\n<li>14 &ndash; отбойник (манжета)</li>\n<li>15 &ndash; крышка (кольцо стопорное)</li>\n<li>16 &ndash; масленка</li>\n<li>17 &ndash; рым-болт</li>\n</ul>\n<p>&nbsp;</p>', 'nasos-irtysh-cml', 3, 100, 1, 0, 'nasos-irtysh-cml.jpg', 'nasos-irtysh-cml.png', '144', '172', 0, 0, '', '', '2017-07-27', 0),
(591, 590, 'ЦМЛ 50/122-1,5/2', '', '', '0', '', 0, '11, м3/ч; 16, м; 1,5, кВт; 3000, об/мин;', '', 'cml-50-122-1-5-2', 4, 0, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(592, 590, 'ЦМЛ 50/130-1,5/2', '', '', '0', '', 0, '12,5, м3/ч; 20, м; 1,5, кВт; 3000, об/мин;', '', 'cml-50-130-1-5-2', 4, 1, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(593, 590, 'ЦМЛ 50/145-2,2/2', '', '', '0', '', 0, '11, м3/ч; 28, м; 2,2, кВт; 3000, об/мин;', '', 'cml-50-145-2-2-2', 4, 2, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(594, 590, 'ЦМЛ 50/158-3/2', '', '', '0', '', 0, '12,5, м3/ч; 32, м; 3, кВт; 3000, об/мин;', '', 'cml-50-158-3-2', 4, 3, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(595, 590, 'ЦМЛ 50/175-3/2', '', '', '0', '', 0, '10, м3/ч; 36, м; 3, кВт; 3000, об/мин;', '', 'cml-50-175-3-2', 4, 4, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(596, 590, 'ЦМЛ 50/184-4/2', '', '', '0', '', 0, '11, м3/ч; 44, м; 4, кВт; 3000, об/мин;', '', 'cml-50-184-4-2', 4, 5, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(597, 590, 'ЦМЛ 50/196-5,5/2', '', '', '0', '', 0, '12,5, м3/ч; 50, м; 5,5, кВт; 3000, об/мин;', '', 'cml-50-196-5-5-2', 4, 6, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(598, 590, 'ЦМЛ 50/202-5,5/2', '', '', '0', '', 0, '10, м3/ч; 52, м; 5,5, кВт; 3000, об/мин;', '', 'cml-50-202-5-5-2', 4, 7, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(599, 590, 'ЦМЛ 50/217-7,5/2', '', '', '0', '', 0, '10, м3/ч; 60, м; 7,5, кВт; 3000, об/мин;', '', 'cml-50-217-7-5-2', 4, 8, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(600, 590, 'ЦМЛ 50/240-7,5/2', '', '', '0', '', 0, '11, м3/ч; 70, м; 7,5, кВт; 3000, об/мин;', '', 'cml-50-240-7-5-2', 4, 9, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(601, 590, 'ЦМЛ 50/247-11/2', '', '', '0', '', 0, '12,5, м3/ч; 80, м; 11, кВт; 3000, об/мин;', '', 'cml-50-247-11-2', 4, 10, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(602, 590, 'ЦМЛ 65/100-1,1/2', '', '', '0', '', 0, '22, м3/ч; 10, м; 1,1, кВт; 3000, об/мин;', '', 'cml-65-100-1-1-2', 4, 11, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(603, 590, 'ЦМЛ 65/115-1,5/2', '', '', '0', '', 0, '25, м3/ч; 12,5, м; 1,5, кВт; 3000, об/мин;', '', 'cml-65-115-1-5-2', 4, 12, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(604, 590, 'ЦМЛ 65/121-2,2/2', '', '', '0', '', 0, '22, м3/ч; 16, м; 2,2, кВт; 3000, об/мин;', '', 'cml-65-121-2-2-2', 4, 13, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(605, 590, 'ЦМЛ 65/130-3/2', '', '', '0', '', 0, '25, м3/ч; 20, м; 3, кВт; 3000, об/мин;', '', 'cml-65-130-3-2', 4, 14, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(403, 220, 'ЦМК 32/125-1,1/4', '', '', '0', '', 0, '6, м3/ч; 5, м; 1,1, кВт; 1500, об/мин;', '', 'cmk-32-125-1-1-4', 4, 0, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(404, 220, 'ЦМК1 32/125-1,1/4', '', '', '0', '', 0, '5, м3/ч; 4, м; 1,1, кВт; 1500, об/мин;', '', 'cmk1-32-125-1-1-4', 4, 1, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(405, 220, 'ЦМК1 32/125-1,5/2', '', '', '0', '', 0, '11, м3/ч; 16, м; 1,5, кВт; 3000, об/мин;', '', 'cmk1-32-125-1-5-2', 4, 2, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(406, 220, 'ЦМК 32/125-2,2/2', '', '', '0', '', 0, '12,5, м3/ч; 20, м; 2,2, кВт; 3000, об/мин;', '', 'cmk-32-125-2-2-2', 4, 3, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(407, 220, 'ЦМК 32/160-1,1/4', '', '', '0', '', 0, '6, м3/ч; 8, м; 1,1, кВт; 1500, об/мин;', '', 'cmk-32-160-1-1-4', 4, 4, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(408, 220, 'ЦМК1 32/160-1,1/4', '', '', '0', '', 0, '6, м3/ч; 7, м; 1,1, кВт; 1500, об/мин;', '', 'cmk1-32-160-1-1-4', 4, 5, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(409, 220, 'ЦМК1 32/160-2,2/2', '', '', '0', '', 0, '11, м3/ч; 28, м; 2,2, кВт; 3000, об/мин;', '', 'cmk1-32-160-2-2-2', 4, 6, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(410, 220, 'ЦМК2 32/160-2,2/2', '', '', '0', '', 0, '10, м3/ч; 24, м; 2,2, кВт; 3000, об/мин;', '', 'cmk2-32-160-2-2-2', 4, 7, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(411, 220, 'ЦМК 32/160-3/2', '', '', '0', '', 0, '12,5, м3/ч; 32, м; 3, кВт; 3000, об/мин;', '', 'cmk-32-160-3-2', 4, 8, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(412, 220, 'ЦМК 32/200-1,1/4', '', '', '0', '', 0, '6, м3/ч; 12,5, м; 1,1, кВт; 1500, об/мин;', '', 'cmk-32-200-1-1-4', 4, 9, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(413, 220, 'ЦМК1 32/200-1,1/4', '', '', '0', '', 0, '6, м3/ч; 11, м; 1,1, кВт; 1500, об/мин;', '', 'cmk1-32-200-1-1-4', 4, 10, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(414, 220, 'ЦМК2 32/200-1,1/4', '', '', '0', '', 0, '5, м3/ч; 9, м; 1,1, кВт; 1500, об/мин;', '', 'cmk2-32-200-1-1-4', 4, 11, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(415, 220, 'ЦМК1 32/200-4/2', '', '', '0', '', 0, '11, м3/ч; 44, м; 4, кВт; 3000, об/мин;', '', 'cmk1-32-200-4-2', 4, 12, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(416, 220, 'ЦМК 32/200-5,5/2', '', '', '0', '', 0, '12, м3/ч; 50, м; 5,5, кВт; 3000, об/мин;', '', 'cmk-32-200-5-5-2', 4, 13, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(417, 220, 'ЦМК2 32/250-1,1/4', '', '', '0', '', 0, '5, м3/ч; 15, м; 1,1, кВт; 1500, об/мин;', '', 'cmk2-32-250-1-1-4', 4, 14, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(418, 220, 'ЦМК 32/250-1,5/4', '', '', '0', '', 0, '6, м3/ч; 20, м; 1,5, кВт; 1500, об/мин;', '', 'cmk-32-250-1-5-4', 4, 15, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(419, 220, 'ЦМК1 32/250-1,5/4', '', '', '0', '', 0, '6, м3/ч; 17, м; 1,5, кВт; 1500, об/мин;', '', 'cmk1-32-250-1-5-4', 4, 16, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(420, 220, 'ЦМК1 32/250-7,5/2', '', '', '0', '', 0, '11, м3/ч; 70, м; 7,5, кВт; 3000, об/мин;', '', 'cmk1-32-250-7-5-2', 4, 17, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(421, 220, 'ЦМК2 32/250-7,5/2', '', '', '0', '', 0, '10, м3/ч; 60, м; 7,5, кВт; 3000, об/мин;', '', 'cmk2-32-250-7-5-2', 4, 18, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(422, 220, 'ЦМК 32/250-11/2', '', '', '0', '', 0, '12,5, м3/ч; 80, м; 11, кВт; 3000, об/мин;', '', 'cmk-32-250-11-2', 4, 19, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(423, 220, 'ЦМК 40/200-1,1/4', '', '', '0', '', 0, '12, м3/ч; 12, м; 1,1, кВт; 1500, об/мин;', '', 'cmk-40-200-1-1-4', 4, 20, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(424, 220, 'ЦМК1 40/200-1,1/4', '', '', '0', '', 0, '12, м3/ч; 11, м; 1,1, кВт; 1500, об/мин;', '', 'cmk1-40-200-1-1-4', 4, 21, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(425, 220, 'ЦМК2 40/200-1,1/4', '', '', '0', '', 0, '11, м3/ч; 10, м; 1,1, кВт; 1500, об/мин;', '', 'cmk2-40-200-1-1-4', 4, 22, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(426, 220, 'ЦМК2 40/200-5,5/2', '', '', '0', '', 0, '21, м3/ч; 38, м; 5,5, кВт; 3000, об/мин;', '', 'cmk2-40-200-5-5-2', 4, 23, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(427, 220, 'ЦМК 40/200-7,5/2', '', '', '0', '', 0, '25, м3/ч; 50, м; 7,5, кВт; 3000, об/мин;', '', 'cmk-40-200-7-5-2', 4, 24, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(428, 220, 'ЦМК1 40/200-7,5/2', '', '', '0', '', 0, '23, м3/ч; 44, м; 7,5, кВт; 3000, об/мин;', '', 'cmk1-40-200-7-5-2', 4, 25, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(429, 220, 'ЦМК2 40/250-1,5/4', '', '', '0', '', 0, '10, м3/ч; 15, м; 1,5, кВт; 1500, об/мин;', '', 'cmk2-40-250-1-5-4', 4, 26, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(430, 220, 'ЦМК 40/250-2,2/4', '', '', '0', '', 0, '12, м3/ч; 20, м; 2,2, кВт; 1500, об/мин;', '', 'cmk-40-250-2-2-4', 4, 27, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(431, 220, 'ЦМК1 40/250-2,2/4', '', '', '0', '', 0, '11, м3/ч; 17, м; 2,2, кВт; 1500, об/мин;', '', 'cmk1-40-250-2-2-4', 4, 28, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(432, 220, 'ЦМК1 40/250-11/2', '', '', '0', '', 0, '23, м3/ч; 70, м; 11, кВт; 3000, об/мин;', '', 'cmk1-40-250-11-2', 4, 29, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(433, 220, 'ЦМК2 40/250-11/2', '', '', '0', '', 0, '21, м3/ч; 60, м; 11, кВт; 3000, об/мин;', '', 'cmk2-40-250-11-2', 4, 30, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(434, 220, 'ЦМК 40/250-15/2', '', '', '0', '', 0, '25, м3/ч; 80, м; 15, кВт; 3000, об/мин;', '', 'cmk-40-250-15-2', 4, 31, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(435, 220, 'ЦМК1 40/315-3/4', '', '', '0', '', 0, '11, м3/ч; 26, м; 3, кВт; 1500, об/мин;', '', 'cmk1-40-315-3-4', 4, 32, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(436, 220, 'ЦМК2 40/315-3/4', '', '', '0', '', 0, '10, м3/ч; 23, м; 3, кВт; 1500, об/мин;', '', 'cmk2-40-315-3-4', 4, 33, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(437, 220, 'ЦМК 40/315-4/4', '', '', '0', '', 0, '12, м3/ч; 32, м; 4, кВт; 1500, об/мин;', '', 'cmk-40-315-4-4', 4, 34, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(438, 220, 'ЦМК2 40/315-18,5/2', '', '', '0', '', 0, '21, м3/ч; 90, м; 18,5, кВт; 3000, об/мин;', '', 'cmk2-40-315-18-5-2', 4, 35, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(439, 220, 'ЦМК1 40/315-22/2', '', '', '0', '', 0, '22, м3/ч; 103, м; 22, кВт; 3000, об/мин;', '', 'cmk1-40-315-22-2', 4, 36, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(440, 220, 'ЦМК 40/315-30/2', '', '', '0', '', 0, '25, м3/ч; 125, м; 30, кВт; 3000, об/мин;', '', 'cmk-40-315-30-2', 4, 37, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(441, 220, 'ЦМК 50/125-1,1/4', '', '', '0', '', 0, '12, м3/ч; 5, м; 1,1, кВт; 1500, об/мин;', '', 'cmk-50-125-1-1-4', 4, 38, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(442, 220, 'ЦМК1 50/125-1,1/4', '', '', '0', '', 0, '11, м3/ч; 4, м; 1,1, кВт; 1500, об/мин;', '', 'cmk1-50-125-1-1-4', 4, 39, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(443, 220, 'ЦМК1 50/125-2,2/2', '', '', '0', '', 0, '22, м3/ч; 16, м; 2,2, кВт; 3000, об/мин;', '', 'cmk1-50-125-2-2-2', 4, 40, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(444, 220, 'ЦМК 50/125-3/2', '', '', '0', '', 0, '25, м3/ч; 20, м; 3, кВт; 3000, об/мин;', '', 'cmk-50-125-3-2', 4, 41, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(445, 220, 'ЦМК 50/160-1,1/4', '', '', '0', '', 0, '12, м3/ч; 8, м; 1,1, кВт; 1500, об/мин;', '', 'cmk-50-160-1-1-4', 4, 42, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(446, 220, 'ЦМК1 50/160-1,1/4', '', '', '0', '', 0, '11, м3/ч; 7, м; 1,1, кВт; 1500, об/мин;', '', 'cmk1-50-160-1-1-4', 4, 43, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(447, 220, 'ЦМК2 50/160-1,1/4', '', '', '0', '', 0, '10, м3/ч; 6, м; 1,1, кВт; 1500, об/мин;', '', 'cmk2-50-160-1-1-4', 4, 44, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(448, 220, 'ЦМК2 50/160-3/2', '', '', '0', '', 0, '21, м3/ч; 24, м; 3, кВт; 3000, об/мин;', '', 'cmk2-50-160-3-2', 4, 45, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(449, 220, 'ЦМК1 50/160-4/2', '', '', '0', '', 0, '23, м3/ч; 28, м; 4, кВт; 3000, об/мин;', '', 'cmk1-50-160-4-2', 4, 46, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(606, 590, 'ЦМЛ 65/142-3/2', '', '', '0', '', 0, '21, м3/ч; 24, м; 3, кВт; 3000, об/мин;', '', 'cml-65-142-3-2', 4, 15, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(607, 590, 'ЦМЛ 65/154-4/2', '', '', '0', '', 0, '23, м3/ч; 28, м; 4, кВт; 3000, об/мин;', '', 'cml-65-154-4-2', 4, 16, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(608, 590, 'ЦМЛ 65/164-4/2', '', '', '0', '', 0, '25, м3/ч; 32, м; 4, кВт; 3000, об/мин;', '', 'cml-65-164-4-2', 4, 17, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(609, 590, 'ЦМЛ 65/171-5,5/2', '', '', '0', '', 0, '21, м3/ч; 38, м; 5,5, кВт; 3000, об/мин;', '', 'cml-65-171-5-5-2', 4, 18, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(610, 590, 'ЦМЛ 65/182-7,5/2', '', '', '0', '', 0, '23, м3/ч; 44, м; 7,5, кВт; 3000, об/мин;', '', 'cml-65-182-7-5-2', 4, 19, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(611, 590, 'ЦМЛ 65/191-7,5/2', '', '', '0', '', 0, '25, м3/ч; 50, м; 7,5, кВт; 3000, об/мин;', '', 'cml-65-191-7-5-2', 4, 20, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(612, 590, 'ЦМЛ 65/217-11/2', '', '', '0', '', 0, '21, м3/ч; 60, м; 11, кВт; 3000, об/мин;', '', 'cml-65-217-11-2', 4, 21, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(613, 590, 'ЦМЛ 65/230-11/2', '', '', '0', '', 0, '23, м3/ч; 70, м; 11, кВт; 3000, об/мин;', '', 'cml-65-230-11-2', 4, 22, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(614, 590, 'ЦМЛ 65/242-15/2', '', '', '0', '', 0, '25, м3/ч; 80, м; 15, кВт; 3000, об/мин;', '', 'cml-65-242-15-2', 4, 23, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(615, 590, 'ЦМЛ 65/255-15/2', '', '', '0', '', 0, '20, м3/ч; 85, м; 15, кВт; 3000, об/мин;', '', 'cml-65-255-15-2', 4, 24, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(616, 590, 'ЦМЛ 65/267-18,5/2', '', '', '0', '', 0, '22, м3/ч; 101, м; 18,5, кВт; 3000, об/мин;', '', 'cml-65-267-18-5-2', 4, 25, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(617, 590, 'ЦМЛ 65/280-22/2', '', '', '0', '', 0, '23, м3/ч; 113, м; 22, кВт; 3000, об/мин;', '', 'cml-65-280-22-2', 4, 26, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(618, 590, 'ЦМЛ 65/290-30/2', '', '', '0', '', 0, '25, м3/ч; 125, м; 30, кВт; 3000, об/мин;', '', 'cml-65-290-30-2', 4, 27, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(619, 590, 'ЦМЛ 80/128-4/2', '', '', '0', '', 0, '45, м3/ч; 16, м; 4, кВт; 3000, об/мин;', '', 'cml-80-128-4-2', 4, 28, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(620, 590, 'ЦМЛ 80/136-5,5/2', '', '', '0', '', 0, '50, м3/ч; 20, м; 5,5, кВт; 3000, об/мин;', '', 'cml-80-136-5-5-2', 4, 29, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(621, 590, 'ЦМЛ 80/150-5,5/2', '', '', '0', '', 0, '43, м3/ч; 24, м; 5,5, кВт; 3000, об/мин;', '', 'cml-80-150-5-5-2', 4, 30, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(622, 590, 'ЦМЛ 80/157-7,5/2', '', '', '0', '', 0, '46, м3/ч; 28, м; 7,5, кВт; 3000, об/мин;', '', 'cml-80-157-7-5-2', 4, 31, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(623, 590, 'ЦМЛ 80/164-7,5/2', '', '', '0', '', 0, '50, м3/ч; 32, м; 7,5, кВт; 3000, об/мин;', '', 'cml-80-164-7-5-2', 4, 32, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(624, 590, 'ЦМЛ 80/187-7,5/2', '', '', '0', '', 0, '43, м3/ч; 38, м; 7,5, кВт; 3000, об/мин;', '', 'cml-80-187-7-5-2', 4, 33, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(625, 590, 'ЦМЛ 80/200-11/2', '', '', '0', '', 0, '46, м3/ч; 44, м; 11, кВт; 3000, об/мин;', '', 'cml-80-200-11-2', 4, 34, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(626, 590, 'ЦМЛ 80/209-15/2', '', '', '0', '', 0, '50, м3/ч; 50, м; 15, кВт; 3000, об/мин;', '', 'cml-80-209-15-2', 4, 35, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(627, 590, 'ЦМЛ 80/221-15/2', '', '', '0', '', 0, '43, м3/ч; 60, м; 15, кВт; 3000, об/мин;', '', 'cml-80-221-15-2', 4, 36, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(628, 590, 'ЦМЛ 80/236-18,5/2', '', '', '0', '', 0, '46, м3/ч; 70, м; 18,5, кВт; 3000, об/мин;', '', 'cml-80-236-18-5-2', 4, 37, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(629, 590, 'ЦМЛ 80/250-22/2', '', '', '0', '', 0, '50, м3/ч; 80, м; 22, кВт; 3000, об/мин;', '', 'cml-80-250-22-2', 4, 38, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(630, 590, 'ЦМЛ 80/252-22/2', '', '', '0', '', 0, '41, м3/ч; 85, м; 22, кВт; 3000, об/мин;', '', 'cml-80-252-22-2', 4, 39, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(631, 590, 'ЦМЛ 80/286-30/2', '', '', '0', '', 0, '46, м3/ч; 100, м; 30, кВт; 3000, об/мин;', '', 'cml-80-286-30-2', 4, 40, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(632, 590, 'ЦМЛ 80/315-37/2', '', '', '0', '', 0, '50, м3/ч; 125, м; 37, кВт; 3000, об/мин;', '', 'cml-80-315-37-2', 4, 41, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(633, 590, 'ЦМЛ 100/138-7,5/2', '', '', '0', '', 0, '89, м3/ч; 16, м; 7,5, кВт; 3000, об/мин;', '', 'cml-100-138-7-5-2', 4, 42, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(634, 590, 'ЦМЛ 100/145-11/2', '', '', '0', '', 0, '100, м3/ч; 20, м; 11, кВт; 3000, об/мин;', '', 'cml-100-145-11-2', 4, 43, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(635, 590, 'ЦМЛ 100/146-11/2', '', '', '0', '', 0, '86, м3/ч; 24, м; 11, кВт; 3000, об/мин;', '', 'cml-100-146-11-2', 4, 44, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(636, 590, 'ЦМЛ 100/157-11/2', '', '', '0', '', 0, '93, м3/ч; 28, м; 11, кВт; 3000, об/мин;', '', 'cml-100-157-11-2', 4, 45, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(637, 590, 'ЦМЛ 100/168-15/2', '', '', '0', '', 0, '100, м3/ч; 32, м; 15, кВт; 3000, об/мин;', '', 'cml-100-168-15-2', 4, 46, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(638, 590, 'ЦМЛ 100/186-15/2', '', '', '0', '', 0, '87, м3/ч; 38, м; 15, кВт; 3000, об/мин;', '', 'cml-100-186-15-2', 4, 47, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(639, 590, 'ЦМЛ 100/198-18,5/2', '', '', '0', '', 0, '93, м3/ч; 44, м; 18,5, кВт; 3000, об/мин;', '', 'cml-100-198-18-5-2', 4, 48, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(640, 590, 'ЦМЛ 100/208-22/2', '', '', '0', '', 0, '100, м3/ч; 50, м; 22, кВт; 3000, об/мин;', '', 'cml-100-208-22-2', 4, 49, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(641, 590, 'ЦМЛ 100/223-30/2', '', '', '0', '', 0, '87, м3/ч; 60, м; 30, кВт; 3000, об/мин;', '', 'cml-100-223-30-2', 4, 50, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(642, 590, 'ЦМЛ 100/239-30/2', '', '', '0', '', 0, '93, м3/ч; 70, м; 30, кВт; 3000, об/мин;', '', 'cml-100-239-30-2', 4, 51, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(643, 590, 'ЦМЛ 100/250-37/2', '', '', '0', '', 0, '100, м3/ч; 80, м; 37, кВт; 3000, об/мин;', '', 'cml-100-250-37-2', 4, 52, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(644, 590, 'ЦМЛ 100/252-37/2', '', '', '0', '', 0, '82, м3/ч; 85, м; 37, кВт; 3000, об/мин;', '', 'cml-100-252-37-2', 4, 53, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(645, 590, 'ЦМЛ 100/274-45/2', '', '', '0', '', 0, '90, м3/ч; 101, м; 45, кВт; 3000, об/мин;', '', 'cml-100-274-45-2', 4, 54, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(646, 590, 'ЦМЛ 100/289-55/2', '', '', '0', '', 0, '95, м3/ч; 113, м; 55, кВт; 3000, об/мин;', '', 'cml-100-289-55-2', 4, 55, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(647, 590, 'ЦМЛ 100/302-75/2', '', '', '0', '', 0, '100, м3/ч; 125, м; 75, кВт; 3000, об/мин;', '', 'cml-100-302-75-2', 4, 56, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(648, 590, 'ЦМЛ 125/148-11/2', '', '', '0', '', 0, '143, м3/ч; 16, м; 11, кВт; 3000, об/мин;', '', 'cml-125-148-11-2', 4, 57, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(649, 590, 'ЦМЛ 125/156-15/2', '', '', '0', '', 0, '160, м3/ч; 20, м; 15, кВт; 3000, об/мин;', '', 'cml-125-156-15-2', 4, 58, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(650, 590, 'ЦМЛ 125/158-15/2', '', '', '0', '', 0, '138, м3/ч; 24, м; 15, кВт; 3000, об/мин;', '', 'cml-125-158-15-2', 4, 59, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(651, 590, 'ЦМЛ 125/167-18,5/2', '', '', '0', '', 0, '150, м3/ч; 28, м; 18,5, кВт; 3000, об/мин;', '', 'cml-125-167-18-5-2', 4, 60, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(652, 590, 'ЦМЛ 125/174-22/2', '', '', '0', '', 0, '160, м3/ч; 32, м; 22, кВт; 3000, об/мин;', '', 'cml-125-174-22-2', 4, 61, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(653, 590, 'ЦМЛ 125/180-22/2', '', '', '0', '', 0, '138, м3/ч; 37, м; 22, кВт; 3000, об/мин;', '', 'cml-125-180-22-2', 4, 62, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(654, 590, 'ЦМЛ 125/195-30/2', '', '', '0', '', 0, '150, м3/ч; 44, м; 30, кВт; 3000, об/мин;', '', 'cml-125-195-30-2', 4, 63, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(655, 590, 'ЦМЛ 125/205-37/2', '', '', '0', '', 0, '160, м3/ч; 50, м; 37, кВт; 3000, об/мин;', '', 'cml-125-205-37-2', 4, 64, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(656, 590, 'ЦМЛ 125/220-37/2', '', '', '0', '', 0, '138, м3/ч; 60, м; 37, кВт; 3000, об/мин;', '', 'cml-125-220-37-2', 4, 65, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(657, 590, 'ЦМЛ 125/245-45/2', '', '', '0', '', 0, '150, м3/ч; 70, м; 45, кВт; 3000, об/мин;', '', 'cml-125-245-45-2', 4, 66, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(658, 590, 'ЦМЛ 125/257-55/2', '', '', '0', '', 0, '160, м3/ч; 80, м; 55, кВт; 3000, об/мин;', '', 'cml-125-257-55-2', 4, 67, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(659, 590, 'ЦМЛ 150/225-45/2', '', '', '0', '', 0, '173, м3/ч; 60, м; 45, кВт; 3000, об/мин;', '', 'cml-150-225-45-2', 4, 68, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(660, 590, 'ЦМЛ 150/236-11/4', '', '', '0', '', 0, '167, м3/ч; 14, м; 11, кВт; 1500, об/мин;', '', 'cml-150-236-11-4', 4, 69, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(661, 590, 'ЦМЛ 150/239-55/2', '', '', '0', '', 0, '187, м3/ч; 70, м; 55, кВт; 3000, об/мин;', '', 'cml-150-239-55-2', 4, 70, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(662, 590, 'ЦМЛ 150/248-15/4', '', '', '0', '', 0, '184, м3/ч; 17, м; 15, кВт; 1500, об/мин;', '', 'cml-150-248-15-4', 4, 71, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(663, 590, 'ЦМЛ 150/254-75/2', '', '', '0', '', 0, '200, м3/ч; 80, м; 75, кВт; 3000, об/мин;', '', 'cml-150-254-75-2', 4, 72, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(664, 590, 'ЦМЛ 150/260-18,5/4', '', '', '0', '', 0, '200, м3/ч; 20, м; 18,5, кВт; 1500, об/мин;', '', 'cml-150-260-18-5-4', 4, 73, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(665, 590, 'ЦМЛ 150/292-18,5/4', '', '', '0', '', 0, '173, м3/ч; 24, м; 18,5, кВт; 1500, об/мин;', '', 'cml-150-292-18-5-4', 4, 74, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(666, 590, 'ЦМЛ 150/304-22/4', '', '', '0', '', 0, '187, м3/ч; 28, м; 22, кВт; 1500, об/мин;', '', 'cml-150-304-22-4', 4, 75, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(667, 590, 'ЦМЛ 150/310-22/4', '', '', '0', '', 0, '160, м3/ч; 30, м; 22, кВт; 1500, об/мин;', '', 'cml-150-310-22-4', 4, 76, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(668, 590, 'ЦМЛ 150/325-30/4', '', '', '0', '', 0, '200, м3/ч; 32, м; 30, кВт; 1500, об/мин;', '', 'cml-150-325-30-4', 4, 77, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(669, 590, 'ЦМЛ 150/349-30/4', '', '', '0', '', 0, '174, м3/ч; 38, м; 30, кВт; 1500, об/мин;', '', 'cml-150-349-30-4', 4, 78, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(670, 590, 'ЦМЛ 150/375-37/4', '', '', '0', '', 0, '187, м3/ч; 44, м; 37, кВт; 1500, об/мин;', '', 'cml-150-375-37-4', 4, 79, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(671, 590, 'ЦМЛ 150/395-45/4', '', '', '0', '', 0, '200, м3/ч; 50, м; 45, кВт; 1500, об/мин;', '', 'cml-150-395-45-4', 4, 80, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(672, 590, 'ЦМЛ 200/234-18,5/4', '', '', '0', '', 0, '322, м3/ч; 13, м; 18,5, кВт; 1500, об/мин;', '', 'cml-200-234-18-5-4', 4, 81, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(673, 590, 'ЦМЛ 200/242-18,5/4', '', '', '0', '', 0, '358, м3/ч; 10, м; 18,5, кВт; 1500, об/мин;', '', 'cml-200-242-18-5-4', 4, 82, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(674, 590, 'ЦМЛ 200/260-22/4', '', '', '0', '', 0, '400, м3/ч; 12,5, м; 22, кВт; 1500, об/мин;', '', 'cml-200-260-22-4', 4, 83, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(675, 590, 'ЦМЛ 200/262-22/4', '', '', '0', '', 0, '358, м3/ч; 16, м; 22, кВт; 1500, об/мин;', '', 'cml-200-262-22-4', 4, 84, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(676, 590, 'ЦМЛ 200/290-30/4', '', '', '0', '', 0, '400, м3/ч; 20, м; 30, кВт; 1500, об/мин;', '', 'cml-200-290-30-4', 4, 85, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(677, 590, 'ЦМЛ 200/300-37/4', '', '', '0', '', 0, '346, м3/ч; 24, м; 37, кВт; 1500, об/мин;', '', 'cml-200-300-37-4', 4, 86, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(678, 590, 'ЦМЛ 200/320-45/4', '', '', '0', '', 0, '374, м3/ч; 28, м; 45, кВт; 1500, об/мин;', '', 'cml-200-320-45-4', 4, 87, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0);
INSERT INTO `sections` (`id`, `parent_id`, `name`, `title`, `h1`, `keywords`, `description`, `noindex`, `smalltext`, `fulltext`, `virtual_name`, `template_id`, `num`, `show`, `counter`, `s_image`, `m_image`, `width`, `height`, `blocked_admin`, `blocked_manager`, `url`, `url_rus`, `date`, `timestamp`) VALUES
(679, 590, 'ЦМЛ 200/333-45/4', '', '', '0', '', 0, '320, м3/ч; 32, м; 45, кВт; 1500, об/мин;', '', 'cml-200-333-45-4', 4, 88, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(680, 590, 'ЦМЛ 200/338-55/4', '', '', '0', '', 0, '400, м3/ч; 32, м; 55, кВт; 1500, об/мин;', '', 'cml-200-338-55-4', 4, 89, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(681, 590, 'ЦМЛ 200/362-55/4', '', '', '0', '', 0, '346, м3/ч; 38, м; 55, кВт; 1500, об/мин;', '', 'cml-200-362-55-4', 4, 90, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(682, 590, 'ЦМЛ 200/380-75/4', '', '', '0', '', 0, '374, м3/ч; 44, м; 75, кВт; 1500, об/мин;', '', 'cml-200-380-75-4', 4, 91, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(683, 590, 'ЦМЛ 200/405-90/4', '', '', '0', '', 0, '400, м3/ч; 50, м; 90, кВт; 1500, об/мин;', '', 'cml-200-405-90-4', 4, 92, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(684, 590, 'ЦМЛ 250/332-75/4', '', '', '0', '', 0, '590, м3/ч; 28, м; 75, кВт; 1500, об/мин;', '', 'cml-250-332-75-4', 4, 93, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(685, 590, 'ЦМЛ 250/350-90/4', '', '', '0', '', 0, '630, м3/ч; 32, м; 90, кВт; 1500, об/мин;', '', 'cml-250-350-90-4', 4, 94, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(686, 590, 'ЦМЛ 250/365-110/4', '', '', '0', '', 0, '630, м3/ч; 35, м; 110, кВт; 1500, об/мин;', '', 'cml-250-365-110-4', 4, 95, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(687, 590, 'ЦМЛ 250/373-110/4', '', '', '0', '', 0, '560, м3/ч; 40, м; 110, кВт; 1500, об/мин;', '', 'cml-250-373-110-4', 4, 96, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(688, 590, 'ЦМЛ 250/395-110/4', '', '', '0', '', 0, '600, м3/ч; 45, м; 110, кВт; 1500, об/мин;', '', 'cml-250-395-110-4', 4, 97, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(689, 590, 'ЦМЛ 250/419-132/4', '', '', '0', '', 0, '630, м3/ч; 50, м; 132, кВт; 1500, об/мин;', '', 'cml-250-419-132-4', 4, 98, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(690, 590, 'ЦМЛ 300/340-37/6', '', '', '0', '', 0, '600, м3/ч; 12,5, м; 37, кВт; 1000, об/мин;', '', 'cml-300-340-37-6', 4, 99, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(691, 590, 'ЦМЛ 300/365-45/6', '', '', '0', '', 0, '607, м3/ч; 15, м; 45, кВт; 1000, об/мин;', '', 'cml-300-365-45-6', 4, 100, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(692, 590, 'ЦМЛ 300/371-132/4', '', '', '0', '', 0, '965, м3/ч; 32, м; 132, кВт; 1500, об/мин;', '', 'cml-300-371-132-4', 4, 101, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(693, 590, 'ЦМЛ 300/375-132/4', '', '', '0', '', 0, '890, м3/ч; 35, м; 132, кВт; 1500, об/мин;', '', 'cml-300-375-132-4', 4, 102, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(694, 590, 'ЦМЛ 300/392-160/4', '', '', '0', '', 0, '890, м3/ч; 40, м; 160, кВт; 1500, об/мин;', '', 'cml-300-392-160-4', 4, 103, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(695, 590, 'ЦМЛ 300/395-55/6', '', '', '0', '', 0, '720, м3/ч; 18, м; 55, кВт; 1000, об/мин;', '', 'cml-300-395-55-6', 4, 104, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(696, 590, 'ЦМЛ 300/400-55/6', '', '', '0', '', 0, '623, м3/ч; 21, м; 55, кВт; 1000, об/мин;', '', 'cml-300-400-55-6', 4, 105, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(697, 590, 'ЦМЛ 300/414-200/4', '', '', '0', '', 0, '950, м3/ч; 45, м; 200, кВт; 1500, об/мин;', '', 'cml-300-414-200-4', 4, 106, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(698, 590, 'ЦМЛ 300/420-75/6', '', '', '0', '', 0, '666, м3/ч; 24, м; 75, кВт; 1000, об/мин;', '', 'cml-300-420-75-6', 4, 107, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(699, 590, 'ЦМЛ 300/420-160/4', '', '', '0', '', 0, '1080, м3/ч; 40, м; 160, кВт; 1500, об/мин;', '', 'cml-300-420-160-4', 4, 108, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(700, 590, 'ЦМЛ 300/434-200/4', '', '', '0', '', 0, '1000, м3/ч; 50, м; 200, кВт; 1500, об/мин;', '', 'cml-300-434-200-4', 4, 109, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(701, 590, 'ЦМЛ 300/444-75/6', '', '', '0', '', 0, '720, м3/ч; 28, м; 75, кВт; 1000, об/мин;', '', 'cml-300-444-75-6', 4, 110, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(702, 590, 'ЦМЛ 300/508-90/6', '', '', '0', '', 0, '614, м3/ч; 32, м; 90, кВт; 1000, об/мин;', '', 'cml-300-508-90-6', 4, 111, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(703, 590, 'ЦМЛ 300/545-110/6', '', '', '0', '', 0, '666, м3/ч; 38, м; 110, кВт; 1000, об/мин;', '', 'cml-300-545-110-6', 4, 112, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(704, 590, 'ЦМЛ 300/580-132/6', '', '', '0', '', 0, '720, м3/ч; 44, м; 132, кВт; 1000, об/мин;', '', 'cml-300-580-132-6', 4, 113, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(705, 5, 'Насосы Иртыш ЦНК', 'Иртыш ЦНК - насос центробежный консольный', 'Насос Иртыш ЦНК', '0', 'Консольные насосы ЦНК Иртыш завода ОДО Взлет со склада в наличии. Доставка по России и СНГ, цены вас приятно удивят, звоните!', 0, '', '<p class=\"MsoNormal\"><span>Центробежный консольный насос ЦНК применяется при работе в стационарных условиях и используется для транспортировки жидкостей различного происхождения и сходной по своим характеристикам с чистой водой. </span></p>\n<p class=\"MsoNormal\"><strong><span>В роли жидкостей могут выступать:</span></strong></p>\n<ul>\n<li>Питьевая и техническая вода</li>\n<li>Холодная и горячая вода</li>\n<li>Водогликолевые смеси</li>\n<li>Морская вода</li>\n<li>Жидкость, схожая по составу с чистой водой.</li>\n</ul>\n<p>Данная серия насосов прекрасно подходит для орошения и осушения сельскохозяйственных земель, систем общего водоснабжения, включая отопление и кондиционирование, а так же в качестве установки применяемой для пожаротушения.</p>\n<h2 style=\"text-align: center;\"><strong><span>Насос Иртыш &ndash; состав и принцип работы</span></strong></h2>\n<p class=\"MsoNormal\"><span>Насос Иртыш ЦНК представляет собой единую фундаментную плиту, на которой установлен насос и электродвигатель. Насос находится в движении благодаря упругой муфте расположенной между ними. Вал насоса имеет сальниковое и торцовое уплотнение. Поставка осуществляется с уже установленным на фундаментальной плите оборудованием. Корпус электронасоса и его рабочее колесо изготавливаются из чугуна серого цвета, а его вал из стали &ndash; 45. При изготовлении торцевого уплотнения используется карбид кремния. &nbsp;</span></p>\n<h2 style=\"text-align: center;\"><strong><span>Технические характеристики насосов Иртыш ЦНК:</span></strong></h2>\n<ul>\n<li>Диапазон температур по Цельсию &ndash; -10 до +110 градусов</li>\n<li>Температура окружающей среды по Цельсию &ndash; до +40 градусов</li>\n<li>Водородный показатель,&nbsp;<span lang=\"EN-US\">pH</span>&nbsp;&ndash; от 6 до 9</li>\n<li>Абразивные включения (концентрация не более одного процента от объема) &ndash; до 0.2 миллиметров</li>\n<li>Степень защиты &ndash;&nbsp;<span lang=\"EN-US\">IP</span>54</li>\n<li>Мощность двигателя, кВт - от 2,2 до 315</li>\n<li>Обороты двигаителя, об./мин. - от 1 500 до 3 000</li>\n<li>Напор, м. - от 4,4 до 89 метров</li>\n<li>Производительность, м3/ч - от 38 до 1 600</li>\n</ul>\n<h2 style=\"text-align: center;\"><strong><span>Условное обозначение - Иртыш ЦМЛ:&nbsp;</span></strong></h2>\n<p class=\"MsoNormal\"><strong><span>Вид обозначения:</span></strong><span>&nbsp;Иртыш ЦНК 100/250.238 - 75/2</span><span lang=\"EN-US\">-400</span></p>\n<ul>\n<li><strong>ИРТЫШ&nbsp;</strong>- серия насоса</li>\n<li><strong>ЦНК&nbsp;</strong>- тип насоса</li>\n<li><strong>100&nbsp;</strong>- номинальный диаметр выходного патрубка</li>\n<li><strong>200&nbsp;</strong>- номинальный диаметр рабочего колеса</li>\n<li><strong>238&nbsp;</strong>&ndash; фактический диаметр рабочего колеса</li>\n<li><strong>7<strong>5 </strong></strong>&ndash; номинальная мощность электродвигателя, кВт.</li>\n<li><strong>2<strong> </strong></strong>&ndash; 2-ух полюсной электродвигатель</li>\n<li><strong>4 </strong>- горизонтальный, на плите с соединительной муфтой</li>\n<li><strong>0 </strong>- без щита управления</li>\n<li><strong>0 </strong>- без защиты</li>\n</ul>\n<p>&nbsp;</p>\n<h2 style=\"text-align: center;\"><strong>Состав насоса</strong><strong><span lang=\"EN-US\">:</span></strong>&nbsp;</h2>\n<ul>\n<li>Насос</li>\n<li>Муфта</li>\n<li>Электродвигатель</li>\n</ul>\n<h2 style=\"text-align: center;\"><strong>Схема насоса Иртыш ЦНК</strong><strong><span lang=\"EN-US\">:</span></strong>&nbsp;</h2>\n<p><img class=\"modalL\" style=\"float: right;\" src=\"/image_upload/nasos/.thumbs/bc5f0004239d7b5eb186bece81a7ee27_500_0_0.jpg\" alt=\"shema-nasos-irtysh-cnk.jpg\" width=\"284\" height=\"240\" /></p>\n<ul>\n<li>1 - Пробка</li>\n<li>2 - Кольцо уплотняющее</li>\n<li>3 - Корпус спиральный</li>\n<li>4 - Гайка рабочего колеса</li>\n<li>5 - Колесо рабочее</li>\n<li>6 - Торцевое уплотнение(либо сальниковое набивочное уплотнение)</li>\n<li>7 - Втулка защитная;</li>\n<li>8 - Корпус подшипников</li>\n<li>9 &ndash; Подшипники</li>\n</ul>', 'nasos-irtysh-cnk', 3, 100, 1, 0, 'nasos-irtysh-cnk.jpg', 'nasos-irtysh-cnk.png', '144', '172', 0, 0, '', '', '2017-08-14', 0),
(706, 705, 'ЦНК 40/125.105-2,2/2-400', '', '', '0', '', 0, '40,5, м3/ч; 10,2, м; 2,2, кВт; 3000, об/мин;', '', 'cnk-40-125-105-2-2-2-400', 4, 0, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(707, 705, 'ЦНК 40/125.124-3/2-400', '', '', '0', '', 0, '43,5, м3/ч; 15,5, м; 3, кВт; 3000, об/мин;', '', 'cnk-40-125-124-3-2-400', 4, 1, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(708, 705, 'ЦНК 40/125.139-4/2-400', '', '', '0', '', 0, '46, м3/ч; 21,5, м; 4, кВт; 3000, об/мин;', '', 'cnk-40-125-139-4-2-400', 4, 2, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(709, 705, 'ЦНК 40/160.152-5,5/2-400', '', '', '0', '', 0, '47, м3/ч; 26,5, м; 5,5, кВт; 3000, об/мин;', '', 'cnk-40-160-152-5-5-2-400', 4, 3, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(710, 705, 'ЦНК 40/160.174-7,5/2-400', '', '', '0', '', 0, '50, м3/ч; 37, м; 7,5, кВт; 3000, об/мин;', '', 'cnk-40-160-174-7-5-2-400', 4, 4, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(711, 705, 'ЦНК 40/200.192-11/2-400', '', '', '0', '', 0, '38, м3/ч; 45, м; 11, кВт; 3000, об/мин;', '', 'cnk-40-200-192-11-2-400', 4, 5, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(712, 705, 'ЦНК 40/200.199-11/2-400', '', '', '0', '', 0, '40, м3/ч; 50, м; 11, кВт; 3000, об/мин;', '', 'cnk-40-200-199-11-2-400', 4, 6, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(713, 705, 'ЦНК 40/200.209-15/2-400', '', '', '0', '', 0, '44, м3/ч; 55, м; 15, кВт; 3000, об/мин;', '', 'cnk-40-200-209-15-2-400', 4, 7, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(714, 705, 'ЦНК 40/250.236-15/2-400', '', '', '0', '', 0, '45, м3/ч; 63, м; 15, кВт; 3000, об/мин;', '', 'cnk-40-250-236-15-2-400', 4, 8, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(715, 705, 'ЦНК 40/250.248-18,5/2-400', '', '', '0', '', 0, '47, м3/ч; 72, м; 18,5, кВт; 3000, об/мин;', '', 'cnk-40-250-248-18-5-2-400', 4, 9, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(716, 705, 'ЦНК 40/250.260-22/2-400', '', '', '0', '', 0, '50, м3/ч; 80, м; 22, кВт; 3000, об/мин;', '', 'cnk-40-250-260-22-2-400', 4, 10, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(717, 705, 'ЦНК 50/125.112-3/2-400', '', '', '0', '', 0, '68, м3/ч; 11, м; 3, кВт; 3000, об/мин;', '', 'cnk-50-125-112-3-2-400', 4, 11, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(718, 705, 'ЦНК 50/125.120-4/2-400', '', '', '0', '', 0, '72, м3/ч; 13, м; 4, кВт; 3000, об/мин;', '', 'cnk-50-125-120-4-2-400', 4, 12, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(719, 705, 'ЦНК 50/125.131-5,5/2-400', '', '', '0', '', 0, '78, м3/ч; 16,5, м; 5,5, кВт; 3000, об/мин;', '', 'cnk-50-125-131-5-5-2-400', 4, 13, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(720, 705, 'ЦНК 50/125.142-7,5/2-400', '', '', '0', '', 0, '85, м3/ч; 20,5, м; 7,5, кВт; 3000, об/мин;', '', 'cnk-50-125-142-7-5-2-400', 4, 14, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(721, 705, 'ЦНК 50/160.154-7,5/2-400', '', '', '0', '', 0, '77, м3/ч; 25, м; 7,5, кВт; 3000, об/мин;', '', 'cnk-50-160-154-7-5-2-400', 4, 15, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(722, 705, 'ЦНК 50/160.174-11/2-400', '', '', '0', '', 0, '87, м3/ч; 35, м; 11, кВт; 3000, об/мин;', '', 'cnk-50-160-174-11-2-400', 4, 16, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(723, 705, 'ЦНК 50/200.193-15/2-400', '', '', '0', '', 0, '70, м3/ч; 44, м; 15, кВт; 3000, об/мин;', '', 'cnk-50-200-193-15-2-400', 4, 17, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(724, 705, 'ЦНК 50/200.210-18,5/2-400', '', '', '0', '', 0, '76, м3/ч; 53, м; 18,5, кВт; 3000, об/мин;', '', 'cnk-50-200-210-18-5-2-400', 4, 18, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(725, 705, 'ЦНК 50/200.219-22/2-400', '', '', '0', '', 0, '80, м3/ч; 59, м; 22, кВт; 3000, об/мин;', '', 'cnk-50-200-219-22-2-400', 4, 19, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(726, 705, 'ЦНК 50/250.230-22/2-400', '', '', '0', '', 0, '64, м3/ч; 64, м; 22, кВт; 3000, об/мин;', '', 'cnk-50-250-230-22-2-400', 4, 20, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(727, 705, 'ЦНК 50/250.239-30/2-400', '', '', '0', '', 0, '67, м3/ч; 70, м; 30, кВт; 3000, об/мин;', '', 'cnk-50-250-239-30-2-400', 4, 21, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(728, 705, 'ЦНК 50/250.260-37/2-400', '', '', '0', '', 0, '74, м3/ч; 86, м; 37, кВт; 3000, об/мин;', '', 'cnk-50-250-260-37-2-400', 4, 22, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(729, 705, 'ЦНК 65/125.114-4/2-400', '', '', '0', '', 0, '97, м3/ч; 9, м; 4, кВт; 3000, об/мин;', '', 'cnk-65-125-114-4-2-400', 4, 23, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(730, 705, 'ЦНК 65/125.122-5,5/2-400', '', '', '0', '', 0, '107, м3/ч; 13, м; 5,5, кВт; 3000, об/мин;', '', 'cnk-65-125-122-5-5-2-400', 4, 24, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(731, 705, 'ЦНК 65/125.131-7,5/2-400', '', '', '0', '', 0, '115, м3/ч; 16, м; 7,5, кВт; 3000, об/мин;', '', 'cnk-65-125-131-7-5-2-400', 4, 25, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(732, 705, 'ЦНК 65/125.141-11/2-400', '', '', '0', '', 0, '125, м3/ч; 20, м; 11, кВт; 3000, об/мин;', '', 'cnk-65-125-141-11-2-400', 4, 26, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(733, 705, 'ЦНК 65/160.151-11/2-400', '', '', '0', '', 0, '103, м3/ч; 24,5, м; 11, кВт; 3000, об/мин;', '', 'cnk-65-160-151-11-2-400', 4, 27, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(734, 705, 'ЦНК 65/160.174-15/2-400', '', '', '0', '', 0, '120, м3/ч; 34, м; 15, кВт; 3000, об/мин;', '', 'cnk-65-160-174-15-2-400', 4, 28, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(735, 705, 'ЦНК 65/200.175-2,2/4-400', '', '', '0', '', 0, '43, м3/ч; 9, м; 2,2, кВт; 1500, об/мин;', '', 'cnk-65-200-175-2-2-4-400', 4, 29, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(736, 705, 'ЦНК 65/200.195-18,5/2-400', '', '', '0', '', 0, '104, м3/ч; 45, м; 18,5, кВт; 3000, об/мин;', '', 'cnk-65-200-195-18-5-2-400', 4, 30, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(737, 705, 'ЦНК 65/200.196-3/4-400', '', '', '0', '', 0, '51, м3/ч; 11,5, м; 3, кВт; 1500, об/мин;', '', 'cnk-65-200-196-3-4-400', 4, 31, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(738, 705, 'ЦНК 65/200.204-22/2-400', '', '', '0', '', 0, '110, м3/ч; 50, м; 22, кВт; 3000, об/мин;', '', 'cnk-65-200-204-22-2-400', 4, 32, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(739, 705, 'ЦНК 65/200.219-4/4-400', '', '', '0', '', 0, '60, м3/ч; 14,8, м; 4, кВт; 1500, об/мин;', '', 'cnk-65-200-219-4-4-400', 4, 33, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(740, 705, 'ЦНК 65/200.219-30/2-400', '', '', '0', '', 0, '120, м3/ч; 59, м; 30, кВт; 3000, об/мин;', '', 'cnk-65-200-219-30-2-400', 4, 34, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(741, 705, 'ЦНК 65/250.240-4/4-400', '', '', '0', '', 0, '57, м3/ч; 17, м; 4, кВт; 1500, об/мин;', '', 'cnk-65-250-240-4-4-400', 4, 35, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(742, 705, 'ЦНК 65/250.250-37/2-400', '', '', '0', '', 0, '120, м3/ч; 74, м; 37, кВт; 3000, об/мин;', '', 'cnk-65-250-250-37-2-400', 4, 36, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(743, 705, 'ЦНК 65/250.260-5,5/4-400', '', '', '0', '', 0, '62, м3/ч; 20,7, м; 5,5, кВт; 1500, об/мин;', '', 'cnk-65-250-260-5-5-4-400', 4, 37, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(744, 705, 'ЦНК 65/250.260-45/2-400', '', '', '0', '', 0, '125, м3/ч; 82, м; 45, кВт; 3000, об/мин;', '', 'cnk-65-250-260-45-2-400', 4, 38, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(745, 705, 'ЦНК 65/315.283-7,5/4-400', '', '', '0', '', 0, '74, м3/ч; 24,2, м; 7,5, кВт; 1500, об/мин;', '', 'cnk-65-315-283-7-5-4-400', 4, 39, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(746, 705, 'ЦНК 65/315.320-11/4-400', '', '', '0', '', 0, '83, м3/ч; 33, м; 11, кВт; 1500, об/мин;', '', 'cnk-65-315-320-11-4-400', 4, 40, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(747, 705, 'ЦНК 80/160.138-1,5/4-400', '', '', '0', '', 0, '96, м3/ч; 4,4, м; 1,5, кВт; 1500, об/мин;', '', 'cnk-80-160-138-1-5-4-400', 4, 41, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(748, 705, 'ЦНК 80/160.138-15/2-400', '', '', '0', '', 0, '195, м3/ч; 16,5, м; 15, кВт; 3000, об/мин;', '', 'cnk-80-160-138-15-2-400', 4, 42, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(749, 705, 'ЦНК 80/160.158-2,2/4-400', '', '', '0', '', 0, '102, м3/ч; 6,1, м; 2,2, кВт; 1500, об/мин;', '', 'cnk-80-160-158-2-2-4-400', 4, 43, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(750, 705, 'ЦНК 80/160.158-18,5/2-400', '', '', '0', '', 0, '206, м3/ч; 23,5, м; 18,5, кВт; 3000, об/мин;', '', 'cnk-80-160-158-18-5-2-400', 4, 44, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(751, 705, 'ЦНК 80/160.166-22/2-400', '', '', '0', '', 0, '212, м3/ч; 27, м; 22, кВт; 3000, об/мин;', '', 'cnk-80-160-166-22-2-400', 4, 45, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(752, 705, 'ЦНК 80/160.174-3/4-400', '', '', '0', '', 0, '110, м3/ч; 7,7, м; 3, кВт; 1500, об/мин;', '', 'cnk-80-160-174-3-4-400', 4, 46, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(753, 705, 'ЦНК 80/160.174-30/2-400', '', '', '0', '', 0, '220, м3/ч; 31, м; 30, кВт; 3000, об/мин;', '', 'cnk-80-160-174-30-2-400', 4, 47, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(754, 705, 'ЦНК 80/200.180-3/4-400', '', '', '0', '', 0, '82, м3/ч; 9,3, м; 3, кВт; 1500, об/мин;', '', 'cnk-80-200-180-3-4-400', 4, 48, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(755, 705, 'ЦНК 80/200.190-30/2-400', '', '', '0', '', 0, '170, м3/ч; 41, м; 30, кВт; 3000, об/мин;', '', 'cnk-80-200-190-30-2-400', 4, 49, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(756, 705, 'ЦНК 80/200.198-4/4-400', '', '', '0', '', 0, '90, м3/ч; 11,5, м; 4, кВт; 1500, об/мин;', '', 'cnk-80-200-198-4-4-400', 4, 50, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(757, 705, 'ЦНК 80/200.208-37/2-400', '', '', '0', '', 0, '190, м3/ч; 51,5, м; 37, кВт; 3000, об/мин;', '', 'cnk-80-200-208-37-2-400', 4, 51, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(758, 705, 'ЦНК 80/200.219-5,5/4-400', '', '', '0', '', 0, '100, м3/ч; 14,5, м; 5,5, кВт; 1500, об/мин;', '', 'cnk-80-200-219-5-5-4-400', 4, 52, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(759, 705, 'ЦНК 80/200.219-45/2-400', '', '', '0', '', 0, '200, м3/ч; 57,5, м; 45, кВт; 3000, об/мин;', '', 'cnk-80-200-219-45-2-400', 4, 53, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(760, 705, 'ЦНК 80/250.231-5,5/4-400', '', '', '0', '', 0, '85, м3/ч; 16,2, м; 5,5, кВт; 1500, об/мин;', '', 'cnk-80-250-231-5-5-4-400', 4, 54, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(761, 705, 'ЦНК 80/250.243-7,5/4-400', '', '', '0', '', 0, '91, м3/ч; 18, м; 7,5, кВт; 1500, об/мин;', '', 'cnk-80-250-243-7-5-4-400', 4, 55, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(762, 705, 'ЦНК 80/250.243-55/2-400', '', '', '0', '', 0, '190, м3/ч; 71, м; 55, кВт; 3000, об/мин;', '', 'cnk-80-250-243-55-2-400', 4, 56, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(763, 705, 'ЦНК 80/250.269-11/4-400', '', '', '0', '', 0, '100, м3/ч; 22,5, м; 11, кВт; 1500, об/мин;', '', 'cnk-80-250-269-11-4-400', 4, 57, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(764, 705, 'ЦНК 80/250.269-75/2-400', '', '', '0', '', 0, '210, м3/ч; 89, м; 75, кВт; 3000, об/мин;', '', 'cnk-80-250-269-75-2-400', 4, 58, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(765, 705, 'ЦНК 80/315.305-15/4-400', '', '', '0', '', 0, '122, м3/ч; 29, м; 15, кВт; 1500, об/мин;', '', 'cnk-80-315-305-15-4-400', 4, 59, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(766, 705, 'ЦНК 80/315.334-18,5/4-400', '', '', '0', '', 0, '130, м3/ч; 36,3, м; 18,5, кВт; 1500, об/мин;', '', 'cnk-80-315-334-18-5-4-400', 4, 60, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(767, 705, 'ЦНК 80/400.366-22/4-400', '', '', '0', '', 0, '122, м3/ч; 40, м; 22, кВт; 1500, об/мин;', '', 'cnk-80-400-366-22-4-400', 4, 61, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(768, 705, 'ЦНК 80/400.404-30/4-400', '', '', '0', '', 0, '140, м3/ч; 49,5, м; 30, кВт; 1500, об/мин;', '', 'cnk-80-400-404-30-4-400', 4, 62, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(769, 705, 'ЦНК 100/160.167-3/4-400', '', '', '0', '', 0, '127, м3/ч; 5,7, м; 3, кВт; 1500, об/мин;', '', 'cnk-100-160-167-3-4-400', 4, 63, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(770, 705, 'ЦНК 100/160.167-22/2-400', '', '', '0', '', 0, '277, м3/ч; 21, м; 22, кВт; 3000, об/мин;', '', 'cnk-100-160-167-22-2-400', 4, 64, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(771, 705, 'ЦНК 100/160.176-30/2-400', '', '', '0', '', 0, '287, м3/ч; 27,5, м; 30, кВт; 3000, об/мин;', '', 'cnk-100-160-176-30-2-400', 4, 65, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(772, 705, 'ЦНК 100/160.185-4/4-400', '', '', '0', '', 0, '145, м3/ч; 8,1, м; 4, кВт; 1500, об/мин;', '', 'cnk-100-160-185-4-4-400', 4, 66, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(773, 705, 'ЦНК 100/160.185-37/2-400', '', '', '0', '', 0, '293, м3/ч; 31,5, м; 37, кВт; 3000, об/мин;', '', 'cnk-100-160-185-37-2-400', 4, 67, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(774, 705, 'ЦНК 100/200.197-5,5/4-400', '', '', '0', '', 0, '137, м3/ч; 10,7, м; 5,5, кВт; 1500, об/мин;', '', 'cnk-100-200-197-5-5-4-400', 4, 68, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(775, 705, 'ЦНК 100/200.197-45/2-400', '', '', '0', '', 0, '260, м3/ч; 44, м; 45, кВт; 3000, об/мин;', '', 'cnk-100-200-197-45-2-400', 4, 69, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(776, 705, 'ЦНК 100/200.207-55/2-400', '', '', '0', '', 0, '286, м3/ч; 48, м; 55, кВт; 3000, об/мин;', '', 'cnk-100-200-207-55-2-400', 4, 70, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(777, 705, 'ЦНК 100/200.219-7,5/4-400', '', '', '0', '', 0, '150, м3/ч; 13,6, м; 7,5, кВт; 1500, об/мин;', '', 'cnk-100-200-219-7-5-4-400', 4, 71, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(778, 705, 'ЦНК 100/200.219-75/2-400', '', '', '0', '', 0, '310, м3/ч; 54, м; 75, кВт; 3000, об/мин;', '', 'cnk-100-200-219-75-2-400', 4, 72, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(779, 705, 'ЦНК 100/250.236-11/4-400', '', '', '0', '', 0, '140, м3/ч; 16, м; 11, кВт; 1500, об/мин;', '', 'cnk-100-250-236-11-4-400', 4, 73, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(780, 705, 'ЦНК 100/250.238-75/2-400', '', '', '0', '', 0, '270, м3/ч; 64, м; 75, кВт; 3000, об/мин;', '', 'cnk-100-250-238-75-2-400', 4, 74, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(781, 705, 'ЦНК 100/250.250-90/2-400', '', '', '0', '', 0, '280, м3/ч; 73, м; 90, кВт; 3000, об/мин;', '', 'cnk-100-250-250-90-2-400', 4, 75, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(782, 705, 'ЦНК 100/250.262-110/2-400', '', '', '0', '', 0, '295, м3/ч; 82, м; 110, кВт; 3000, об/мин;', '', 'cnk-100-250-262-110-2-400', 4, 76, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(783, 705, 'ЦНК 100/250.269-15/4-400', '', '', '0', '', 0, '160, м3/ч; 21,2, м; 15, кВт; 1500, об/мин;', '', 'cnk-100-250-269-15-4-400', 4, 77, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(784, 705, 'ЦНК 100/315.293-18,5/4-400', '', '', '0', '', 0, '167, м3/ч; 25,8, м; 18,5, кВт; 1500, об/мин;', '', 'cnk-100-315-293-18-5-4-400', 4, 78, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(785, 705, 'ЦНК 100/315.307-22/4-400', '', '', '0', '', 0, '172, м3/ч; 28,2, м; 22, кВт; 1500, об/мин;', '', 'cnk-100-315-307-22-4-400', 4, 79, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(786, 705, 'ЦНК 100/315.334-30/4-400', '', '', '0', '', 0, '188, м3/ч; 34,5, м; 30, кВт; 1500, об/мин;', '', 'cnk-100-315-334-30-4-400', 4, 80, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(787, 705, 'ЦНК 100/400.358-30/4-400', '', '', '0', '', 0, '156, м3/ч; 38,2, м; 30, кВт; 1500, об/мин;', '', 'cnk-100-400-358-30-4-400', 4, 81, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(788, 705, 'ЦНК 100/400.404-37/4-400', '', '', '0', '', 0, '178, м3/ч; 50,3, м; 37, кВт; 1500, об/мин;', '', 'cnk-100-400-404-37-4-400', 4, 82, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(789, 705, 'ЦНК 125/200.184-7,5/4-400', '', '', '0', '', 0, '240, м3/ч; 8, м; 7,5, кВт; 1500, об/мин;', '', 'cnk-125-200-184-7-5-4-400', 4, 83, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(790, 705, 'ЦНК 125/200.184-55/2-400', '', '', '0', '', 0, '460, м3/ч; 33, м; 55, кВт; 3000, об/мин;', '', 'cnk-125-200-184-55-2-400', 4, 84, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(791, 705, 'ЦНК 125/200.202-11/4-400', '', '', '0', '', 0, '245, м3/ч; 10,3, м; 11, кВт; 1500, об/мин;', '', 'cnk-125-200-202-11-4-400', 4, 85, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(792, 705, 'ЦНК 125/200.202-75/2-400', '', '', '0', '', 0, '480, м3/ч; 43, м; 75, кВт; 3000, об/мин;', '', 'cnk-125-200-202-75-2-400', 4, 86, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(793, 705, 'ЦНК 125/200.211-90/2-400', '', '', '0', '', 0, '490, м3/ч; 48, м; 90, кВт; 3000, об/мин;', '', 'cnk-125-200-211-90-2-400', 4, 87, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(794, 705, 'ЦНК 125/200.224-15/4-400', '', '', '0', '', 0, '260, м3/ч; 13,2, м; 15, кВт; 1500, об/мин;', '', 'cnk-125-200-224-15-4-400', 4, 88, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(795, 705, 'ЦНК 125/200.224-110/2-400', '', '', '0', '', 0, '500, м3/ч; 53, м; 110, кВт; 3000, об/мин;', '', 'cnk-125-200-224-110-2-400', 4, 89, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(796, 705, 'ЦНК 125/250.246-15/4-400', '', '', '0', '', 0, '270, м3/ч; 15,5, м; 15, кВт; 1500, об/мин;', '', 'cnk-125-250-246-15-4-400', 4, 90, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(797, 705, 'ЦНК 125/250.269-18,5/4-400', '', '', '0', '', 0, '290, м3/ч; 19,2, м; 18,5, кВт; 1500, об/мин;', '', 'cnk-125-250-269-18-5-4-400', 4, 91, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(798, 705, 'ЦНК 125/315.294-22/4-400', '', '', '0', '', 0, '242, м3/ч; 25, м; 22, кВт; 1500, об/мин;', '', 'cnk-125-315-294-22-4-400', 4, 92, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(799, 705, 'ЦНК 125/315.320-30/4-400', '', '', '0', '', 0, '272, м3/ч; 30,4, м; 30, кВт; 1500, об/мин;', '', 'cnk-125-315-320-30-4-400', 4, 93, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(800, 705, 'ЦНК 125/315.334-37/4-400', '', '', '0', '', 0, '285, м3/ч; 34, м; 37, кВт; 1500, об/мин;', '', 'cnk-125-315-334-37-4-400', 4, 94, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(801, 705, 'ЦНК 125/400.362-45/4-400', '', '', '0', '', 0, '275, м3/ч; 40,3, м; 45, кВт; 1500, об/мин;', '', 'cnk-125-400-362-45-4-400', 4, 95, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(802, 705, 'ЦНК 125/400.380-55/4-400', '', '', '0', '', 0, '285, м3/ч; 44,5, м; 55, кВт; 1500, об/мин;', '', 'cnk-125-400-380-55-4-400', 4, 96, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(803, 705, 'ЦНК 125/400.419-75/4-400', '', '', '0', '', 0, '305, м3/ч; 56, м; 75, кВт; 1500, об/мин;', '', 'cnk-125-400-419-75-4-400', 4, 97, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(804, 705, 'ЦНК 150/200.206-11/4-400', '', '', '0', '', 0, '345, м3/ч; 9,3, м; 11, кВт; 1500, об/мин;', '', 'cnk-150-200-206-11-4-400', 4, 98, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(805, 705, 'ЦНК 150/200.224-15/4-400', '', '', '0', '', 0, '375, м3/ч; 10,6, м; 15, кВт; 1500, об/мин;', '', 'cnk-150-200-224-15-4-400', 4, 99, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(806, 705, 'ЦНК 150/250.239-18,5/4-400', '', '', '0', '', 0, '385, м3/ч; 13, м; 18,5, кВт; 1500, об/мин;', '', 'cnk-150-250-239-18-5-4-400', 4, 100, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(807, 705, 'ЦНК 150/250.258-22/4-400', '', '', '0', '', 0, '420, м3/ч; 16, м; 22, кВт; 1500, об/мин;', '', 'cnk-150-250-258-22-4-400', 4, 101, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(808, 705, 'ЦНК 150/250.269-30/4-400', '', '', '0', '', 0, '435, м3/ч; 18,2, м; 30, кВт; 1500, об/мин;', '', 'cnk-150-250-269-30-4-400', 4, 102, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(809, 705, 'ЦНК 150/315.303-37/4-400', '', '', '0', '', 0, '400, м3/ч; 25, м; 37, кВт; 1500, об/мин;', '', 'cnk-150-315-303-37-4-400', 4, 103, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(810, 705, 'ЦНК 150/315.334-45/4-400', '', '', '0', '', 0, '430, м3/ч; 31,5, м; 45, кВт; 1500, об/мин;', '', 'cnk-150-315-334-45-4-400', 4, 104, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(811, 705, 'ЦНК 150/400.347-55/4-400', '', '', '0', '', 0, '365, м3/ч; 35, м; 55, кВт; 1500, об/мин;', '', 'cnk-150-400-347-55-4-400', 4, 105, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(812, 705, 'ЦНК 150/400.381-75/4-400', '', '', '0', '', 0, '405, м3/ч; 43, м; 75, кВт; 1500, об/мин;', '', 'cnk-150-400-381-75-4-400', 4, 106, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(813, 705, 'ЦНК 150/400.419-90/4-400', '', '', '0', '', 0, '445, м3/ч; 53, м; 90, кВт; 1500, об/мин;', '', 'cnk-150-400-419-90-4-400', 4, 107, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(814, 705, 'ЦНК 150/500.500-90/4-400', '', '', '0', '', 0, '300, м3/ч; 66, м; 90, кВт; 1500, об/мин;', '', 'cnk-150-500-500-90-4-400', 4, 108, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(815, 705, 'ЦНК 200/400.370-90/4-400', '', '', '0', '', 0, '530, м3/ч; 35, м; 90, кВт; 1500, об/мин;', '', 'cnk-200-400-370-90-4-400', 4, 109, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(816, 705, 'ЦНК 200/400.385-110/4-400', '', '', '0', '', 0, '600, м3/ч; 45, м; 110, кВт; 1500, об/мин;', '', 'cnk-200-400-385-110-4-400', 4, 110, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(817, 705, 'ЦНК 200/400.400-132/4-400', '', '', '0', '', 0, '630, м3/ч; 50, м; 132, кВт; 1500, об/мин;', '', 'cnk-200-400-400-132-4-400', 4, 111, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(818, 705, 'ЦНК 200/415.415-160/4-400', '', '', '0', '', 0, '630, м3/ч; 54, м; 160, кВт; 1500, об/мин;', '', 'cnk-200-415-415-160-4-400', 4, 112, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(819, 705, 'ЦНК 250/315.300-90/4-400', '', '', '0', '', 0, '880, м3/ч; 25, м; 90, кВт; 1500, об/мин;', '', 'cnk-250-315-300-90-4-400', 4, 113, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(820, 705, 'ЦНК 250/315.315-110/4-400', '', '', '0', '', 0, '1000, м3/ч; 32, м; 110, кВт; 1500, об/мин;', '', 'cnk-250-315-315-110-4-400', 4, 114, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(821, 705, 'ЦНК 250/330.330-132/4-400', '', '', '0', '', 0, '1000, м3/ч; 37, м; 132, кВт; 1500, об/мин;', '', 'cnk-250-330-330-132-4-400', 4, 115, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(822, 705, 'ЦНК 250/400.390-132/4-400', '', '', '0', '', 0, '840, м3/ч; 35, м; 132, кВт; 1500, об/мин;', '', 'cnk-250-400-390-132-4-400', 4, 116, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(823, 705, 'ЦНК 250/400.405-160/4-400', '', '', '0', '', 0, '890, м3/ч; 40, м; 160, кВт; 1500, об/мин;', '', 'cnk-250-400-405-160-4-400', 4, 117, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(824, 705, 'ЦНК 250/400.419-200/4-400', '', '', '0', '', 0, '1000, м3/ч; 50, м; 200, кВт; 1500, об/мин;', '', 'cnk-250-400-419-200-4-400', 4, 118, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(825, 705, 'ЦНК 250/415.415-250/4-400', '', '', '0', '', 0, '1000, м3/ч; 65, м; 250, кВт; 1500, об/мин;', '', 'cnk-250-415-415-250-4-400', 4, 119, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(826, 705, 'ЦНК 300/315.290-132/4-400', '', '', '0', '', 0, '1410, м3/ч; 25, м; 132, кВт; 1500, об/мин;', '', 'cnk-300-315-290-132-4-400', 4, 120, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(827, 705, 'ЦНК 300/315.305-160/4-400', '', '', '0', '', 0, '1510, м3/ч; 28, м; 160, кВт; 1500, об/мин;', '', 'cnk-300-315-305-160-4-400', 4, 121, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(828, 705, 'ЦНК 300/315.320-200/4-400', '', '', '0', '', 0, '1600, м3/ч; 32, м; 200, кВт; 1500, об/мин;', '', 'cnk-300-315-320-200-4-400', 4, 122, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(829, 705, 'ЦНК 300/330.330-200/4-400', '', '', '0', '', 0, '1600, м3/ч; 35, м; 200, кВт; 1500, об/мин;', '', 'cnk-300-330-330-200-4-400', 4, 123, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(830, 705, 'ЦНК 300/400.380-200/4-400', '', '', '0', '', 0, '1340, м3/ч; 35, м; 200, кВт; 1500, об/мин;', '', 'cnk-300-400-380-200-4-400', 4, 124, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(831, 705, 'ЦНК 300/400.390-250/4-400', '', '', '0', '', 0, '1520, м3/ч; 45, м; 250, кВт; 1500, об/мин;', '', 'cnk-300-400-390-250-4-400', 4, 125, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(832, 705, 'ЦНК 300/400.400-315/4-400', '', '', '0', '', 0, '1600, м3/ч; 50, м; 315, кВт; 1500, об/мин;', '', 'cnk-300-400-400-315-4-400', 4, 126, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0),
(833, 705, 'ЦНК 300/400.415-315/4-400', '', '', '0', '', 0, '1600, м3/ч; 55, м; 315, кВт; 1500, об/мин;', '', 'cnk-300-400-415-315-4-400', 4, 127, 1, 0, '', '', '144', '172', 0, 0, '', '', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `templates`
--

CREATE TABLE `templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `template_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `templates`
--

INSERT INTO `templates` (`id`, `name`, `model`, `created_at`, `updated_at`, `template_id`) VALUES
(1, 'Категория', 'category', NULL, NULL, 3),
(4, 'Продукт', 'product', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '1',
  `blocked_admin` int DEFAULT NULL,
  `blocked_manager` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `group`, `blocked_admin`, `blocked_manager`) VALUES
(9, 'admin', '6055c4d2fc079251d493f976c5370fc6', '2', 0, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=834;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
