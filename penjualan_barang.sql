-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Nov 2023 pada 10.52
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kode_brg` varchar(50) NOT NULL,
  `nama_brg` varchar(50) DEFAULT NULL,
  `harga` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` varchar(50) NOT NULL,
  `nama_customer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_penjualan_barang`
--

CREATE TABLE `detail_penjualan_barang` (
  `no_jual` varchar(50) NOT NULL,
  `kode_brg` varchar(50) DEFAULT NULL,
  `qty_penjualan` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_barang`
--

CREATE TABLE `penjualan_barang` (
  `no_jual` varchar(50) NOT NULL,
  `tgl_jual` date NOT NULL,
  `id_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_brg`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `detail_penjualan_barang`
--
ALTER TABLE `detail_penjualan_barang`
  ADD PRIMARY KEY (`no_jual`),
  ADD UNIQUE KEY `kode_brg` (`kode_brg`);

--
-- Indeks untuk tabel `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD PRIMARY KEY (`no_jual`),
  ADD UNIQUE KEY `id_customer` (`id_customer`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_penjualan_barang`
--
ALTER TABLE `detail_penjualan_barang`
  ADD CONSTRAINT `detail_penjualan_barang_ibfk_1` FOREIGN KEY (`no_jual`) REFERENCES `penjualan_barang` (`no_jual`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_penjualan_barang_ibfk_2` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD CONSTRAINT `penjualan_barang_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
