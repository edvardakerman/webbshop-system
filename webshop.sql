-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 20, 2021 at 09:31 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop2`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `FirstName` varchar(55) NOT NULL,
  `LastName` varchar(55) NOT NULL,
  `Email` varchar(55) NOT NULL,
  `RegisterDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(55) NOT NULL,
  `isAdmin` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `FirstName`, `LastName`, `Email`, `RegisterDate`, `password`, `isAdmin`) VALUES
(1, 'Georgios', 'Goussis', 'ulidin@gmail.com', '2021-05-16 10:20:52', '123456', NULL),
(2, 'ed', 'ed', 'ed@mail.se', '2021-05-19 09:47:52', '123', 1),
(3, 'Niklas', 'Söderberg', 'nma.prob@gmail.com', '2021-05-19 11:40:30', '123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `productId`, `amount`, `price`) VALUES
(21, 17, 1, 1, '41'),
(22, 17, 2, 1, '3'),
(23, 17, 3, 1, '5'),
(24, 18, 1, 1, '41'),
(25, 18, 3, 1, '5'),
(26, 19, 6, 1, '89'),
(27, 20, 3, 2, '5'),
(28, 20, 4, 1, '3'),
(29, 21, 2, 1, '3'),
(30, 22, 1, 1, '41'),
(31, 23, 2, 1, '3'),
(32, 23, 6, 1, '89'),
(33, 24, 1, 5, '41'),
(34, 25, 2, 1, '3'),
(35, 25, 6, 1, '89'),
(36, 26, 1, 1, '41'),
(37, 27, 2, 1, '3'),
(38, 28, 6, 1, '89'),
(39, 28, 1, 1, '41'),
(40, 28, 11, 1, '17'),
(41, 29, 3, 1, '5');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `RegisterDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orderStatus` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customerId`, `RegisterDate`, `orderStatus`) VALUES
(17, 3, '2021-05-19 11:40:57', NULL),
(18, 3, '2021-05-19 12:32:53', NULL),
(19, 3, '2021-05-19 13:13:23', NULL),
(20, 2, '2021-05-19 13:18:21', NULL),
(21, 2, '2021-05-19 13:33:29', NULL),
(22, 3, '2021-05-19 14:38:58', NULL),
(23, 3, '2021-05-19 21:51:14', NULL),
(24, 3, '2021-05-19 22:58:44', NULL),
(25, 3, '2021-05-19 23:03:59', NULL),
(26, 3, '2021-05-19 23:05:29', NULL),
(27, 3, '2021-05-19 23:05:58', NULL),
(28, 3, '2021-05-19 23:47:54', NULL),
(29, 3, '2021-05-20 09:35:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(11,0) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category` varchar(55) NOT NULL,
  `rarity` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `amount`, `description`, `price`, `image`, `category`, `rarity`) VALUES
