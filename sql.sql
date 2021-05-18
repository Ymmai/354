CREATE DATABASE db_onLineMusic

CREATE TABLE `dbo.tb_artist`(
`id` INT NOT NULL,
`artistName` VARCHAR(50),
`type` VARCHAR(50),
`imgURL` VARCHAR(50),
PRIMARY KEY(`id`)
)

CREATE TABLE `dbo.tb_song`(
`id` INT NOT NULL,
`songName` VARCHAR(50),
`singer` VARCHAR(50),
`fileURL` VARCHAR(100),
`hits` INT,
`type` VARCHAR(5),
PRIMARY KEY(`id`)
)

CREATE TABLE `dbo.tb_user`(
`id` INT NOT NULL,
`manager` VARCHAR(30),
`pwd` VARCHAR(30),
`userFlag` VARCHAR(5),
PRIMARY KEY(`id`)
)

CREATE TABLE `dbo.userSong`(
`id` INT NOT NULL,
`userId` INT,
`songId` INT,
PRIMARY KEY(`id`)
)