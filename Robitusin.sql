create database Robitusin
go
use Robitusin
go


CREATE TABLE [Friendship] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [Status] nvarchar(255),
  [TimeOfCreation] time,
  [SenderId] int,
  [RecieverId] int
)
GO

CREATE TABLE [Conversation] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [Name] nvarchar(255),
  [Picture] image
)
GO

CREATE TABLE [Message] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [Text] nvarchar(255),
  [Attachment] Picture,
  [TimeOfSent] time,
  [MemberId] int
)
GO

CREATE TABLE [MessageState] (
  [MessageId] int,
  [ConversationMember] int,
  [MessageStatus] nvarchar(255)
)
GO

CREATE TABLE [ConversationMember] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [UserId] int,
  [ConversationId] int,
  [MemberRole] nvarchar(255),
  [Nickname] nvarchar(255),
  [LastTimeActive] time
)
GO

CREATE TABLE [User] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [FirstName] nvarchar(255),
  [Surname] nvarchar(255),
  [email] nvarchar(255),
  [ProfileImage] image,
  [password] nvarchar(255),
  [Tel] int,
  [Info] nvarchar(255),
  [GenderId] int
)
GO

CREATE TABLE [Gender] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [Gender] nvarchar(255)
)
GO

ALTER TABLE [Friendship] ADD FOREIGN KEY ([SenderId]) REFERENCES [User] ([id])
GO

ALTER TABLE [Friendship] ADD FOREIGN KEY ([RecieverId]) REFERENCES [User] ([id])
GO

ALTER TABLE [Message] ADD FOREIGN KEY ([MemberId]) REFERENCES [ConversationMember] ([id])
GO

ALTER TABLE [MessageState] ADD FOREIGN KEY ([MessageId]) REFERENCES [Message] ([id])
GO

ALTER TABLE [MessageState] ADD FOREIGN KEY ([ConversationMember]) REFERENCES [ConversationMember] ([id])
GO

ALTER TABLE [ConversationMember] ADD FOREIGN KEY ([UserId]) REFERENCES [User] ([id])
GO

ALTER TABLE [ConversationMember] ADD FOREIGN KEY ([ConversationId]) REFERENCES [Conversation] ([id])
GO

ALTER TABLE [User] ADD FOREIGN KEY ([GenderId]) REFERENCES [Gender] ([id])
GO
