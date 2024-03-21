-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2024 at 08:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingblog-flask`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `date` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `phone_num` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `msg`, `date`, `phone_num`, `email`) VALUES
(1, 'first', 'msg test', 'current_timestamp()', '123456789', 'gmail@gmail.com'),
(2, 'test', 'hello this is testing', '2024-03-20 19:11:40.487451', '1232547', 'test@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(20) NOT NULL,
  `title` varchar(300) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `subhead` varchar(600) NOT NULL,
  `content` text NOT NULL,
  `date` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `subhead`, `content`, `date`, `img_file`) VALUES
(1, 'new Jatin', 'jatin', 'jatin', ' a passionate software developer with a knack for innovation and problem-solving. Holding a degree in Electronic and Communication Engineering, Jatin\'s journey into the realm of coding and programming began with a curiosity to explore the vast possibilities within the field. Armed with a ', '2024-03-21 20:19:39.098889', 'about-bg.jpg'),
(2, 'this is titie', 'second-post', 'Problems look mighty small from 150 miles up', 'Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman\'s earth, if free men make it, will be truly round: a globe in practice, not in theory.\n\nScience cuts two ways, of course; its products can be used for both good and evil. But there\'s no turning back from science. The early warnings about technological dangers also come from science.\n\nWhat was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth.\n\nA Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That\'s how I felt seeing the Earth for the first time. I could not help but love and cherish her.\n\nFor those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.\n\nThe Final Frontier\nThere can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.\n\nThere can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.\n\nThe dreams of yesterday are the hopes of today and the reality of tomorrow. Science has not yet mastered prophecy. We predict too much for the next year and yet far too little for the next ten.\n\nSpaceflights cannot be stopped. This is not the work of any one man or even a group of men. It is a historical process which mankind is carrying out in accordance with the natural laws of human development.\n\nReaching for the Stars\nAs we got further and further away, it [the Earth] diminished in size. Finally it shrank to the size of a marble, the most beautiful you can imagine. That beautiful, warm, living object looked so fragile, so delicate, that if you touched it with a finger it would crumble and fall apart. Seeing this has to change a man.\n\n[To go places and do things that have never been done before – that’s what living is all about.]\n\nSpace, the final frontier. These are the voyages of the Starship Enterprise. Its five-year mission: to explore strange new worlds, to seek out new life and new civilizations, to boldly go where no man has gone before.\n\nAs I stand out here in the wonders of the unknown at Hadley, I sort of realize there’s a fundamental truth to our nature, Man must explore, and this is exploration at its greatest.', 'current_timestamp()', 'home-bg.jpg'),
(3, 'python 111', 'python', 'all about python ', 'very goood language', '2024-03-21 18:57:40.684786', 'homebg.jpg'),
(4, 'Python 3.11.0', 'python-02', 'This is the stable release of Python 3.11.0\r\nPython 3.11.0 is the newest major release of the Python programming language, and it contains many new features and optimizations.', 'Major new features of the 3.11 series, compared to 3.10\r\nSome of the new major new features and changes in Python 3.11 are:\r\n\r\nGeneral changes\r\nPEP 657 -- Include Fine-Grained Error Locations in Tracebacks\r\nPEP 654 -- Exception Groups and except*\r\nPEP 680 -- tomllib: Support for Parsing TOML in the Standard Library\r\ngh-90908 -- Introduce task groups to asyncio\r\ngh-34627 -- Atomic grouping ((?>...)) and possessive quantifiers (*+, ++, ?+, {m,n}+) are now supported in regular expressions.\r\nThe Faster CPython Project is already yielding some exciting results. Python 3.11 is up to 10-60% faster than Python 3.10. On average, we measured a 1.22x speedup on the standard benchmark suite. See Faster CPython for details.\r\nTyping and typing language changes\r\nPEP 673 -- Self Type\r\nPEP 646 -- Variadic Generics\r\nPEP 675 -- Arbitrary Literal String Type\r\nPEP 655 -- Marking individual TypedDict items as required or potentially-missing\r\nPEP 681 -- Data Class Transforms\r\nMore resources\r\nOnline Documentation\r\nPEP 664, 3.11 Release Schedule\r\nReport bugs at https://github.com/python/cpython/issues.\r\nHelp fund Python and its community.\r\nAnd now for something completely different\r\nWhen a spherical non-rotating body of a critical radius collapses under its own gravitation under general relativity, theory suggests it will collapse to a single point. This is not the case with a rotating black hole (a Kerr black hole). With a fluid rotating body, its distribution of mass is not spherical (it shows an equatorial bulge), and it has angular momentum. Since a point cannot support rotation or angular momentum in classical physics (general relativity being a classical theory), the minimal shape of the singularity that can support these properties is instead a ring with zero thickness but non-zero radius, and this is referred to as a ringularity or Kerr singularity.\r\n\r\nThis kind of singularity has the following peculiar property. The spacetime allows a geodesic curve (describing the movement of observers and photons in spacetime) to pass through the center of this ring singularity. The region beyond permits closed time-like curves. Since the trajectory of observers and particles in general relativity are described by time-like curves, it is possible for observers in this region to return to their past. This interior solution is not likely to be physical and is considered a purely mathematical artefact.\r\n\r\nThere are some other interesting free-fall trajectories. For example, there is a point in the axis of symmetry that has the property that if an observer is below this point, the pull from the singularity will force the observer to pass through the middle of the ring singularity to the region with closed time-like curves and it will experience repulsive gravity that will push it back to the original region, but then it will experience the pull from the singularity again and will repeat this process forever. This is, of course, only if the extreme gravity doesn’t destroy the observer first.', '2024-03-21', 'pthon_3.11.png'),
(8, 'adding a new ', 'adding-a-new-allug', 'subheading time is 21', 'lorem22', '2024-03-21 23:45:58.917809', 'home-bg.jpg'),
(9, 'test', 'test', 'test', 'est', '2024-03-22 00:36:53.512232', 'about-bg.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
