-- phpMyAdmin SQL Dump
-- version 
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3308
-- Время создания: Апр 23 2024 г., 17:28
-- Версия сервера: 8.0.36-28
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `host1868209_om`
--

-- --------------------------------------------------------

--
-- Структура таблицы `equipments`
--

CREATE TABLE `equipments` (
  `id` int NOT NULL,
  `equipid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Серийный идентификатор оборудования в автомобиле',
  `apikey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ключ API актуальный',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Описание расположения оборудования',
  `lastipaddr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL COMMENT 'Состояние в работе'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Оборудование';

--
-- Дамп данных таблицы `equipments`
--

INSERT INTO `equipments` (`id`, `equipid`, `sid`, `apikey`, `description`, `lastipaddr`, `enabled`) VALUES
(1, '', '123123123', 'alfatest1234', 'Дома лежит', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `locations`
--

CREATE TABLE `locations` (
  `id` int NOT NULL,
  `localtionid` int NOT NULL,
  `locationcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locationshortname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `locationname` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Места (города) действия';

--
-- Дамп данных таблицы `locations`
--

INSERT INTO `locations` (`id`, `localtionid`, `locationcode`, `locationshortname`, `locationname`) VALUES
(1, 0, 'ru_yessentuki', 'yessentuki', 'Ессентуки'),
(2, 2, 'ru_pyat', 'pyatigorsk', 'Пятигорск'),
(3, 2, 'ru_pyat', 'pyatigorsk', 'Пятигорск');

-- --------------------------------------------------------

--
-- Структура таблицы `moneybalance`
--

CREATE TABLE `moneybalance` (
  `id` int NOT NULL,
  `userid` int NOT NULL,
  `videoid` int NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rep` int NOT NULL,
  `value` int NOT NULL,
  `description` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Денежный баланс клиентов и партнеров';

-- --------------------------------------------------------

--
-- Структура таблицы `partners`
--

CREATE TABLE `partners` (
  `id` int NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bussines` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `OGRN` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `BIK` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactTel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactEMail` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Партнеры';

--
-- Дамп данных таблицы `partners`
--

INSERT INTO `partners` (`id`, `name`, `bussines`, `description`, `OGRN`, `BIK`, `contactName`, `contactTel`, `contactEMail`) VALUES
(1, 'Dima', 'taxi', 'taxi', '111', '111', 'dima', '111', 'money@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `partnerscars`
--

CREATE TABLE `partnerscars` (
  `id` int NOT NULL,
  `partnerid` int NOT NULL,
  `carVIN` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `carPlate` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `carModel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `carColor` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `carDescription` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `carType` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `carEquipmentID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Автомобили портнеров';

--
-- Дамп данных таблицы `partnerscars`
--

INSERT INTO `partnerscars` (`id`, `partnerid`, `carVIN`, `carPlate`, `carModel`, `carColor`, `carDescription`, `carType`, `carEquipmentID`) VALUES
(1, 1, 'd', 'В433РС126', 'Mitsubishi Lancer X', 'Серый', 'Автомобиль в хорошем техническом состоянии', 'Легковой седан', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `partnerscarslocations`
--

CREATE TABLE `partnerscarslocations` (
  `id` int NOT NULL,
  `carid` int NOT NULL,
  `locationid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Локации автомобилей партнеров';

--
-- Дамп данных таблицы `partnerscarslocations`
--

INSERT INTO `partnerscarslocations` (`id`, `carid`, `locationid`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `statlinks`
--

CREATE TABLE `statlinks` (
  `id` int NOT NULL,
  `equipid` int NOT NULL,
  `videoid` int NOT NULL,
  `equipip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `referip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkdatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gpsposlat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gpsposlan` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Статистика переходов по ссылке';

--
-- Дамп данных таблицы `statlinks`
--

INSERT INTO `statlinks` (`id`, `equipid`, `videoid`, `equipip`, `referip`, `linkdatetime`, `gpsposlat`, `gpsposlan`) VALUES
(1, 0, 2, '', '95.25.47.106', '2024-03-22 14:03:39', '', ''),
(2, 0, 2, '', '95.25.47.106', '2024-03-22 14:04:42', '', ''),
(3, 0, 1, '', '95.25.47.106', '2024-03-22 14:05:17', '', ''),
(4, 0, 1, '', '95.25.47.106', '2024-03-22 14:06:34', '', ''),
(5, 0, 1, '', '95.25.47.106', '2024-03-22 14:06:59', '', ''),
(6, 0, 1, '', '95.25.47.106', '2024-03-22 15:51:20', '', ''),
(7, 0, 0, '', '95.25.45.254', '2024-03-28 21:10:13', '', ''),
(8, 1, 1, '', '95.25.45.254', '2024-03-28 21:14:55', '', ''),
(9, 1, 1, '', '95.25.47.139', '2024-04-08 17:28:38', '', ''),
(10, 1, 1, '', '95.25.47.139', '2024-04-09 19:50:14', '', ''),
(11, 1, 1, '', '95.25.47.139', '2024-04-09 19:51:05', '', ''),
(12, 1, 1, '', '95.25.47.139', '2024-04-09 19:51:41', '', ''),
(13, 1, 1, '', '95.25.47.139', '2024-04-09 19:52:51', '', ''),
(14, 1, 1, '192.168.1.1', '95.25.47.139', '2024-04-15 18:43:37', '40', '40'),
(15, 1, 3, '192.168.1.1', '95.25.47.139', '2024-04-16 14:14:41', '40', '40'),
(16, 1, 4, '192.168.1.1', '95.25.47.139', '2024-04-16 14:14:55', '40', '40'),
(17, 1, 4, '192.168.1.1', '176.15.209.143', '2024-04-16 14:15:52', '40', '40'),
(18, 1, 4, '192.168.1.1', '176.15.209.143', '2024-04-16 14:15:52', '40', '40'),
(19, 1, 4, '192.168.1.1', '176.15.209.143', '2024-04-16 14:15:52', '40', '40'),
(20, 1, 4, '192.168.1.1', '176.15.209.143', '2024-04-16 14:15:52', '40', '40'),
(21, 1, 3, '192.168.1.1', '176.15.209.143', '2024-04-16 14:15:56', '40', '40');

-- --------------------------------------------------------

--
-- Структура таблицы `statviews`
--

CREATE TABLE `statviews` (
  `id` int NOT NULL,
  `equipid` int NOT NULL,
  `videoid` int NOT NULL,
  `adddatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gpsposlat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gpsposlon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastip` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `referip` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Статистика просмотров видео';

--
-- Дамп данных таблицы `statviews`
--

INSERT INTO `statviews` (`id`, `equipid`, `videoid`, `adddatetime`, `gpsposlat`, `gpsposlon`, `lastip`, `referip`) VALUES
(15, 1, 1, '2024-04-15 16:20:16', '44.04334', '42.89964', '95.25.47.139', ''),
(16, 1, 0, '2024-04-15 16:20:16', '44.04510', '42.89799', '95.25.47.139', ''),
(17, 1, 0, '2024-04-15 16:24:49', '44.04639', '42.89535', '95.25.47.139', ''),
(18, 1, 0, '2024-04-15 16:27:17', '1', '1', '95.25.47.139', ''),
(19, 1, 0, '2024-04-15 16:29:49', '1', '1', '95.25.47.139', ''),
(20, 1, 0, '2024-04-15 16:30:21', '1', '1', '95.25.47.139', ''),
(21, 1, 0, '2024-04-15 18:31:11', '1', '1', '95.25.47.139', ''),
(22, 1, 1, '2024-04-15 18:51:00', '1', '1', '95.25.47.139', '');

-- --------------------------------------------------------

--
-- Структура таблицы `userrole`
--

CREATE TABLE `userrole` (
  `id` int NOT NULL,
  `role` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rolecaption` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Группы пользователей';

--
-- Дамп данных таблицы `userrole`
--

INSERT INTO `userrole` (`id`, `role`, `rolecaption`) VALUES
(0, 'admin', 'Администратор'),
(1, 'moderator', 'Модератор'),
(2, 'client', 'Клиент'),
(3, 'partner', 'Партнёр'),
(4, 'guest', 'Гость');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL COMMENT 'Уникальный идентификатор пользоателя',
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userrole` int NOT NULL COMMENT 'Роль пользователя с системе',
  `regdate` datetime NOT NULL COMMENT 'Дата регистрации',
  `lastipaddr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Последний IP-адрес',
  `fullusername` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Полное имя пользователя',
  `companyname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Компания',
  `companyrole` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Должность в компании',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Описание пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Все пользователи';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `userrole`, `regdate`, `lastipaddr`, `fullusername`, `companyname`, `companyrole`, `description`) VALUES
(0, 'afanasenkov90@mail.ru', 'lex', 'password1', 0, '2024-03-19 16:04:41', '', 'Aleksander Sergeevich Afanasenkov', 'OLHAR.MEDIA', 'Co-founder, Developer', 'Разработчик системы OLHAR.MEDIA');

-- --------------------------------------------------------

--
-- Структура таблицы `videolocations`
--

CREATE TABLE `videolocations` (
  `id` int NOT NULL,
  `videoid` int NOT NULL,
  `locationid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `videolocations`
--

INSERT INTO `videolocations` (`id`, `videoid`, `locationid`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 1),
(4, 2, 2),
(5, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `videos`
--

CREATE TABLE `videos` (
  `id` int NOT NULL,
  `filename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `serverfilename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userid` int NOT NULL,
  `adddate` datetime NOT NULL,
  `duartion` time NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `showlocation` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Список видео (Рекламных компаний)';

--
-- Дамп данных таблицы `videos`
--

INSERT INTO `videos` (`id`, `filename`, `serverfilename`, `userid`, `adddate`, `duartion`, `url`, `showlocation`) VALUES
(1, 'sample720.avi', '', 0, '2024-03-19 15:58:38', '00:00:30', 'https://yandex.ru', 1),
(2, 'sample720_2.avi', 'sample720_2.avi', 0, '2024-03-19 15:58:38', '00:00:30', 'https://yandex.ru', 1),
(3, 'simple.avi', 'simp.avi', 1, '0000-00-00 00:00:00', '00:00:30', 'https://wa.me/79620173391?text=%D0%9F%D1%80%D0%B8%D0%B2%D0%B5%D1%82!%20%F0%9F%91%8B%20%D0%AF%20%D0%BE%D1%82%20Olhar.Media...', 0),
(4, 'simple.avi', 'simp.avi', 1, '0000-00-00 00:00:00', '00:00:30', 'whatsapp://send?text=%D0%9F%D1%80%D0%B8%D0%B2%D0%B5%D1%82!%20%F0%9F%91%8B%20%D0%AF%20%D0%BE%D1%82%20Olhar.Media...', 0),
(5, 'simple.avi', 'simp.avi', 1, '0000-00-00 00:00:00', '00:00:30', 'tg://msg?text=Hello%20from%20Olhar.Media...', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `moneybalance`
--
ALTER TABLE `moneybalance`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partnerscars`
--
ALTER TABLE `partnerscars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partnerscarslocations`
--
ALTER TABLE `partnerscarslocations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `statlinks`
--
ALTER TABLE `statlinks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `statviews`
--
ALTER TABLE `statviews`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `videolocations`
--
ALTER TABLE `videolocations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `equipments`
--
ALTER TABLE `equipments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `moneybalance`
--
ALTER TABLE `moneybalance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `partnerscars`
--
ALTER TABLE `partnerscars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `partnerscarslocations`
--
ALTER TABLE `partnerscarslocations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `statlinks`
--
ALTER TABLE `statlinks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `statviews`
--
ALTER TABLE `statviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `userrole`
--
ALTER TABLE `userrole`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор пользоателя', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `videolocations`
--
ALTER TABLE `videolocations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
