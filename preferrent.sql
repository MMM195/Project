-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2026 at 10:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `preferrent`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `rooms_count` int(11) NOT NULL DEFAULT 1,
  `adults` int(11) NOT NULL DEFAULT 1,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `room_id`, `check_in`, `check_out`, `rooms_count`, `adults`, `total_price`, `status`, `created_at`) VALUES
(1, 1, 10, '2026-08-02', '2026-08-03', 1, 3, 2700.00, 'confirmed', '2026-08-02 14:02:08');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `content`, `created_at`) VALUES
(1, 1, 'อย่ามาครับจะเก็บไว้พักคนเดียว', '2026-08-02 14:03:24');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `number` varchar(20) NOT NULL,
  `category` varchar(50) NOT NULL,
  `category_label` varchar(120) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `capacity` int(11) NOT NULL DEFAULT 2,
  `beds` tinyint(4) NOT NULL DEFAULT 1,
  `quantity` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `scene_class` varchar(50) DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `number`, `category`, `category_label`, `price`, `capacity`, `beds`, `quantity`, `description`, `image`, `scene_class`, `available`) VALUES
(1, 'ห้องเตียงคู่ วิวเมือง', '101', 'วิวเมือง', 'เตียงคู่ (ควีน) · วิวเมือง', 1800.00, 4, 2, NULL, 'ห้องเตียงควีนไซส์ 2 เตียง 24ตร.ม.\r\nมองเห็นวิวเส้นขอบฟ้าเมือง เหมาะสำหรับเพื่อนหรือครอบครัว', 'images/twin-city.png', 'scene-city', 1),
(2, 'ห้องเตียงคู่ วิวเมือง', '102', 'วิวเมือง', 'เตียงคู่ (ควีน) · วิวเมือง', 1800.00, 4, 2, NULL, 'ห้องเตียงควีนไซส์ 2 เตียง 24ตร.ม.\r\nมองเห็นวิวเส้นขอบฟ้าเมือง เหมาะสำหรับเพื่อนหรือครอบครัว', 'images/twin-city.png', 'scene-city', 1),
(3, 'ห้องเตียงคู่ วิวเมือง', '103', 'วิวเมือง', 'เตียงคู่ (ควีน) · วิวเมือง', 1800.00, 4, 2, NULL, 'ห้องเตียงควีนไซส์ 2 เตียง 24ตร.ม.\r\nมองเห็นวิวเส้นขอบฟ้าเมือง เหมาะสำหรับเพื่อนหรือครอบครัว', 'images/twin-city.png', 'scene-city', 1),
(4, 'ห้องเตียงเดี่ยว วิวเมือง', '104', 'วิวเมือง', 'เตียงเดี่ยว (คิง) · วิวเมือง', 2000.00, 3, 1, NULL, 'ห้องเตียงคิงไซส์ 1 เตียง มองเห็นวิวเมืองยามค่ำคืน บรรยากาศเงียบสงบส่วนตัว', 'images/king-city.png', 'scene-city', 1),
(5, 'ห้องเตียงเดี่ยว วิวเมือง', '105', 'วิวเมือง', 'เตียงเดี่ยว (คิง) · วิวเมือง', 2000.00, 3, 1, NULL, 'ห้องเตียงคิงไซส์ 1 เตียง มองเห็นวิวเมืองยามค่ำคืน บรรยากาศเงียบสงบส่วนตัว', 'images/king-city.png', 'scene-city', 1),
(6, 'ห้องเตียงเดี่ยว วิวเมือง', '106', 'วิวเมือง', 'เตียงเดี่ยว (คิง) · วิวเมือง', 2000.00, 3, 1, NULL, 'ห้องเตียงคิงไซส์ 1 เตียง มองเห็นวิวเมืองยามค่ำคืน บรรยากาศเงียบสงบส่วนตัว', 'images/king-city.png', 'scene-city', 1),
(7, 'ห้องเตียงคู่ ริมแม่น้ำ', '201', 'ริมแม่น้ำ', 'เตียงคู่ (ควีน) · ริมแม่น้ำ', 2400.00, 4, 2, NULL, 'ห้องเตียงควีนไซส์ 2 เตียง พร้อมระเบียงส่วนตัวริมแม่น้ำเจ้าพระยา', 'images/twin-river.png', 'scene-river', 1),
(8, 'ห้องเตียงคู่ ริมแม่น้ำ', '202', 'ริมแม่น้ำ', 'เตียงคู่ (ควีน) · ริมแม่น้ำ', 2400.00, 4, 2, NULL, 'ห้องเตียงควีนไซส์ 2 เตียง พร้อมระเบียงส่วนตัวริมแม่น้ำเจ้าพระยา', 'images/twin-river.png', 'scene-river', 1),
(9, 'ห้องเตียงคู่ ริมแม่น้ำ', '203', 'ริมแม่น้ำ', 'เตียงคู่ (ควีน) · ริมแม่น้ำ', 2400.00, 4, 2, NULL, 'ห้องเตียงควีนไซส์ 2 เตียง พร้อมระเบียงส่วนตัวริมแม่น้ำเจ้าพระยา', 'images/twin-river.png', 'scene-river', 1),
(10, 'ห้องเตียงเดี่ยว ริมแม่น้ำ', '204', 'ริมแม่น้ำ', 'เตียงเดี่ยว (คิง) · ริมแม่น้ำ', 2700.00, 3, 1, NULL, 'ห้องเตียงคิงไซส์ 1 เตียง พร้อมระเบียงส่วนตัวชมพระอาทิตย์ตกริมแม่น้ำเจ้าพระยา', 'images/king-river.png', 'scene-river', 1),
(11, 'ห้องเตียงเดี่ยว ริมแม่น้ำ', '205', 'ริมแม่น้ำ', 'เตียงเดี่ยว (คิง) · ริมแม่น้ำ', 2700.00, 3, 1, NULL, 'ห้องเตียงคิงไซส์ 1 เตียง พร้อมระเบียงส่วนตัวชมพระอาทิตย์ตกริมแม่น้ำเจ้าพระยา', 'images/king-river.png', 'scene-river', 1),
(12, 'ห้องเตียงเดี่ยว ริมแม่น้ำ', '206', 'ริมแม่น้ำ', 'เตียงเดี่ยว (คิง) · ริมแม่น้ำ', 2700.00, 3, 1, NULL, 'ห้องเตียงคิงไซส์ 1 เตียง พร้อมระเบียงส่วนตัวชมพระอาทิตย์ตกริมแม่น้ำเจ้าพระยา', 'images/king-river.png', 'scene-river', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `email` varchar(190) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `is_admin`, `password_hash`, `created_at`) VALUES
(1, 'วอดส์', 'test01@gmail.com', 0, '$2y$10$DEkTOaCriOYcPsWDevgbjuqlrnNyx90ktyAhY2FIIQjxRjEciqegi', '2026-08-02 14:00:54'),
(2, 'Administator', 'admin@preferrent.com', 1, '$2y$10$OCYEpxPccimiXNzWoIdHG.gLKXInNtLqvXjJX8PRBCXdvhX2z3JIW', '2026-08-02 14:33:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
