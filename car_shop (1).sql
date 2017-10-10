-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 10 2017 г., 13:27
-- Версия сервера: 10.1.19-MariaDB
-- Версия PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `car_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `img` varchar(255) NOT NULL,
  `descr` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`id`, `name`, `img`, `descr`) VALUES
(1, 'Audi', 'image/audi.jpg', 'Audi – немецкий бренд и одноименная автомобилестроительная компания в составе концерна Volkswagen Group. Штаб-квартира компании Audi находится в городе Ингольштадте, в Германии. '),
(2, 'BMW', 'image/bmw.jpg', ' BMW – немецкий бренд, под которым компания Bayerische Motoren Werke, аббревиатура которой и является наименованием марки, и производит автомобили, мотоциклы, двигатели, велосипеды. '),
(3, 'Honda', 'image/honda.jpg', ' Honda — японский бренд, известный, в первую очередь, как производитель высоконадежных, современных легковых автомобилей и мотоциклов. Один из лидеров машиностроительной отрасли Японии. '),
(4, 'Nissan ', 'image/nissan.jpg', ' Nissan – японский автомобильный бренд, один из крупнейших в мире. Занимает восьмое место в мировом рейтинге автопроизводителей и третье – среди японских производителей, после Toyota и Honda. Штаб-квартира находится в Иокогаме. '),
(5, 'Mercedes-Benz ', 'image/mersedes', ' Mercedes-Benz – немецкий бренд легковых автомобилей премиум-класса, грузовых автомобилей, автобусов и других транспортных средств немецкого автостроительного концерна Daimler AG. ');

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `id_model` int(11) NOT NULL,
  `year_of_issue` int(11) NOT NULL,
  `engine_capacity` float NOT NULL,
  `max_speed` float NOT NULL,
  `price` float NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `id_brand`, `id_model`, `year_of_issue`, `engine_capacity`, `max_speed`, `price`, `img`) VALUES
(1, 1, 1, 1995, 1896, 166, 3200, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/audi-80-quatteo-15.jpg?raw=true'),
(2, 1, 1, 2001, 2771, 220, 4500, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/audi-cabriolet-2.8-e-08.jpg?raw=true'),
(3, 5, 2, 1986, 1997, 168, 3600, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/mercedes-benz-c-200-mer_c_04_kb_komp_ava_1.jpg?raw=true'),
(4, 5, 3, 2001, 2299, 200, 7000, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/2001_mercedes-benz_slk-class_2_dr_slk230_supercharged_convertible-pic-59072.jpg?raw=true'),
(5, 4, 4, 1994, 1809, 215, 6500, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/nissan-200-sx-1997-9157sm.jpg?raw=true'),
(6, 4, 4, 2000, 1998, 235, 9000, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/post-26143-13151355211237222867.jpg?raw=true');

-- --------------------------------------------------------

--
-- Структура таблицы `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `colors`
--

INSERT INTO `colors` (`id`, `name`) VALUES
(4, 'black'),
(2, 'blue'),
(5, 'bordo'),
(1, 'red'),
(3, 'white');

-- --------------------------------------------------------

--
-- Структура таблицы `color_car`
--

CREATE TABLE `color_car` (
  `id` int(11) NOT NULL,
  `id_car` int(11) NOT NULL,
  `id_color` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `color_car`
--

INSERT INTO `color_car` (`id`, `id_car`, `id_color`) VALUES
(1, 1, 1),
(2, 5, 1),
(3, 6, 2),
(4, 3, 3),
(5, 3, 4),
(6, 2, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `models`
--

INSERT INTO `models` (`id`, `name`) VALUES
(1, 'Audi 80'),
(2, 'Mercedes 200t'),
(3, 'Mercedes 230 se'),
(4, 'Nissan 200 sx');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_car` int(11) NOT NULL,
  `color` varchar(30) NOT NULL,
  `id_user` int(11) NOT NULL,
  `payment_method` enum('credit card','cash') NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `id_car`, `color`, `id_user`, `payment_method`, `status`) VALUES
(55, 2, 'bordo', 1, 'cash', 1),
(60, 3, 'white', 1, 'cash', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sname` varchar(30) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `time_life` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `sname`, `login`, `password`, `status`, `time_life`) VALUES
(1, 'Ivan', 'Ivanov', 'test', 'test', 0, 10000),
(2, 'anna', 'test', 'ann', '123', 1, 0),
(3, 'anna', 'test', 'tann', '123', 1, 1507554926),
(4, 'anna', 'test', 'tanja', 'af17a6d2be6676b4cf53b3ae81796fa6', 0, 1507556525);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_fk0` (`id_brand`),
  ADD KEY `cars_fk1` (`id_model`);

--
-- Индексы таблицы `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `color_car`
--
ALTER TABLE `color_car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_car_fk0` (`id_car`),
  ADD KEY `color_car_fk1` (`id_color`);

--
-- Индексы таблицы `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_fk0` (`id_car`),
  ADD KEY `FK_1` (`id_user`),
  ADD KEY `FK_2` (`color`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `color_car`
--
ALTER TABLE `color_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_fk0` FOREIGN KEY (`id_brand`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `cars_fk1` FOREIGN KEY (`id_model`) REFERENCES `models` (`id`);

--
-- Ограничения внешнего ключа таблицы `color_car`
--
ALTER TABLE `color_car`
  ADD CONSTRAINT `color_car_fk0` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id`),
  ADD CONSTRAINT `color_car_fk1` FOREIGN KEY (`id_color`) REFERENCES `colors` (`id`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
