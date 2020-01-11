CREATE TABLE `Friendship` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Status` bit,
  `SenderId` int,
  `RecieverId` int
);

CREATE TABLE `Conversation` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(50),
  `Picture` varchar(200)
);

CREATE TABLE `Message` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Text` text,
  `CreatedAt` datetime,
  `ConversationMemberId` int,
  `ConversationId` int,
  `MessageStatus` bit
);

CREATE TABLE `ConversationMember` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `UserId` int,
  `ConversationId` int,
  `Nickname` varchar(50)
);

CREATE TABLE `User` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `FirstName` varchar(50),
  `Surname` varchar(50),
  `Email` varchar(50),
  `ProfileImage` varchar(200),
  `Password` varchar(200)
);

ALTER TABLE `Friendship` ADD FOREIGN KEY (`SenderId`) REFERENCES `User` (`Id`);

ALTER TABLE `Friendship` ADD FOREIGN KEY (`RecieverId`) REFERENCES `User` (`Id`);

ALTER TABLE `Message` ADD FOREIGN KEY (`ConversationMemberId`) REFERENCES `ConversationMember` (`Id`);

ALTER TABLE `Message` ADD FOREIGN KEY (`ConversationId`) REFERENCES `Conversation` (`Id`);

ALTER TABLE `ConversationMember` ADD FOREIGN KEY (`UserId`) REFERENCES `User` (`Id`);

ALTER TABLE `ConversationMember` ADD FOREIGN KEY (`ConversationId`) REFERENCES `Conversation` (`Id`);
