-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2019 年 04 月 09 日 10:12
-- 伺服器版本: 10.1.30-MariaDB
-- PHP 版本： 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `205cde proj`
--

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `name` varchar(255) NOT NULL,
  `price` smallint(4) NOT NULL,
  `date01` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `game`
--

CREATE TABLE `game` (
  `id` int(4) NOT NULL,
  `name` text,
  `price` smallint(4) DEFAULT NULL,
  `amount` text,
  `date1` date DEFAULT NULL,
  `YouTubeGamePlay` text,
  `GameDescription` text,
  `platform` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `game`
--

INSERT INTO `game` (`id`, `name`, `price`, `amount`, `date1`, `YouTubeGamePlay`, `GameDescription`, `platform`) VALUES
(1, 'Sekiro: Shadows Die Twice', 469, '46', '2019-03-22', 'https://www.youtube.com/embed/a2TjEl0l_FU', 'This game is an action-adventure video game developed by FromSoftware and published by Activision. The game follows a Sengoku period shinobi known as Sekiro as he attempts to take revenge on a samurai who attacked him and kidnapped his lord. The game received universal acclaim from critics. ', 'ps4'),
(2, 'Gundam Versus', 240, '21', '2017-09-29', 'https://www.youtube.com/embed/rJLX0pQnMU0', 'Gundam Versus is a video game for the PlayStation 4, the fifth generation in the Gundam VS series. It was released in Japan and Asian territories on July 6, 2017 with a North American and European release on September 29, 2017. ', 'ps4'),
(3, 'Marvels Spider-Man', 281, '28', '2018-09-07', 'https://www.youtube.com/embed/yCVOCSlzQno', 'Marvel\'s Spider-Man is a 2018 action-adventure game developed by Insomniac Games and published by Sony Interactive Entertainment. Based on the Marvel Comics superhero Spider-Man, it is inspired by the long-running comic book mythology and adaptations in other media. In the game\'s main storyline, the super-human crime lord Mr. Negative orchestrates a plot to seize control of New York City\'s criminal underworld. When Mr. Negative threatens to release a deadly virus, Spider-Man must confront him and protect the city while dealing with the personal problems of his civilian persona, Peter Parker', 'ps4'),
(4, 'GOD OF WAR 4', 268, '14', '2018-04-20', 'https://www.youtube.com/embed/6LOD-pwJY6E', 'God of War is an action-adventure video game developed by Santa Monica Studio and published by Sony Interactive Entertainment (SIE). Released on April 20, 2018, for the PlayStation 4 (PS4) console, it is the eighth installment in the God of War series, the eighth chronologically, and the sequel to 2010\'s God of War III. Unlike previous games, which were loosely based on Greek mythology, this installment is loosely based on Norse mythology, with the majority of it set in ancient Norway in the realm of Midgard. For the first time in the series, there are two main protagonists: Kratos, the former Greek God of War who remains as the only playable character, and his young son Atreus; at times, the player may passively control him. Following the death of Kratos\' second wife and Atreus\' mother, they journey to fulfill her promise to spread her ashes at the highest peak of the nine realms. Kratos keeps his troubled past a secret from Atreus, who is unaware of his divine nature. Along their journey, they encounter monsters and gods of the Norse world. ', 'ps4'),
(5, 'Monster Hunter: World', 261, '66', '2018-01-26', 'https://www.youtube.com/embed/__z0lSVYXWI', 'Monster Hunter: World is an action role-playing game developed and published by Capcom. A part of the Monster Hunter series, it was released worldwide for PlayStation 4 and Xbox One in January 2018, with a Microsoft Windows version in August 2018. In the game, the player takes the role of a Hunter, tasked to hunt down and either kill or trap monsters that roam in one of several environmental spaces. If successful, the player is rewarded through loot consisting of parts from the monster and other elements that are used to craft weapons and armor, amongst other equipment. The game\'s core loop has the player crafting appropriate gear to be able to hunt down more difficult monsters, which in turn provide parts that lead to more powerful gear. Players may hunt alone, or can hunt in cooperative groups of up to four players via the game\'s online services. ', 'ps4'),
(6, 'Super Smash Bros. Ultimate', 385, '35', '2018-12-07', 'https://www.youtube.com/embed/jhmsv0ISfto', 'Super Smash Bros. Ultimate. Super Smash Bros. Ultimate is a 2018 crossover fighting game developed by Bandai Namco Studios and Sora Ltd., and published by Nintendo for the Nintendo Switch. ... It features a wide variety of game modes, including a campaign for single-player and multiplayer versus modes.', 'NS'),
(7, 'Mario Kart 8', 345, '54', '2017-04-28', 'https://www.youtube.com/embed/qRNv3FpnvMg', 'Mario Kart 8 is a kart racing video game and the eighth major installment in the Mario Kart series, developed and published by Nintendo for their Wii U home video game console. The game was announced at E3 2013 and released worldwide in May 2014. ', 'NS'),
(8, 'Zelda Breath of the Wild', 398, '09', '2017-03-03', 'https://www.youtube.com/embed/1P7d2JNCtX4', 'The Legend of Zelda: Breath of the Wild is an action-adventure game developed and published by Nintendo. An entry in the longrunning The Legend of Zelda series, it was released for the Nintendo Switch and Wii U consoles on March 3, 2017. Breath of the Wild is set at the end of the series\' timeline; the player controls Link, who awakens from a hundred-year slumber to defeat Calamity Ganon before it can destroy the kingdom of Hyrule. ', 'NS'),
(9, 'Pokemon Lets Go, Pikachu!', 298, '57', '2018-11-16', 'https://www.youtube.com/embed/G7TYF6aGW1o', 'Pokémon: Let\'s Go, Pikachu! and Pokémon: Let\'s Go, Eevee! are role-playing video games developed by Game Freak and published by The Pokémon Company and Nintendo for the Nintendo Switch. The games are the first main series Pokémon entries for the system, and the first main titles to be released on a home console. They are enhanced remakes of the 1996 video games Pokémon Red and Blue, and the 1998 video game Pokémon Yellow. The games also feature integration with the mobile game Pokémon Go and support a new optional controller, the Poké Ball Plus. ', 'NS'),
(10, 'Dengeki Bunko: Fighting Climax PS3 ver.', 150, '14', '2015-12-17', 'https://www.youtube.com/embed/wqClhWuleKQ', 'Dengeki Bunko: Fighting Climax is a 2D arcade fighting game developed by Ecole Software and French Bread and published by Sega. The game celebrates the 20th anniversary of ASCII Media Works\' Dengeki Bunko imprint, featuring various characters from light novels published under the imprint. The game was first released in Japanese arcades in March 2014, and later released on PlayStation 3 and PlayStation Vita on November 13, 2014. The console version was released in North America and Europe in October 2015. The game\'s theme song is \"Belief\" by Mami Kawada. ', 'PS3'),
(11, 'Mobile Suit Gundam: Extreme Vs.Full Boost ', 238, '32', '2012-04-05', 'https://www.youtube.com/embed/5fui2SW4Qqo', 'Mobile Suit Gundam: Extreme Vs. Full Boost is the sequel to Mobile Suit Gundam: Extreme Vs. The game was announced on November 28, 2011 for release in arcades in 2012 and is headed for a PS3 release in 2014 with additional units exclusive to the console version which is set for release on January 31. The theme song for Full Boost is titled FIGHT IT OUT feat. K(Pay money To my Pain, performed by both Akihiro Namba of Hi-Standard and Takeshi Ueda of AA=. An additional update called Maxi Boost is slated for release in March 2014 with even more units. ', 'PS3'),
(12, 'Monster Hunter Generations', 110, '23', '2015-11-28', 'https://www.youtube.com/embed/9fMubWXGeFs', 'Monster Hunter Generations is an action role-playing video game developed and published by Capcom for the Nintendo 3DS. Announced in May 2015, the game was released in Japan in November 2015 and internationally in July 2016. Like other titles in the Monster Hunter series, players undertake quests that involve hunting dangerous creatures. Major additions in this installment include special attacks, new combat styles, and the ability to play as Felynes, who has traditionally only appeared as a companion to the player. An expanded version of the game, titled Monster Hunter XX, was announced in October 2016, and was released exclusively in Japan in March 2017. A HD port of the expansion for the Nintendo Switch, titled Monster Hunter Generations Ultimate,[b] was released in Japan in August 2017 followed by a worldwide release in August 2018. ', '3ds'),
(13, 'Super Mario Bro 2', 261, '12', '2013-07-21', 'https://www.youtube.com/embed/D339twbaCqc', 'New Super Mario Bros. 2 is a side-scrolling 2.5D action-adventure platform game for the Nintendo 3DS. It was first released in Japan on July 28, 2012. It is the thirteenth title in the main Super Mario series and the third in the New Super Mario Bros. line after New Super Mario Bros. for the Nintendo DS, and New Super Mario Bros. Wii for the Wii. As the direct sequel to New Super Mario Bros., it is an indirect follow-up to New Super Mario Bros. Wii. ', '3ds'),
(14, 'Dark Soul 3', 369, '41', '2017-03-27', 'https://www.youtube.com/embed/ceHf4o65EO4', 'Dark Souls III: The Ringed City is the second of two downloadable content packs for the 2016 action role-playing video game Dark Souls III. Released on March 27, 2017, the content pack was developed by FromSoftware and published by Bandai Namco Entertainment. It drew favorable reception from critics, with several seeing it as a proper end to the Souls series. ', 'PS4');

-- --------------------------------------------------------

--
-- 資料表結構 `login`
--

CREATE TABLE `login` (
  `email` varchar(255) NOT NULL,
  `username` text,
  `password` text,
  `address` text,
  `District` text,
  `CardtType` text,
  `cardno` text,
  `ExpirationDate` text,
  `CvCode` text,
  `CardOwner` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `login`
--

INSERT INTO `login` (`email`, `username`, `password`, `address`, `District`, `CardtType`, `cardno`, `ExpirationDate`, `CvCode`, `CardOwner`) VALUES
('ambrose609@gmail.com', 'Hin', '123qweasd', '', '', '', '0', '', '0', ''),
('gggg@gmail.com', 'Nok', '123456', '', '', '', '0', '', '0', ''),
('YNK@gmail.com', 'YNK', '1234', '', '', '', '0', '', '0', '');

-- --------------------------------------------------------

--
-- 資料表結構 `ns_game`
--

CREATE TABLE `ns_game` (
  `id` int(4) NOT NULL,
  `name` text,
  `price` smallint(4) DEFAULT NULL,
  `amount` text,
  `date` date DEFAULT NULL,
  `YouTubeGamePlay` text,
  `GameDescription` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `ns_game`
--

INSERT INTO `ns_game` (`id`, `name`, `price`, `amount`, `date`, `YouTubeGamePlay`, `GameDescription`) VALUES
(1, 'Super Smash Bros. Ultimate', 385, '35', '2018-12-07', 'https://www.youtube.com/embed/jhmsv0ISfto', 'Super Smash Bros. Ultimate. Super Smash Bros. Ultimate is a 2018 crossover fighting game developed by Bandai Namco Studios and Sora Ltd., and published by Nintendo for the Nintendo Switch. ... It features a wide variety of game modes, including a campaign for single-player and multiplayer versus modes.'),
(2, 'Mario Kart 8', 345, '54', '2017-04-28', 'https://www.youtube.com/embed/qRNv3FpnvMg', 'Mario Kart 8 is a kart racing video game and the eighth major installment in the Mario Kart series, developed and published by Nintendo for their Wii U home video game console. The game was announced at E3 2013 and released worldwide in May 2014. '),
(3, 'Zelda Breath of the Wild', 398, '09', '2017-03-03', 'https://www.youtube.com/embed/1P7d2JNCtX4', 'The Legend of Zelda: Breath of the Wild is an action-adventure game developed and published by Nintendo. An entry in the longrunning The Legend of Zelda series, it was released for the Nintendo Switch and Wii U consoles on March 3, 2017. Breath of the Wild is set at the end of the series\' timeline; the player controls Link, who awakens from a hundred-year slumber to defeat Calamity Ganon before it can destroy the kingdom of Hyrule. '),
(4, 'Pokemon Let\'s Go, Pikachu!', 298, '57', '2018-11-16', 'https://www.youtube.com/embed/G7TYF6aGW1o', 'Pokémon: Let\'s Go, Pikachu! and Pokémon: Let\'s Go, Eevee! are role-playing video games developed by Game Freak and published by The Pokémon Company and Nintendo for the Nintendo Switch. The games are the first main series Pokémon entries for the system, and the first main titles to be released on a home console. They are enhanced remakes of the 1996 video games Pokémon Red and Blue, and the 1998 video game Pokémon Yellow. The games also feature integration with the mobile game Pokémon Go and support a new optional controller, the Poké Ball Plus. ');

-- --------------------------------------------------------

--
-- 資料表結構 `order001`
--

CREATE TABLE `order001` (
  `OrderItem` text NOT NULL,
  `TotalPrice` int(11) NOT NULL,
  `itemname` text NOT NULL,
  `custemail` text NOT NULL,
  `custaddr` text NOT NULL,
  `district` text NOT NULL,
  `creditcarttype` text NOT NULL,
  `custcardno` text NOT NULL,
  `cardexdate` text NOT NULL,
  `CVC` smallint(3) NOT NULL,
  `cardowner` text NOT NULL,
  `phoneno` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `students`
--

CREATE TABLE `students` (
  `name` text,
  `addr` text,
  `city` text,
  `pin` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `students`
--

INSERT INTO `students` (`name`, `addr`, `city`, `pin`) VALUES
('YNK', 'babababab', 'UK', 'S1011769'),
('YNK', 'babababab', 'UK', 'S1011769'),
('b', 'asdasd', 'HK', '12345'),
('b', 'asdasd', 'HK', '12345'),
('WEQE', '', '', ''),
('ddd', 'ddd', 'ddd', 'ddd'),
('ddd', 'ddd', 'ddd', 'ddd'),
('ddd', 'ddd', 'ddd', 'ddd'),
('aaaa', 'q', 'q', 'q');

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `name` text,
  `email` varchar(255) NOT NULL,
  `password` text,
  `Address` text,
  `District` text,
  `CardType` text,
  `CreditCard` decimal(16,0) DEFAULT NULL,
  `CardOwner` text,
  `PhoneNo` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `user`
--

INSERT INTO `user` (`name`, `email`, `password`, `Address`, `District`, `CardType`, `CreditCard`, `CardOwner`, `PhoneNo`) VALUES
('AmbroseYuen', 'ambrose609@gmail.com', '123qweasd', 'Ho Man Tin', 'Kowloon City', 'VISA', '1234567890123456', 'Yuen Nok Hin', 66935113),
('Hin', 'Hin@gmail.com', '1234', 'MKMK street', 'Yau TsimMong', 'MasterCard', '9999888877776666', 'HIN', 27139852),
('qqq', 'qqq@qqq.com', 'qqqq', 'qqqq', 'Central and Western', 'VISA', '4433221144332211', 'qqq', 44332211),
('YNK', 'YNK@yahoo.com.hk', 'password', 'HMT SMH RM1104', 'Kowloon City', 'VISA', '123012301230123', 'YNK', 36936911),
('YUEN', 'YUEN@gmail.com', '1234567', 'DWDAF 23345 Dfdwad', 'Sai Kung', 'Paypal', '1111222211112222', 'NEUY', 11221122);

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`email`);

--
-- 資料表索引 `ns_game`
--
ALTER TABLE `ns_game`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
