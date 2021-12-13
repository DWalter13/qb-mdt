CREATE TABLE `user_mdt` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`char_id` int(11) DEFAULT NULL,
	`notes` varchar(255) DEFAULT NULL,
	`mugshot_url` varchar(255) DEFAULT NULL,
	`bail` bit DEFAULT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `vehicle_mdt` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`plate` varchar(255) DEFAULT NULL,
	`stolen` bit DEFAULT 0,
	`notes` varchar(255) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `user_convictions` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`char_id` int(11) DEFAULT NULL,
	`offense` varchar(255) DEFAULT NULL,
	`count` int(11) DEFAULT NULL,
	
	PRIMARY KEY (`id`)
);

CREATE TABLE `mdt_reports` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`char_id` int(11) DEFAULT NULL,
	`title` varchar(255) DEFAULT NULL,
	`incident` longtext DEFAULT NULL,
    `charges` longtext DEFAULT NULL,
    `author` varchar(255) DEFAULT NULL,
	`name` varchar(255) DEFAULT NULL,
    `date` varchar(255) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `mdt_warrants` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) DEFAULT NULL,
	`char_id` int(11) DEFAULT NULL,
	`report_id` int(11) DEFAULT NULL,
	`report_title` varchar(255) DEFAULT NULL,
	`charges` longtext DEFAULT NULL,
	`date` varchar(255) DEFAULT NULL,
	`expire` varchar(255) DEFAULT NULL,
	`notes` varchar(255) DEFAULT NULL,
	`author` varchar(255) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
	
       PRIMARY KEY (`id`)
);

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`) VALUES
(1, 'Murder', 25000, 0, 0),
(2, 'Involuntary Manslaughter', 10000, 0, 120),
(3, 'Vehicular Manslaughter', 7500, 0, 100),
(4, 'Attempted Murder on LEO', 1500, 0, 60),
(5, 'Attempted Murder', 1000, 0, 50),
(6, 'Assault w/ Deadly Weapon on LEO', 700, 0, 45),
(7, 'Assault w/ Deadly Weapon', 350, 0, 30),
(8, 'Assault on LEO', 150, 0, 15),
(9, 'Assault', 100, 0, 10),
(10, 'Kidnapping of an LEO', 400, 0, 40),
(11, 'Kidnapping / Hostage Taking', 200, 0, 20),
(12, 'Bank Robbery', 800, 0, 50),
(13, 'Armored Truck Robbery', 650, 0, 40),
(14, 'Jewelery Store Robbery ', 500, 0, 30),
(15, 'Store Robbery', 150, 0, 15),
(16, 'House Robbery', 100, 0, 10),
(17, 'Corruption', 10000, 0, 650),
(18, 'Felony Driving Under the Influence', 300, 0, 30),
(19, 'Grand Theft Auto', 300, 0, 20),
(20, 'Evading Arrest', 200, 0, 20),
(21, 'Driving Under the Influence', 150, 0, 15),
(22, 'Hit and Run', 150, 0, 15),
(23, 'Operating a Motor Vehicle without a License', 100, 0, 10),
(24, 'Criminal Speeding', 300, 0, 10),
(25, 'Excessive Speeding 4', 250, 0, 0),
(26, 'Excessive Speeding 3', 200, 0, 0),
(27, 'Excessive Speeding 2', 150, 0, 0),
(28, 'Excessive Speeding', 100, 0, 0),
(29, 'Operating an Unregisted Motor Vehicle', 100, 0, 5),
(30, 'Reckless Endangerment', 150, 0, 5),
(31, 'Careless Driving', 100, 0, 0),
(32, 'Operating a Non-Street Legal Vehicle', 200, 0, 5),
(33, 'Failure to Stop', 100, 0, 0),
(34, 'Obstructing Traffic', 150, 0, 0),
(35, 'Illegal Lane Change', 100, 0, 0),
(36, 'Failure to Yield to an Emergency Vehicle', 150, 0, 0),
(37, 'Illegal Parking', 100, 0, 0),
(38, 'Excessive Vehicle Noise', 100, 0, 0),
(39, 'Driving without Proper Use of Headlights', 100, 0, 0),
(40, 'Illegal U-Turn', 100, 0, 0),
(41, 'Drug Manufacturing/Cultivation', 550, 0, 40),
(42, 'Possession of Schedule 1 Drug', 150, 0, 15),
(43, 'Possession of Schedule 2 Drug', 250, 0, 20),
(44, 'Sale/Distribution of Schedule 1 Drug', 250, 0, 20),
(45, 'Sale/Distribution of Schedule 2 Drug', 400, 0, 30),
(46, 'Drug Trafficking', 500, 0, 40),
(47, 'Weapons Caching of Class 2s', 2500, 0, 120),
(48, 'Weapons Caching of Class 1s', 1250, 0, 60),
(49, 'Weapons Trafficking of Class 2s', 1700, 0, 80),
(50, 'Weapons Trafficking of Class 1s', 800, 0, 45),
(51, 'Possession of a Class 2 Firearm', 800, 0, 40),
(52, 'Possession of a Class 1 Firearm', 150, 0, 15),
(53, 'Brandishing a Firearm', 100, 0, 5),
(54, 'Unlawful discharge of a firearm', 150, 0, 10),
(55, 'Perjury', 1000, 0, 60),
(56, 'Arson', 500, 0, 30),
(57, 'False Impersonation of a Government Official', 200, 0, 25),
(58, 'Possession of Dirty Money', 200, 0, 25),
(59, 'Possession of Stolen Goods', 100, 0, 15),
(60, 'Unlawful Solicitation', 150, 0, 20),
(61, 'Larceny', 150, 0, 20),
(62, 'Felony Attempted Commision of an Offence/Crime', 350, 0, 20),
(63, 'Tampering With Evidence', 200, 0, 20),
(64, 'Illegal Gambling', 200, 0, 20),
(65, 'Bribery', 200, 0, 20),
(66, 'Stalking', 350, 0, 20),
(67, 'Organizing an illegal event', 150, 0, 15),
(68, 'Participating in an illegal event', 50, 0, 5),
(69, 'Criminal Mischief', 100, 0, 15),
(70, 'Prostitution', 250, 0, 15),
(71, 'Failure to Identify', 150, 0, 15),
(72, 'Obstruction of Justice', 150, 0, 15),
(73, 'Resisting Arrest', 100, 0, 10),
(74, 'Disturbing the Peace', 100, 0, 10),
(75, 'Threat to do Bodily Harm', 100, 0, 10),
(76, 'Terroristic Threat', 150, 0, 10),
(77, 'Damage to Government Property', 150, 0, 10),
(78, 'Contempt of Court', 250, 0, 10),
(79, 'Failure to Obey a Lawful Order', 150, 0, 10),
(80, 'False Report', 100, 0, 10),
(81, 'Trespassing', 100, 0, 10),
(82, 'Loitering', 100, 0, 0),
(83, 'Public Intoxication', 100, 0, 0),
(84, 'Indecent Exposure', 100, 0, 0),
(85, 'Verbal Harassment ', 100, 0, 0),
(86, 'Aiding and Abetting', 100, 0, 0),
(87, 'Incident Report', 0, 0, 0),
(88, 'Written Citation', 0, 0, 0),
(89, 'Verbal Warning', 0, 0, 0);
