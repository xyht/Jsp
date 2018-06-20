-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-06-20 13:36:31
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jsp`
--

-- --------------------------------------------------------

--
-- 表的结构 `emp`
--

CREATE TABLE `emp` (
  `job` varchar(20) NOT NULL,
  `ename` varchar(20) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `emp`
--

INSERT INTO `emp` (`job`, `ename`, `id`) VALUES
('奇偶比1', 'asd', 1);

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `data_day` varchar(10) NOT NULL,
  `data_hour` varchar(10) NOT NULL,
  `data_week` varchar(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `data` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`id`, `data_day`, `data_hour`, `data_week`, `title`, `data`) VALUES
(1, '01', '02', 'Feb', '【六一】大师兄的周末公益行：他们真的可...', '同样也在做着这些看起来很微小却能温暖且感动全世界的事 情；大BOSS孙雷曾在内部会议时对玖富人说，玖富做公益......'),
(2, '02', '03', 'Feb', '【六一】大师兄的周末公益行：他们真的可.....', '同样也在做着这些看起来很微小却能温暖且感动全世界的事 情；大BOSS孙雷曾在内部会议时对玖富人说，玖富做公益......'),
(3, '24', '04', 'Feb', '【六一】大师兄的周末公益行：他们真的可......', '同样也在做着这些看起来很微小却能温暖且感动全世界的事 情；大BOSS孙雷曾在内部会议时对玖富人说，玖富做公益......'),
(4, '24', '06', 'Feb', '【六一】大师兄的周末公益行：他们真的可......', '同样也在做着这些看起来很微小却能温暖且感动全世界的事 情；大BOSS孙雷曾在内部会议时对玖富人说，玖富做公益......'),
(5, '25', '06', 'Feb', '【六一】大师兄的周末公益行：他们真的可.....', '同样也在做着这些看起来很微小却能温暖且感动全世界的事 情；大BOSS孙雷曾在内部会议时对玖富人说，玖富做公益......'),
(6, '17', '07', 'Feb', '【六一】大师兄的周末公益行：他们真的可.....', '同样也在做着这些看起来很微小却能温暖且感动全世界的事 情；大BOSS孙雷曾在内部会议时对玖富人说，玖富做公益......');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `pass`, `email`) VALUES
(10000000, '1127310216', 'a2973703020', '2973703020@qq.com'),
(10000001, '2849183023', 'a2973703020', '2973703020@qq.com'),
(10000002, '1127310216', 'a2973703020', '2973703020@qq.com'),
(10000003, '54200679', 'a', '2973703020@qq.com'),
(10000004, '456123789', '213546987', '@1127310216@qq.com'),
(10000005, '11273645', '365423486', 'email'),
(10000006, '11273645', '365423486', 'email'),
(10000007, '11273645', '365423486', 'email'),
(10000008, '1123123123', '123', '123456@qq.com'),
(10000009, '18135434588', 'printf', 'qwer@qq.com'),
(10000010, '18750977213', '123', 'qwer@qq.com'),
(10000011, '18650977213', '1127310216', 'qwer@qq.com'),
(10000012, 'å¾é¦æµ©', '127310216', '2@qq.com'),
(10000013, 'å¾é¦æµ©', '11', '2@qq.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `emp`
--
ALTER TABLE `emp`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000014;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
