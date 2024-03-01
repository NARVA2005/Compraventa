-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2024 a las 15:27:40
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `interpolice`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `description` varchar(150) NOT NULL,
  `date` date NOT NULL,
  `note` varchar(500) NOT NULL,
  `id_people` int(11) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `history`
--

INSERT INTO `history` (`id`, `description`, `date`, `note`, `id_people`, `estado`) VALUES
(2, 'Escándalo en vía pública', '2024-02-13', 'Según testigos, el sujeto perdió la cordura y atacó a varias personas.', 7, 'inactivo'),
(4, 'Insultar a un agente', '2024-02-13', 'N/A', 15, 'inactivo'),
(5, 'Fumar en lugar no permitido', '2024-01-28', 'N/A', 34, 'activo'),
(9, 'Alboroto', '2024-02-06', 'N/A', 75, 'activo'),
(10, 'Alboroto', '2024-02-05', 'N/A', 75, 'activo'),
(12, 'Fumar en lugar no permitido', '2024-02-06', 'N/A', 17, 'activo'),
(14, 'mato a miguel', '2024-02-18', 'topo', 2, 'activo'),
(15, 'xcxcxc', '2024-02-15', 'sdsdsd', 12, 'activo'),
(16, 'toma los datos de una empresa y hace publicidad engañosa ', '2024-02-19', 'se toma la base de datos de la empresa ', 2, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `type` int(1) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `people`
--

INSERT INTO `people` (`id`, `name`, `lastname`, `nickname`, `email`, `type`, `estado`) VALUES
(2, 'Ronnica', 'Kinnear', 'rkinnear1', 'rkinnear1@umich.edu', 4, 'activo'),
(7, 'Ava', 'Cosgriff', 'acosgriff6', 'acosgriff6@i2i.jp', 3, 'activo'),
(11, 'Mikol', 'Fulun', 'mfuluna', 'mfuluna@cloudflare.com', 1, 'activo'),
(12, 'Aloysius', 'Long', 'alongb', 'alongb@ftc.gov', 2, 'activo'),
(13, 'Lorrayne', 'Pagel', 'lpagelc', 'lpagelc@dagondesign.com', 1, 'activo'),
(14, 'Victoir', 'Summersby', 'vsummersbyd', 'vsummersbyd@eepurl.com', 3, 'activo'),
(15, 'Anallise', 'Ward', 'awarde', 'awarde@usda.gov', 4, 'activo'),
(16, 'Grant', 'Acom', 'gacomf', 'gacomf@dmoz.org', 2, 'activo'),
(17, 'Pincus', 'Manzell', 'pmanzellg', 'pmanzellg@joomla.org', 2, 'activo'),
(18, 'Madel', 'Fitchell', 'mfitchellh', 'mfitchellh@imdb.com', 4, 'activo'),
(19, 'Andriana', 'Bente', 'abentei', 'abentei@4shared.com', 3, 'activo'),
(20, 'Jared', 'Gordge', 'jgordgej', 'jgordgej@ibm.com', 3, 'activo'),
(21, 'Saunder', 'Kershow', 'skershowk', 'skershowk@cnbc.com', 3, 'activo'),
(22, 'Hamilton', 'Bill', 'hbilll', 'hbilll@usatoday.com', 4, 'activo'),
(23, 'Tate', 'Simukov', 'tsimukovm', 'tsimukovm@cpanel.net', 2, 'activo'),
(24, 'Ailis', 'Dunphy', 'adunphyn', 'adunphyn@umn.edu', 4, 'activo'),
(25, 'Caria', 'Gauche', 'cgaucheo', 'cgaucheo@sbwire.com', 4, 'activo'),
(26, 'Nanny', 'Turney', 'nturneyp', 'nturneyp@behance.net', 1, 'activo'),
(27, 'Tina', 'Ewan', 'tewanq', 'tewanq@imgur.com', 1, 'activo'),
(28, 'Annadiana', 'Audibert', 'aaudibertr', 'aaudibertr@facebook.com', 2, 'activo'),
(29, 'Beret', 'Tomasino', 'btomasinos', 'btomasinos@vk.com', 2, 'activo'),
(30, 'Amandie', 'Camp', 'acampt', 'acampt@blogger.com', 3, 'activo'),
(31, 'Gertruda', 'Dermott', 'gdermottu', 'gdermottu@newsvine.com', 3, 'activo'),
(32, 'Lucia', 'Jendrach', 'ljendrachv', 'ljendrachv@t.co', 3, 'activo'),
(33, 'Evania', 'Botwood', 'ebotwoodw', 'ebotwoodw@psu.edu', 2, 'activo'),
(34, 'Cariotta', 'Willett', 'cwillettx', 'cwillettx@example.com', 1, 'activo'),
(35, 'Blakeley', 'Dowdell', 'bdowdelly', 'bdowdelly@latimes.com', 4, 'activo'),
(36, 'Claribel', 'McPake', 'cmcpakez', 'cmcpakez@smh.com.au', 2, 'activo'),
(37, 'Livia', 'Carlett', 'lcarlett10', 'lcarlett10@nymag.com', 4, 'activo'),
(38, 'Sile', 'Norgate', 'snorgate11', 'snorgate11@springer.com', 4, 'activo'),
(39, 'Tove', 'Gundrey', 'tgundrey12', 'tgundrey12@behance.net', 2, 'activo'),
(40, 'Sile', 'Wilkison', 'swilkison13', 'swilkison13@goo.gl', 4, 'activo'),
(41, 'Shelba', 'Draper', 'sdraper14', 'sdraper14@ucoz.ru', 2, 'activo'),
(42, 'Kira', 'Revill', 'krevill15', 'krevill15@github.io', 1, 'activo'),
(43, 'Donn', 'Simonard', 'dsimonard16', 'dsimonard16@youtu.be', 3, 'activo'),
(44, 'Lynnelle', 'Dufore', 'ldufore17', 'ldufore17@addtoany.com', 2, 'activo'),
(45, 'Cassondra', 'Wynes', 'cwynes18', 'cwynes18@engadget.com', 2, 'activo'),
(46, 'Bobina', 'Bosnell', 'bbosnell19', 'bbosnell19@newyorker.com', 2, 'activo'),
(47, 'Krispin', 'Hendrickson', 'khendrickson1a', 'khendrickson1a@examiner.com', 1, 'activo'),
(48, 'Cointon', 'Carnoghan', 'ccarnoghan1b', 'ccarnoghan1b@dailymail.co.uk', 2, 'activo'),
(49, 'Andris', 'Janiak', 'ajaniak1c', 'ajaniak1c@accuweather.com', 2, 'activo'),
(50, 'Gregor', 'Ascrofte', 'gascrofte1d', 'gascrofte1d@rediff.com', 2, 'activo'),
(51, 'Alexis', 'Strothers', 'astrothers1e', 'astrothers1e@t-online.de', 2, 'activo'),
(52, 'Filide', 'Derill', 'fderill1f', 'fderill1f@un.org', 4, 'activo'),
(53, 'Robin', 'Medcalfe', 'rmedcalfe1g', 'rmedcalfe1g@cmu.edu', 1, 'activo'),
(54, 'Paxon', 'Spragge', 'pspragge1h', 'pspragge1h@acquirethisname.com', 4, 'activo'),
(55, 'Row', 'Aldhouse', 'raldhouse1i', 'raldhouse1i@ask.com', 1, 'activo'),
(56, 'Arleta', 'Presho', 'apresho1j', 'apresho1j@ask.com', 3, 'activo'),
(57, 'Ruprecht', 'Robiou', 'rrobiou1k', 'rrobiou1k@wp.com', 1, 'activo'),
(58, 'Vincenz', 'Forge', 'vforge1l', 'vforge1l@godaddy.com', 1, 'activo'),
(59, 'Arabela', 'Fagg', 'afagg1m', 'afagg1m@symantec.com', 1, 'activo'),
(60, 'Jamison', 'Luesley', 'jluesley1n', 'jluesley1n@cmu.edu', 2, 'activo'),
(61, 'Mirabella', 'Gidley', 'mgidley1o', 'mgidley1o@1688.com', 3, 'activo'),
(62, 'Leanna', 'Luckham', 'lluckham1p', 'lluckham1p@baidu.com', 4, 'activo'),
(63, 'Derron', 'Stoddart', 'dstoddart1q', 'dstoddart1q@behance.net', 1, 'activo'),
(64, 'Joachim', 'Powell', 'jpowell1r', 'jpowell1r@people.com.cn', 4, 'activo'),
(65, 'Manfred', 'Krzyzowski', 'mkrzyzowski1s', 'mkrzyzowski1s@yellowpages.com', 1, 'activo'),
(66, 'Regina', 'Nobriga', 'rnobriga1t', 'rnobriga1t@acquirethisname.com', 1, 'activo'),
(67, 'Georgianna', 'Cowle', 'gcowle1u', 'gcowle1u@theglobeandmail.com', 4, 'activo'),
(68, 'Fremont', 'Savege', 'fsavege1v', 'fsavege1v@timesonline.co.uk', 1, 'activo'),
(69, 'Etan', 'Tidbury', 'etidbury1w', 'etidbury1w@abc.net.au', 3, 'activo'),
(70, 'Leoline', 'Stains', 'lstains1x', 'lstains1x@boston.com', 4, 'activo'),
(71, 'Charity', 'Dine-Hart', 'cdinehart1y', 'cdinehart1y@ftc.gov', 1, 'activo'),
(72, 'Maximilianus', 'Satyford', 'msatyford1z', 'msatyford1z@nasa.gov', 3, 'activo'),
(73, 'Tomlin', 'Heintze', 'theintze20', 'theintze20@bravesites.com', 1, 'activo'),
(74, 'Matilda', 'Keeney', 'mkeeney21', 'mkeeney21@ocn.ne.jp', 3, 'activo'),
(75, 'Kristel', 'Abramowitch', 'kabramowitch22', 'kabramowitch22@yandex.ru', 2, 'activo'),
(76, 'Evelyn', 'Veldens', 'eveldens23', 'eveldens23@opera.com', 1, 'activo'),
(77, 'Barty', 'O\'Doogan', 'bodoogan24', 'bodoogan24@mayoclinic.com', 1, 'activo'),
(78, 'Mitchel', 'O\'Rudden', 'morudden25', 'morudden25@networkadvertising.org', 1, 'activo'),
(79, 'Heath', 'Byrkmyr', 'hbyrkmyr26', 'hbyrkmyr26@dell.com', 1, 'activo'),
(80, 'Sigismundo', 'Bonifazio', 'sbonifazio27', 'sbonifazio27@nih.gov', 4, 'activo'),
(81, 'Hartley', 'Robak', 'hrobak28', 'hrobak28@uiuc.edu', 3, 'activo'),
(82, 'Antony', 'Richarson', 'aricharson29', 'aricharson29@51.la', 2, 'activo'),
(83, 'Gawen', 'Janse', 'gjanse2a', 'gjanse2a@nasa.gov', 4, 'activo'),
(84, 'Jesus', 'Pritchard', 'jpritchard2b', 'jpritchard2b@webeden.co.uk', 3, 'activo'),
(85, 'Roxana', 'Burnhill', 'rburnhill2c', 'rburnhill2c@msn.com', 3, 'activo'),
(86, 'Carmelina', 'Lamperd', 'clamperd2d', 'clamperd2d@biblegateway.com', 2, 'activo'),
(87, 'Rosene', 'Ffoulkes', 'rffoulkes2e', 'rffoulkes2e@marketwatch.com', 4, 'activo'),
(88, 'Benji', 'Dever', 'bdever2f', 'bdever2f@businessweek.com', 1, 'activo'),
(89, 'Bonny', 'Hambrick', 'bhambrick2g', 'bhambrick2g@printfriendly.com', 3, 'activo'),
(90, 'Blondell', 'Ishchenko', 'bishchenko2h', 'bishchenko2h@elegantthemes.com', 1, 'activo'),
(91, 'Philip', 'Greenstock', 'pgreenstock2i', 'pgreenstock2i@msu.edu', 4, 'activo'),
(92, 'Ludvig', 'Dulany', 'ldulany2j', 'ldulany2j@va.gov', 4, 'activo'),
(93, 'Torin', 'Mitchel', 'tmitchel2k', 'tmitchel2k@npr.org', 1, 'activo'),
(94, 'Merla', 'Hills', 'mhills2l', 'mhills2l@phpbb.com', 3, 'activo'),
(95, 'Dante', 'Lamke', 'dlamke2m', 'dlamke2m@google.co.jp', 1, 'activo'),
(96, 'Carolin', 'St Pierre', 'cstpierre2n', 'cstpierre2n@comcast.net', 2, 'activo'),
(97, 'Marge', 'Ruberry', 'mruberry2o', 'mruberry2o@addtoany.com', 3, 'activo'),
(98, 'Ivonne', 'Nairns', 'inairns2p', 'inairns2p@slate.com', 1, 'activo'),
(99, 'Anderson', 'Tasama', 'LordTasama', 'tasamaperez2005@gmail.com', 3, 'activo'),
(109, 'Héctor', 'Fabio', 'Enano', 'hector', 4, 'activo'),
(110, 'Héctor', 'Fabio', 'Enano', 'hector@gmail.com', 4, 'activo'),
(111, 'Alejo', 'Tobón', 'El Gei', 'alejo@gmail.com', 3, 'activo'),
(114, 'Ronnica', 'Mattosoff', '', 'rmattosoff0@blogs.com', 1, 'activo'),
(115, 'Ronnica Ronnica Ronnica Ronnica Ronnica Ronnica Ro', 'Ronnica Ronnica Ronnica Ronnica Ronnica Ronnica Ro', 'Ronnica', 'rmattosoff0@blogs.com', 4, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `rank` int(1) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `lastname`, `rank`, `email`, `password`, `photo`, `estado`) VALUES
(6, 'Andersondfd', 'Tasamadfd', 2, 'sdsd@gmail.com', '12345', '', 'inactivo'),
(7, 'Jhon', 'Pérez', 1, 'tasama@gmail.com', '01cfcd4f6b8770febfb40cb906715822', '', 'activo'),
(12, 'Alejo', 'Tobón', 5, 'alejo@gmail.com', '01cfcd4f6b8770febfb40cb906715822', '', 'activo'),
(16, 'Narvaez', 'López', 4, 'narva@gmail.com', 'f0efb5f6cb4ce54821a9c5c6e1dff052', '', 'activo'),
(17, 'Anderson', 'Tobón', 1, 'alejo@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '', 'activo'),
(19, 'jhon', 'narvaez', 2, 'djhfjsdsjjd', '', NULL, 'activo'),
(20, 'dfdfd', 'dfgdf', 2, 'dfdfdfd', '', NULL, 'activo'),
(21, 'gfgd', 'dfd', 2, 'cvzcds', '', NULL, 'activo'),
(22, 'ggff', 'jhjhj', 4, 'jkjkjk', '', NULL, 'activo'),
(23, 'sdsd', 'sdsd', 2, 'xzxzx', '', NULL, 'activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_people` (`id_people`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`id_people`) REFERENCES `people` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
