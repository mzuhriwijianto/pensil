-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Sep 2022 pada 11.33
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_apms`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_bidang`
--

CREATE TABLE `t_apms_bidang` (
  `id_bidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `nm_bidang` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_bidang`
--

INSERT INTO `t_apms_bidang` (`id_bidang`, `nm_bidang`) VALUES
('1', 'bidang aset'),
('2', 'bidang anggaran'),
('3', 'bidang akuntansi'),
('4', 'bidang perbendaharaan'),
('5', 'kesekretariatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_dispo_a`
--

CREATE TABLE `t_apms_dispo_a` (
  `id_dispoa` varchar(6) COLLATE utf8_bin NOT NULL,
  `id_project` varchar(4) COLLATE utf8_bin NOT NULL,
  `id_bidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_subbidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `no_surat` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_respon` int(1) NOT NULL,
  `notice` text COLLATE utf8_bin NOT NULL,
  `lampiran` text COLLATE utf8_bin NOT NULL,
  `tgl_kirim` datetime DEFAULT NULL,
  `userid` varchar(25) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_dispo_a`
--

INSERT INTO `t_apms_dispo_a` (`id_dispoa`, `id_project`, `id_bidang`, `id_subbidang`, `no_surat`, `id_respon`, `notice`, `lampiran`, `tgl_kirim`, `userid`) VALUES
('000001', '0007', '1', '2', '0', 0, 'dispo UDK<br />\r\nkoord dengan kelurahan jetak, pelajari ', '', '2022-08-02 05:04:27', 'kabid.aset'),
('000001', '0127', '1', '3', '005_1149_412.217_2022', 0, 'Persiapan Lelang Kayu Tebangan 2022, koord dengan DLH utk bahan penilaian BMD', '', '2022-09-22 09:20:14', 'kabid.aset'),
('000001', '0001', '1', '1', '005_2067_412.302_2022', 0, 'Tindak lanjuti', '', '2022-07-21 03:11:01', 'kabid.aset'),
('000001', '0003', '1', '1', '005_2239_412.203_2022', 0, 'saya hadiri', '', '2022-07-25 05:48:37', 'kabid.aset'),
('000001', '0004', '1', '1', '005_23169_Keuda', 0, 'ikuti, laporkan hasilnya / buat nota dinas ke Sekda', '', '2022-07-25 05:50:12', 'kabid.aset'),
('000001', '0017', '1', '3', '005_2422_412.219_2022', 0, 'udk, saya hadir', '', '2022-08-10 07:09:36', 'kabid.aset'),
('000001', '0037', '1', '2', '005_25012_Keuda', 0, 'hadir bersama', '', '2022-08-15 04:58:40', 'kabid.aset'),
('000001', '0109', '1', '1', '005_804_412.208_2022', 0, 'tolong dispo ke Gilang, utk disampaikan pada ybs, Gilang, Robet, Elvina, utk menemui saya bersama-sama', '', '2022-09-11 07:51:20', 'kabid.aset'),
('000001', '0033', '1', '2', '005_970_412.217_2022', 0, 'tolong saya diingatkan utk hadir', '', '2022-08-11 07:14:21', 'kabid.aset'),
('000001', '0105', '1', '1', '0255_EMCL-CPO_2022', 0, 'saya hadir bersama sdr. Haditya, tolong disiapkan ST dan SPPD. Buat draft laporan Perjadin.', '', '2022-09-11 08:01:03', 'kabid.aset'),
('000001', '0070', '1', '2', '0263_EMCL-CPO_2022', 0, 'UDK, Arsip', '', '2022-08-31 07:51:50', 'kabid.aset'),
('000001', '0005', '1', '1', '027_962_412.031_2022', 0, 'Buat BA Penelitian Tim<br />\r\nKoordinasikan dengan bag Hukum', '', '2022-07-25 05:52:40', 'kabid.aset'),
('000001', '0057', '1', '1', '028_1889_412.050_2022', 0, 'fasilitasi', '', '2022-08-26 05:51:56', 'kabid.aset'),
('000001', '0032', '1', '2', '028_2469_412.203_2022', 0, 'Cek, proses segera', '', '2022-08-11 07:14:52', 'kabid.aset'),
('000001', '0036', '1', '2', '028_2554_412.203_2022', 0, 'cek, proses segera', '', '2022-08-15 04:59:34', 'kabid.aset'),
('000001', '0035', '1', '2', '028_2559_412.203_2022', 0, 'cek, proses segera', '', '2022-08-12 05:59:16', 'kabid.aset'),
('000001', '0039', '1', '2', '028_2569_412.203_2022', 0, 'proses segera', '', '2022-08-15 04:43:50', 'kabid.aset'),
('000001', '0054', '1', '2', '028_2651_412.203_2022', 0, 'cek, proses segera', '', '2022-08-26 05:54:48', 'kabid.aset'),
('000001', '0051', '1', '2', '028_2677_412.203_2022', 0, 'Cek, proses segera', '', '2022-08-26 05:58:18', 'kabid.aset'),
('000001', '0075', '1', '2', '028_2818_412.203_2022', 0, 'cek, proses segera', '', '2022-09-02 11:45:43', 'kabid.aset'),
('000001', '0114', '1', '1', '032_1094_412.218_2022', 0, 'Bahan TL MCP KPK dan BPK, arsip dengan baik', '', '2022-09-13 06:58:00', 'kabid.aset'),
('000001', '0117', '1', '1', '032_1094__412.218_2022', 0, 'Pantau, utk bahan MCP KPK dan Audit BPK ', '', '2022-09-14 10:38:18', 'kabid.aset'),
('000001', '0079', '1', '1', '032_1245_412.212_2022', 0, 'lakukan telaah RKBMD, laporkan hasilnya', '', '2022-09-02 11:42:48', 'kabid.aset'),
('000001', '0024', '1', '2', '032_1299_412.303_2022', 0, 'Cek, laksanakan', '', '2022-08-10 06:57:12', 'kabid.aset'),
('000001', '0021', '1', '3', '032_1309_412.303_2022', 0, 'Buat surat kepada Dinas Pendidikan, sampaikan apa saja yg harus dicukupi sebagai bahan penelitian oleh Tim Peneliti Kabupaten', '', '2022-08-10 07:01:58', 'kabid.aset'),
('000001', '0046', '1', '2', '032_1411_412.303_2022', 0, 'Laksanakan ', '', '2022-08-24 03:32:37', 'kabid.aset'),
('000001', '0088', '1', '1', '032_1663_412.206_2022', 0, 'lakukan telaah RKBMD', '', '2022-09-02 11:40:06', 'kabid.aset'),
('000001', '0101', '1', '1', '032_1680_412.206_2022', 0, 'bahan MCP KPK, Laporkan', '', '2022-09-06 03:31:34', 'kabid.aset'),
('000001', '0119', '1', '1', '032_1743_412.206_2022', 0, 'lakukan telaah RKBMD, laporkan', '', '2022-09-20 11:40:48', 'kabid.aset'),
('000001', '0077', '1', '1', '032_1827_412.213_2022', 0, 'cek, proses', '', '2022-09-02 11:43:47', 'kabid.aset'),
('000001', '0076', '1', '1', '032_1833_412.213_2022', 0, 'cek, proses', '', '2022-09-02 11:44:09', 'kabid.aset'),
('000001', '0099', '1', '1', '032_1855_412.213_2022', 0, 'cek, proses segera', '', '2022-09-06 03:32:46', 'kabid.aset'),
('000001', '0064', '1', '2', '032_1968_412.201_2022', 0, 'cek, proses segera', '', '2022-08-30 08:10:02', 'kabid.aset'),
('000001', '0103', '1', '1', '032_382_412.011_2022', 0, 'Cek, proses', '', '2022-09-07 05:58:34', 'kabid.aset'),
('000001', '0097', '1', '1', '032_4174.A_412.202.38_2022', 0, 'lakukan telaah RKBMD, agenda kan desk RKBMD utk semua OPD', '', '2022-09-06 03:34:22', 'kabid.aset'),
('000001', '0123', '1', '1', '032_455_412.424_2022', 0, 'cek, laporkan', '', '2022-09-19 02:34:45', 'kabid.aset'),
('000001', '0110', '1', '1', '032_516_412.421_2022', 0, 'cek, lakukan telaah RKBMD', '', '2022-09-12 03:28:19', 'kabid.aset'),
('000001', '0122', '1', '1', '032_520_412.415_2022', 0, 'lakukan telaah RKBMD, laporkan', '', '2022-09-20 11:39:01', 'kabid.aset'),
('000001', '0082', '1', '1', '032_565_412.422_2022', 0, 'lakukan telaah, laporkan', '', '2022-09-02 11:41:12', 'kabid.aset'),
('000001', '0058', '1', '1', '032_601_412.216_2022', 0, 'temuai saya, lakuka telaah RKBMD, arsip utk dokumen penys RKBMD Kab', '', '2022-08-26 05:51:31', 'kabid.aset'),
('000001', '0041', '1', '3', '032_813_412.224_2022', 0, 'Tunggu Dispo, fasilitasi', '', '2022-08-18 12:14:35', 'kabid.aset'),
('000001', '0118', '1', '1', '035_824_412.408_2022', 0, 'lakukan telaah RKBMD, laporkan', '', '2022-09-20 11:41:08', 'kabid.aset'),
('000001', '0031', '1', '3', '050_1030_412.050_2022', 0, 'agendakan rapat tim peneliti kab, und Dinas CK, proses BA dan usulan persetujuan pembongkaran', '', '2022-08-11 10:37:50', 'kabid.aset'),
('000001', '0090', '1', '1', '050_1059_412.217_2022', 0, 'cek, proses', '', '2022-09-02 11:39:11', 'kabid.aset'),
('000001', '0025', '1', '3', '050_1830_412.050_2022', 0, 'tunggu dispo Bupati, cek pantau ', '', '2022-08-10 06:55:47', 'kabid.aset'),
('000001', '0074', '1', '1', '050_2855_412.203_2022', 0, 'cek, proses', '', '2022-09-02 11:44:28', 'kabid.aset'),
('000001', '0073', '1', '1', '050_545_412.204_2022', 0, 'cek, koord dengan bagian pembangunan, jika dibutuhkan, proses', '', '2022-09-02 11:45:16', 'kabid.aset'),
('000001', '0016', '1', '1', '050_654_412.208_2022', 0, 'cek, fasilitasi, jika belum tercantum dalam SSH agar diusulkan kepada Bupati', '', '2022-08-10 07:11:45', 'kabid.aset'),
('000001', '0130', '1', '2', '061_936_BJ_UM_SRT', 0, 'tunggu dispo, cek aset tercatat di OPD mana', '', '2022-09-21 02:24:03', 'kabid.aset'),
('000001', '0012', '1', '1', '090_1568_412.207_2022', 0, 'cek apakah sdh ada dalam SK<br />\r\nproses sesuai ketentuan', '', '2022-08-02 05:02:15', 'kabid.aset'),
('000001', '0022', '1', '1', '188_1170_412.031_2022', 0, 'agendakan rapat tim peneliti kabupaten, cukupi BA Penelitian BMD', '', '2022-08-10 07:00:07', 'kabid.aset'),
('000001', '0009', '1', '1', '188_1606_412.013_2022', 0, 'Cek, Koord dengan OPD ybs dan Bidang Akuntasi utk TL koreksi aset Jl. Suharso.', '', '2022-07-29 06:18:47', 'kabid.aset'),
('000001', '0028', '1', '3', '400_4468_412.202_2022', 0, 'tunggu dispo bupati, koord dengan ybs', '', '2022-08-10 06:50:16', 'kabid.aset'),
('000001', '0069', '1', '1', '420_1980_412.201_2022', 0, 'fasilitasi', '', '2022-08-31 07:52:34', 'kabid.aset'),
('000001', '0093', '1', '1', '420_2044_412.201_2022', 0, 'bahan rekon, pastikan setelah dilaksanakan hibah dicatat sesuai dengan ketentuan', '', '2022-09-02 11:48:24', 'kabid.aset'),
('000001', '0096', '1', '1', '420_2054_412.201_2022', 0, 'UDK, sesuai petunjuk Kaban, yg hadir kabid Akuntansi', '', '2022-09-06 03:35:12', 'kabid.aset'),
('000001', '0108', '1', '1', '428_470_412.214_2022', 0, 'cek, apakah bisa masuk HSPK, seingat saya ada di perpres 33 standar pemeliharaan bangunan, cek apakah sdh ada di SBU atau standar lainnya', '', '2022-09-11 07:54:32', 'kabid.aset'),
('000001', '0042', '1', '1', '440_4588_412.202_2022', 0, 'Cukupi, buat surat ke Dinkes, usulkan nama saya', '', '2022-08-18 12:14:00', 'kabid.aset'),
('000001', '0056', '1', '1', '440_4675A_412.202_2022', 0, 'fasilitasi', '', '2022-08-26 05:52:30', 'kabid.aset'),
('000001', '0098', '1', '1', '440_4879A_412.202_2022', 0, 'cek, proses segera, jika ada yg kurang jelas, panggil ybs', '', '2022-09-06 03:33:41', 'kabid.aset'),
('000001', '0112', '1', '3', '440_5007_412.202_2022', 0, 'Buat nota dinas ke Sekda, kewenangan pemberian persetujuan pemusnahan berada pada Bupati pasal 422 ayat (1) permendagri 19/2016', '', '2022-09-12 09:26:39', 'kabid.aset'),
('000001', '0055', '1', '2', '510_1560_412.220_2022', 0, 'Koord dengan Dinas Perdagangan terkait berkas syarat kelengkapan penilaian', '', '2022-08-26 05:54:12', 'kabid.aset'),
('000001', '0052', '1', '1', '510_1563_412.220_2022', 0, 'Pantau, dorong supaya terbit surat pernyataan menerima pengalihan status penggunaan barang', '', '2022-08-26 05:57:50', 'kabid.aset'),
('000001', '0078', '1', '1', '520_1980_412.221_2022', 0, 'cek, proses', '', '2022-09-02 11:43:19', 'kabid.aset'),
('000001', '0115', '1', '3', '520_2209_412.221_2022', 0, 'proses segera ajuan SK Penghapusan ke Pengelola Barang', '', '2022-09-14 10:39:30', 'kabid.aset'),
('000001', '0084', '1', '1', '524_862_412.222_2022', 0, 'cek, proses', '', '2022-09-02 11:38:50', 'kabid.aset'),
('000001', '0080', '1', '1', '524__412.222_2022', 0, 'cek, proses', '', '2022-09-02 11:42:08', 'kabid.aset'),
('000001', '0049', '1', '1', '530_846_412.218_2022', 0, 'copy utk kasubid, subkoord, dan bendahara pembantu sebagai informasi', '', '2022-08-24 03:21:34', 'kabid.aset'),
('000001', '0065', '1', '1', '550_1238_412.212_2022', 0, 'fasilitasi, jika ada kesulitan/tidak dimengerti panggil ybs', '', '2022-08-30 08:09:15', 'kabid.aset'),
('000001', '0019', '1', '1', '551_1092_412.212_2022', 0, 'fasilitasi, koordinasikan dengan ybs, cek apakah harus dicantumkan dalam SK Perubahan SSH/HSPK', '', '2022-08-10 07:06:45', 'kabid.aset'),
('000001', '0008', '1', '3', '640_1002_412.205_2022', 0, 'Pantau dan lakukan koord jika diperlukan', '', '2022-07-29 06:21:07', 'kabid.aset'),
('000001', '0013', '1', '3', '640_1011_412.205_2022', 0, 'Pantau, Koord Dgn OPD Dan CK Terkait Sop Pembongkaran ', '', '2022-08-03 04:00:51', 'kabid.aset'),
('000001', '0014', '1', '3', '640_1012_412.205_2022', 0, 'Pantau, Koord Dgn OPD Dan CK Terkait Sop Pembongkaran ', '', '2022-08-03 03:58:06', 'kabid.aset'),
('000001', '0015', '1', '3', '640_1013_412.205_2022', 0, 'Pantau, koord dgn OPD dan CK terkait sop pembongkaran ', '', '2022-08-03 03:57:13', 'kabid.aset'),
('000001', '0062', '1', '3', '640_1024_412.205_2055', 0, 'sudah ada KT dari Bag Hukum tgl 8-8-2022, pelajari', '', '2022-08-26 03:45:40', 'kabid.aset'),
('000001', '0038', '1', '3', '640_1078_412.205_2022', 0, 'agendakan rapat segera', '', '2022-08-15 04:53:53', 'kabid.aset'),
('000001', '0053', '1', '2', '640_1126_412.205_2022', 0, 'Proses pengukuran kembali, koord dengan BPN, CK dan Desa Banjarsari', '', '2022-08-26 05:56:15', 'kabid.aset'),
('000001', '0116', '1', '3', '640_1216_412.205_2022', 0, 'pantau, koord dengan kec Temayang, laporkan', '', '2022-09-14 10:36:42', 'kabid.aset'),
('000001', '0002', '1', '2', '650_2199_412.203_2022', 0, 'cek, proses, koord dengan PTU', '', '2022-07-25 05:22:11', 'kabid.aset'),
('000001', '0023', '1', '2', '650_2370_412.203_2022', 0, 'cek, proses', '', '2022-08-10 06:58:05', 'kabid.aset'),
('000001', '0029', '1', '2', '650_2432_412.203_2022', 0, 'cek, proses', '', '2022-08-10 06:49:26', 'kabid.aset'),
('000001', '0027', '1', '2', '650_2456_412.203_2022', 0, 'cek, proses<br />\r\n', '', '2022-08-10 06:51:08', 'kabid.aset'),
('000001', '0094', '1', '2', '650_2870_412.203_2022', 0, 'cek, proses', '', '2022-09-07 06:01:38', 'kabid.aset'),
('000001', '0066', '1', '3', '660_1051_412.217_2022', 0, 'TL dispo, agendakan rapat dengan DLH terkait mekanisme lelang selanjutnya', '', '2022-08-30 08:08:37', 'kabid.aset'),
('000001', '0020', '1', '2', '660_916_412.217_2022', 0, 'cukupi, kirim dengan surat pengantar', '', '2022-08-10 07:04:23', 'kabid.aset'),
('000001', '0071', '1', '3', '700_1249_412.100_2022', 0, 'fasilitasi', '', '2022-08-31 07:50:45', 'kabid.aset'),
('000001', '0106', '1', '3', '700_1302_412.100_2022', 0, 'Pedomani, lanjutkan proses penjualan kendaraan dinas secara lelang', '', '2022-09-11 08:12:59', 'kabid.aset'),
('000001', '0121', '1', '2', '700_1382_412.100_2022', 0, 'udk, sdh saya hadiri', '', '2022-09-20 11:40:05', 'kabid.aset'),
('000001', '0100', '1', '1', '791_2755_412.219_2022', 0, 'cek, proses segera, jika ada yg tidak jelas, panggil ybs', '', '2022-09-06 03:32:21', 'kabid.aset'),
('000001', '0059', '1', '1', '800_1781_412.213_2022', 0, 'tunggu dispo, koord dengan bag umum', '', '2022-08-26 05:48:45', 'kabid.aset'),
('000001', '0040', '1', '3', '800_2963_412.202.39_2022', 0, 'tunggu dispo Bupati, fasilitasi<br />\r\n', '', '2022-08-15 04:53:04', 'kabid.aset'),
('000001', '0063', '1', '3', '800_3125_412.202.39_2022', 0, 'Tunggu dispo, lakukan penelitian awal, agendakan rapat penelitian tim kabupaten', '', '2022-08-26 03:44:01', 'kabid.aset'),
('000001', '0129', '1', '1', '800_527_412.420_2022', 0, 'lakukan telaah RKBMD, laporkan', '', '2022-09-21 02:24:32', 'kabid.aset'),
('000001', '0060', '1', '3', '800_834_412.222_2022', 0, 'buat surat ke opd ybs utk mengajukan usulan penghapusan karena sebab lain', '', '2022-08-26 05:47:37', 'kabid.aset'),
('000001', '0030', '1', '3', '840_1057__412.205_2022', 0, 'agendakan rapat segera, undang Dinas CK dan OPD terkait , sosialisasi sop pengiriman material sisa bongkaran', '', '2022-08-10 06:47:49', 'kabid.aset'),
('000001', '0010', '1', '3', '893_23182_Keuda', 0, 'cukupi, kirimkan data sdr. Thohier Raspiado.', '', '2022-07-29 06:15:42', 'kabid.aset'),
('000001', '0087', '1', '1', '900_1156_412.205_2022', 0, 'cek, proses', '', '2022-09-02 11:41:46', 'kabid.aset'),
('000001', '0048', '1', '1', '900_1186_412.212_2022', 0, 'Tunggu Dispo, cek, fasilitasi', '', '2022-08-24 03:31:18', 'kabid.aset'),
('000001', '0102', '1', '1', '900_1589_412.202.40_2022', 0, 'cek, proses', '', '2022-09-07 05:59:23', 'kabid.aset'),
('000001', '0111', '1', '1', '900_1671_412.404_2022', 0, 'cek, proses segera', '', '2022-09-12 03:27:55', 'kabid.aset'),
('000001', '0061', '1', '3', '900_412.408_2022', 0, 'Cek, permohonan surat persetujuan bupati tentang pembongkaran Polindes Karangan apakah sdh turun? <br />\r\ntunggu dispo, fasilitasi', '', '2022-08-26 03:48:03', 'kabid.aset'),
('000001', '0104', '1', '3', '900_4898_412..202_2022', 0, 'agendakan rapat penelitian tim kab, buat nota dinas usulan persetujuan Bupati', '', '2022-09-07 05:57:39', 'kabid.aset'),
('000001', '0091', '1', '3', '900_4898_412.202_2022', 0, 'tunggu dispo, agendalan penelitian tim kabupaten<br />\r\n<br />\r\n', '', '2022-09-02 11:27:28', 'kabid.aset'),
('000001', '0089', '1', '1', '900_546_412.210_2022', 0, 'cek, proses', '', '2022-09-02 11:39:30', 'kabid.aset'),
('000001', '0083', '1', '1', '900_597_412.210_2022', 0, 'cek, proses', '', '2022-09-02 11:40:28', 'kabid.aset'),
('000001', '0026', '1', '1', '906_2420_412.209_2022', 0, 'TL dispo, koord dengan Bag Pembangunan', '', '2022-08-10 06:53:23', 'kabid.aset'),
('000001', '0047', '1', '2', '970_1798_412.304_2022', 0, 'UDK', '', '2022-08-24 03:31:53', 'kabid.aset'),
('000001', '0072', '1', '1', '970_1964_412.304_2022', 0, 'cek, fasilitasi segera', '', '2022-08-31 07:51:16', 'kabid.aset'),
('000001', '0086', '1', '2', 'B_1159_VIII_2022', 0, 'tunggu dispo Bupati', '', '2022-09-02 11:30:04', 'kabid.aset'),
('000001', '0085', '1', '3', 'B_1161_VIII_2022', 0, 'cukupi, cek apakah sdh terbit SK penghapusannya, jika belum koord agar terbit SK penghapusan', '', '2022-09-02 11:35:25', 'kabid.aset'),
('000001', '0081', '1', '2', 'HP.02.01_1713.35.22_VII_2022', 0, 'cukupi, lakukan koord dgn BPN', '', '2022-09-02 11:38:13', 'kabid.aset'),
('000001', '0107', '1', '2', 'IP.02.01_1791.31.22_IX_2022', 0, 'Cek apakah kesalahan ada pada BPN atau Pemohon, koord utk mencari solusi selain pencabutan/solusi akhir. Temui saya dengan mas Ari', '', '2022-09-11 07:59:14', 'kabid.aset'),
('000001', '0011', '1', '2', 'NT.01.02_1502-35.22_VII_2022', 0, 'hadir bersama', '', '2022-08-02 05:02:47', 'kabid.aset'),
('000001', '0045', '1', '3', 'S-1034_KNL.1006_2022', 0, 'TL Dispo, arsip dalam bendel Lelang Limbah Kayu', '', '2022-08-24 04:13:00', 'kabid.aset'),
('000001', '0092', '1', '3', 'S-1170_KNL.1006_2022', 0, 'cek, tindaklanjuti, laporkan berkala', '', '2022-09-02 11:22:18', 'kabid.aset'),
('000001', '0120', '1', '3', 'S-1268_KNL.1006_2022', 0, 'Cukupi segera', '', '2022-09-20 11:40:22', 'kabid.aset'),
('000001', '0006', '1', '3', 'S-918_KNL.1006_2022', 0, 'Cek, TL sesuai ketentuan', '', '2022-07-28 01:31:44', 'kabid.aset'),
('000001', '0050', '1', '1', 'UM.0102-CA_419', 0, 'Kasubid PTU, hadiri', '', '2022-08-24 03:19:36', 'kabid.aset'),
('000001', '0095', '1', '1', 'UM0102_BB8_1444', 0, 'hadiri, ajak staf, laporkan', '', '2022-09-07 06:00:47', 'kabid.aset'),
('000001', '0131', '1', '1', 'UND-2_WKN.10_WKN.102_22', 0, 'siapkan perangkat, ikuti bersama-sama', '', '2022-09-21 02:23:19', 'kabid.aset'),
('000001', '0113', '1', '2', 'UND-93_WKN.10_2022', 0, 'tunjuk staf, ajak penghapusan dan 1 org dari akuntansi', '', '2022-09-13 12:24:49', 'kabid.aset'),
('000002', '0001', '1', '1', '005_2067_412.302_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-07 06:12:07', 'kabid.aset'),
('000002', '0003', '1', '1', '005_2239_412.203_2022', 6, 'well done', '', '2022-08-10 07:20:56', 'kabid.aset'),
('000002', '0004', '1', '1', '005_23169_Keuda', 7, 'nota dinas laporan ke Sekda mana?', '', '2022-08-10 07:19:47', 'kabid.aset'),
('000002', '0037', '1', '2', '005_25012_Keuda', 7, 'tolong bentuk tindak lanjut berupa scan laporan perjadin, cantumkan hal2 yg harus menjadi atensi pimpinan', '', '2022-09-11 07:39:19', 'kabid.aset'),
('000002', '0005', '1', '1', '027_962_412.031_2022', 7, 'segera minta ttd, sementara Gilang masih rekon, bisa diteruskan ke sdr Haditya utk membantu, segera setelah ttd semua, buat surat ke pengantar ke Bag Umum', '', '2022-08-10 07:17:20', 'kabid.aset'),
('000002', '0057', '1', '1', '028_1889_412.050_2022', 7, 'uplot draft SK Perubahan, cek, Bappeda juga mengajukan tapi belum diakomodir ', '', '2022-09-13 12:22:52', 'kabid.aset'),
('000002', '0032', '1', '2', '028_2469_412.203_2022', 7, 'tolong tindak lanjut berupa scan/photo tanda terima arsip yg ada tgl dan ttd penerima/BPN', '', '2022-09-11 07:43:57', 'kabid.aset'),
('000002', '0036', '1', '2', '028_2554_412.203_2022', 7, 'tolong tindak lanjut berupa scan/photo tanda terima arsip/surat pengantar yg ada tgl dan ttd penerima/BPN', '', '2022-09-11 07:40:48', 'kabid.aset'),
('000002', '0035', '1', '2', '028_2559_412.203_2022', 7, 'tolong tindak lanjut berupa scan/photo tanda terima arsip yg ada tgl dan ttd penerima/BPN', '', '2022-09-11 07:43:25', 'kabid.aset'),
('000002', '0039', '1', '2', '028_2569_412.203_2022', 7, 'tolong dilengkapi scan/photo tanda terima arsip/surat pengantar yg ada tgl dan ttd penerima/BPN', '', '2022-09-11 07:37:13', 'kabid.aset'),
('000002', '0054', '1', '2', '028_2651_412.203_2022', 7, 'tolong dilengkapi scan/photo tanda terima arsip yg sdh ada tgl dan ttd penerima/BPN', '', '2022-09-11 07:35:28', 'kabid.aset'),
('000002', '0051', '1', '2', '028_2677_412.203_2022', 7, 'tolong dilengkapi scan/photo tanda terima arsip/surat pengantar yg ada tgl dan ttd penerima/BPN', '', '2022-09-11 07:36:44', 'kabid.aset'),
('000002', '0075', '1', '2', '028_2818_412.203_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-11 07:28:17', 'kabid.aset'),
('000002', '0079', '1', '1', '032_1245_412.212_2022', 6, 'agendakan waktu utk rapat penelaahan RKBMD secara bersama-sama', '', '2022-09-12 09:23:46', 'kabid.aset'),
('000002', '0088', '1', '1', '032_1663_412.206_2022', 6, 'agendakan waktu utk rapat penelaahan RKBMD secara bersama-sama', '', '2022-09-12 09:22:47', 'kabid.aset'),
('000002', '0101', '1', '1', '032_1680_412.206_2022', 6, 'laporkan utk memenuhi MCP KPK', '', '2022-09-14 10:44:59', 'kabid.aset'),
('000002', '0077', '1', '1', '032_1827_412.213_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-13 12:19:46', 'kabid.aset'),
('000002', '0076', '1', '1', '032_1833_412.213_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-13 12:20:33', 'kabid.aset'),
('000002', '0099', '1', '1', '032_1855_412.213_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-14 10:45:27', 'kabid.aset'),
('000002', '0103', '1', '1', '032_382_412.011_2022', 7, 'saya minta data OPD yg mempunyai tanggungan utk menghapus KDP yg tidak dilanjutkan. sampai mana saja progres penghapusannya', '', '2022-09-16 07:47:49', 'kabid.aset'),
('000002', '0082', '1', '1', '032_565_412.422_2022', 6, 'agendakan waktu utk rapat penelaahan RKBMD secara bersama-sama', '', '2022-09-12 09:23:27', 'kabid.aset'),
('000002', '0058', '1', '1', '032_601_412.216_2022', 6, 'agendakan waktu utk rapat penelaahan RKBMD secara bersama-sama', '', '2022-09-12 09:24:00', 'kabid.aset'),
('000002', '0044', '1', '3', '032_813_412.224_2022', 0, 'agendakan rapat penelitian tim kabupaten, buat nota dinas KT usulan penghapusan aset tanah dan bangunan KPUD', '', '2022-08-24 04:15:04', 'kabid.aset'),
('000002', '0090', '1', '1', '050_1059_412.217_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-13 12:18:52', 'kabid.aset'),
('000002', '0073', '1', '1', '050_545_412.204_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-13 12:20:42', 'kabid.aset'),
('000002', '0016', '1', '1', '050_654_412.208_2022', 6, 'well done', '', '2022-08-24 05:22:49', 'kabid.aset'),
('000002', '0012', '1', '1', '090_1568_412.207_2022', 6, 'arigato gozaimasu', '', '2022-08-12 05:47:15', 'kabid.aset'),
('000002', '0009', '1', '1', '188_1606_412.013_2022', 6, 'terima kasih', '', '2022-08-26 06:25:07', 'kabid.aset'),
('000002', '0034', '1', '3', '400_4468_412.202_2022', 0, 'Agendakan rapat tim peneliti kabupaten', '', '2022-08-11 07:13:29', 'kabid.aset'),
('000002', '0069', '1', '1', '420_1980_412.201_2022', 7, 'uplot draft SK Perubahan, cek, Bappeda juga mengajukan tapi belum diakomodir ', '', '2022-09-13 12:22:25', 'kabid.aset'),
('000002', '0093', '1', '1', '420_2044_412.201_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-12 09:19:55', 'kabid.aset'),
('000002', '0108', '1', '1', '428_470_412.214_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-14 10:40:20', 'kabid.aset'),
('000002', '0042', '1', '1', '440_4588_412.202_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-07 06:11:28', 'kabid.aset'),
('000002', '0056', '1', '1', '440_4675A_412.202_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-07 06:10:15', 'kabid.aset'),
('000002', '0078', '1', '1', '520_1980_412.221_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-07 06:08:33', 'kabid.aset'),
('000002', '0084', '1', '1', '524_862_412.222_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-13 12:19:36', 'kabid.aset'),
('000002', '0080', '1', '1', '524__412.222_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-07 06:03:51', 'kabid.aset'),
('000002', '0065', '1', '1', '550_1238_412.212_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-07 06:09:46', 'kabid.aset'),
('000002', '0019', '1', '1', '551_1092_412.212_2022', 7, 'Panggil PPTK Dishub, temui saya', '', '2022-08-26 03:42:04', 'kabid.aset'),
('000002', '0018', '1', '3', '640_1002_412.205_2022', 0, 'telah dilakukan rapat tgl 3/8/2022 di Disparbud<br />\r\nDisparbud akan membuat surat permohonan persetujuan pembongkaran<br />\r\npantau', '', '2022-08-10 07:08:38', 'kabid.aset'),
('000002', '0053', '1', '2', '640_1126_412.205_2022', 7, 'Senin tolong dipastikan jadwal pengukurannya, kapan BPN bisa turun ', '', '2022-09-11 07:32:51', 'kabid.aset'),
('000002', '0106', '1', '3', '700_1302_412.100_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-14 11:05:55', 'kabid.aset'),
('000002', '0043', '1', '3', '800_2963_412.202.39_2022', 0, 'Agendakan Rapat Tim Peneliti', '', '2022-08-18 12:12:25', 'kabid.aset'),
('000002', '0068', '1', '3', '800_3125_412.202.39_2022', 0, 'Cek, proses segera, agendakan rapat tim peneliti', '', '2022-08-30 08:05:17', 'kabid.aset'),
('000002', '0087', '1', '1', '900_1156_412.205_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-13 12:19:14', 'kabid.aset'),
('000002', '0048', '1', '1', '900_1186_412.212_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-07 06:10:59', 'kabid.aset'),
('000002', '0089', '1', '1', '900_546_412.210_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-13 12:19:04', 'kabid.aset'),
('000002', '0083', '1', '1', '900_597_412.210_2022', 6, 'kerja bagus, terima kasih. selanjutnya utk diproses SK penambahan Standar Harga nya', '', '2022-09-14 10:46:15', 'kabid.aset'),
('000002', '0026', '1', '1', '906_2420_412.209_2022', 6, 'terima kasih', '', '2022-08-26 06:25:47', 'kabid.aset'),
('000002', '0072', '1', '1', '970_1964_412.304_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-13 12:20:54', 'kabid.aset'),
('000002', '0092', '1', '3', 'S-1170_KNL.1006_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-15 12:49:27', 'kabid.aset'),
('000002', '0050', '1', '1', 'UM.0102-CA_419', 6, 'kerja bagus, terima kasih', '', '2022-09-07 06:10:44', 'kabid.aset'),
('000003', '0005', '1', '1', '027_962_412.031_2022', 7, 'BA belum mencantumkan alasan pengalihan status penggunaan barang', '', '2022-08-12 05:58:20', 'kabid.aset'),
('000003', '0057', '1', '1', '028_1889_412.050_2022', 7, 'uplot draft sk yang sudah final beserta surat pengantar nya ke Bupati', '', '2022-09-20 11:42:45', 'kabid.aset'),
('000003', '0069', '1', '1', '420_1980_412.201_2022', 7, 'uplot draft sk yang sudah final beserta surat pengantar nya ke Bupati', '', '2022-09-20 11:42:36', 'kabid.aset'),
('000003', '0067', '1', '3', '640_1002_412.205_2022', 0, 'Buat BA penelitian untuk dilampirkan pada nota dinas permohonan draft usulan persetujuan pembongkaran gedung BCH ', '', '2022-08-30 08:07:39', 'kabid.aset'),
('000004', '0005', '1', '1', '027_962_412.031_2022', 7, '1. tanggal dan lengkapi tanda tangan<br />\r\n2. buat nota dinas permohonan persetujuan pengalihan status penggunaan', '', '2022-08-24 05:25:55', 'kabid.aset'),
('000005', '0005', '1', '1', '027_962_412.031_2022', 6, 'kerja bagus, terima kasih', '', '2022-09-13 12:23:44', 'kabid.aset');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_dispo_b`
--

CREATE TABLE `t_apms_dispo_b` (
  `id_dispob` varchar(6) COLLATE utf8_bin NOT NULL,
  `id_project` varchar(4) COLLATE utf8_bin NOT NULL,
  `id_bidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_subbidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_staff` varchar(2) COLLATE utf8_bin NOT NULL,
  `no_surat` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_respon` int(1) NOT NULL,
  `notice` text COLLATE utf8_bin NOT NULL,
  `lampiran` text COLLATE utf8_bin NOT NULL,
  `tgl_kirim` datetime DEFAULT NULL,
  `userid` varchar(25) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_dispo_b`
--

INSERT INTO `t_apms_dispo_b` (`id_dispob`, `id_project`, `id_bidang`, `id_subbidang`, `id_staff`, `no_surat`, `id_respon`, `notice`, `lampiran`, `tgl_kirim`, `userid`) VALUES
('000001', '0007', '1', '2', '2', '0', 0, 'Minta tolong cek surat terdahulu, dengan ajuan yang sama<br />\r\nSelanjutnya koordinasikan dengan Kelurahan Jetak<br />\r\nTerima kasih', '', '2022-08-03 04:54:19', 'subbid.pmf'),
('000001', '0001', '1', '1', '4', '005_2067_412.302_2022', 0, 'dibendel', '', '2022-07-28 08:52:20', 'subbid.ptu'),
('000001', '0003', '1', '1', '4', '005_2239_412.203_2022', 0, 'dibendel', '', '2022-07-28 08:50:09', 'subbid.ptu'),
('000001', '0004', '1', '1', '2', '005_23169_Keuda', 0, 'dibuatkan ringkasan zoom meeting tersebut<br />\r\n', '', '2022-07-28 08:48:21', 'subbid.ptu'),
('000001', '0017', '1', '3', '1', '005_2422_412.219_2022', 0, '>  TL Dispo.... <br />\r\n>  Tolong Cek... Koordinasikan/penelitian bersama  OPD terkait proses KT dan bendel sbg bahan rapat <br />\r\n>  Laporkan perkembangannya', '', '2022-08-15 03:40:57', 'subbid.hps'),
('000001', '0037', '1', '2', '2', '005_25012_Keuda', 0, 'Petunjuk Pak Kabid, beliau ada kegiatan jd sy hadir beserta 2 orang staf, Dek Adi dan Mbak Erma hadir bersama saya. Terima kasih.', '', '2022-08-18 10:10:23', 'subbid.pmf'),
('000001', '0109', '1', '1', '1', '005_804_412.208_2022', 0, 'Utk Disampaikan Pada Ybs, Robet, Elvina, Utk Menemui Pak Andi<br />\r\nBersama-sama', '', '2022-09-13 10:25:58', 'subbid.ptu'),
('000001', '0033', '1', '2', '4', '005_970_412.217_2022', 0, 'Mas Heri, DK, rapat sudah dihadiri Pak Kabid.', '', '2022-08-15 02:50:01', 'subbid.pmf'),
('000001', '0105', '1', '1', '2', '0255_EMCL-CPO_2022', 0, 'Tolong Disiapkan ST Dan SPPD. Buat Draft Laporan Perjadin.', '', '2022-09-13 10:28:23', 'subbid.ptu'),
('000001', '0070', '1', '2', '2', '0263_EMCL-CPO_2022', 0, 'UDK', '', '2022-09-07 03:09:08', 'subbid.pmf'),
('000001', '0005', '1', '1', '1', '027_962_412.031_2022', 0, 'diproses, buat Berita Acara Penelitian<br />\r\n', '', '2022-07-28 08:46:46', 'subbid.ptu'),
('000001', '0057', '1', '1', '3', '028_1889_412.050_2022', 0, 'Koordinasi sama mas shodiqin', '', '2022-08-29 09:16:57', 'subbid.ptu'),
('000001', '0032', '1', '2', '3', '028_2469_412.203_2022', 0, 'Mbak Erma, minta tolong cek dan lanjutkan ke pemberkasan berikutnya. Terima kasih.', '', '2022-08-15 02:41:41', 'subbid.pmf'),
('000001', '0036', '1', '2', '3', '028_2554_412.203_2022', 0, 'Mbak Erma, minta tolong cek dan lanjutkan ke pemberkasan berikutnya. Terima kasih.', '', '2022-08-15 05:08:12', 'subbid.pmf'),
('000001', '0035', '1', '2', '3', '028_2559_412.203_2022', 0, 'Mbak Erma minta tolong cek, dan lanjutkan ke pemberkasan berikutnya. Terima kasih.', '', '2022-08-15 02:48:42', 'subbid.pmf'),
('000001', '0039', '1', '2', '3', '028_2569_412.203_2022', 0, 'Mbak Erma, minta tolong cek dan lanjutkan ke pemberkasan berikutnya. Terima kasih.', '', '2022-08-15 05:08:30', 'subbid.pmf'),
('000001', '0054', '1', '2', '3', '028_2651_412.203_2022', 0, 'Mbak Erma cek berkasnya', '', '2022-08-30 10:16:15', 'subbid.pmf'),
('000001', '0051', '1', '2', '3', '028_2677_412.203_2022', 0, 'Mbak Erma tolong cek berkasnya pada waktu menyerahkan, apabila dalam pengisian masih ada yg kurang,kasih tahu dan bisa diisi langsung saat penyerahan atau kembalikan saja jangan diterima sebelum lengkap biar tidak menjadi tanggungan kita', '', '2022-08-29 03:16:04', 'subbid.pmf'),
('000001', '0075', '1', '2', '3', '028_2818_412.203_2022', 0, 'Cek dulu, apabila lengkap lanjut proses, apabila blm lengkap kembalikan atau suruh isi ditempat', '', '2022-09-07 03:35:44', 'subbid.pmf'),
('000001', '0114', '1', '1', '1', '032_1094_412.218_2022', 0, 'Bahan TL MCP KPK Dan BPK, Arsip Dengan Baik', '', '2022-09-14 04:50:02', 'subbid.ptu'),
('000001', '0079', '1', '1', '4', '032_1245_412.212_2022', 0, 'direkap dan dijadikan 1 ordner RKBMD', '', '2022-09-05 08:36:24', 'subbid.ptu'),
('000001', '0024', '1', '2', '2', '032_1299_412.303_2022', 0, 'Dek Adi minta tolong segera kirim suratnya. Terima kasih.', '', '2022-08-15 02:36:20', 'subbid.pmf'),
('000001', '0021', '1', '3', '1', '032_1309_412.303_2022', 0, '> Lanjutkan Dispo....<br />\r\n> Koordinasi, pantau dan Laporkan perkembangan', '', '2022-08-15 04:01:44', 'subbid.hps'),
('000001', '0046', '1', '2', '2', '032_1411_412.303_2022', 0, 'Minta tolong di Arsip <br />\r\nTerima kasih', '', '2022-08-26 05:18:21', 'subbid.pmf'),
('000001', '0088', '1', '1', '4', '032_1663_412.206_2022', 0, 'direkap dan dibendel jadi 1 Ordner RKBMD', '', '2022-09-05 08:33:14', 'subbid.ptu'),
('000001', '0101', '1', '1', '1', '032_1680_412.206_2022', 0, 'bendel dan Scan Pakta Integritas Barang Milik Daerah', '', '2022-09-13 10:31:33', 'subbid.ptu'),
('000001', '0077', '1', '1', '2', '032_1827_412.213_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:50:53', 'subbid.ptu'),
('000001', '0076', '1', '1', '2', '032_1833_412.213_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:50:31', 'subbid.ptu'),
('000001', '0099', '1', '1', '2', '032_1855_412.213_2022', 0, 'Segera Proses input ke SIPD ', '', '2022-09-13 10:34:01', 'subbid.ptu'),
('000001', '0064', '1', '2', '2', '032_1968_412.201_2022', 0, 'Cek, segera proses ke BPN', '', '2022-09-07 03:36:07', 'subbid.pmf'),
('000001', '0103', '1', '1', '1', '032_382_412.011_2022', 0, 'proses sesuai ketentuan dan peraturan yang berlaku', '', '2022-09-13 10:29:08', 'subbid.ptu'),
('000001', '0097', '1', '1', '4', '032_4174.A_412.202.38_2022', 0, 'Kita Agenda Kan Desk RKBMD Utk Semua OPD', '', '2022-09-13 10:36:16', 'subbid.ptu'),
('000001', '0110', '1', '1', '4', '032_516_412.421_2022', 0, 'Bendel Berkas dan Rekap hasilnya', '', '2022-09-13 10:23:03', 'subbid.ptu'),
('000001', '0082', '1', '1', '4', '032_565_412.422_2022', 0, 'direkap dan dibendel jadi 1 ordner di RKBMD', '', '2022-09-05 08:35:03', 'subbid.ptu'),
('000001', '0058', '1', '1', '4', '032_601_412.216_2022', 0, 'Drekap dan di bendel jadikan 1 ordner RKBMD', '', '2022-09-05 08:38:57', 'subbid.ptu'),
('000001', '0041', '1', '3', '2', '032_813_412.224_2022', 0, 'Buat Surat Balasan untuk kelengkapan permohonan penghapusannya', '', '2022-08-29 01:35:42', 'subbid.hps'),
('000001', '0031', '1', '3', '1', '050_1030_412.050_2022', 0, '> Tolong Cek... Koordinasikan/penelitian bersama  OPD terkait proses KT dan bendel sbg bahan rapat <br />\r\n> Laporkan perkembangannya<br />\r\n', '', '2022-08-15 03:36:53', 'subbid.hps'),
('000001', '0090', '1', '1', '2', '050_1059_412.217_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:31:50', 'subbid.ptu'),
('000001', '0025', '1', '3', '1', '050_1830_412.050_2022', 0, '>  TL Dispo.... <br />\r\n>  Tolong Cek... Koordinasikan/penelitian bersama  OPD terkait proses KT dan bendel sbg bahan rapat <br />\r\n>  Laporkan perkembangannya', '', '2022-08-15 03:42:27', 'subbid.hps'),
('000001', '0074', '1', '1', '1', '050_2855_412.203_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:49:56', 'subbid.ptu'),
('000001', '0073', '1', '1', '3', '050_545_412.204_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:49:10', 'subbid.ptu'),
('000001', '0016', '1', '1', '2', '050_654_412.208_2022', 0, 'SSH diinput di SIPD sesuai dengan auan OPD ', '', '2022-08-12 11:20:52', 'subbid.ptu'),
('000001', '0130', '1', '2', '4', '061_936_BJ_UM_SRT', 0, 'Info dari Pak Kabid surat Bupati turun ke Bapenda', '', '2022-09-22 10:38:04', 'subbid.pmf'),
('000001', '0012', '1', '1', '2', '090_1568_412.207_2022', 0, 'Tolong diinput ke SIPD Tahun 2022', '', '2022-08-04 02:20:30', 'subbid.ptu'),
('000001', '0022', '1', '1', '1', '188_1170_412.031_2022', 0, 'Kita koordinasikan dengan Bagian Umum dan Bagian Hukum Sekretariat Daerah,<br />\r\nbuat berita acara penelitian', '', '2022-08-26 04:34:50', 'subbid.ptu'),
('000001', '0009', '1', '1', '1', '188_1606_412.013_2022', 0, 'jurnal koreksi atas pencatatan Barang Milik Daerah Jalan dr. Suharso sesuai Peraturan yang berlaku ', '', '2022-08-04 02:24:03', 'subbid.ptu'),
('000001', '0034', '1', '3', '1', '400_4468_412.202_2022', 0, '> Cek... Koordinasikan/penelitian bersama  OPD terkait proses KT dan bendel sbg bahan rapat ', '', '2022-08-15 03:33:25', 'subbid.hps'),
('000001', '0069', '1', '1', '3', '420_1980_412.201_2022', 0, 'dibendel dan dibuatkan SK Perubahannya', '', '2022-09-05 08:42:20', 'subbid.ptu'),
('000001', '0093', '1', '1', '4', '420_2044_412.201_2022', 0, 'untuk dibendel dengan rusak masuk', '', '2022-09-05 08:30:23', 'subbid.ptu'),
('000001', '0096', '1', '1', '3', '420_2054_412.201_2022', 0, 'UDK, Sesuai Petunjuk Kaban, Yg Hadir Kabid Akuntansi, <br />\r\nbendel suratnya<br />\r\n', '', '2022-09-13 10:38:31', 'subbid.ptu'),
('000001', '0108', '1', '1', '2', '428_470_412.214_2022', 0, 'Di Perpres 33 Standar Pemeliharaan Bangunan,<br />\r\nCek Apakah Sdh Ada Di SBU Atau Standar Lainnya', '', '2022-09-13 10:27:36', 'subbid.ptu'),
('000001', '0042', '1', '1', '3', '440_4588_412.202_2022', 0, 'segera dipenuhi', '', '2022-08-19 11:12:33', 'subbid.ptu'),
('000001', '0056', '1', '1', '2', '440_4675A_412.202_2022', 0, 'untuk SSH, di input di SIPD  tahun 2022', '', '2022-08-29 09:13:58', 'subbid.ptu'),
('000001', '0098', '1', '1', '2', '440_4879A_412.202_2022', 0, 'Proses segera ke SIPD', '', '2022-09-13 10:34:58', 'subbid.ptu'),
('000001', '0112', '1', '3', '2', '440_5007_412.202_2022', 0, '- Buatkan notdin yg menjelaskan permohonan ijin Bupati<br />\r\n- Bersama Mas Agung... buat Keker Cek & Teliti bersama OPD', '', '2022-09-13 03:53:52', 'subbid.hps'),
('000001', '0055', '1', '2', '2', '510_1560_412.220_2022', 0, 'Cek kelengkapan apakah sudah sesuai dengan permintan KPKNL, buat pengantar ke KPKNL,naikkan ke saya', '', '2022-09-07 02:55:29', 'subbid.pmf'),
('000001', '0052', '1', '1', '1', '510_1563_412.220_2022', 0, 'diprintkan KIB nya, ', '', '2022-08-29 09:12:28', 'subbid.ptu'),
('000001', '0078', '1', '1', '2', '520_1980_412.221_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:51:23', 'subbid.ptu'),
('000001', '0115', '1', '3', '3', '520_2209_412.221_2022', 0, 'buat nota dinas kaji telaah, sediakan kembali draft sk pengelola barang ttg penghapusan ', '', '2022-09-15 05:46:18', 'subbid.hps'),
('000001', '0084', '1', '1', '3', '524_862_412.222_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:33:57', 'subbid.ptu'),
('000001', '0080', '1', '1', '2', '524__412.222_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:35:27', 'subbid.ptu'),
('000001', '0049', '1', '1', '2', '530_846_412.218_2022', 0, 'buat suratnya, yang ditunjuk an. haditya', '', '2022-08-29 09:08:25', 'subbid.ptu'),
('000001', '0065', '1', '1', '2', '550_1238_412.212_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:41:31', 'subbid.ptu'),
('000001', '0019', '1', '1', '2', '551_1092_412.212_2022', 0, 'SSH nya diinput di SIPD, <br />\r\nuntuk kegiatan menggunakan paket saya kordinasikan dulu dengan Bidang Anggaran', '', '2022-08-12 11:19:15', 'subbid.ptu'),
('000001', '0008', '1', '3', '1', '640_1002_412.205_2022', 0, '> Arsipkan dan Bendel bahan Rapat', '', '2022-08-15 03:55:16', 'subbid.hps'),
('000001', '0018', '1', '3', '1', '640_1002_412.205_2022', 0, '> Arsipkan/Bendel Bahan Rapat<br />\r\n> Pantau ....', '', '2022-08-15 03:59:14', 'subbid.hps'),
('000001', '0067', '1', '3', '1', '640_1002_412.205_2022', 0, '- Persiapkan Draft BA penelitian sbg bahan Notdin Kajian + Koordinasi bersama saya', '', '2022-08-30 02:12:34', 'subbid.hps'),
('000001', '0013', '1', '3', '1', '640_1011_412.205_2022', 0, '> Lanjutkan Dispo....<br />\r\n> Koordinasi guna penelitian  dgn OPD Terkait; bersama saya<br />\r\n> Pantau dan Laporkan perkembangan', '', '2022-08-15 04:10:51', 'subbid.hps'),
('000001', '0014', '1', '3', '1', '640_1012_412.205_2022', 0, '> Lanjutkan Dispo....<br />\r\n> Koordinasi guna penelitian  dgn OPD Terkait; bersama saya<br />\r\n> Pantau dan Laporkan perkembangan', '', '2022-08-15 04:10:31', 'subbid.hps'),
('000001', '0015', '1', '3', '2', '640_1013_412.205_2022', 0, '> TL Dispo.... <br />\r\n> Bersama Mas AGung Tolong Cek... Koordinasikan/penelitian bersama  OPD terkait proses KT dan bendel sbg bahan rapat <br />\r\n> Laporkan perkembangannya', '', '2022-08-15 03:39:31', 'subbid.hps'),
('000001', '0062', '1', '3', '1', '640_1024_412.205_2055', 0, 'Bersama saya  Koordinasi dgn DPKP .... dan tunggu dispo<br />\r\n', '', '2022-08-30 12:49:34', 'subbid.hps'),
('000001', '0038', '1', '3', '1', '640_1078_412.205_2022', 0, '> Kondisikan sesuai posisi di Gudang.... Koordinasi dengan Mas Robet & P. No<br />\r\n> Administrasikan Nota Pengiriman Barang', '', '2022-08-29 01:32:27', 'subbid.hps'),
('000001', '0053', '1', '2', '2', '640_1126_412.205_2022', 0, 'Tindaklanjuti sesuai pertemuan Hari Jumat Tanggal 26 Agustus 2022 di Balai Desa Banjarsari', '', '2022-08-29 03:18:03', 'subbid.pmf'),
('000001', '0116', '1', '3', '2', '640_1216_412.205_2022', 0, 'pantau disela-sela keg penilaian aset tanah dinas pendidikan, laporkan', '', '2022-09-15 05:44:34', 'subbid.hps'),
('000001', '0002', '1', '2', '3', '650_2199_412.203_2022', 0, 'Minta tolong copy dan teruskan ke Penatausahaan<br />\r\nSurat Pengajuan dari Pak Kasubbid Penatausahaan<br />\r\nTerima kasih mbak', '', '2022-07-28 02:53:09', 'subbid.pmf'),
('000001', '0023', '1', '2', '3', '650_2370_412.203_2022', 0, 'Mbak Erma, copy dulu suratnya, selanjutnya surat asli segera kirim ke BPN. Terima kasih.', '', '2022-08-15 02:35:21', 'subbid.pmf'),
('000001', '0029', '1', '2', '1', '650_2432_412.203_2022', 0, 'Mas Ari, copy surat, surat asli segera kirim ke BPN. Terima kasih.', '', '2022-08-15 02:40:28', 'subbid.pmf'),
('000001', '0027', '1', '2', '1', '650_2456_412.203_2022', 0, 'Mas Ari, copy surat, selanjutnya surat asli segera dikirim ke BPN.', '', '2022-08-15 02:38:18', 'subbid.pmf'),
('000001', '0094', '1', '2', '1', '650_2870_412.203_2022', 0, 'Segera kirim ke BPN', '', '2022-09-09 02:00:31', 'subbid.pmf'),
('000001', '0066', '1', '3', '1', '660_1051_412.217_2022', 0, 'Bersama saya, Koordinasikan dengan Pengurus Barang.... Bahan Rapat', '', '2022-08-30 12:52:32', 'subbid.hps'),
('000001', '0020', '1', '2', '1', '660_916_412.217_2022', 0, 'Mas Ari, carikan scan sertifikat tsb di ats,copy dan buatkan surat pengantar ke DLH. Terima kasih', '', '2022-08-15 02:32:34', 'subbid.pmf'),
('000001', '0071', '1', '3', '4', '700_1249_412.100_2022', 0, 'fasilitasi, utk laporan hasil review agar discan dan diarsip dengan baik', '', '2022-09-13 09:13:26', 'subbid.hps'),
('000001', '0106', '1', '3', '4', '700_1302_412.100_2022', 0, 'untuk dipedomani, surat diarsip dengan baik ', '', '2022-09-13 09:10:35', 'subbid.hps'),
('000001', '0121', '1', '2', '1', '700_1382_412.100_2022', 0, 'UDK<br />\r\nSudah dihadiri Pak Kabid sewaktu kita Pengukuran Ulang di Banjarsari', '', '2022-09-22 10:38:43', 'subbid.pmf'),
('000001', '0100', '1', '1', '2', '791_2755_412.219_2022', 0, 'Diinput sesuai ketentuan', '', '2022-09-13 10:32:43', 'subbid.ptu'),
('000001', '0059', '1', '1', '1', '800_1781_412.213_2022', 0, 'menunggu disposisi turun dai ibu Bupati, dan buatkan Berita Acara Penelitian ', '', '2022-09-05 08:40:55', 'subbid.ptu'),
('000001', '0040', '1', '3', '1', '800_2963_412.202.39_2022', 0, 'Tunggu Surat dan Dispo Asli', '', '2022-08-29 01:33:43', 'subbid.hps'),
('000001', '0043', '1', '3', '1', '800_2963_412.202.39_2022', 0, 'Tolong siapkan Nota DInas Persetujuan Pembongkaran (Bahan sdh Lengkap)', '', '2022-08-29 01:25:03', 'subbid.hps'),
('000001', '0063', '1', '3', '1', '800_3125_412.202.39_2022', 0, 'Tunggu Dispo... Masukan File Daftar yang akan dihapus sebagai bahan rapat', '', '2022-08-29 01:37:16', 'subbid.hps'),
('000001', '0068', '1', '3', '1', '800_3125_412.202.39_2022', 0, '- Foto Copi, buat Surat Pengantar Dispo Surat tsb dikirim ke Bagian Hukum dan Inspektorat<br />\r\n- persiapkan kertas kerja + koordinasi dgn OPD terkait', '', '2022-08-30 02:16:30', 'subbid.hps'),
('000001', '0060', '1', '3', '1', '800_834_412.222_2022', 0, '- Buatkan draft  surat ke OPD agar melalui usulan penghapusan dengan sebab lain<br />\r\n- Konsultasikan dengan P. Kabid', '', '2022-08-30 02:19:16', 'subbid.hps'),
('000001', '0030', '1', '3', '2', '840_1057__412.205_2022', 0, '> TL Dispo.... <br />\r\n> Bersama Mas AGung Tolong Cek... Koordinasikan/penelitian bersama  OPD terkait proses KT dan bendel sbg bahan rapat <br />\r\n> Laporkan perkembangannya', '', '2022-08-15 03:39:10', 'subbid.hps'),
('000001', '0010', '1', '3', '2', '893_23182_Keuda', 0, '> Bersama saya koordinasi dengan BKPP terkait Anggarannya...', '', '2022-08-15 04:09:40', 'subbid.hps'),
('000001', '0087', '1', '1', '3', '900_1156_412.205_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:33:36', 'subbid.ptu'),
('000001', '0048', '1', '1', '2', '900_1186_412.212_2022', 0, 'untuk ZOSS menunggu petunjuk lebih lanjut, hasil koordinasi dengan Anggaran kalau bisa dirinci', '', '2022-08-26 04:31:21', 'subbid.ptu'),
('000001', '0102', '1', '1', '4', '900_1589_412.202.40_2022', 0, 'Bendel berkasnya dan Rekap hasilnya', '', '2022-09-13 10:30:24', 'subbid.ptu'),
('000001', '0111', '1', '1', '4', '900_1671_412.404_2022', 0, 'Bendel Berkas dan Rekap hasilnya', '', '2022-09-13 10:22:23', 'subbid.ptu'),
('000001', '0061', '1', '3', '2', '900_412.408_2022', 0, 'Tunggu Dispo....<br />\r\nArsipkan', '', '2022-08-30 12:46:26', 'subbid.hps'),
('000001', '0104', '1', '3', '1', '900_4898_412..202_2022', 0, 'proses cek dan cukupi bahan', '', '2022-09-13 03:50:26', 'subbid.hps'),
('000001', '0091', '1', '3', '1', '900_4898_412.202_2022', 0, 'Proses, cek dan cukupi bahan', '', '2022-09-13 03:50:58', 'subbid.hps'),
('000001', '0089', '1', '1', '2', '900_546_412.210_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:32:10', 'subbid.ptu'),
('000001', '0083', '1', '1', '2', '900_597_412.210_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:34:19', 'subbid.ptu'),
('000001', '0026', '1', '1', '2', '906_2420_412.209_2022', 0, 'untuk SSH di input ke SIPD', '', '2022-08-12 11:14:31', 'subbid.ptu'),
('000001', '0047', '1', '2', '4', '970_1798_412.304_2022', 0, 'UDK', '', '2022-08-29 03:13:08', 'subbid.pmf'),
('000001', '0072', '1', '1', '2', '970_1964_412.304_2022', 0, 'diinput diSIPD dan berkas dibendel jadi 1 dengan SSH', '', '2022-09-05 08:44:41', 'subbid.ptu'),
('000001', '0086', '1', '2', '2', 'B_1159_VIII_2022', 0, 'Tunggu Dispo Bupati', '', '2022-09-07 03:33:04', 'subbid.pmf'),
('000001', '0085', '1', '3', '2', 'B_1161_VIII_2022', 0, '- BUAT DRAFT NOTDIN KE SEKDA TERLAMPIR SURAT KE OPD TERKAIT<br />\r\n- Koordinasi bersama Mas Agung Ke PB OPD', '', '2022-09-13 03:46:36', 'subbid.hps'),
('000001', '0081', '1', '2', '1', 'HP.02.01_1713.35.22_VII_2022', 0, 'Cukupi kekurangan berkas dan koordinasikan dengan BPN', '', '2022-09-07 03:34:53', 'subbid.pmf'),
('000001', '0107', '1', '2', '1', 'IP.02.01_1791.31.22_IX_2022', 0, 'Mas ari koordinasi dengan pak tedjo', '', '2022-09-19 03:31:17', 'subbid.pmf'),
('000001', '0011', '1', '2', '1', 'NT.01.02_1502-35.22_VII_2022', 0, 'Arsip suratnya<br />\r\nSudah dihadiri Bu Kaban ', '', '2022-08-03 04:55:12', 'subbid.pmf'),
('000001', '0045', '1', '3', '1', 'S-1034_KNL.1006_2022', 0, 'Upload Surat Permohonan Lelang Ulang', '', '2022-08-29 01:34:58', 'subbid.hps'),
('000001', '0092', '1', '3', '4', 'S-1170_KNL.1006_2022', 0, 'hadiri, laporkan hasilnya', '', '2022-09-13 09:11:47', 'subbid.hps'),
('000001', '0006', '1', '3', '1', 'S-918_KNL.1006_2022', 0, '> TL Dispo<br />\r\n> Cukupi...', '', '2022-08-15 03:53:28', 'subbid.hps'),
('000001', '0050', '1', '1', '2', 'UM.0102-CA_419', 0, 'Hadir bersama saya, buat surat perintah tugas dan sppd', '', '2022-08-26 04:27:12', 'subbid.ptu'),
('000001', '0095', '1', '1', '4', 'UM0102_BB8_1444', 0, 'Buat Surat Tugas dan SPPD', '', '2022-09-13 10:19:00', 'subbid.ptu'),
('000001', '0113', '1', '2', '4', 'UND-93_WKN.10_2022', 0, 'Copy, teruskan ke Pak Fedo dan tim, Pemanfaatan yang hadir Mas Heri', '', '2022-09-19 03:30:09', 'subbid.pmf'),
('000002', '0001', '1', '1', '4', '005_2067_412.302_2022', 4, 'Bendel', '', '2022-09-05 08:27:13', 'subbid.ptu'),
('000002', '0003', '1', '1', '4', '005_2239_412.203_2022', 4, 'sudah dilaksanakan', '', '2022-08-04 03:22:00', 'subbid.ptu'),
('000002', '0004', '1', '1', '2', '005_23169_Keuda', 4, 'sudah dilaksanakan', '', '2022-08-04 03:21:22', 'subbid.ptu'),
('000002', '0037', '1', '2', '2', '005_25012_Keuda', 4, 'Terima kasih<br />\r\n', '', '2022-09-09 01:55:02', 'subbid.pmf'),
('000002', '0005', '1', '1', '1', '027_962_412.031_2022', 4, 'Sudah dibuatkan BA oleh Bagian Umum dan Badan Pemadam Kebakaran', '', '2022-08-04 03:19:29', 'subbid.ptu'),
('000002', '0057', '1', '1', '3', '028_1889_412.050_2022', 4, 'Terima kasih', '', '2022-09-13 10:17:04', 'subbid.ptu'),
('000002', '0032', '1', '2', '3', '028_2469_412.203_2022', 4, 'Good Job Mbak Erma, tanda terima arsip, Terima kasih', '', '2022-09-09 01:50:00', 'subbid.pmf'),
('000002', '0036', '1', '2', '3', '028_2554_412.203_2022', 4, 'Good Job Mbak Erma, tanda terima arsip, Terima kasih', '', '2022-09-09 01:50:37', 'subbid.pmf'),
('000002', '0035', '1', '2', '3', '028_2559_412.203_2022', 4, 'Good Job Mbak Erma, tanda terima arsip, Terima kasih', '', '2022-09-09 01:52:54', 'subbid.pmf'),
('000002', '0039', '1', '2', '3', '028_2569_412.203_2022', 4, 'Tanda terima arsip, Terima kasih', '', '2022-09-09 01:56:00', 'subbid.pmf'),
('000002', '0054', '1', '2', '3', '028_2651_412.203_2022', 4, 'Buatkan surat pengantar, lengkap, segera kirim ke BPN', '', '2022-09-09 01:58:40', 'subbid.pmf'),
('000002', '0051', '1', '2', '3', '028_2677_412.203_2022', 4, 'Persiapkan surat pengantar, lengkap, segera kirim ke BPN', '', '2022-09-09 01:56:55', 'subbid.pmf'),
('000002', '0075', '1', '2', '3', '028_2818_412.203_2022', 4, 'Tanda terima arsip.', '', '2022-09-09 01:59:18', 'subbid.pmf'),
('000002', '0079', '1', '1', '4', '032_1245_412.212_2022', 4, 'Sudah dilaksanakan', '', '2022-09-12 03:55:39', 'subbid.ptu'),
('000002', '0088', '1', '1', '4', '032_1663_412.206_2022', 4, 'Sudah dilaksanakan', '', '2022-09-12 03:56:37', 'subbid.ptu'),
('000002', '0101', '1', '1', '1', '032_1680_412.206_2022', 4, 'terima kasih', '', '2022-09-14 04:43:09', 'subbid.ptu'),
('000002', '0077', '1', '1', '2', '032_1827_412.213_2022', 4, 'Terima kasih', '', '2022-09-13 10:15:38', 'subbid.ptu'),
('000002', '0076', '1', '1', '2', '032_1833_412.213_2022', 4, 'Terima kasih', '', '2022-09-13 10:16:01', 'subbid.ptu'),
('000002', '0099', '1', '1', '2', '032_1855_412.213_2022', 4, 'terima kasih', '', '2022-09-14 04:43:59', 'subbid.ptu'),
('000002', '0103', '1', '1', '1', '032_382_412.011_2022', 4, 'diisikan sesuai data kontraknya', '', '2022-09-14 04:47:12', 'subbid.ptu'),
('000002', '0082', '1', '1', '4', '032_565_412.422_2022', 4, 'Sudah dilaksanakan', '', '2022-09-12 03:56:20', 'subbid.ptu'),
('000002', '0058', '1', '1', '4', '032_601_412.216_2022', 4, 'Sudah dilaksanakan', '', '2022-09-12 03:58:08', 'subbid.ptu'),
('000002', '0044', '1', '3', '2', '032_813_412.224_2022', 0, 'Buat Surat Jawaban utk melengkapi usulannya', '', '2022-08-29 01:38:14', 'subbid.hps'),
('000002', '0090', '1', '1', '2', '050_1059_412.217_2022', 4, 'Terima kasih', '', '2022-09-13 10:13:17', 'subbid.ptu'),
('000002', '0073', '1', '1', '3', '050_545_412.204_2022', 4, 'Terima kasih', '', '2022-09-13 10:16:19', 'subbid.ptu'),
('000002', '0016', '1', '1', '2', '050_654_412.208_2022', 4, 'terima kasih', '', '2022-08-19 11:14:36', 'subbid.ptu'),
('000002', '0012', '1', '1', '2', '090_1568_412.207_2022', 4, 'terima kasi', '', '2022-08-12 11:05:50', 'subbid.ptu'),
('000002', '0009', '1', '1', '1', '188_1606_412.013_2022', 4, 'terima kasih', '', '2022-08-26 04:26:24', 'subbid.ptu'),
('000002', '0028', '1', '3', '1', '400_4468_412.202_2022', 0, '>  TL Dispo.... <br />\r\n>  Tolong Cek... Koordinasikan/penelitian bersama  OPD terkait proses KT dan bendel sbg bahan rapat <br />\r\n>  Laporkan perkembangannya', '', '2022-08-15 03:42:09', 'subbid.hps'),
('000002', '0069', '1', '1', '3', '420_1980_412.201_2022', 4, 'Terima kasih', '', '2022-09-13 10:16:50', 'subbid.ptu'),
('000002', '0093', '1', '1', '4', '420_2044_412.201_2022', 4, 'Sudah dilaksanakan', '', '2022-09-12 03:56:52', 'subbid.ptu'),
('000002', '0108', '1', '1', '2', '428_470_412.214_2022', 4, 'terima kasih', '', '2022-09-14 04:42:42', 'subbid.ptu'),
('000002', '0042', '1', '1', '3', '440_4588_412.202_2022', 4, 'dibendel', '', '2022-09-05 08:28:14', 'subbid.ptu'),
('000002', '0056', '1', '1', '2', '440_4675A_412.202_2022', 4, 'Terima kasih', '', '2022-09-06 11:01:12', 'subbid.ptu'),
('000002', '0078', '1', '1', '2', '520_1980_412.221_2022', 4, 'Terima kasih', '', '2022-09-06 11:00:51', 'subbid.ptu'),
('000002', '0084', '1', '1', '3', '524_862_412.222_2022', 4, 'Terima kasih', '', '2022-09-13 10:15:20', 'subbid.ptu'),
('000002', '0080', '1', '1', '2', '524__412.222_2022', 4, 'Terima kasih', '', '2022-09-06 11:00:31', 'subbid.ptu'),
('000002', '0065', '1', '1', '2', '550_1238_412.212_2022', 4, 'Terima kasih', '', '2022-09-06 11:01:02', 'subbid.ptu'),
('000002', '0019', '1', '1', '2', '551_1092_412.212_2022', 4, 'terima kasih', '', '2022-08-19 11:10:21', 'subbid.ptu'),
('000002', '0053', '1', '2', '2', '640_1126_412.205_2022', 4, 'Koordinasikan jadwal pengukuran ke Dinas PKP Cipta Karya', '', '2022-09-09 01:57:56', 'subbid.pmf'),
('000002', '0071', '1', '3', '4', '700_1249_412.100_2022', 4, 'kerja bagus, terima kasih', '', '2022-09-20 05:36:12', 'subbid.hps'),
('000002', '0106', '1', '3', '4', '700_1302_412.100_2022', 4, 'terima kasih', '', '2022-09-14 11:04:20', 'subbid.hps'),
('000002', '0087', '1', '1', '3', '900_1156_412.205_2022', 4, 'Terima kasih', '', '2022-09-13 10:14:55', 'subbid.ptu'),
('000002', '0048', '1', '1', '2', '900_1186_412.212_2022', 4, 'dibendel jadi 1 untuk SSH', '', '2022-09-05 08:29:11', 'subbid.ptu'),
('000002', '0089', '1', '1', '2', '900_546_412.210_2022', 4, 'Terima kasih', '', '2022-09-13 10:13:55', 'subbid.ptu'),
('000002', '0083', '1', '1', '2', '900_597_412.210_2022', 4, 'terima kasih', '', '2022-09-14 04:44:25', 'subbid.ptu'),
('000002', '0026', '1', '1', '2', '906_2420_412.209_2022', 4, 'terima kasih', '', '2022-08-26 04:25:39', 'subbid.ptu'),
('000002', '0072', '1', '1', '2', '970_1964_412.304_2022', 4, 'Terima kasih', '', '2022-09-13 10:16:33', 'subbid.ptu'),
('000002', '0092', '1', '3', '4', 'S-1170_KNL.1006_2022', 4, 'terima kasih', '', '2022-09-15 12:48:52', 'subbid.hps'),
('000002', '0050', '1', '1', '2', 'UM.0102-CA_419', 4, 'Bendel Surat', '', '2022-09-05 08:23:53', 'subbid.ptu'),
('000003', '0004', '1', '1', '2', '005_23169_Keuda', 4, 'terima kasih, dimohon untuk membuat  data migrasi data  dari simda bmd ke e bmd', '', '2022-08-12 11:09:30', 'subbid.ptu'),
('000003', '0005', '1', '1', '1', '027_962_412.031_2022', 4, 'terima kasih,<br />\r\nselanjutnya dimintakan tanda tangan', '', '2022-08-12 11:07:50', 'subbid.ptu'),
('000003', '0057', '1', '1', '3', '028_1889_412.050_2022', 4, 'terima kasih<br />\r\n', '', '2022-09-14 04:46:13', 'subbid.ptu'),
('000003', '0069', '1', '1', '3', '420_1980_412.201_2022', 4, 'Terima kasih', '', '2022-09-14 04:45:49', 'subbid.ptu'),
('000004', '0005', '1', '1', '1', '027_962_412.031_2022', 4, 'terima kasih', '', '2022-08-19 11:15:34', 'subbid.ptu'),
('000005', '0005', '1', '1', '1', '027_962_412.031_2022', 4, 'Terima kasih', '', '2022-09-13 10:17:19', 'subbid.ptu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_dispo_c`
--

CREATE TABLE `t_apms_dispo_c` (
  `id_dispoc` varchar(6) COLLATE utf8_bin NOT NULL,
  `id_project` varchar(4) COLLATE utf8_bin NOT NULL,
  `id_bidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_subbidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_staff` varchar(2) COLLATE utf8_bin NOT NULL,
  `no_surat` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_respon` int(1) NOT NULL,
  `notice` text COLLATE utf8_bin NOT NULL,
  `lampiran` text COLLATE utf8_bin NOT NULL,
  `tgl_kirim` datetime DEFAULT NULL,
  `userid` varchar(25) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_dispo_c`
--

INSERT INTO `t_apms_dispo_c` (`id_dispoc`, `id_project`, `id_bidang`, `id_subbidang`, `id_staff`, `no_surat`, `id_respon`, `notice`, `lampiran`, `tgl_kirim`, `userid`) VALUES
('000001', '0007', '1', '2', '2', '0', 1, 'Siap, segera ditindaklanjuti ', '', '2022-08-04 04:33:18', 'staf.pmf2'),
('000001', '0001', '1', '1', '4', '005_2067_412.302_2022', 3, 'Selesai', '', '2022-07-28 03:04:48', 'staf.ptu4'),
('000001', '0003', '1', '1', '4', '005_2239_412.203_2022', 3, 'Selesai', '', '2022-07-28 03:04:37', 'staf.ptu4'),
('000001', '0004', '1', '1', '2', '005_23169_Keuda', 1, 'baik akan kami tindak lanjuti', '', '2022-07-28 09:30:19', 'staf.ptu2'),
('000001', '0017', '1', '3', '1', '005_2422_412.219_2022', 1, 'siap', '', '2022-08-25 01:00:27', 'staf.hps1'),
('000001', '0037', '1', '2', '2', '005_25012_Keuda', 3, 'Telah dihadiri dan dilaksanakan dengan penuh tanggung jawab', '', '2022-09-07 05:00:01', 'staf.pmf2'),
('000001', '0109', '1', '1', '1', '005_804_412.208_2022', 1, '-', '', '2022-09-14 08:28:51', 'staf.ptu1'),
('000001', '0105', '1', '1', '2', '0255_EMCL-CPO_2022', 1, 'kami telah hadiri', '', '2022-09-13 10:45:22', 'staf.ptu2'),
('000001', '0070', '1', '2', '2', '0263_EMCL-CPO_2022', 1, 'Siap diarsip ke ordner surat masuk ', '', '2022-09-08 05:46:06', 'staf.pmf2'),
('000001', '0005', '1', '1', '1', '027_962_412.031_2022', 1, 'Siap', '', '2022-08-01 01:41:08', 'staf.ptu1'),
('000001', '0057', '1', '1', '3', '028_1889_412.050_2022', 1, 'Segera dikoordinasikan dengan saudara Shodiqin', '', '2022-08-30 04:39:27', 'staf.ptu3'),
('000001', '0032', '1', '2', '3', '028_2469_412.203_2022', 1, 'siap bu sinta ini di proses untuk pembuatan Model A dan Permohonan Hak', '', '2022-08-15 05:09:24', 'staf.pmf3'),
('000001', '0036', '1', '2', '3', '028_2554_412.203_2022', 1, 'siap bu sinta ini di proses untuk pembuatan Model A dan Permohonan Hak', '', '2022-08-15 05:10:10', 'staf.pmf3'),
('000001', '0035', '1', '2', '3', '028_2559_412.203_2022', 1, 'siap bu sinta ini di proses untuk pembuatan Model A dan Permohonan Hak', '', '2022-08-15 05:09:53', 'staf.pmf3'),
('000001', '0039', '1', '2', '3', '028_2569_412.203_2022', 1, 'siap bu sinta ini di proses untuk pembuatan Model A dan Permohonan Hak', '', '2022-08-15 05:10:26', 'staf.pmf3'),
('000001', '0054', '1', '2', '3', '028_2651_412.203_2022', 3, 'sudah di cek, berkas lengkap<br />\r\ndan siap dikirim ke BPN', '', '2022-09-07 05:00:13', 'staf.pmf3'),
('000001', '0051', '1', '2', '3', '028_2677_412.203_2022', 1, 'sudah di cek dan telah lengkap<br />\r\nberkas segera di kirim ke BPN', '', '2022-09-07 04:58:03', 'staf.pmf3'),
('000001', '0075', '1', '2', '3', '028_2818_412.203_2022', 3, 'Sudah di cek dan telah lengkap<br />\r\ndan berkas siap dikirim ke bpn', '', '2022-09-07 05:03:50', 'staf.pmf3'),
('000001', '0114', '1', '1', '1', '032_1094_412.218_2022', 3, 'telah di print dan di bundle', '', '2022-09-15 09:08:32', 'staf.ptu1'),
('000001', '0079', '1', '1', '4', '032_1245_412.212_2022', 1, 'Rekapitulasi RKBMD 2023', '', '2022-09-06 11:13:51', 'staf.ptu4'),
('000001', '0024', '1', '2', '2', '032_1299_412.303_2022', 3, 'Surat sudah dikirim ke instansi/SKPD terakit', '', '2022-08-15 05:11:16', 'staf.pmf2'),
('000001', '0021', '1', '3', '1', '032_1309_412.303_2022', 1, 'siap', '', '2022-08-25 12:59:33', 'staf.hps1'),
('000001', '0046', '1', '2', '2', '032_1411_412.303_2022', 3, 'Sudah diarsip ke ordner surat keluar sub bidang pemanfaatan', '', '2022-09-07 05:15:42', 'staf.pmf2'),
('000001', '0088', '1', '1', '4', '032_1663_412.206_2022', 1, 'Rekapitulasi RKBMD 2023', '', '2022-09-06 11:13:34', 'staf.ptu4'),
('000001', '0101', '1', '1', '1', '032_1680_412.206_2022', 1, 'dokumen digital pakta integritas bisa dilihat pada link : https://bit.ly/pakta_integritas_2022', '', '2022-09-14 09:25:12', 'staf.ptu1'),
('000001', '0077', '1', '1', '2', '032_1827_412.213_2022', 1, 'baik kami proses', '', '2022-09-05 11:12:34', 'staf.ptu2'),
('000001', '0076', '1', '1', '2', '032_1833_412.213_2022', 1, 'baik kami proses', '', '2022-09-05 11:12:41', 'staf.ptu2'),
('000001', '0099', '1', '1', '2', '032_1855_412.213_2022', 1, 'baik kami cek', '', '2022-09-13 10:44:16', 'staf.ptu2'),
('000001', '0064', '1', '2', '2', '032_1968_412.201_2022', 1, 'Sebagian sudah didaftarkan ke BPN dan sebagian masih proses pemberkasan', '', '2022-09-09 09:49:06', 'staf.pmf2'),
('000001', '0103', '1', '1', '1', '032_382_412.011_2022', 1, 'rincian dokumen cek pada link : https://bit.ly/cek_dokumen_kdp_2021', '', '2022-09-14 09:08:17', 'staf.ptu1'),
('000001', '0097', '1', '1', '4', '032_4174.A_412.202.38_2022', 1, 'Siap untuk dilaksanakan', '', '2022-09-15 08:45:34', 'staf.ptu4'),
('000001', '0110', '1', '1', '4', '032_516_412.421_2022', 1, 'Siap dilaksanakan', '', '2022-09-15 08:46:40', 'staf.ptu4'),
('000001', '0082', '1', '1', '4', '032_565_412.422_2022', 1, 'Rekapitulasi RKBMD 2023', '', '2022-09-06 11:13:43', 'staf.ptu4'),
('000001', '0058', '1', '1', '4', '032_601_412.216_2022', 1, 'Rekapitulasi RKBMD 2023', '', '2022-09-06 11:13:58', 'staf.ptu4'),
('000001', '0031', '1', '3', '1', '050_1030_412.050_2022', 1, 'siap', '', '2022-08-25 01:05:30', 'staf.hps1'),
('000001', '0090', '1', '1', '2', '050_1059_412.217_2022', 1, 'Sudah dilakukan input di SIPD laporan bukti sedang disiapkan', '', '2022-09-05 11:10:31', 'staf.ptu2'),
('000001', '0025', '1', '3', '1', '050_1830_412.050_2022', 1, 'siap', '', '2022-08-25 01:01:04', 'staf.hps1'),
('000001', '0074', '1', '1', '1', '050_2855_412.203_2022', 3, 'Telah diinput pada SIPD', '', '2022-09-06 12:00:07', 'staf.ptu1'),
('000001', '0073', '1', '1', '3', '050_545_412.204_2022', 1, 'Proses<br />\r\n', '', '2022-09-05 09:07:16', 'staf.ptu3'),
('000001', '0016', '1', '1', '2', '050_654_412.208_2022', 1, 'Baik kami cek di SIPD', '', '2022-08-15 08:34:43', 'staf.ptu2'),
('000001', '0012', '1', '1', '2', '090_1568_412.207_2022', 1, 'baik kami cek', '', '2022-08-11 10:51:39', 'staf.ptu2'),
('000001', '0022', '1', '1', '1', '188_1170_412.031_2022', 2, '1.Telah koordinasi dengan saudara sri permadi ariwiyono dalam hal tagging tanah, sementara yang bersangkutan sedang pemeriksaan tanah, menunggu yang bersangkutan dalam hal teknis <br />\r\n2. telah koordinasi dengan saudara adhy dalam hal sertipikat (jika sudah sertipikat) dan bagi yang belum sertipikat digunakan SPSS, menunggu hasil dari yang bersangkutan', '', '2022-08-30 10:54:09', 'staf.ptu1'),
('000001', '0009', '1', '1', '1', '188_1606_412.013_2022', 1, 'Surat kepada kepala PU BM', '', '2022-08-08 12:12:32', 'staf.ptu1'),
('000001', '0028', '1', '3', '1', '400_4468_412.202_2022', 1, 'siap', '', '2022-08-25 01:01:59', 'staf.hps1'),
('000001', '0034', '1', '3', '1', '400_4468_412.202_2022', 1, 'siap pak', '', '2022-08-25 12:51:47', 'staf.hps1'),
('000001', '0069', '1', '1', '3', '420_1980_412.201_2022', 1, 'Segera Ditindaklanjuti ', '', '2022-09-05 09:06:21', 'staf.ptu3'),
('000001', '0093', '1', '1', '4', '420_2044_412.201_2022', 1, 'Sebagai bahan rekon', '', '2022-09-06 11:13:14', 'staf.ptu4'),
('000001', '0096', '1', '1', '3', '420_2054_412.201_2022', 3, 'Laksanakan', '', '2022-09-13 01:41:14', 'staf.ptu3'),
('000001', '0108', '1', '1', '2', '428_470_412.214_2022', 1, 'baik akan kami cek', '', '2022-09-13 10:45:41', 'staf.ptu2'),
('000001', '0042', '1', '1', '3', '440_4588_412.202_2022', 3, 'Berkas sudah di kirim ke Dinas Kesehatan pada tanggal 26 Agustus 2022', '', '2022-08-30 04:48:50', 'staf.ptu3'),
('000001', '0056', '1', '1', '2', '440_4675A_412.202_2022', 1, 'baik kami cek di SIPD ', '', '2022-08-29 10:47:29', 'staf.ptu2'),
('000001', '0098', '1', '1', '2', '440_4879A_412.202_2022', 1, 'baik kami cek', '', '2022-09-13 10:43:53', 'staf.ptu2'),
('000001', '0055', '1', '2', '2', '510_1560_412.220_2022', 1, 'Siap ditindaklanjuti untuk membuat surat pengantar ke KPKNL Madiun bersama dengan penilaian tanah lainnya', '', '2022-09-07 05:29:56', 'staf.pmf2'),
('000001', '0052', '1', '1', '1', '510_1563_412.220_2022', 2, '1. telah berkoordinasi dengan pihak dinas perdagangan, menurut beliau : Surat Kesediaan Menerima Barang baru akan terbit setelah Dinas Cipta Karya melakukan penelitian terhadap BMD yang akan diserahkan<br />\r\n2. telah berkoordinasi dengan pihak Cipta Karya, menurut beliau : akan dikoordinasikan terlebih dahulu dengan Bidangnya', '', '2022-08-30 10:58:44', 'staf.ptu1'),
('000001', '0078', '1', '1', '2', '520_1980_412.221_2022', 1, 'baik kami proses', '', '2022-09-05 11:12:59', 'staf.ptu2'),
('000001', '0115', '1', '3', '3', '520_2209_412.221_2022', 3, 'sudah saya naikkan ke sekre pak', '', '2022-09-16 04:08:08', 'staf.hps3'),
('000001', '0084', '1', '1', '3', '524_862_412.222_2022', 3, 'Sudah di proses dan update di SIPD', '', '2022-09-05 09:11:18', 'staf.ptu3'),
('000001', '0080', '1', '1', '2', '524__412.222_2022', 1, 'baik kami proses', '', '2022-09-05 12:13:33', 'staf.ptu2'),
('000001', '0049', '1', '1', '2', '530_846_412.218_2022', 1, 'baik pak', '', '2022-08-29 10:41:43', 'staf.ptu2'),
('000001', '0065', '1', '1', '2', '550_1238_412.212_2022', 1, 'Baik kami proses', '', '2022-09-05 10:16:01', 'staf.ptu2'),
('000001', '0019', '1', '1', '2', '551_1092_412.212_2022', 1, 'kami akan cek', '', '2022-08-15 04:32:59', 'staf.ptu2'),
('000001', '0018', '1', '3', '1', '640_1002_412.205_2022', 1, 'siap', '', '2022-08-25 01:00:41', 'staf.hps1'),
('000001', '0013', '1', '3', '1', '640_1011_412.205_2022', 1, 'siap', '', '2022-08-25 12:56:30', 'staf.hps1'),
('000001', '0014', '1', '3', '1', '640_1012_412.205_2022', 1, 'siap', '', '2022-08-25 12:55:51', 'staf.hps1'),
('000001', '0015', '1', '3', '2', '640_1013_412.205_2022', 1, 'Siap laksanakan', '', '2022-09-01 03:22:14', 'staf.hps2'),
('000001', '0053', '1', '2', '2', '640_1126_412.205_2022', 3, 'Sudah didaftarkan pengembalian batas ke BPN dan SPS sudah dibayar, menunggu pengukuran ulang untuk pengembalian batas dari BPN', '', '2022-09-08 05:40:10', 'staf.pmf2'),
('000001', '0002', '1', '2', '3', '650_2199_412.203_2022', 1, 'Siapp buu', '', '2022-07-28 02:54:48', 'staf.pmf3'),
('000001', '0023', '1', '2', '3', '650_2370_412.203_2022', 1, 'Siap Laksanakan Bu Sinta', '', '2022-08-15 05:07:58', 'staf.pmf3'),
('000001', '0029', '1', '2', '1', '650_2432_412.203_2022', 3, 'telah disimpan untuk persyaratan pendaftaran pensertipikatan tanah di BPB', '', '2022-08-15 03:28:17', 'staf.pmf1'),
('000001', '0027', '1', '2', '1', '650_2456_412.203_2022', 3, 'telah disimpan untuk sebagai persyaratan pendaftaran pensertifikatan tanah di BPN', '', '2022-08-15 03:14:56', 'staf.pmf1'),
('000001', '0094', '1', '2', '1', '650_2870_412.203_2022', 3, 'Telah didaftarkan/dikirim sebagai kelengkapan berkas tanah ke BPN', '', '2022-09-09 02:05:21', 'staf.pmf1'),
('000001', '0020', '1', '2', '1', '660_916_412.217_2022', 2, 'File Scan sertipikat hak pakai untuk TPA di Desa Bandungrejo Kec. Ngasem & Desa Banjarsari Kec. Trucuk 2 bidang belum diketemukan, dan untuk di Desa Buntalan Kec. Temayang penggunaan sampai saat ini untuk Bandara Khusus belum ada perubahan serta DLH sudah diberi foto copi Peta bidang tanah, foto copi SHM', '', '2022-08-15 03:35:33', 'staf.pmf1'),
('000001', '0071', '1', '3', '4', '700_1249_412.100_2022', 1, 'siap bapak<br />\r\n', '', '2022-09-14 11:48:58', 'staf.hps4'),
('000001', '0106', '1', '3', '4', '700_1302_412.100_2022', 1, 'siap bapak', '', '2022-09-14 09:11:18', 'staf.hps4'),
('000001', '0100', '1', '1', '2', '791_2755_412.219_2022', 1, 'baik kami cek', '', '2022-09-13 10:44:50', 'staf.ptu2'),
('000001', '0059', '1', '1', '1', '800_1781_412.213_2022', 3, 'Telah Diinput di SIPD', '', '2022-09-06 11:59:33', 'staf.ptu1'),
('000001', '0030', '1', '3', '2', '840_1057__412.205_2022', 1, 'Siap Laksanakan', '', '2022-09-01 03:24:41', 'staf.hps2'),
('000001', '0010', '1', '3', '2', '893_23182_Keuda', 3, 'sudah berakhir', '', '2022-09-01 03:20:49', 'staf.hps2'),
('000001', '0087', '1', '1', '3', '900_1156_412.205_2022', 3, 'Sudah di proses dan update standar harga di SIPD TA 2022', '', '2022-09-05 09:12:17', 'staf.ptu3'),
('000001', '0048', '1', '1', '2', '900_1186_412.212_2022', 1, 'baik pak', '', '2022-08-29 10:41:53', 'staf.ptu2'),
('000001', '0102', '1', '1', '4', '900_1589_412.202.40_2022', 1, 'Sudah dilaksanakan', '', '2022-09-15 08:46:04', 'staf.ptu4'),
('000001', '0111', '1', '1', '4', '900_1671_412.404_2022', 1, 'Siap dilaksanakan', '', '2022-09-15 08:46:49', 'staf.ptu4'),
('000001', '0089', '1', '1', '2', '900_546_412.210_2022', 1, 'Sudah dilakukan input di SIPD laporan bukti sedang disiapkan', '', '2022-09-05 11:10:48', 'staf.ptu2'),
('000001', '0083', '1', '1', '2', '900_597_412.210_2022', 1, 'Sudah dilakukan input di SIPD laporan bukti sedang disiapkan', '', '2022-09-05 11:11:08', 'staf.ptu2'),
('000001', '0026', '1', '1', '2', '906_2420_412.209_2022', 1, 'siap kami  cek di sipd', '', '2022-08-16 09:46:15', 'staf.ptu2'),
('000001', '0047', '1', '2', '4', '970_1798_412.304_2022', 1, 'Siap', '', '2022-08-30 09:32:37', 'staf.pmf4'),
('000001', '0072', '1', '1', '2', '970_1964_412.304_2022', 1, 'kami proses', '', '2022-09-05 10:20:15', 'staf.ptu2'),
('000001', '0086', '1', '2', '2', 'B_1159_VIII_2022', 1, 'Siap untuk menunggu dispo', '', '2022-09-08 05:50:03', 'staf.pmf2'),
('000001', '0011', '1', '2', '1', 'NT.01.02_1502-35.22_VII_2022', 3, 'Sudah diarsip', '', '2022-08-05 04:26:31', 'staf.pmf1'),
('000001', '0092', '1', '3', '4', 'S-1170_KNL.1006_2022', 1, 'siap bapak', '', '2022-09-13 10:09:49', 'staf.hps4'),
('000001', '0006', '1', '3', '1', 'S-918_KNL.1006_2022', 1, 'siap', '', '2022-08-25 01:04:42', 'staf.hps1'),
('000001', '0050', '1', '1', '2', 'UM.0102-CA_419', 1, 'Baik kami ikuti acara tersebut', '', '2022-08-29 10:34:18', 'staf.ptu2'),
('000001', '0095', '1', '1', '4', 'UM0102_BB8_1444', 1, 'Sudah dilaksanakan', '', '2022-09-15 08:45:01', 'staf.ptu4'),
('000002', '0001', '1', '1', '4', '005_2067_412.302_2022', 3, 'Selesai', '000002-005_2067_412.302_2022-staf.pdf', '2022-08-29 03:34:16', 'staf.ptu4'),
('000002', '0003', '1', '1', '4', '005_2239_412.203_2022', 3, 'Selesai', '000002-005_2239_412.203_2022-staf.pdf', '2022-08-01 09:01:50', 'staf.ptu4'),
('000002', '0004', '1', '1', '2', '005_23169_Keuda', 3, 'Terlampir Hasil Rapat 25 Juli 2022', '000002-005_23169_Keuda-staf.pdf', '2022-07-28 04:55:50', 'staf.ptu2'),
('000002', '0037', '1', '2', '2', '005_25012_Keuda', 3, 'Telah dihadiri dan dilakukan dengan penuh tanggung jawab', '000002-005_25012_Keuda-staf.jpeg', '2022-09-07 05:09:22', 'staf.pmf2'),
('000002', '0109', '1', '1', '1', '005_804_412.208_2022', 3, '-', '000002-005_804_412.208_2022-staf.pdf', '2022-09-15 09:01:04', 'staf.ptu1'),
('000002', '0005', '1', '1', '1', '027_962_412.031_2022', 3, 'Tanda tangan yang bersangkutan', '', '2022-08-02 05:01:54', 'staf.ptu1'),
('000002', '0057', '1', '1', '3', '028_1889_412.050_2022', 3, 'Sudah di masukkan ke dalam Draf SK Perubahan Pengurus Barang  Nomor : 188/90/KEP/412.013/2022', '', '2022-09-08 11:15:13', 'staf.ptu3'),
('000002', '0032', '1', '2', '3', '028_2469_412.203_2022', 3, 'siap sudah dikerjakan', '000002-028_2469_412.203_2022-staf.jpeg', '2022-09-07 05:10:35', 'staf.pmf3'),
('000002', '0036', '1', '2', '3', '028_2554_412.203_2022', 3, 'siap sudah dikerjakan', '000002-028_2554_412.203_2022-staf.jpeg', '2022-09-07 05:11:05', 'staf.pmf3'),
('000002', '0035', '1', '2', '3', '028_2559_412.203_2022', 3, 'siap sudah dikerjakan', '000002-028_2559_412.203_2022-staf.jpeg', '2022-09-07 05:10:51', 'staf.pmf3'),
('000002', '0039', '1', '2', '3', '028_2569_412.203_2022', 3, 'siap sudah dikerjakan', '000002-028_2569_412.203_2022-staf.jpeg', '2022-09-07 05:11:47', 'staf.pmf3'),
('000002', '0054', '1', '2', '3', '028_2651_412.203_2022', 3, 'telah dikerjakan', '000002-028_2651_412.203_2022-staf.jpeg', '2022-09-07 05:12:40', 'staf.pmf3'),
('000002', '0051', '1', '2', '3', '028_2677_412.203_2022', 3, 'telah dikerjakan', '000002-028_2677_412.203_2022-staf.jpeg', '2022-09-07 05:12:22', 'staf.pmf3'),
('000002', '0075', '1', '2', '3', '028_2818_412.203_2022', 3, 'siap sudah dikerjakan', '000002-028_2818_412.203_2022-staf.jpeg', '2022-09-07 05:10:10', 'staf.pmf3'),
('000002', '0114', '1', '1', '1', '032_1094_412.218_2022', 3, 'telah diarsip', '000002-032_1094_412.218_2022-staf.pdf', '2022-09-16 04:17:42', 'staf.ptu1'),
('000002', '0079', '1', '1', '4', '032_1245_412.212_2022', 3, 'Sudah dibendel dan direkap', '000002-032_1245_412.212_2022-staf.pdf', '2022-09-06 01:43:00', 'staf.ptu4'),
('000002', '0088', '1', '1', '4', '032_1663_412.206_2022', 3, 'Sudah dibendel dan direkap', '000002-032_1663_412.206_2022-staf.pdf', '2022-09-06 01:42:35', 'staf.ptu4'),
('000002', '0101', '1', '1', '1', '032_1680_412.206_2022', 3, 'scan pakta digital bisa dilihat pada link : https://bit.ly/pakta_integritas_2022', '000002-032_1680_412.206_2022-staf.pdf', '2022-09-14 09:31:32', 'staf.ptu1'),
('000002', '0077', '1', '1', '2', '032_1827_412.213_2022', 3, 'sudah dilakukan input di SIPD', '000002-032_1827_412.213_2022-staf.pdf', '2022-09-07 04:38:18', 'staf.ptu2'),
('000002', '0076', '1', '1', '2', '032_1833_412.213_2022', 3, 'telah dilaksanakan', '000002-032_1833_412.213_2022-staf.pdf', '2022-09-07 04:28:18', 'staf.ptu2'),
('000002', '0099', '1', '1', '2', '032_1855_412.213_2022', 3, 'telah dilakukan penyesuaian di SIPD terimakasih', '000002-032_1855_412.213_2022-staf.pdf', '2022-09-13 02:36:03', 'staf.ptu2'),
('000002', '0103', '1', '1', '1', '032_382_412.011_2022', 3, 'untuk mempermudah manajemen file, cek dokumen disimpan pada google drive dan dapat dilihat pada link : https://bit.ly/cek_dokumen_kdp_2021', '000002-032_382_412.011_2022-staf.pdf', '2022-09-14 09:34:04', 'staf.ptu1'),
('000002', '0082', '1', '1', '4', '032_565_412.422_2022', 3, 'Sudah dibendel dan direkap', '000002-032_565_412.422_2022-staf.pdf', '2022-09-06 01:42:47', 'staf.ptu4'),
('000002', '0058', '1', '1', '4', '032_601_412.216_2022', 3, 'Sudah dibendel dan direkap', '000002-032_601_412.216_2022-staf.pdf', '2022-09-06 01:43:15', 'staf.ptu4'),
('000002', '0090', '1', '1', '2', '050_1059_412.217_2022', 3, 'telah dilakukan penyesuaian di SIPD untuk pengajuan SSH tersebut', '000002-050_1059_412.217_2022-staf.pdf', '2022-09-07 03:37:42', 'staf.ptu2'),
('000002', '0074', '1', '1', '1', '050_2855_412.203_2022', 3, 'telah selesai diinput', '000002-050_2855_412.203_2022-staf.pdf', '2022-09-15 08:56:07', 'staf.ptu1'),
('000002', '0073', '1', '1', '3', '050_545_412.204_2022', 3, 'Sudah di INPUT', '000002-050_545_412.204_2022-staf.pdf', '2022-09-08 11:26:39', 'staf.ptu3'),
('000002', '0016', '1', '1', '2', '050_654_412.208_2022', 3, 'Telah kami lakukan insert di SIPD', '000002-050_654_412.208_2022-staf.pdf', '2022-08-15 08:35:09', 'staf.ptu2'),
('000002', '0012', '1', '1', '2', '090_1568_412.207_2022', 3, 'Telah dilakukan input sesuai dengan Surat tsb di atas', '000002-090_1568_412.207_2022-staf.pdf', '2022-08-11 02:44:04', 'staf.ptu2'),
('000002', '0022', '1', '1', '1', '188_1170_412.031_2022', 2, 'progress penelitian titik koordinat per 16 september 2022<br />\r\n-19 bidang telah di tag <br />\r\n-03 bidang perlu di cek lokasi fisiknya<br />\r\n-08 bidang telah ditemukan sertipikatnya<br />\r\n-23 bidang belum dilakukan penelitian<br />\r\n-<br />\r\n', '000002-188_1170_412.031_2022-staf.pdf', '2022-09-16 04:23:46', 'staf.ptu1'),
('000002', '0009', '1', '1', '1', '188_1606_412.013_2022', 3, 'sudah dicatat', '000002-188_1606_412.013_2022-staf.pdf', '2022-08-25 09:04:22', 'staf.ptu1'),
('000002', '0069', '1', '1', '3', '420_1980_412.201_2022', 3, 'Sudah di masukkan ke dalam Draf SK Perubahan Pengurus Barang Nomor : 188/90/KEP/412.013/2022', '', '2022-09-08 11:19:02', 'staf.ptu3'),
('000002', '0093', '1', '1', '4', '420_2044_412.201_2022', 3, 'Sudah dibendel', '000002-420_2044_412.201_2022-staf.pdf', '2022-09-06 01:42:02', 'staf.ptu4'),
('000002', '0108', '1', '1', '2', '428_470_412.214_2022', 3, 'telah dilakukan penyesuaian di SIPD', '000002-428_470_412.214_2022-staf.pdf', '2022-09-13 01:53:56', 'staf.ptu2'),
('000002', '0042', '1', '1', '3', '440_4588_412.202_2022', 3, 'Di terima oleh pegawai RSUD R. Sosodoro tanggal 26 Agustus 2022', '000002-440_4588_412.202_2022-staf.pdf', '2022-08-30 04:52:09', 'staf.ptu3'),
('000002', '0056', '1', '1', '2', '440_4675A_412.202_2022', 3, 'Telah dilakukan insert di SIPD ', '000002-440_4675A_412.202_2022-staf.pdf', '2022-09-05 10:41:24', 'staf.ptu2'),
('000002', '0098', '1', '1', '2', '440_4879A_412.202_2022', 3, 'telah disesuaikan di SIPD', '000002-440_4879A_412.202_2022-staf.pdf', '2022-09-15 03:32:07', 'staf.ptu2'),
('000002', '0052', '1', '1', '1', '510_1563_412.220_2022', 3, 'data dari cipta karya', '000002-510_1563_412.220_2022-staf.pdf', '2022-09-15 08:59:24', 'staf.ptu1'),
('000002', '0078', '1', '1', '2', '520_1980_412.221_2022', 3, 'telah disesuaikan di SIPD', '000002-520_1980_412.221_2022-staf.pdf', '2022-09-05 05:52:15', 'staf.ptu2'),
('000002', '0115', '1', '3', '3', '520_2209_412.221_2022', 3, 'sudah NAIK KE SEKRE', '000002-520_2209_412.221_2022-staf.pdf', '2022-09-16 04:13:00', 'staf.hps3'),
('000002', '0084', '1', '1', '3', '524_862_412.222_2022', 3, 'Sudah di input', '000002-524_862_412.222_2022-staf.pdf', '2022-09-08 11:44:02', 'staf.ptu3'),
('000002', '0080', '1', '1', '2', '524__412.222_2022', 3, 'telah disesuaikan di SIPD', '000002-524__412.222_2022-staf.pdf', '2022-09-05 05:40:05', 'staf.ptu2'),
('000002', '0065', '1', '1', '2', '550_1238_412.212_2022', 3, 'telah dilakukan penyesuaian di SIPD modul SBU', '000002-550_1238_412.212_2022-staf.pdf', '2022-09-05 04:29:08', 'staf.ptu2'),
('000002', '0019', '1', '1', '2', '551_1092_412.212_2022', 3, 'sudah dilakukan pengecekan di SIPD', '000002-551_1092_412.212_2022-staf.pdf', '2022-08-18 09:28:44', 'staf.ptu2'),
('000002', '0053', '1', '2', '2', '640_1126_412.205_2022', 3, 'Tahap selanjutnya menunggu jadwal pengukuran ulang untuk pengembalian batas dari BPN', '000002-640_1126_412.205_2022-staf.pdf', '2022-09-09 09:53:44', 'staf.pmf2'),
('000002', '0071', '1', '3', '4', '700_1249_412.100_2022', 3, 'hasil revieu telah discan dan diarsipkan dengan baik ', '000002-700_1249_412.100_2022-staf.pdf', '2022-09-16 09:41:32', 'staf.hps4'),
('000002', '0106', '1', '3', '4', '700_1302_412.100_2022', 3, 'Telah selesai dilaksanakan untuk diarsipkan dengan baik ', '000002-700_1302_412.100_2022-staf.pdf', '2022-09-14 12:22:13', 'staf.hps4'),
('000002', '0100', '1', '1', '2', '791_2755_412.219_2022', 3, 'Telah dilakukan penyesuaian di SIPD', '000002-791_2755_412.219_2022-staf.pdf', '2022-09-15 09:11:14', 'staf.ptu2'),
('000002', '0059', '1', '1', '1', '800_1781_412.213_2022', 3, '-', '000002-800_1781_412.213_2022-staf.pdf', '2022-09-15 08:58:11', 'staf.ptu1'),
('000002', '0087', '1', '1', '3', '900_1156_412.205_2022', 3, 'Sudah di input ', '000002-900_1156_412.205_2022-staf.pdf', '2022-09-08 11:47:08', 'staf.ptu3'),
('000002', '0048', '1', '1', '2', '900_1186_412.212_2022', 3, 'telah dilakukan penyesuaian SBU di SIPD', '000002-900_1186_412.212_2022-staf.pdf', '2022-09-01 08:16:18', 'staf.ptu2'),
('000002', '0089', '1', '1', '2', '900_546_412.210_2022', 3, 'telah dilakukan input data di SIPD', '000002-900_546_412.210_2022-staf.pdf', '2022-09-07 04:44:55', 'staf.ptu2'),
('000002', '0083', '1', '1', '2', '900_597_412.210_2022', 3, 'telah dilakukan pengecekan dan menggunakan Harga pada usulan sebelumnya, tidak memerlukan UPDATE SIPD', '000002-900_597_412.210_2022-staf.pdf', '2022-09-13 03:11:34', 'staf.ptu2'),
('000002', '0026', '1', '1', '2', '906_2420_412.209_2022', 3, 'Telah dilakukan input di SIPD kecuali SBU yang telah di koordinasikan oleh ka subbid ke bagian pembangunan', '000002-906_2420_412.209_2022-staf.pdf', '2022-08-26 02:24:59', 'staf.ptu2'),
('000002', '0072', '1', '1', '2', '970_1964_412.304_2022', 3, 'Telah dilakukan penyesuaian di SIPD terkait surat tersebut', '000002-970_1964_412.304_2022-staf.pdf', '2022-09-12 08:26:13', 'staf.ptu2'),
('000002', '0092', '1', '3', '4', 'S-1170_KNL.1006_2022', 3, 'pelaksanaan lelang telah dihadiri pak', '000002-S-1170_KNL.1006_2022-staf.pdf', '2022-09-15 10:24:37', 'staf.hps4'),
('000002', '0050', '1', '1', '2', 'UM.0102-CA_419', 3, 'kegiatan telah dilaksanakan', '000002-UM.0102-CA_419-staf.pdf', '2022-08-29 12:48:45', 'staf.ptu2'),
('000003', '0005', '1', '1', '1', '027_962_412.031_2022', 3, 'Revisi 12/08/2022', '', '2022-08-12 10:20:40', 'staf.ptu1'),
('000003', '0057', '1', '1', '3', '028_1889_412.050_2022', 3, 'Done', '000003-028_1889_412.050_2022-staf.pdf', '2022-09-13 01:46:11', 'staf.ptu3'),
('000003', '0069', '1', '1', '3', '420_1980_412.201_2022', 3, 'Laksanakan', '000003-420_1980_412.201_2022-staf.pdf', '2022-09-13 01:46:36', 'staf.ptu3'),
('000004', '0005', '1', '1', '1', '027_962_412.031_2022', 3, '.', '', '2022-08-15 11:23:25', 'staf.ptu1'),
('000005', '0005', '1', '1', '1', '027_962_412.031_2022', 3, 'telah di tandatangani kepala bagian umum tanggal 06 september 2022', '000005-027_962_412.031_2022-staf.pdf', '2022-09-06 11:56:50', 'staf.ptu1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_isidispo`
--

CREATE TABLE `t_apms_isidispo` (
  `id_isidispo` int(1) NOT NULL,
  `isi_disposisi` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_isidispo`
--

INSERT INTO `t_apms_isidispo` (`id_isidispo`, `isi_disposisi`) VALUES
(1, 'arsip / file / udk'),
(2, 'diketahui'),
(3, 'hadiri'),
(4, 'kajian telaah'),
(5, 'sebagai referensi'),
(6, 'tindaklanjuti sesuai perundang-undangan'),
(7, 'tugaskan staf'),
(8, 'bahan usulan sk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_jabatan`
--

CREATE TABLE `t_apms_jabatan` (
  `id_jab` varchar(2) COLLATE utf8_bin NOT NULL,
  `ket_jab` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_jabatan`
--

INSERT INTO `t_apms_jabatan` (`id_jab`, `ket_jab`) VALUES
('1', 'kepala badan'),
('2', 'kepala bidang'),
('3', 'kepala sub bidang'),
('4', 'staf'),
('5', 'operator'),
('9', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_opd`
--

CREATE TABLE `t_apms_opd` (
  `id_opd` varchar(3) COLLATE utf8_bin NOT NULL,
  `nm_opd` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_opd`
--

INSERT INTO `t_apms_opd` (`id_opd`, `nm_opd`) VALUES
('001', 'sekretariat daerah'),
('002', 'inspektorat'),
('003', 'badan pengelolaan keuangan dan aset daerah'),
('004', 'dinas pendidikan'),
('005', 'badan kepegawaian, pendidikan dan pelatihan'),
('006', 'badan kesatuan bangsa, politik dan perlindungan masyarakat'),
('007', 'badan penanggulangan bencana daerah'),
('008', 'badan pendapatan daerah'),
('009', 'badan perencanaan pembangunan daerah'),
('010', 'dinas kebudayaan dan pariwisata'),
('011', 'dinas kepemudaan dan olahraga'),
('012', 'dinas kependudukan dan catatan sipil'),
('013', 'dinas kesehatan'),
('014', 'dinas ketahanan pangan dan pertanian'),
('015', 'dinas komunikasi dan informatika'),
('016', 'dinas koperasi dan usaha mikro'),
('017', 'dinas lingkungan hidup'),
('018', 'dinas pekerjaan umum bina marga dan penataan ruang'),
('019', 'dinas pekerjaan umum sumber daya air'),
('020', 'dinas pemadam kebakaran'),
('021', 'dinas pemberdayaan masyarakat dan desa'),
('022', 'dinas pemberdayaan perempuan, perlindungan anak dan keluarga'),
('023', 'dinas penanaman modal dan pelayanan terpadu satu pintu'),
('024', 'dinas perumahan, kawasan pemukiman dan cipta karya'),
('025', 'dinas perdagangan'),
('026', 'dinas perhubungan'),
('027', 'dinas perindustrian dan tenaga kerja'),
('028', 'dinas perpustakaan dan kearsipan'),
('030', 'dinas perumahan, kawasan permukiman dan cipta karya'),
('031', 'dinas peternakan dan perikanan'),
('032', 'dinas sosial'),
('033', 'kecamatan balen'),
('034', 'kecamatan baureno'),
('035', 'kecamatan bojonegoro'),
('036', 'kecamatan bubulan'),
('037', 'kecamatan dander'),
('038', 'kecamatan gayam'),
('039', 'kecamatan gondang'),
('040', 'kecamatan kalitidu'),
('041', 'kecamatan kanor'),
('042', 'kecamatan kapas'),
('043', 'kecamatan kasiman'),
('044', 'kecamatan kedungadem'),
('045', 'kecamatan kepohbaru'),
('046', 'kecamatan malo'),
('047', 'kecamatan margomulyo'),
('048', 'kecamatan ngambon'),
('049', 'kecamatan ngasem'),
('050', 'kecamatan ngasem'),
('051', 'kecamatan ngraho'),
('052', 'kecamatan padangan'),
('053', 'kecamatan purwosari'),
('054', 'kecamatan sekar'),
('055', 'kecamatan sugihwaras'),
('056', 'kecamatan sukosewu'),
('057', 'kecamatan sumberrejo'),
('058', 'kecamatan tambakrejo'),
('059', 'kecamatan temayang'),
('060', 'kecamatan trucuk'),
('061', 'kelurahan banjarejo'),
('062', 'kelurahan jetak'),
('063', 'kelurahan kadipaten'),
('064', 'kelurahan karang pacar'),
('065', 'kelurahan kepatihan'),
('066', 'kelurahan klangon'),
('067', 'kelurahan ledok kulon'),
('068', 'kelurahan ledok wetan'),
('069', 'kelurahan mojokampung'),
('070', 'kelurahan ngrowo'),
('071', 'rsud kelas b dr. r. sosodoro djatikoesoemo bojonegoro'),
('072', 'rsud kelas d padangan'),
('073', 'rsud kelas d sumberejo'),
('074', 'satuan polisi pamong praja'),
('075', 'sekretariat dewan'),
('076', 'kecamatan kedewan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_project`
--

CREATE TABLE `t_apms_project` (
  `id_project` varchar(4) COLLATE utf8_bin NOT NULL,
  `id_bidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_subbidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_staff` varchar(2) COLLATE utf8_bin NOT NULL,
  `no_surat` text COLLATE utf8_bin NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_terima` datetime NOT NULL,
  `pengirim` varchar(3) COLLATE utf8_bin NOT NULL,
  `judul` text COLLATE utf8_bin NOT NULL,
  `status` varchar(4) COLLATE utf8_bin NOT NULL,
  `lampiran` text COLLATE utf8_bin NOT NULL,
  `id_isidispo` int(1) NOT NULL,
  `sifat` int(1) NOT NULL,
  `no_agenda` varchar(8) COLLATE utf8_bin NOT NULL,
  `userid` varchar(25) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_project`
--

INSERT INTO `t_apms_project` (`id_project`, `id_bidang`, `id_subbidang`, `id_staff`, `no_surat`, `tgl_surat`, `tgl_terima`, `pengirim`, `judul`, `status`, `lampiran`, `id_isidispo`, `sifat`, `no_agenda`, `userid`) VALUES
('0001', '1', '1', '4', '005_2067_412.302_2022', '2022-07-15', '2022-07-21 11:18:42', '001', 'Undangan Penyampaian Usulan Program Kota Tanpa Kumuh (KOTAKU)', '1010', '00011-005_2067_412.302_2022.pdf', 3, 1, '399', 'opr.aset'),
('0002', '1', '2', '3', '650_2199_412.203_2022', '2022-07-20', '2022-07-25 17:09:53', '018', 'Informasi Rencana Tata Ruang', '1005', '00021-650_2199_412.203_2022.pdf', 5, 1, '402', 'opr.aset'),
('0003', '1', '1', '4', '005_2239_412.203_2022', '2022-07-25', '2022-07-25 17:11:18', '001', 'Undangan 26 Juli 2022', '1010', '00031-005_2239_412.203_2022.pdf', 3, 1, '403', 'opr.aset'),
('0004', '1', '1', '2', '005_23169_Keuda', '2022-07-22', '2022-07-25 17:12:55', '001', 'Surat dari Kemendagri - Undangan Rapat Zoom tgl. 25 Juli 2022', '1009', '00041-005_23169_Keuda.pdf', 6, 4, '404', 'opr.aset'),
('0005', '1', '1', '1', '027_962_412.031_2022', '2022-07-21', '2022-07-25 17:14:54', '001', 'Nota Dinas dari Bagian Umum tentang Permohonan Persetujuan Bupati Bojonegoro atas Pengalihan Status Penggunaan Barang Milik Daerah', '1010', '00051-027_962_412.031_2022.pdf', 6, 1, '405', 'opr.aset'),
('0006', '1', '3', '1', 'S-918_KNL.1006_2022', '2022-07-26', '2022-07-28 11:59:50', '001', 'Surat dari KPKN dan Lelang Madiun tentang Penetapan Jadwal Lelang', '1005', '00061-S-918_KNL.1006_2022.pdf', 6, 4, '406', 'opr.aset'),
('0007', '1', '2', '2', '0', '2022-07-06', '2022-07-29 10:19:19', '001', 'Permohonan Pengembalian Tanah Waris', '1005', '00071-0.pdf', 5, 4, '407', 'opr.aset'),
('0008', '1', '3', '1', '640_1002_412.205_2022', '2022-07-28', '2022-07-29 10:20:47', '030', 'Penghapusan Aset Gedung dan Sarana Prasarana Aset Gedung Kantor Bojonegoro Creative Hub', '1004', '00081-640_1002_412.205_2022.pdf', 6, 1, '408', 'opr.aset'),
('0009', '1', '1', '1', '188_1606_412.013_2022', '2022-07-29', '2022-07-29 15:05:32', '001', 'Kajian Hukum Telaah atas Laporan Hasil Penilaian Internal Penaksir Barang Milik Daerah dr. Suharso', '1010', '00091-188_1606_412.013_2022.pdf', 6, 3, '409', 'opr.aset'),
('0010', '1', '3', '2', '893_23182_Keuda', '2022-07-22', '2022-07-29 16:34:33', '001', 'Surat  Kemendagri Dirjen Bina Keuangan Daerah - Pelatihan Penilaian Barang Milik Daerah', '1005', '00101-893_23182_Keuda.pdf', 6, 3, '410', 'opr.aset'),
('0011', '1', '2', '1', 'NT.01.02_1502-35.22_VII_2022', '2022-07-29', '2022-08-01 14:47:12', '001', 'Surat dari BPN Kab. Bojonegoro - Undangan Rapat Tim Gugus Tugas Reforma Agraria (GTRA)', '1005', '00111-NT.01.02_1502-35.22_VII_2022.pdf', 6, 1, '411', 'opr.aset'),
('0012', '1', '1', '2', '090_1568_412.207_2022', '2022-07-29', '2022-08-01 14:58:16', '020', 'Daftar Usulan SSH P-APBD TA 2022', '1010', '00121-090_1568_412.207_2022.pdf', 6, 4, '412', 'opr.aset'),
('0013', '1', '3', '1', '640_1011_412.205_2022', '2022-08-01', '2022-08-03 14:47:34', '024', 'Pemberitahuan Pembongkaran', '1005', '00131-640_1011_412.205_2022.pdf', 6, 1, '413', 'opr.aset'),
('0014', '1', '3', '1', '640_1012_412.205_2022', '2022-08-01', '2022-08-03 14:48:53', '024', 'Pemberitahuan Pembongkaran', '1005', '00141-640_1012_412.205_2022.pdf', 6, 1, '414', 'opr.aset'),
('0015', '1', '3', '2', '640_1013_412.205_2022', '2022-08-01', '2022-08-03 14:50:06', '024', 'Pemberitahuan Pembongkaran', '1005', '00151-640_1013_412.205_2022.pdf', 6, 1, '415', 'opr.aset'),
('0016', '1', '1', '2', '050_654_412.208_2022', '2022-08-02', '2022-08-04 09:53:19', '074', 'Usulan Standart Satuan Harga (SSH) untuk P-APBD TA. 2022', '1010', '00161-050_654_412.208_2022.pdf', 6, 3, '416', 'opr.aset'),
('0017', '1', '3', '1', '005_2422_412.219_2022', '2022-08-02', '2022-08-04 09:54:40', '010', 'undangan 3 Agustus 2022', '1005', '00171-005_2422_412.219_2022.pdf', 3, 1, '417', 'opr.aset'),
('0018', '1', '3', '1', '640_1002_412.205_2022', '2022-07-28', '2022-08-04 10:10:56', '024', 'Penghapusan Aset Gedung dan Sarana Prasarana Aset Gedung Kantor Creative Hub', '1005', '00181-640_1002_412.205_2022.pdf', 6, 1, '418', 'opr.aset'),
('0019', '1', '1', '2', '551_1092_412.212_2022', '2022-08-02', '2022-08-04 10:18:16', '026', 'Permohonan Input Standart Satuan Harga (SSH) TA. 2022', '1009', '00191-551_1092_412.212_2022.pdf', 6, 1, '419', 'opr.aset'),
('0020', '1', '2', '1', '660_916_412.217_2022', '2022-08-02', '2022-08-04 10:19:06', '017', 'Permohonan', '1005', '00201-660_916_412.217_2022.pdf', 6, 1, '420', 'opr.aset'),
('0021', '1', '3', '1', '032_1309_412.303_2022', '2022-08-02', '2022-08-05 11:25:27', '003', 'Nota Dinas Kajian tentang Permohonan Persetujuan Pembongkaran Aset Tetap Dinas Pendidikan Kabupaten Bojonegoro Tahun 2022', '1005', '00211-032_1309_412.303_2022.pdf', 6, 1, '421', 'opr.aset'),
('0022', '1', '1', '1', '188_1170_412.031_2022', '2022-08-04', '2022-08-05 11:50:03', '001', 'Kajian_Telaah terkait permohonan persetujuan Bupati Bojonegoro atas pengalihan status penggunaan Barang Milik Daerah', '1007', '00221-188_1170_412.031_2022.pdf', 6, 1, '422', 'opr.aset'),
('0023', '1', '2', '3', '650_2370_412.203_2022', '2022-08-02', '2022-08-05 14:13:52', '018', ' Informasi Rencana Tata Ruang', '1005', '00231-650_2370_412.203_2022.pdf', 5, 1, '423', 'opr.aset'),
('0024', '1', '2', '2', '032_1299_412.303_2022', '2022-08-02', '2022-08-05 16:20:37', '003', 'Jadwal Pengajuan Pengukuran', '1005', '00241-032_1299_412.303_2022.pdf', 6, 1, '424', 'opr.aset'),
('0025', '1', '3', '1', '050_1830_412.050_2022', '2022-08-05', '2022-08-08 12:39:02', '075', 'Permohonan Persetujuan Pembongkaran Aset Tetap Gedung DPRD Kab. Bojonegoro', '1005', '00251-050_1830_412.050_2022.pdf', 6, 1, '425', 'opr.aset'),
('0026', '1', '1', '2', '906_2420_412.209_2022', '2022-08-05', '2022-08-08 12:40:14', '022', 'Usulan Penambahan SBU TA 2022', '1010', '00261-906_2420_412.209_2022.pdf', 6, 1, '426', 'opr.aset'),
('0027', '1', '2', '1', '650_2456_412.203_2022', '2022-08-08', '2022-08-10 14:53:54', '018', 'Informasi Rencana Tata Ruang', '1005', '00271-650_2456_412.203_2022.pdf', 6, 1, '427', 'opr.aset'),
('0028', '1', '3', '1', '400_4468_412.202_2022', '2022-08-08', '2022-08-10 14:55:09', '013', 'Permohonan Usulan Penghapusan Barang Milik Daerah (BMD) dalam Bentuk Penjualan dan Pemusnahan', '1005', '00281-400_4468_412.202_2022.pdf', 6, 1, '428', 'opr.aset'),
('0029', '1', '2', '1', '650_2432_412.203_2022', '2022-08-08', '2022-08-10 14:56:04', '018', 'Informasi Rencana Tata Ruang', '1005', '00291-650_2432_412.203_2022.pdf', 6, 1, '429', 'opr.aset'),
('0030', '1', '3', '2', '840_1057__412.205_2022', '2022-08-08', '2022-08-10 14:57:14', '024', 'Permohonan Izin Penerimaan Aset Hasil Pembongkaran ke Gudang Aset Kab. Bojonegoro', '1005', '00301-840_1057__412.205_2022.pdf', 6, 1, '430', 'opr.aset'),
('0031', '1', '3', '1', '050_1030_412.050_2022', '2022-08-04', '2022-08-11 09:46:24', '075', 'Permohonan Persetujuan Pembongkaran Aset Tetap Gedung DPRD Kab. Bojonegoro Tahun Anggaran 2022', '1005', '00311-050_1030_412.050_2022.pdf', 6, 1, '431', 'opr.aset'),
('0032', '1', '2', '3', '028_2469_412.203_2022', '2022-08-09', '2022-08-11 11:11:29', '018', 'Berkas Pengurusan Sertifikat (Lengkap) di Bawah Jalan dari Dinas PU Bina Marga PR', '1009', '00321-028_2469_412.203_2022.pdf', 6, 1, '432', 'opr.aset'),
('0033', '1', '2', '4', '005_970_412.217_2022', '2022-08-10', '2022-08-11 11:22:06', '001', 'Undangan Koordinasi Pembahasan Regulasi Perijinan Laboratorium Lingkungan', '1004', '00331-005_970_412.217_2022.pdf', 3, 3, '433', 'opr.aset'),
('0034', '1', '3', '1', '400_4468_412.202_2022', '2022-08-05', '2022-08-11 11:23:45', '013', 'Permohonan Usulan Penghapusan Barang Milik Daerah (BMD) dalam bentuk Penjualan dan Pemusnahan', '1006', '00341-400_4468_412.202_2022.pdf', 6, 1, '434', 'opr.aset'),
('0035', '1', '2', '3', '028_2559_412.203_2022', '2022-08-12', '2022-08-12 15:42:06', '018', 'Berkas Pengukuran Sertifikat (Lengkap) di Bawah Jalan dari Dinas PU Bina Marga PR', '1009', '00351-028_2559_412.203_2022.pdf', 6, 1, '435', 'opr.aset'),
('0036', '1', '2', '3', '028_2554_412.203_2022', '2022-08-11', '2022-08-15 10:48:14', '018', 'Berkas Pengukuran Sertifikat di Bawah Jalan dari Dinas PU Bina Marga dan PR', '1009', '00361-028_2554_412.203_2022.pdf', 6, 1, '436', 'opr.aset'),
('0037', '1', '2', '2', '005_25012_Keuda', '2022-08-12', '2022-08-15 10:52:45', '001', 'Undangan Rapat dari Direktorat Jenderal Bina Keuangan Daerah tgl. 23 Agustus 2022 - Jakarta', '1009', '00371-005_25012_Keuda.pdf', 3, 4, '437', 'opr.aset'),
('0038', '1', '3', '1', '640_1078_412.205_2022', '2022-08-12', '2022-08-15 11:59:30', '024', 'Izin Pengiriman Aset Hasil Bongkaran ke Gudang Aset Kab. Bojonegoro', '1004', '00381-640_1078_412.205_2022.pdf', 6, 1, '438', 'opr.aset'),
('0039', '1', '2', '3', '028_2569_412.203_2022', '2022-08-15', '2022-08-15 15:04:33', '018', 'Berkas Pengukuran Sertipikat di Bawah Jalan dari DInas PU Bina Marga PR', '1009', '00391-028_2569_412.203_2022.pdf', 6, 4, '439', 'opr.aset'),
('0040', '1', '3', '1', '800_2963_412.202.39_2022', '2022-08-15', '2022-08-15 15:05:37', '072', 'Usulan Pembongkaran Bangunan Gedung RSUD Padangan', '1004', '00401-800_2963_412.202.39_2022.pdf', 6, 1, '440', 'opr.aset'),
('0041', '1', '3', '2', '032_813_412.224_2022', '2022-08-15', '2022-08-16 09:29:56', '031', 'Permohonan Usulan SK Penghapusan Aset Tanah dan Bangunan KPU', '1004', '00411-032_813_412.224_2022.pdf', 6, 1, '441', 'opr.aset'),
('0042', '1', '1', '3', '440_4588_412.202_2022', '2022-08-16', '2022-08-18 10:04:09', '013', 'Surat Permohonan', '1010', '00421-440_4588_412.202_2022.pdf', 6, 1, '442', 'opr.aset'),
('0043', '1', '3', '1', '800_2963_412.202.39_2022', '2022-08-12', '2022-08-18 10:05:52', '072', 'Usulan Pembongkaran Bangunan Gedung RSUD Padangan', '1004', '00431-800_2963_412.202.39_2022.pdf', 6, 1, '443', 'opr.aset'),
('0044', '1', '3', '2', '032_813_412.224_2022', '2022-08-18', '2022-08-22 12:02:09', '031', 'Permohonan Usulan SK Penghapusan Aset Tanah dan Bangunan KPU', '1004', '00441-032_813_412.224_2022.pdf', 6, 1, '444', 'opr.aset'),
('0045', '1', '3', '1', 'S-1034_KNL.1006_2022', '2022-08-15', '2022-08-22 12:04:01', '001', 'Surat dari KPKNL Madiun - Penyampaian Salinan Risalah Lelang No. 317_50_2022', '1004', '00451-S-1034_KNL.1006_2022.pdf', 6, 1, '445', 'opr.aset'),
('0046', '1', '2', '2', '032_1411_412.303_2022', '2022-08-16', '2022-08-22 12:05:03', '003', 'Jadwal Pengajuan Pengukuran', '1005', '00461-032_1411_412.303_2022.pdf', 1, 1, '446', 'opr.aset'),
('0047', '1', '2', '4', '970_1798_412.304_2022', '2022-01-01', '2022-08-22 12:16:42', '001', 'Undangan aparan Akhir Naskah Akademik Raperda PDRD', '1005', '00471-970_1798_412.304_2022.pdf', 1, 1, '447', 'opr.aset'),
('0048', '1', '1', '2', '900_1186_412.212_2022', '2022-08-18', '2022-08-22 12:17:55', '026', 'Usulan Standart Satuan Harga P-APBD TA. 2022', '1010', '00481-900_1186_412.212_2022.pdf', 6, 1, '448', 'opr.aset'),
('0049', '1', '1', '2', '530_846_412.218_2022', '2022-08-18', '2022-08-22 12:18:57', '001', 'Surat dari Sekretariat Presiden - Pemenuhan Belanja APBD Tahun 2022 untuk Peningkatan Penggunaan Produk Dalam Negeri (P3DN)', '1005', '00491-530_846_412.218_2022.pdf', 5, 1, '449', 'opr.aset'),
('0050', '1', '1', '2', 'UM.0102-CA_419', '2022-08-15', '2022-08-22 12:35:36', '001', 'Surat dari Kementerian Pekerjaan Umum dan Perumahan Rakyat  - Undangan Koordinasi Percepatan Serah Terima Aset SPAM IKK Hongaria di Provinsi Jawa Timur', '1010', '00501-UM.0102-CA_419.pdf', 6, 4, '450', 'opr.aset'),
('0051', '1', '2', '3', '028_2677_412.203_2022', '2022-08-22', '2022-08-25 11:32:48', '018', 'Berkas Pengurusan Sertifikat (Lengkap) di Bawah Jalan', '1009', '00511-028_2677_412.203_2022.pdf', 6, 1, '462', 'opr.aset'),
('0052', '1', '1', '1', '510_1563_412.220_2022', '2022-08-24', '2022-08-25 11:40:15', '016', 'Serah Terima BMD Pasar Banjarejo II (Pasar Wisata) Bojonegoro', '1007', '00521-510_1563_412.220_2022.pdf', 6, 1, '461', 'opr.aset'),
('0053', '1', '2', '2', '640_1126_412.205_2022', '2022-08-24', '2022-08-25 11:43:39', '024', 'Permohonan Pengembalian Batas Tanah', '1009', '00531-640_1126_412.205_2022.pdf', 6, 1, '450', 'opr.aset'),
('0054', '1', '2', '3', '028_2651_412.203_2022', '2022-08-22', '2022-08-25 11:46:55', '018', 'Berkas Pengajuan Sertifikat (Lengkap) di Bawah Jalan', '1009', '00541-028_2651_412.203_2022.pdf', 6, 1, '451', 'opr.aset'),
('0055', '1', '2', '2', '510_1560_412.220_2022', '2022-08-23', '2022-08-25 11:55:05', '016', 'Percepatan Appraisal Pasar Daerah Kab. Bojonegoro', '1005', '00551-510_1560_412.220_2022.pdf', 6, 1, '452', 'opr.aset'),
('0056', '1', '1', '2', '440_4675A_412.202_2022', '2022-08-22', '2022-08-25 12:07:14', '013', 'Data Usulan SSH', '1010', '00561-440_4675A_412.202_2022.pdf', 6, 1, '453', 'opr.aset'),
('0057', '1', '1', '3', '028_1889_412.050_2022', '2022-08-22', '2022-08-25 12:11:26', '075', 'Usulan Perubahan Personil Pejabat Pengelola Barang Milik Daerah Tahun Anggaran 2022', '1009', '00571-028_1889_412.050_2022.pdf', 8, 1, '454', 'opr.aset'),
('0058', '1', '1', '4', '032_601_412.216_2022', '2022-08-23', '2022-08-25 12:20:22', '028', 'Usulan Rencana Kebutuhan Barang Milik Daerah TA 2023', '1010', '00581-032_601_412.216_2022.pdf', 6, 1, '455', 'opr.aset'),
('0059', '1', '1', '1', '800_1781_412.213_2022', '2022-08-23', '2022-08-25 12:34:08', '015', 'Permohoan Kendaraan Dinas _ Operasional Lapangan Roda 4', '1007', '00591-800_1781_412.213_2022.pdf', 6, 3, '456', 'opr.aset'),
('0060', '1', '3', '1', '800_834_412.222_2022', '2022-08-23', '2022-08-25 12:46:50', '031', 'Laporan Kehilangan Kendaraan Dinas Roda DUa', '1004', '00601-800_834_412.222_2022.pdf', 6, 1, '457', 'opr.aset'),
('0061', '1', '3', '2', '900_412.408_2022', '2022-08-22', '2022-08-25 12:52:10', '045', 'Pengajuan Proposal Permohonan Hibah Pembangunan Hibah Pembangunan Bekas Polindes Desa Karangan Kec. Kepohbaru Kab. Bojonegoro', '1004', '00611-900_412.408_2022.pdf', 6, 1, '458', 'opr.aset'),
('0062', '1', '3', '1', '640_1024_412.205_2055', '2022-08-19', '2022-08-25 13:03:54', '024', 'Pemberitahuan Mulai Pekerjaan dan Informasi Lokasi Permohonan Timbunan Tanah', '1004', '00621-640_1024_412.205_2055.pdf', 2, 1, '459', 'opr.aset'),
('0063', '1', '3', '1', '800_3125_412.202.39_2022', '2022-08-23', '2022-08-25 13:06:08', '072', 'Usulan Penghapusan Barang Milik Daerah (BMD) melalui prosedur Pemusnahan dan Penjualan', '1004', '00631-800_3125_412.202.39_2022.pdf', 6, 1, '460', 'opr.aset'),
('0064', '1', '2', '2', '032_1968_412.201_2022', '2022-08-25', '2022-08-29 10:52:17', '004', 'Kekurangan berkas Usulan Sertipikat', '1005', '00641-032_1968_412.201_2022.pdf', 6, 1, '463', 'opr.aset'),
('0065', '1', '1', '2', '550_1238_412.212_2022', '2022-08-25', '2022-08-29 10:58:35', '026', 'Usulan Standart Satuan Harga (SSH) P-APBD TA 2022', '1010', '00651-550_1238_412.212_2022.pdf', 6, 1, '467', 'opr.aset'),
('0066', '1', '3', '1', '660_1051_412.217_2022', '2022-08-24', '2022-08-29 11:02:27', '017', 'Nota Dinas  Permohonan Persetujuan Penjualan Limbah Kayu', '1004', '00661-660_1051_412.217_2022.pdf', 6, 1, '465', 'opr.aset'),
('0067', '1', '3', '1', '640_1002_412.205_2022', '2022-08-22', '2022-08-29 11:04:45', '010', 'Permohonan Izin Persetujuan Pembongkaran Gedung Bojonegoro Creative Hub (BCH)', '1004', '00671-640_1002_412.205_2022.pdf', 6, 1, '466', 'opr.aset'),
('0068', '1', '3', '1', '800_3125_412.202.39_2022', '2022-08-22', '2022-08-29 11:07:15', '072', 'Usulan Penghapusan Barang Milik Daerah (BMD) Melalui Prosedur Pemusnahan dan Penjualan', '1005', '00681-800_3125_412.202.39_2022.pdf', 6, 1, '464', 'opr.aset'),
('0069', '1', '1', '3', '420_1980_412.201_2022', '2022-08-29', '2022-08-31 10:22:58', '004', 'Usulan Perubahan SK Pengurus Barang Tahun 2022', '1009', '00691-420_1980_412.201_2022.pdf', 8, 1, '468', 'opr.aset'),
('0070', '1', '2', '2', '0263_EMCL-CPO_2022', '2022-08-24', '2022-08-31 10:24:23', '001', 'Surat dari Exxon Mobil - Permohonan Narasumber Lokakarya Aspek Pertanahan Jalur Pipa Minyak Banyu Urip Kamis 8-9-2022', '1005', '00701-0263_EMCL-CPO_2022.pdf', 2, 1, '469', 'opr.aset'),
('0071', '1', '3', '4', '700_1249_412.100_2022', '2022-08-29', '2022-08-31 10:26:33', '002', 'Reviu atas Usulan Penjualan Barang Milik Daerah Pemerintah Kabupaten Bojonegoro', '1008', '00711-700_1249_412.100_2022.pdf', 6, 1, '470', 'opr.aset'),
('0072', '1', '1', '2', '970_1964_412.304_2022', '2022-08-29', '2022-08-31 10:27:43', '008', 'Copy Nota Dinas Kepala Bapenda kepada Ibu Bupati Bojonegoro', '1010', '00721-970_1964_412.304_2022.pdf', 6, 4, '471', 'opr.aset'),
('0073', '1', '1', '3', '050_545_412.204_2022', '2022-08-30', '2022-09-02 08:36:51', '019', 'Permohonan Penginputan SSH_SBU', '1010', '00731-050_545_412.204_2022.pdf', 6, 1, '472', 'opr.aset'),
('0074', '1', '1', '1', '050_2855_412.203_2022', '2022-08-21', '2022-09-02 08:38:21', '018', 'Usulan Tambahan Standar Harga Pada PAPBD TA 2022', '1007', '00741-050_2855_412.203_2022.pdf', 6, 1, '473', 'opr.aset'),
('0075', '1', '2', '3', '028_2818_412.203_2022', '2022-08-30', '2022-09-02 08:39:25', '018', 'Berkas Pengukuran Sertipikat (Lengkap) di Bawah Jalan', '1010', '00751-028_2818_412.203_2022.pdf', 6, 1, '474', 'opr.aset'),
('0076', '1', '1', '2', '032_1833_412.213_2022', '2022-08-30', '2022-09-02 08:40:35', '015', 'Usulan SSH TA 2022 Dinas Komunikasi dan Informatika', '1010', '00761-032_1833_412.213_2022.pdf', 6, 1, '475', 'opr.aset'),
('0077', '1', '1', '2', '032_1827_412.213_2022', '2022-08-30', '2022-09-02 08:41:39', '015', 'Usulan SSH TA 2022 Dinas Komunikasi dan Informatika', '1010', '00771-032_1827_412.213_2022.pdf', 6, 1, '476', 'opr.aset'),
('0078', '1', '1', '2', '520_1980_412.221_2022', '2022-08-30', '2022-09-02 08:42:40', '014', 'Usulan Tambahan SSH untuk P-APBD Tahun 2022', '1010', '00781-520_1980_412.221_2022.pdf', 6, 1, '477', 'opr.aset'),
('0079', '1', '1', '4', '032_1245_412.212_2022', '2022-08-30', '2022-09-02 08:44:02', '026', 'Usulan Rencana Kebutuhan Barang Milik Daerah (RKBMD) Dinas Perhubungan', '1010', '00791-032_1245_412.212_2022.pdf', 6, 1, '478', 'opr.aset'),
('0080', '1', '1', '2', '524__412.222_2022', '2022-08-30', '2022-09-02 08:45:16', '031', 'Usulan SSH P-APBD Tahun 2022 Dinas Peternakan dan Perikanan', '1010', '00801-524__412.222_2022.pdf', 6, 1, '479', 'opr.aset'),
('0081', '1', '2', '1', 'HP.02.01_1713.35.22_VII_2022', '2022-08-30', '2022-09-02 08:47:24', '001', 'Surat dari Badan Pertanahan Nasional Bojonegoro - Pemberitahuan Kekurangan Berkas ke 1', '1004', '00811-HP.02.01_1713.35.22_VII_2022.pdf', 6, 1, '480', 'opr.aset'),
('0082', '1', '1', '4', '032_565_412.422_2022', '2022-08-31', '2022-09-02 08:51:02', '051', 'Usulan Rencana Kebutuhan Barang Milik Daerah (RKBMD) TA 2023', '1010', '00821-032_565_412.422_2022.pdf', 6, 1, '482', 'opr.aset'),
('0083', '1', '1', '2', '900_597_412.210_2022', '2022-08-31', '2022-09-02 08:51:51', '012', 'Daftar Usulan Standar Satuan Harga (SSH) Tahun 2022', '1010', '00831-900_597_412.210_2022.pdf', 6, 1, '483', 'opr.aset'),
('0084', '1', '1', '3', '524_862_412.222_2022', '2022-08-31', '2022-09-02 08:52:29', '031', 'Usulan HSPK P-APBD Tahun 2022', '1010', '00841-524_862_412.222_2022.pdf', 6, 1, '484', 'opr.aset'),
('0085', '1', '3', '2', 'B_1161_VIII_2022', '2022-09-01', '2022-09-02 18:14:27', '001', 'Permohonan Penerbitan Surat Keterangan Penghapusan Aset Pemkab Bojonegoro', '1004', '00851-B_1161_VIII_2022.pdf', 6, 4, '485', 'opr.aset'),
('0086', '1', '2', '2', 'B_1159_VIII_2022', '2022-09-01', '2022-09-02 18:16:22', '001', 'Surat dari KODIM 0813 - Permohonan Kendaraan Untuk KODIM 0813', '1005', '00861-B_1159_VIII_2022.pdf', 6, 4, '486', 'opr.aset'),
('0087', '1', '1', '3', '900_1156_412.205_2022', '2022-09-01', '2022-09-02 18:17:27', '024', 'Usulan SSH Tahun 2022', '1010', '00871-900_1156_412.205_2022.pdf', 6, 1, '487', 'opr.aset'),
('0088', '1', '1', '4', '032_1663_412.206_2022', '2022-09-01', '2022-09-02 18:18:42', '032', 'Usulan Rencana Kebutuhan Pengadaan Barang Milik Daerah TA 2023', '1010', '00881-032_1663_412.206_2022.pdf', 6, 4, '488', 'opr.aset'),
('0089', '1', '1', '2', '900_546_412.210_2022', '2022-09-01', '2022-09-02 18:20:01', '012', 'Daftar Usulan SSH Tahun 2022', '1010', '00891-900_546_412.210_2022.pdf', 6, 1, '489', 'opr.aset'),
('0090', '1', '1', '2', '050_1059_412.217_2022', '2022-09-01', '2022-09-02 18:21:35', '017', 'Usulan Tambahan SSH _ SBU _ P-APBD 2022', '1010', '00901-050_1059_412.217_2022.pdf', 6, 1, '490', 'opr.aset'),
('0091', '1', '3', '1', '900_4898_412.202_2022', '2022-09-01', '2022-09-02 18:26:51', '013', 'Permohonan Hibah Gedung dan Bangunan Puskesmas Pungpungan Lama, Polindes Karangan Kepohbaru, Polindes Cendono Padangan', '1004', '00911-900_4898_412.202_2022.pdf', 6, 3, '491', 'opr.aset'),
('0092', '1', '3', '4', 'S-1170_KNL.1006_2022', '2022-08-31', '2022-09-02 18:28:22', '001', 'Surat dari KPKNL Madiun -  Penetapan Jadwal Lelang Ulang (6 September 2022)', '1010', '00921-S-1170_KNL.1006_2022.pdf', 6, 1, '492', 'opr.aset'),
('0093', '1', '1', '4', '420_2044_412.201_2022', '2022-09-01', '2022-09-02 18:29:27', '004', 'Program TJSL Renovasi Gedung Sekolah', '1010', '00931-420_2044_412.201_2022.pdf', 2, 1, '493', 'opr.aset'),
('0094', '1', '2', '1', '650_2870_412.203_2022', '2022-09-02', '2022-09-05 08:22:25', '018', 'Informasi Rencana Tata Ruang', '1005', '00941-650_2870_412.203_2022.pdf', 5, 1, '494', 'opr.aset'),
('0095', '1', '1', '4', 'UM0102_BB8_1444', '2022-09-02', '2022-09-05 08:24:24', '001', 'Direktorat Jenderal Bina Marga - Survey Bersama Hibah BMN Berupa Jalan dan Jembatan', '1005', '00951-UM0102_BB8_1444.pdf', 3, 1, '495', 'opr.aset'),
('0096', '1', '1', '3', '420_2054_412.201_2022', '2022-09-05', '2022-09-06 10:28:16', '001', 'Permohonan Narasumber Peningkatan Kapasitas Pengelolaan BOS SD dan SMP Negeri _ Swasta', '1005', '00961-420_2054_412.201_2022.pdf', 1, 1, '502', 'opr.aset'),
('0097', '1', '1', '4', '032_4174.A_412.202.38_2022', '2022-09-05', '2022-09-06 10:44:07', '071', 'Usulan (RKBMD) TA 2023', '1005', '00971-032_4174.A_412.202.38_2022.pdf', 6, 4, '499', 'opr.aset'),
('0098', '1', '1', '2', '440_4879A_412.202_2022', '2022-09-02', '2022-09-06 10:45:47', '013', 'Data Usulan SSH Dinas Kesehatan', '1007', '00981-440_4879A_412.202_2022.pdf', 6, 4, '498', 'opr.aset'),
('0099', '1', '1', '2', '032_1855_412.213_2022', '2022-09-02', '2022-09-06 10:48:14', '015', 'Usulan SSH TA 2022 Dinas Komunikasi dan Informatika', '1010', '00991-032_1855_412.213_2022.pdf', 6, 4, '497', 'opr.aset'),
('0100', '1', '1', '2', '791_2755_412.219_2022', '2022-09-02', '2022-09-06 10:49:36', '010', 'Usulan SSH SBU ASB dan HSPK P-APBD Tahun 2022', '1007', '01001-791_2755_412.219_2022.pdf', 6, 4, '496', 'opr.aset'),
('0101', '1', '1', '1', '032_1680_412.206_2022', '2022-09-02', '2022-09-06 10:51:38', '032', 'Pakta Integritas Barang Milik Daerah Dinas Sosial', '1010', '01011-032_1680_412.206_2022.pdf', 6, 4, '504', 'opr.aset'),
('0102', '1', '1', '4', '900_1589_412.202.40_2022', '2022-09-06', '2022-09-07 12:21:54', '073', ' Mengirim Laporan Hasil Rekonsiliasi Semester 1 BMD RSUD Sumberrejo', '1005', '01021-900_1589_412.202.40_2022.pdf', 6, 1, '505', 'opr.aset'),
('0103', '1', '1', '1', '032_382_412.011_2022', '2022-09-06', '2022-09-07 12:22:52', '001', 'Pengiriman Kelengkapan Dokumen KDP Tahun 2019', '1009', '01031-032_382_412.011_2022.pdf', 6, 4, '506', 'opr.aset'),
('0104', '1', '3', '1', '900_4898_412..202_2022', '2022-09-06', '2022-09-07 12:26:49', '013', 'Permohonan Hibah Gedung dan Bangunan Puskesmas Pungpungan lama, Polindes Karangan Kepohbaru, Polindes Cendono Padangan', '1004', '01041-900_4898_412..202_2022.pdf', 6, 3, '507', 'opr.aset'),
('0105', '1', '1', '2', '0255_EMCL-CPO_2022', '2022-09-07', '2022-09-08 09:47:10', '001', 'Exxonmobil - Undangan Lokakarya Aspek Pertanahan Jalur Pipa Minyak Banyu Urip', '1005', '01051-0255_EMCL-CPO_2022.pdf', 3, 4, '508', 'opr.aset'),
('0106', '1', '3', '4', '700_1302_412.100_2022', '2022-09-07', '2022-09-08 09:49:02', '002', 'Reviu atas Usulan Penjualan Barang Milik Daerah Kabupaten Bojonegoro pada BPKAD', '1010', '01061-700_1302_412.100_2022.pdf', 5, 4, '509', 'opr.aset'),
('0107', '1', '2', '1', 'IP.02.01_1791.31.22_IX_2022', '2022-09-08', '2022-09-09 10:41:11', '001', 'Permohonan Berkas Pemkab Bojonegoro yang Tumpah Tindih (Overlap)', '1004', '01071-IP.02.01_1791.31.22_IX_2022.pdf', 6, 1, '510', 'opr.aset'),
('0108', '1', '1', '2', '428_470_412.214_2022', '2022-09-08', '2022-09-09 10:42:27', '011', 'Penambahan HSPK', '1010', '01081-428_470_412.214_2022.pdf', 6, 1, '511', 'opr.aset'),
('0109', '1', '1', '1', '005_804_412.208_2022', '2022-09-07', '2022-09-09 10:47:13', '074', 'Rekapitulasi Daftar Kehadiran Apel Pagi Karyawan _ Karyawati ASN Bulan Agustus 2022', '1007', '01091-005_804_412.208_2022.pdf', 5, 4, '512', 'opr.aset'),
('0110', '1', '1', '4', '032_516_412.421_2022', '2022-09-08', '2022-09-12 10:02:33', '058', 'Laporan Usulan Rencana Kebutuhan Pemeliharaan Barang Milik Daerah (BMD)', '1005', '01101-032_516_412.421_2022.pdf', 6, 4, '513', 'opr.aset'),
('0111', '1', '1', '4', '900_1671_412.404_2022', '2022-09-09', '2022-09-12 10:03:43', '033', 'Pengiriman Berkas Rekon BMD Per 30 Juni 2022', '1005', '01111-900_1671_412.404_2022.pdf', 6, 4, '514', 'opr.aset'),
('0112', '1', '3', '2', '440_5007_412.202_2022', '2022-09-08', '2022-09-12 16:19:04', '013', 'Permohonan Persetujuan Penghapusan Obat Kadaluarsa Tahun 2021', '1004', '01121-440_5007_412.202_2022.pdf', 6, 1, '515', 'opr.aset'),
('0113', '1', '2', '4', 'UND-93_WKN.10_2022', '2022-09-13', '2022-09-13 11:07:54', '001', 'Kantor Wilayah Direktorat Jenderal Kekayaan Negara - Undangan Sosialisasi 22 September 2022', '1004', '01131-UND-93_WKN.10_2022.pdf', 7, 4, '516', 'opr.aset'),
('0114', '1', '1', '1', '032_1094_412.218_2022', '2022-09-13', '2022-09-13 17:22:31', '025', 'Permohonan Keterangan Asal Usul Tanah', '1007', '01141-032_1094_412.218_2022.pdf', 6, 4, '517', 'opr.aset'),
('0115', '1', '3', '3', '520_2209_412.221_2022', '2022-09-14', '2022-09-14 17:37:00', '014', 'Usulan Surat Keputusan tentang Penghapusan Barang Milik Daerah', '1007', '01151-520_2209_412.221_2022.pdf', 6, 1, '520', 'opr.aset'),
('0116', '1', '3', '2', '640_1216_412.205_2022', '2022-09-14', '2022-09-14 17:39:28', '024', 'Pemberitahuan Bongkaran', '1004', '01161-640_1216_412.205_2022.pdf', 6, 1, '518', 'opr.aset'),
('0117', '1', '1', '', '032_1094__412.218_2022', '2022-09-14', '2022-09-14 17:43:25', '027', 'Permohonan Keterangan Asal Usul Tanah', '1002', '01171-032_1094__412.218_2022.pdf', 6, 1, '519', 'opr.aset'),
('0118', '1', '1', '', '035_824_412.408_2022', '2022-09-16', '2022-09-19 09:24:45', '045', 'Pengiriman Usulan Rencana Kebutuhan Barang Milik Daerah (RKBMD) TA 2023', '1002', '01181-035_824_412.408_2022.pdf', 6, 4, '525', 'opr.aset'),
('0119', '1', '1', '', '032_1743_412.206_2022', '2022-09-16', '2022-09-19 09:31:09', '032', 'Revisi Usulan Rencana Kebutuhan Pengadaan dan Pemeliharaan Barang Milik Daerah TA 2023', '1002', '01191-032_1743_412.206_2022.pdf', 6, 4, '524', 'opr.aset'),
('0120', '1', '3', '', 'S-1268_KNL.1006_2022', '2022-09-16', '2022-09-19 09:33:06', '001', 'Kantor Pelayanan Kekayaan Negara dan Lelang Madiun - Permintaan Konfirmasi Data Pejabat Fungsional Penilai Pemerintah Non DJKN', '1002', '01201-S-1268_KNL.1006_2022.pdf', 6, 4, '523', 'opr.aset'),
('0121', '1', '2', '1', '700_1382_412.100_2022', '2022-09-15', '2022-09-19 09:45:37', '075', 'Rapat Monitoring dan Evaluasi Program MCP KPK-RI Tahun 2022 Pemerintah Kabupaten Bojonegoro', '1004', '01211-700_1382_412.100_2022.pdf', 3, 4, '522', 'opr.aset'),
('0122', '1', '1', '', '032_520_412.415_2022', '2022-09-16', '2022-09-19 10:03:55', '052', 'Usulan Rencana Kebutuhan Barang Milik Daerah TA 2023', '1002', '01221-032_520_412.415_2022.pdf', 6, 4, '526', 'opr.aset'),
('0123', '1', '1', '', '032_455_412.424_2022', '2022-09-16', '2022-09-19 14:15:31', '059', 'Usulan Rencana Kebutuhan Barang Milik Daerah TA 2023', '1002', '01231-032_455_412.424_2022.pdf', 6, 4, '527', 'opr.aset'),
('0124', '1', '', '', 'HP.A2A1_1377.31.22_26', '2022-09-19', '2022-09-20 13:00:03', '001', 'Pemberitahuan Kekurangan Berkas ke II', '1000', '01241-HP.A2A1_1377.31.22_26.pdf', 6, 4, '528', 'opr.aset'),
('0125', '1', '', '', '028_3159_412.203_2022', '2022-09-19', '2022-09-20 13:00:56', '018', 'Berkas Pengurusan Sertifikat (Lengkap) di Bawah Jalan dari Dinas PU Bina Marga PR', '1000', '01251-028_3159_412.203_2022.pdf', 6, 4, '529', 'opr.aset'),
('0126', '1', '', '', '032_2022_412.306_2022', '2022-09-19', '2022-09-20 13:01:50', '007', 'Usulan RKBMD BPBD', '1000', '01261-032_2022_412.306_2022.pdf', 6, 4, '530', 'opr.aset'),
('0127', '1', '3', '', '005_1149_412.217_2022', '2022-09-19', '2022-09-20 13:02:42', '001', 'Undangan, Senin 19 September 2022', '1002', '01271-005_1149_412.217_2022.pdf', 6, 4, '531', 'opr.aset'),
('0128', '1', '', '', '032_110_412.022_2022', '2022-09-19', '2022-09-20 13:03:50', '001', 'Bagian Administrasi Pembangunan - Usulan Rencana Kebutuhan Barang Milik Daerah (RKBMD) TA 2023', '1000', '01281-032_110_412.022_2022.pdf', 6, 4, '532', 'opr.aset'),
('0129', '1', '1', '', '800_527_412.420_2022', '2022-09-19', '2022-09-20 13:04:52', '048', 'Usulan Rencana Kebutuhan Barang Milik Daerah TA 2023', '1002', '01291-800_527_412.420_2022.pdf', 6, 4, '533', 'opr.aset'),
('0130', '1', '2', '4', '061_936_BJ_UM_SRT', '2022-09-19', '2022-09-20 13:05:47', '001', 'Bank Jatim - Penyampaian Kelengkapan Data Atas Permohonan Ijin Tempat Sewa ATM', '1004', '01301-061_936_BJ_UM_SRT.pdf', 6, 4, '534', 'opr.aset'),
('0131', '1', '1', '', 'UND-2_WKN.10_WKN.102_22', '2022-09-15', '2022-09-21 09:35:31', '001', 'Undangan kegiatan coaching clinic pengelolaan BMD_D Selasa 20 Sep 2022', '1002', '01311-UND-2_WKN.10_WKN.102_22.pdf', 7, 4, '535', 'opr.aset');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_respon`
--

CREATE TABLE `t_apms_respon` (
  `id_respon` int(2) NOT NULL,
  `keterangan` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_respon`
--

INSERT INTO `t_apms_respon` (`id_respon`, `keterangan`) VALUES
(1, 'siap ditindaklanjuti'),
(2, 'terjadi kendala teknis'),
(3, 'telah selesai'),
(4, 'setujui'),
(5, 'revisi'),
(6, 'approved'),
(7, 'not approved');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_sifatproject`
--

CREATE TABLE `t_apms_sifatproject` (
  `id_sifatproject` int(1) NOT NULL,
  `keterangan` varchar(25) COLLATE utf8_bin NOT NULL,
  `waktu` varchar(2) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_sifatproject`
--

INSERT INTO `t_apms_sifatproject` (`id_sifatproject`, `keterangan`, `waktu`) VALUES
(1, 'penting', '10'),
(2, 'rahasia', '7'),
(3, 'segera', '5'),
(4, 'biasa', '14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_staf`
--

CREATE TABLE `t_apms_staf` (
  `id_bidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_subbid` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_staf` varchar(2) COLLATE utf8_bin NOT NULL,
  `nm_staf` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_staf`
--

INSERT INTO `t_apms_staf` (`id_bidang`, `id_subbid`, `id_staf`, `nm_staf`) VALUES
('1', '1', '1', 'Staf Bidang Perencanaan dan Penatausahaan 1'),
('1', '1', '2', 'Staf Bidang Perencanaan dan Penatausahaan 2'),
('1', '1', '3', 'Staf Bidang Perencanaan dan Penatausahaan 3'),
('1', '1', '4', 'Staf Bidang Perencanaan dan Penatausahaan 4'),
('1', '2', '1', 'Staf Bidang Penggunaan dan Pemanfaatan 1'),
('1', '2', '2', 'Staf Bidang Penggunaan dan Pemanfaatan 2'),
('1', '2', '3', 'Staf Bidang Penggunaan dan Pemanfaatan 3'),
('1', '2', '4', 'Staf Bidang Penggunaan dan Pemanfaatan 4'),
('1', '3', '1', 'Staf Bidang Bidang Penghapusan dan Pemindahtanganan 1'),
('1', '3', '2', 'Staf Bidang Bidang Penghapusan dan Pemindahtanganan 2'),
('1', '3', '3', 'Staf Bidang Bidang Penghapusan dan Pemindahtanganan 3'),
('1', '3', '4', 'Staf Bidang Bidang Penghapusan dan Pemindahtanganan 4'),
('1', '3', '5', 'Staf Bidang Bidang Penghapusan dan Pemindahtanganan 5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_status`
--

CREATE TABLE `t_apms_status` (
  `id_status` varchar(4) COLLATE utf8_bin NOT NULL,
  `ket_status` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_status`
--

INSERT INTO `t_apms_status` (`id_status`, `ket_status`) VALUES
('1000', 'telah dibuat'),
('1001', 'diterima kepala bidang'),
('1002', 'dikirim kepala bidang'),
('1003', 'diterima kepala sub bidang'),
('1004', 'dikirim kepala sub bidang'),
('1005', 'diterima oleh staf'),
('1006', 'reply progres oleh staf'),
('1007', 'belum validasi atasan'),
('1008', 'validasi pekerjaan oleh atasan'),
('1009', 'not approved / revisi'),
('1010', 'approved / done');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_subbidang`
--

CREATE TABLE `t_apms_subbidang` (
  `id_bidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_subbid` varchar(2) COLLATE utf8_bin NOT NULL,
  `nm_subbid` varchar(100) COLLATE utf8_bin NOT NULL,
  `warna` varchar(15) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_subbidang`
--

INSERT INTO `t_apms_subbidang` (`id_bidang`, `id_subbid`, `nm_subbid`, `warna`) VALUES
('1', '1', 'sub bidang perencanaan dan penatausahaan', '#3455eb'),
('1', '2', 'sub bidang penggunaan dan pemanfaatan', '#eb34dc'),
('1', '3', 'sub bidang penghapusan dan pemindahtanganan', '#34dceb'),
('2', '1', 'sub bidang anggaran 1', ''),
('2', '2', 'sub bidang anggaran 2', ''),
('3', '1', 'sub bidang akt 1', ''),
('3', '2', 'sub bidang akt 2', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_apms_user`
--

CREATE TABLE `t_apms_user` (
  `userid` varchar(25) COLLATE utf8_bin NOT NULL,
  `nama` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` text COLLATE utf8_bin NOT NULL,
  `id_akses` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_bidang` varchar(2) COLLATE utf8_bin NOT NULL,
  `id_subbidang` int(1) NOT NULL,
  `id_staff` int(2) NOT NULL,
  `status` varchar(1) COLLATE utf8_bin NOT NULL,
  `nip` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `t_apms_user`
--

INSERT INTO `t_apms_user` (`userid`, `nama`, `password`, `id_akses`, `id_bidang`, `id_subbidang`, `id_staff`, `status`, `nip`) VALUES
('admin', 'admin', '4297f44b13955235245b2497399d7a93', '9', '0', 0, 0, '0', '9999999999999'),
('kabid.aset', 'ANDI PANCA WARDANA,SE,Ak', '4297f44b13955235245b2497399d7a93', '2', '1', 0, 0, '0', '197710122006041022'),
('opr.aset', 'RAMADHAN SHODIQIN', '4297f44b13955235245b2497399d7a93', '5', '1', 0, 0, '1', '989399047'),
('staf.hps1', 'AGUNG BUDI SANTOSO', '4297f44b13955235245b2497399d7a93', '4', '1', 3, 1, '0', '2585855669'),
('staf.hps2', 'ROBET TRI YULIANTO,A.Md.M', '4297f44b13955235245b2497399d7a93', '4', '1', 3, 2, '0', '199907052022021001'),
('staf.hps3', 'ELVINA APRIYANTI, A.Md.M.', '4297f44b13955235245b2497399d7a93', '4', '1', 3, 3, '1', '200004252022022001'),
('staf.hps4', 'MOCH. ALI FAHMI, S.Tr.IP', '4297f44b13955235245b2497399d7a93', '4', '1', 3, 4, '1', '2000022720220810001'),
('staf.hps5', 'M. IHSAN ROSYADI 2', '4297f44b13955235245b2497399d7a93', '4', '1', 3, 5, '0', '199905072021021002'),
('staf.pmf1', 'SRI PERMADI ARIWIYONO, S.T.', '4297f44b13955235245b2497399d7a93', '4', '1', 2, 1, '1', '196911012003121002'),
('staf.pmf2', 'SETYO ADI CAHYONO', '4297f44b13955235245b2497399d7a93', '4', '1', 2, 2, '0', '125858969'),
('staf.pmf3', 'YUNITA ERMA SAFITRI', '4297f44b13955235245b2497399d7a93', '4', '1', 2, 3, '1', '155879858'),
('staf.pmf4', 'HERI POERNOMO', '4297f44b13955235245b2497399d7a93', '4', '1', 2, 4, '0', '197507152003121007'),
('staf.ptu1', 'GILANG PRATOMO WIBOWO ,A.Md.', '4297f44b13955235245b2497399d7a93', '4', '1', 1, 1, '1', '198905022019031004'),
('staf.ptu2', 'HADITYA KHALID ULFI, A.Md.', '4297f44b13955235245b2497399d7a93', '4', '1', 1, 2, '1', '198907302022041001'),
('staf.ptu3', 'M. IHSAN ROSYADI', '4297f44b13955235245b2497399d7a93', '4', '1', 1, 3, '0', '199905072021021001'),
('staf.ptu4', 'HANIFA DWI SAFITRI', '4297f44b13955235245b2497399d7a93', '4', '1', 1, 4, '1', '125485858'),
('subbid.hps', 'THOHIER RASPIADO, S.Sos', '4297f44b13955235245b2497399d7a93', '3', '1', 3, 0, '0', '197611151996021002'),
('subbid.pmf', 'SINTA RAHMAWATI,S.STP,MA', '4297f44b13955235245b2497399d7a93', '3', '1', 2, 0, '1', '198610292006022001'),
('subbid.ptu', 'M. SYAIFUDDIN, S.Sos', '4297f44b13955235245b2497399d7a93', '3', '1', 1, 0, '0', '197612251997031006');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_apms_bidang`
--
ALTER TABLE `t_apms_bidang`
  ADD PRIMARY KEY (`id_bidang`);

--
-- Indeks untuk tabel `t_apms_dispo_a`
--
ALTER TABLE `t_apms_dispo_a`
  ADD PRIMARY KEY (`id_dispoa`,`no_surat`,`id_project`) USING BTREE;

--
-- Indeks untuk tabel `t_apms_dispo_b`
--
ALTER TABLE `t_apms_dispo_b`
  ADD PRIMARY KEY (`id_dispob`,`no_surat`,`id_project`) USING BTREE;

--
-- Indeks untuk tabel `t_apms_dispo_c`
--
ALTER TABLE `t_apms_dispo_c`
  ADD PRIMARY KEY (`id_dispoc`,`no_surat`,`id_project`) USING BTREE;

--
-- Indeks untuk tabel `t_apms_isidispo`
--
ALTER TABLE `t_apms_isidispo`
  ADD PRIMARY KEY (`id_isidispo`);

--
-- Indeks untuk tabel `t_apms_jabatan`
--
ALTER TABLE `t_apms_jabatan`
  ADD PRIMARY KEY (`id_jab`);

--
-- Indeks untuk tabel `t_apms_opd`
--
ALTER TABLE `t_apms_opd`
  ADD PRIMARY KEY (`id_opd`);

--
-- Indeks untuk tabel `t_apms_project`
--
ALTER TABLE `t_apms_project`
  ADD PRIMARY KEY (`id_project`,`id_bidang`,`no_surat`(100)) USING BTREE;

--
-- Indeks untuk tabel `t_apms_respon`
--
ALTER TABLE `t_apms_respon`
  ADD PRIMARY KEY (`id_respon`);

--
-- Indeks untuk tabel `t_apms_sifatproject`
--
ALTER TABLE `t_apms_sifatproject`
  ADD PRIMARY KEY (`id_sifatproject`);

--
-- Indeks untuk tabel `t_apms_staf`
--
ALTER TABLE `t_apms_staf`
  ADD PRIMARY KEY (`id_bidang`,`id_subbid`,`id_staf`);

--
-- Indeks untuk tabel `t_apms_status`
--
ALTER TABLE `t_apms_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indeks untuk tabel `t_apms_subbidang`
--
ALTER TABLE `t_apms_subbidang`
  ADD PRIMARY KEY (`id_bidang`,`id_subbid`);

--
-- Indeks untuk tabel `t_apms_user`
--
ALTER TABLE `t_apms_user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_apms_isidispo`
--
ALTER TABLE `t_apms_isidispo`
  MODIFY `id_isidispo` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `t_apms_respon`
--
ALTER TABLE `t_apms_respon`
  MODIFY `id_respon` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `t_apms_sifatproject`
--
ALTER TABLE `t_apms_sifatproject`
  MODIFY `id_sifatproject` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