(1, 'Hofri Ghostforge', 5, 'Spirits you control get +1/+1 and have trample and haste.\r\nWhenever another nontoken creature you control dies, exile it. If you do, create a token that\'s a copy of that creature, except it\'s a Spirit in addition to its other types and it has \"When this creature leaves the battlefield, return the exiled card to its owner\'s graveyard.\"', '41', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/hofrighostforge.hq.jpg?v=1617398328', 'Legendary Creature', 'Mythic Rare'),
(2, 'Make Your Mark', 62, 'Target creature gets +1/+0 until end of turn. When that creature dies this turn, create a 3/2 red and white Spirit creature token.', '3', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/makeyourmark.hq.jpg?v=1617398312', 'Instant', 'Common'),
(3, 'Humiliate', 32, 'Target opponent reveals their hand. You choose a nonland card from it. That player discards that card. Put a +1/+1 counter on a creature you control.', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/humiliate.hq.jpg?v=1617527130', 'Sorcery', 'Uncommon'),
(4, 'Infuse with Vitality', 5, 'Until end of turn, target creature gains deathtouch and \"When this creature dies, return it to the battlefield tapped under its owner\'s control.\"\r\nYou gain 2 life.', '3', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/infusewithvitality.hq.jpg?v=1617527105', 'Instant', 'Common'),
(5, 'Inkling Summoning', 66, 'Create a 2/1 white and black Inkling creature token with flying.', '3', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/inklingsummoning.hq.jpg?v=1617527147', 'Sorcery - Lesson', 'Common'),
(6, 'Jadzi, Oracle of Arcavios', 5, 'Discard a card: Return Jadzi, Oracle of Arcavios to its owner\'s hand.\r\nMagecraft — Whenever you cast or copy an instant or sorcery spell, reveal the top card of your library. If it\'s a nonland card, you may cast it by paying 1 rather than paying its mana cost. If it\'s a land card, put it onto the battlefield.', '89', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/jadzi,oracleofarcaviosjourneytotheoracle.hq.jpg?v=1617527093', 'Legendary Creature — Human Wizard', 'Mythic Rare'),
(7, 'Kasmina, Enigma Sage', 5, 'Each other planeswalker you control has the loyalty abilities of Kasmina, Enigma Sage.\r\n+2: Scry 1.\r\n−X: Create a 0/0 green and blue Fractal creature token. Put X +1/+1 counters on it.\r\n−8: Search your library for an instant or sorcery card that shares a color with this planeswalker, exile that card, then shuffle. You may cast that card without paying its mana cost.', '99', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/kasmina,enigmasage.hq.jpg?v=1617527130', 'Legendary Planeswalker — Kasmina', 'Mythic Rare'),
(8, 'Kianne, Dean of Substance', 10, 'Tap: Exile the top card of your library. If it\'s a land card, put it into your hand. Otherwise, put a study counter on it.\r\n4G: Create a 0/0 green and blue Fractal creature token. Put a +1/+1 counter on it for each different mana value among nonland cards you own in exile with study counters on them.', '18', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/kianne,deanofsubstanceimbraham,deanoftheory.hq.jpg?v=1617398403', 'Legendary Creature — Elf Druid', 'Rare'),
(9, 'Killian, Ink Duelist', 28, 'Lifelink\r\nMenace (This creature can\'t be blocked except by two or more creatures.)\r\nSpells you cast that target a creature cost 2 less to cast.', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/killian,inkduelist.hq.jpg?v=1617527130', 'Legendary Creature — Human Warlock', 'Uncommon'),
(10, 'Lorehold Apprentice', 28, 'Magecraft — Whenever you cast or copy an instant or sorcery spell, until end of turn, Spirit creatures you control gain \"Tap: This creature deals 1 damage to each opponent.\"', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/loreholdapprentice.hq.jpg?v=1617527126', 'Creature — Human Cleric', 'Uncommon'),
(11, 'Lorehold Command', 8, 'Choose two —\r\n• Create a 3/2 red and white Spirit creature token.\r\n• Creatures you control get +1/+0 and gain indestructible and haste until end of turn.\r\n• Lorehold Command deals 3 damage to any target. Target player gains 3 life.\r\n• Sacrifice a permanent, then draw two cards.', '17', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/loreholdcommand.hq.jpg?v=1617527129', 'Instant', 'Rare'),
(12, 'Lorehold Excavation', 28, 'At the beginning of your end step, mill a card. If a land card was milled this way, you gain 1 life. Otherwise, Lorehold Excavation deals 1 damage to each opponent. (To mill a card, put the top card of your library into your graveyard.)\r\n5, Exile a creature card from your graveyard: Create a tapped 3/2 red and white Spirit creature token.', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/loreholdexcavation.hq.jpg?v=1617398330', 'Enchantment', 'Uncommon'),
(13, 'Lorehold Pledgemage', 62, 'First strike\r\nMagecraft — Whenever you cast or copy an instant or sorcery spell, Lorehold Pledgemage gets +1/+0 until end of turn.', '3', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/loreholdpledgemage.hq.jpg?v=1617398331', 'Creature — Kor Shaman', 'Common'),
(14, 'Maelstrom Muse', 30, 'Flying\r\nWhenever Maelstrom Muse attacks, the next instant or sorcery spell you cast this turn costs X less to cast, where X is Maelstrom Muse\'s power as this ability resolves.', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/maelstrommuse.hq.jpg?v=1617527098', 'Creature — Djinn Wizard', 'Uncommon'),
(15, 'Magma Opus', 5, 'Magma Opus deals 4 damage divided as you choose among any number of targets. Tap two target permanents. Create a 4/4 blue and red Elemental creature token. Draw two cards.\r\n(U/R)(U/R), Discard Magma Opus: Create a Treasure token.', '46', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/magmaopus.hq.jpg?v=1617527130', 'Instant', 'Mythic Rare'),
(16, 'Manifestation Sage', 10, 'When Manifestation Sage enters the battlefield, create a 0/0 green and blue Fractal creature token. Put X +1/+1 counters on it, where X is the number of cards in your hand.', '15', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/manifestationsage.hq.jpg?v=1617527152', 'Creature — Human Wizard', 'Rare'),
(17, 'Mila, Crafty Companion', 6, 'Whenever an opponent attacks one or more planeswalkers you control, put a loyalty counter on each planeswalker you control.\r\nWhenever a permanent you control becomes the target of a spell or ability an opponent controls, you may draw a card.\r\n\r\n+1: You may discard a card. If you do, draw a card. If a creature card was discarded this way, draw two cards instead.\r\n−2: Return target creature card from your graveyard to the battlefield. It gains haste. Exile it at the beginning of your next upkeep.\r\n−7: You get an emblem with \"Whenever a creature enters the battlefield under your control, it deals damage equal to its power to any target.\"', '117', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/mila,craftycompanionlukka,waywardbonder.hq.jpg?v=1617398401', 'Legendary Creature — Fox', 'Mythic Rare'),
(18, 'Moldering Karok', 56, 'Necroluminescence is common among the undead creatures of Sedgemoor, giving the midnight swamp an eerie glow. It\'s comforting—from a distance.', '3', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/molderingkarok.hq.jpg?v=1617398302', 'Creature — Zombie Crocodile', 'Common'),
(19, 'Mortality Spear', 22, 'This spell costs 2 less to cast if you gained life this turn.\r\nDestroy target nonland permanent.', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/mortalityspear.hq.jpg?v=1617527088', 'Instant', 'Uncommon'),
(20, 'Needlethorn Drake', 56, 'Flying, deathtouch. \r\nAs they learn to fly, young drakes have a tendency to accidentally impale trees, cliffs, and unsuspecting students.', '3', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/needlethorndrake.hq.jpg?v=1617527437', 'Creature — Drake', 'Common'),
(21, 'Oggyar Battle-Seer', 50, 'Haste. \r\nTap: Scry 1. \r\n\"May Ganathog bless us with bloody visions of glory restored!\"', '3', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/oggyarbattle-seer.hq.jpg?v=1617527096', 'Creature — Ogre Shaman', 'Common'),
(22, 'Owlin Shieldmage', 60, 'Flying. \r\nWard—Pay 3 life. (Whenever this creature becomes the target of a spell or ability an opponent controls, counter it unless that player pays 3 life.)', '3', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/owlinshieldmage.hq.jpg?v=1617527146', 'Creature — Bird Warlock', 'Common'),
(23, 'Pest Summoning', 50, 'Create two 1/1 black and green Pest creature tokens with \"When this creature dies, you gain 1 life.\"', '3', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/pestsummoning.hq.jpg?v=1617527127', 'Sorcery — Lesson', 'Common'),
(24, 'Pestilent Cauldron', 8, 'Tap, Discard a card: Create a 1/1 black and green Pest creature token with \"When this creature dies, you gain 1 life.\"\r\n1, Tap: Each opponent mills cards equal to the amount of life you gained this turn.\r\n4, Tap: Exile four target cards from a single graveyard. Draw a card.\r\n \r\nReturn up to two target creature, land, and/or planeswalker cards from your graveyard to your hand. Each player gains 4 life. Exile Restorative Burst.', '18', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/pestilentcauldronrestorativeburst.hq.jpg?v=1617527246', 'Artifact', 'Rare'),
(25, 'Plargg, Dean of Chaos', 5, 'Tap, Discard a card: Draw a card.\r\n4R, Tap: Reveal cards from the top of your library until you reveal a nonlegendary, nonland card with mana value 3 or less. You may cast that card without paying its mana cost. Put all revealed cards not cast this way on the bottom of your library in a random order.\r\n \r\nOther tapped creatures you control get +1/+0.\r\nOther untapped creatures you control get +0/+1.\r\nWhenever you attack, untap each creature you control, then tap any number of creatures you control.', '17', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/plargg,deanofchaosaugusta,deanoforder.hq.jpg?v=1617398403', 'Legendary Creature — Orc Shaman', 'Rare'),
(26, 'Practical Research', 32, 'Draw four cards. Then discard two cards unless you discard an instant or sorcery card.', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/practicalresearch.hq.jpg?v=1617398313', 'Instant', 'Uncommon'),
(27, 'Prismari Apprentice', 32, 'Magecraft — Whenever you cast or copy an instant or sorcery spell, Prismari Apprentice can\'t be blocked this turn. If that spell has mana value 5 or greater, put a +1/+1 counter on Prismari Apprentice.', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/prismariapprentice.hq.jpg?v=1617527119', 'Creature — Human Shaman', 'Uncommon'),
(28, 'Prismari Command', 5, 'Choose two —\r\n• Prismari Command deals 2 damage to any target.\r\n• Target player draws two cards, then discards two cards.\r\n• Target player creates a Treasure token.\r\n• Destroy target artifact.', '124', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/prismaricommand.hq.jpg?v=1617527128', 'Instant', 'Rare'),
(29, 'Prismari Pledgemage', 52, 'Defender\r\nMagecraft — Whenever you cast or copy an instant or sorcery spell, Prismari Pledgemage can attack this turn as though it didn\'t have defender.', '3', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/prismaripledgemage.hq.jpg?v=1617398310', 'Creature — Orc Wizard', 'Common'),
(30, 'Quandrix Apprentice', 16, 'Magecraft — Whenever you cast or copy an instant or sorcery spell, look at the top three cards of your library. You may reveal a land card from among them and put that card into your hand. Put the rest on the bottom of your library in any order.', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/quandrixapprentice.hq.jpg?v=1617527125', 'Creature — Human Wizard', 'Uncommon'),
(31, 'Quandrix Command', 10, 'Choose two —\r\n• Return target creature or planeswalker to its owner\'s hand.\r\n• Counter target artifact or enchantment spell.\r\n• Put two +1/+1 counters on target creature.\r\n• Target player shuffles up to three target cards from their graveyard into their library.', '22', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/quandrixcommand.hq.jpg?v=1617527125', 'Instant', 'Rare'),
(32, 'Quandrix Cultivator', 20, 'When Quandrix Cultivator enters the battlefield, you may search your library for a basic Forest or Island card, put it onto the battlefield, then shuffle.', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/quandrixcultivator.hq.jpg?v=1617527150', 'Creature — Turtle Druid', 'Uncommon'),
(33, 'Quandrix Pledgemage', 48, 'Magecraft — Whenever you cast or copy an instant or sorcery spell, put a +1/+1 counter on Quandrix Pledgemage.', '3', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/quandrixpledgemage.hq.jpg?v=1617527151', 'Creature — Merfolk Druid', 'Common'),
(34, 'Quintorius, Field Historian', 26, 'Spirits you control get +1/+0.\r\nWhenever one or more cards leave your graveyard, create a 3/2 red and white Spirit creature token.', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/quintorius,fieldhistorian.hq.jpg?v=1617398331', 'Legendary Creature — Elephant Cleric', 'Uncommon'),
(35, 'Radiant Scrollwielder', 12, 'Instant and sorcery spells you control have lifelink.\r\nAt the beginning of your upkeep, exile an instant or sorcery card at random from your graveyard. You may cast it this turn. If a spell cast this way would be put into your graveyard, exile it instead.', '18', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/radiantscrollwielder.hq.jpg?v=1617398334', 'Creature — Dwarf Cleric', 'Rare'),
(36, 'Reconstruct History', 26, 'Return up to one target artifact card, up to one target enchantment card, up to one target instant card, up to one target sorcery card, and up to one target planeswalker card from your graveyard to your hand.\r\nExile Reconstruct History.', '5', 'https://www.svenskamagic.com/kortbilder/strixhaven:schoolofmages/reconstructhistory.hq.jpg?v=1617398331', 'Sorcery', 'Uncommon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders` (`orderId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order.customer` (`customerId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `fk_orders` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order.customer` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
