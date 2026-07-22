-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2026 at 11:44 AM
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
-- Database: `db_marketplace`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `password`, `created_at`) VALUES
('ADM01', 'fina rachma wati', 'finarachmawati4@gmail.com', 'admin123', '2026-07-20 07:38:22'),
('ADM02', 'Staff Gudang', 'staff@marketplace.com', 'staff456', '2026-07-20 07:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(10) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `created_at`) VALUES
('KTG01', 'Elektronik', '2026-07-20 07:46:04'),
('KTG02', 'Fashion & Pakaian', '2026-07-20 07:47:27'),
('KTG03', 'Makanan & Minuman', '2026-07-20 07:48:17'),
('KTG04', 'Kesehatan & Rumah Tangga', '2026-07-20 07:49:10');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` varchar(10) NOT NULL,
  `id_produk` varchar(10) NOT NULL,
  `nama_pembeli` varchar(100) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` decimal(12,2) NOT NULL,
  `tanggal_pesanan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `id_produk`, `nama_pembeli`, `no_hp`, `jumlah`, `total_harga`, `tanggal_pesanan`) VALUES
('ORD0001', 'PRD002', 'Ahmad Fauzi', '081234567890', 2, 150000.00, '2026-07-20 08:06:44'),
('ORD0002', 'PRD001', 'Siti Aminah', '085711223344', 1, 150000.00, '2026-07-20 08:09:19'),
('ORD0003', 'PRD003', 'Budi Santoso', '089988776655', 4, 100000.00, '2026-07-20 08:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` varchar(10) NOT NULL,
  `id_kategori` varchar(10) NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` decimal(12,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `deskripsi`, `harga`, `stok`, `foto`, `created_at`) VALUES
('PRD001', 'KTG01', 'Headphone Bluetooth Bass', 'Headphone wireless dengan fitur noise cancelling dan baterai tahan lama', 150000.00, 15, 'headphone.jpg', '2026-07-20 07:52:50'),
('PRD002', 'KTG02', 'Kaos Polos Cotton Combed', 'Kaos polos premium bahan katun combed 30s, sangat adem dan nyaman', 75000.00, 40, 'kaos.jpg', '2026-07-20 07:57:04'),
('PRD003', 'KTG03', 'Kopi Susu Gula Aren', 'Kopi susu instan siap seduh dengan rasa gula aren yang pas. Isi 10 sachet', 25000.00, 85, 'kopi.jpg', '2026-07-20 08:00:11'),
('PRD004', 'KTG04', 'Mouse Gaming RGB', 'Mouse gaming kabel dengan sensitivitas tinggi hingga 7200 DPI dan lampu RGB', 120000.00, 20, 'mouse.jpg', '2026-07-20 08:02:39'),
('PRD005', 'KTG02', 'Jaket Hoodie Hitam', 'Hoodie dengan bahan fleece tebal yang cocok untuk udara dingin atau berkendara', 185000.00, 12, 'hoodie.jpg', '2026-07-20 08:04:32'),
('PRD006', 'KTG01', 'camera', 'camera simple cute', 1000000.00, 10, '1784538782_camera.jpg', '2026-07-20 09:13:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
