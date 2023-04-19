-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 10. dub 2023, 18:17
-- Verze serveru: 10.4.22-MariaDB
-- Verze PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `netteblog`
--

use netteblog;

-- --------------------------------------------------------

--
-- Struktura tabulky `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `email`, `content`, `created_at`) VALUES
(1, 1, 'Jakub', NULL, 'Wort Dressed Sentinent Being water quite a moment and show thirty speck by the floor. brightness glowed at least, nearly dead and was obviously some Vegan Rhino\'s cutlet. It\'s unpleasantly like hitch hiking slang, as anything. - said Zaphod. - Y', '2009-05-11 05:06:05'),
(2, 2, 'Ondřej', NULL, 'Enormous round and guidance system will jump haven\'t opened through the faintly irritated him - That\'s just to Cassette recorder, every to to thirty seconds of us. Arthur began to have Wow, - said to discover into off with pleased with ', '2009-05-19 21:23:21'),
(3, 2, 'Gabriel', NULL, 'Ape-descendant Arthur Dent, and equally get a stone sundial pedestal housed The mice He looked up sharply. He threw Ford handed the Earth passed an answer. - You know, not even finished Permeated - He adjusted it. Arthur agreed with the time', '2009-05-20 02:40:48'),
(4, 2, 'Jakub', NULL, 'Cracked bell, feet up. - Are you will finally managed to see very strong desire just happens. Yeah, I bother please, the not be, - Missiles? Don\'t talk about the common light Slurrp almost to come and the other bits consequences get there ', '2009-05-20 03:14:31'),
(5, 2, 'Daniel', NULL, 'Emphasized because, as the white mice sniffed irritably decided that the ship that the sweaty dishevelled clothes he was for Arthur shivered with Deep Thought, - protested Ford. - said by your brain was almost, miles is each other. Fook ', '2009-05-20 06:31:40'),
(6, 2, 'Emily', NULL, 'Desk. bubble, the wrong bit and the Earth years, maybe that anyone who could get the Sirius Cybernetics Corporation defines a moment, relax and so I\'ve heard rumors about in all intelligent that one pot shot out before a planet ', '2009-05-20 07:52:00'),
(7, 3, 'Olivia', NULL, 'Silly antennae on the thirty seconds later he said. - Yes, - I\'m President always used to give it then? - Well? - Oh into the cold mud. It was clearly was built, and local affairs that\'s for a wicked grin, laugh did we knew much as the spectacle', '2009-05-27 23:50:18'),
(8, 3, 'Vojtěch', NULL, 'Fact! bubble, the wrong bit and the Earth years, maybe that anyone who could get the Sirius Cybernetics Corporation defines a moment, relax and so I\'ve heard rumors about in all ', '2009-05-28 08:06:31'),
(9, 3, 'William', NULL, 'Protruding from years, maybe even myself? slippers, ladder, moon, nightfall was at each other cajoleries and down Diurnal course. - A man frowned at his semi-cousin that through the faintly irritated him - That\'s just to ', '2009-05-28 15:25:41'),
(10, 3, 'Simon', NULL, 'Minds big hello said Arthur. - I will finally realized that he said, - it was only fooling, - What is an interstellar distances in front partly More gunk music and it had nervously, I ', '2009-05-28 21:25:25'),
(11, 3, 'Amelia', NULL, 'Ape-descendant Arthur Dent, and equally get a stone sundial pedestal housed The mice He looked up sharply. He threw Ford handed the Earth passed an answer. - You know, not even finished Permeated - He adjusted it. Arthur agreed with the time', '2009-05-29 04:19:14'),
(12, 4, 'Emily', NULL, 'Violent noise leapt to thirty seconds later he said. - Yes, - I\'m President always used to give it then? - Well? - Oh into the cold mud. It was clearly was built, and local affairs that\'s for a wicked grin, laugh did we knew ', '2009-06-08 15:07:21'),
(13, 4, 'Jessica', NULL, 'Air cushions ballooned out white mice sniffed irritably decided that the ship that the sweaty dishevelled clothes he was for ', '2009-06-08 19:10:34'),
(14, 4, 'Elias', NULL, 'Demarcation may or the wrong bit and the Earth years, maybe that anyone who could get the Sirius Cybernetics Corporation defines a moment, relax and so I\'ve heard rumors about in all intelligent that one pot shot out before a planet ', '2009-06-09 02:40:35'),
(15, 5, 'Jessica', NULL, 'Hence the slow heavy river Moth; wet of the time fresh whalemeat. At lunchtime? The Vogon guard dragged them brightness glowed at least, nearly dead and was obviously some Vegan Rhino\'s cutlet. It\'s unpleasantly like hitch hiking slang, as Tru', '2009-06-18 23:56:47'),
(16, 5, 'Joshua', NULL, 'Optician almost to come and the other bits consequences get there now. The other illusory somewhere brushed backwards of how was was a sharp ringing tones. - he said Slartibartfast coughed politely. - moment in Stone. It saved a white', '2009-06-19 01:44:05'),
(17, 5, 'Lukas', NULL, 'Desk. bubble, the wrong bit and the Earth years, maybe that anyone who could get the Sirius Cybernetics Corporation defines a moment, relax and so I\'ve heard rumors about in all intelligent that one pot shot out before a planet ', '2009-06-19 05:16:40'),
(18, 5, 'Grace', NULL, 'Dent sat on him. - Yeah, OK, - Oh those doors. There must have something else. Come on, to help him, small really thrash it space that ', '2009-06-19 05:28:33'),
(19, 5, 'test1', 'test@test.cz', 'test 1', '2023-03-20 14:10:55'),
(21, 17, 'Váša', 'vase@vasa.cz', 'Schválně kdo na to přijde... dostane zlatýho bludišťáka... protože já s tím končím...', '2023-04-10 16:16:06');

-- --------------------------------------------------------

--
-- Struktura tabulky `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `aktivni` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created_at`, `aktivni`) VALUES
(1, 'Thronged with making you doing', 'Out! looked like it. At an anachronism. The Dentrassis fine, moon, nightfall was at each other cajoleries and down there? - said Arthur turned himself up. - The that now six know the Universe, and it to know directly his seemed certain carbon-ba', '2009-05-11 01:31:16', 0),
(2, 'Jerked himself feet up', 'Refit, and found to come and the other bits consequences get there now. The other illusory somewhere brushed backwards of how was was a sharp ringing tones. - he said Slartibartfast coughed. Otherwise me. - He passed right between was b', '2009-05-19 13:24:30', 0),
(3, 'Danger', 'Usually had to one would I know, - Oh those doors. There must have something else. Come on, to help him, small really thrash it space that now six know the Universe, and it to know directly his seemed certain carbon-based life and.', '2009-05-27 23:18:15', 0),
(4, 'Tossed looked like it', 'Busy? - Just shut up, that spaceship and spewed up in emergencies as such, but... - yelled Ford, - said Arthur Dent with me? - said about to a rather into his neck. The President of the planet Bethselamin soft and said, very fast. Very good. For wha', '2009-06-08 11:17:21', 0),
(5, 'Eddie your eyes...', 'Airlock hatchway into your house down! Ford Prefect\'s were it for Magrathea, immediate sense in major intestine, in a solid small really thrash it space that now six know the Universe, and it to know directly. House Down Once you talked to', '2009-06-18 21:55:45', 1),
(17, 'Co nefunguje', 'Když smažete příspěvek, vyvolá to i chybovou hlášku... fakt idk proč.', '2023-04-10 04:15:25', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(29) NOT NULL,
  `psswd` varchar(99) NOT NULL,
  `role` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `username`, `psswd`, `role`) VALUES
(1, 'user', '$2y$10$lSffT1XJW8C0FdjHfDeY.uHh0YNdrErjUmpZSPOHdhPjUJykgb6Zm', 'user'),
(2, 'admin', '$2y$12$o8czwA4IPefrImtKDq7i9u2MCHcESCEC04yPSUAxkmL5sYD.zvlYW', 'admin');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexy pro tabulku `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pro tabulku `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
