-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Jun 2020 um 07:11
-- Server-Version: 10.1.35-MariaDB
-- PHP-Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `bi-kompass`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `floors`
--

CREATE TABLE `floors` (
  `id` int(11) NOT NULL,
  `svg_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL COMMENT '-1 = UG, 0 = EG, 1 = OG 1 etc...',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'EG, OG 1, etc...',
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `floors`
--

INSERT INTO `floors` (`id`, `svg_id`, `level`, `name`, `location_id`) VALUES
(2, 'nw10og1', 1, 'OG 1', 1),
(3, 'nw10og2', 2, 'OG 2', 1),
(4, 'ra11eg', 0, 'EG', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `plz` int(11) NOT NULL,
  `city` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `locations`
--

INSERT INTO `locations` (`id`, `description`, `street`, `number`, `plz`, `city`) VALUES
(1, 'Hauptgebäude / Eingang', 'Nagelsweg', 10, 20097, 'Hamburg'),
(2, 'Tischlerei', 'Rosenallee', 11, 20097, 'Hamburg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `persons`
--

CREATE TABLE `persons` (
  `id` int(11) NOT NULL,
  `firstname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `function` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PSF, BD, SD, ...',
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'z.B.: 040 / 88123456',
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `persons`
--

INSERT INTO `persons` (`id`, `firstname`, `lastname`, `function`, `phone`, `room_id`) VALUES
(1, 'Herbert', 'Meyer', 'BD', '-', 4),
(2, 'Gudrun', 'Schwägerin', 'PSF', '040-112525(0)', 5),
(3, 'Ingrid', 'Ohnetal', 'PSF', '040-112525(12)', 10),
(4, 'Franz', 'Kaffka', 'FA', '040-112-525(17)', 10),
(5, 'Helga', 'Sieglinde', 'Personalleitung', '040-112-525(5)', 11),
(6, 'Franziska', 'Nissen', 'PSF', '040-112-525(21)', 15),
(7, 'Eberhard', 'Weiszäcker', 'SD', '-', 16);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Bsp.: R-03',
  `function` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Neustadt, Altona, ... NULL',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor_id` int(11) NOT NULL,
  `svg_unique_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `function`, `nickname`, `description`, `floor_id`, `svg_unique_name`) VALUES
(4, 'R-112', 'Büro SD/BD', NULL, 'Büro', 2, 'nw10-og1-r112'),
(5, 'R-113', 'Büro', NULL, 'Büro', 2, 'nw10-og1-r113'),
(6, 'R-114', 'Seminarraum', NULL, 'Mit Beamer und Tafel', 2, 'nw10-og1-r114'),
(7, 'R-115', 'Computerraum', 'Großhansdorf', '20 Plätze für Teilnehmer', 2, 'nw10-og1-r115'),
(8, 'R-116', 'Herrentoilette', '', ' ', 2, 'nw10-og1-wc'),
(9, 'R-117', 'Küche', 'Fritierbude', 'Große Küche OG 1 mit Herd und Mikrowelle', 2, 'nw10-og1-kitchen'),
(10, 'R-202', 'Büro', '', 'Zweiraumbüro', 3, 'nw10-og2-r202'),
(11, 'R-203', 'Büro', '', '', 3, 'nw10-og2-r203'),
(12, 'R-204', 'Ruheraum', 'Matratzenwolkenland', '', 3, 'nw10-og2-r204'),
(13, 'R-205', 'Unterrichtsraum', 'Bremerhafen', '8 Computerplätze, Beamer und Tafel', 3, 'nw10-og2-r205'),
(14, 'R-206', 'Damentoilette', 'Babywickeltisch', '', 3, 'nw10-og2-r206'),
(15, 'UG-R-05', 'Büro PSF', '', 'Bitte gegenüber anklopfen, oft niemand da.', 4, 'ra11-eg-ugr05'),
(16, 'UG-R-06', 'Büro SD', '', '', 4, 'ra11-eg-ugr06'),
(17, 'UG-R-07', 'Werkstatt', 'Hafencity II', 'Vier große Hobelbänke und Sägebank', 4, 'ra11-eg-ugr07'),
(18, 'UG-R-08', 'Abstellkammer', '', '', 4, 'ra11-eg-ugr08');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `test_faqs`
--

CREATE TABLE `test_faqs` (
  `id` int(11) NOT NULL,
  `question_short` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_long` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `test_faqs`
--

INSERT INTO `test_faqs` (`id`, `question_short`, `question_long`, `answer`, `link`, `posted`) VALUES
(1, 'Wo finde ich meine PSF?', NULL, 'Siehe unter Navigation PSF', '', '2020-03-31 13:00:00'),
(2, 'Wo finde ich Frau Amina', NULL, 'Frau Amina: Raum 323, NW 10, 3. Stock', 'link/zu/amina', '2020-03-30 11:00:00'),
(3, 'Ich bin zu spät. Was soll ich tun?', NULL, 'Beim Empfang anrufen und Bescheid sagen. Die Telefonnummer: 040/339988', 'link/zu/empfang', '2020-03-30 11:00:00'),
(4, 'Wo ist die Tischlerei?', NULL, 'Rosenallee 21', 'link/zu/Rosenallee/21', '2020-01-02 17:20:00'),
(5, 'Ich schaffe meine Arbeitspakete nicht. Was kann ich tun? An wen kann ich mich wenden?', NULL, 'Antwort, Antwort, Antwort', 'link/zu/antwort-230', '2020-01-02 17:00:00'),
(6, 'Wie melde ich mich bei Kursen an?', NULL, 'Antwort für IaK Kurse', 'link/zu/iak/kurse', '2020-03-30 11:00:00'),
(7, 'Ich habe in zwei Wochen Therapie? Kann ich da einfach fehlen?', NULL, 'Man muss so ein Zettel ausfüllen', 'link/zu/vorlage/Zettel', '2020-03-17 06:00:00'),
(8, 'Der Corona-Wahnsinn nervt! Was jetzt?', 'Die Zeiten sind hart und wir müssen alle zu Hause bleiben. Die Frage ist, was man jetzt tut, wenn auch die PSFs nicht mehr arbeiten?\r\nDie Frage wurde von Herbert Meisen gestellt.\r\nDies ist eine Frage mit langem Inhalt.', 'Erstmal abwarten und Tee trinken', 'link/zu/Artikel/corona/lebt', '2020-04-01 06:00:00');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indizes für die Tabelle `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indizes für die Tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `constraint_unique_svg_name` (`svg_unique_name`),
  ADD KEY `floor_id` (`floor_id`);

--
-- Indizes für die Tabelle `test_faqs`
--
ALTER TABLE `test_faqs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `floors`
--
ALTER TABLE `floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `persons`
--
ALTER TABLE `persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `test_faqs`
--
ALTER TABLE `test_faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `floors`
--
ALTER TABLE `floors`
  ADD CONSTRAINT `floors_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints der Tabelle `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `persons_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints der Tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`floor_id`) REFERENCES `floors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
