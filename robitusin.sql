-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 13. led 2020, 17:09
-- Verze serveru: 10.4.11-MariaDB
-- Verze PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `robitusin`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `conversation`
--

CREATE TABLE `conversation` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `Picture` varchar(200) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `conversationmember`
--

CREATE TABLE `conversationmember` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `ConversationId` int(11) DEFAULT NULL,
  `Nickname` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `friendship`
--

CREATE TABLE `friendship` (
  `Id` int(11) NOT NULL,
  `Status` bit(1) DEFAULT NULL,
  `SenderId` int(11) DEFAULT NULL,
  `RecieverId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `message`
--

CREATE TABLE `message` (
  `Id` int(11) NOT NULL,
  `Text` text COLLATE utf8_czech_ci DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `ConversationMemberId` int(11) DEFAULT NULL,
  `ConversationId` int(11) DEFAULT NULL,
  `MessageStatus` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `Username` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `ProfileImage` varchar(200) COLLATE utf8_czech_ci DEFAULT NULL,
  `Password` varchar(200) COLLATE utf8_czech_ci DEFAULT NULL,
  `Token` varchar(300) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`Id`);

--
-- Klíče pro tabulku `conversationmember`
--
ALTER TABLE `conversationmember`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `ConversationId` (`ConversationId`);

--
-- Klíče pro tabulku `friendship`
--
ALTER TABLE `friendship`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `SenderId` (`SenderId`),
  ADD KEY `RecieverId` (`RecieverId`);

--
-- Klíče pro tabulku `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ConversationMemberId` (`ConversationMemberId`),
  ADD KEY `ConversationId` (`ConversationId`);

--
-- Klíče pro tabulku `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `conversation`
--
ALTER TABLE `conversation`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `conversationmember`
--
ALTER TABLE `conversationmember`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `friendship`
--
ALTER TABLE `friendship`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `message`
--
ALTER TABLE `message`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `conversationmember`
--
ALTER TABLE `conversationmember`
  ADD CONSTRAINT `conversationmember_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`),
  ADD CONSTRAINT `conversationmember_ibfk_2` FOREIGN KEY (`ConversationId`) REFERENCES `conversation` (`Id`);

--
-- Omezení pro tabulku `friendship`
--
ALTER TABLE `friendship`
  ADD CONSTRAINT `friendship_ibfk_1` FOREIGN KEY (`SenderId`) REFERENCES `user` (`Id`),
  ADD CONSTRAINT `friendship_ibfk_2` FOREIGN KEY (`RecieverId`) REFERENCES `user` (`Id`);

--
-- Omezení pro tabulku `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`ConversationMemberId`) REFERENCES `conversationmember` (`Id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`ConversationId`) REFERENCES `conversation` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
