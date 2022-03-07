/*
SQLyog Enterprise - MySQL GUI v7.15 
MySQL - 5.1.33-community : Database - db_sikd_NlzMuj4vfZ
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_sikd_NlzMuj4vfZ` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_sikd_NlzMuj4vfZ`;

/*Table structure for table `berita_acara` */

DROP TABLE IF EXISTS `berita_acara`;

CREATE TABLE `berita_acara` (
  `BeritaAcaraKey` varchar(13) NOT NULL,
  `BeritaId` int(11) NOT NULL AUTO_INCREMENT,
  `PermohonanId` int(11) NOT NULL,
  `Nomor` varchar(100) NOT NULL,
  `Tgl` date NOT NULL,
  `stat` varchar(2) DEFAULT NULL,
  `UploadSurat` text NOT NULL,
  PRIMARY KEY (`BeritaId`,`PermohonanId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `berita_acara` */

/*Table structure for table `berkas` */

DROP TABLE IF EXISTS `berkas`;

CREATE TABLE `berkas` (
  `BerkasKey` varchar(13) NOT NULL,
  `BerkasId` int(11) NOT NULL DEFAULT '0',
  `RoleId` varchar(250) DEFAULT NULL,
  `ClId` int(11) NOT NULL,
  `Klasifikasi` varchar(50) DEFAULT NULL,
  `BerkasNumber` int(8) DEFAULT NULL,
  `BerkasName` varchar(250) DEFAULT NULL,
  `RetensiTipe_Active` varchar(15) DEFAULT NULL,
  `RetensiValue_Active` date DEFAULT NULL,
  `RetensiTipe_InActive` varchar(15) DEFAULT NULL,
  `RetensiValue_InActive` date DEFAULT NULL,
  `SusutId` varchar(14) DEFAULT NULL,
  `BerkasLokasi` varchar(250) DEFAULT NULL,
  `BerkasDesc` text,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreationDate` date DEFAULT NULL,
  `BerkasStatus` varchar(15) DEFAULT NULL,
  `BerkasCountSince` varchar(15) DEFAULT NULL,
  `KetAkhir` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`BerkasKey`,`BerkasId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `berkas` */

insert  into `berkas`(`BerkasKey`,`BerkasId`,`RoleId`,`ClId`,`Klasifikasi`,`BerkasNumber`,`BerkasName`,`RetensiTipe_Active`,`RetensiValue_Active`,`RetensiTipe_InActive`,`RetensiValue_InActive`,`SusutId`,`BerkasLokasi`,`BerkasDesc`,`CreatedBy`,`CreationDate`,`BerkasStatus`,`BerkasCountSince`,`KetAkhir`) values ('NlzMuj4vfZ',1,'root',1,NULL,0,'General Temp','tgl','2013-12-01',NULL,NULL,'0','Lokasi Fisiknya','Berkas Penampungan Sementara',1,'2010-10-04','open','created','');

/*Table structure for table `berkas_history` */

DROP TABLE IF EXISTS `berkas_history`;

CREATE TABLE `berkas_history` (
  `BerkasKey` varchar(13) DEFAULT NULL,
  `BerkasId` int(11) DEFAULT NULL,
  `PeopleId` int(11) DEFAULT NULL,
  `PrimaryRoleId` varchar(250) DEFAULT NULL,
  `ActionDate` date DEFAULT NULL,
  `ActionType` varchar(35) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `berkas_history` */

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL DEFAULT '',
  `to` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `to` (`to`),
  KEY `from` (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

/*Table structure for table `classification` */

DROP TABLE IF EXISTS `classification`;

CREATE TABLE `classification` (
  `ClKey` varchar(13) NOT NULL,
  `ClId` int(11) unsigned NOT NULL,
  `ClParentId` int(10) unsigned DEFAULT NULL,
  `ClCode` varchar(25) NOT NULL,
  `ClName` varchar(255) NOT NULL,
  `ClDesc` text,
  `RetensiThn_Active` int(2) DEFAULT NULL,
  `RetensiThn_InActive` int(2) DEFAULT NULL,
  `SusutId` varchar(14) NOT NULL,
  `CIStatus` int(2) NOT NULL,
  `ClStatusParent` int(2) NOT NULL,
  PRIMARY KEY (`ClKey`,`ClId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `classification` */

insert  into `classification`(`ClKey`,`ClId`,`ClParentId`,`ClCode`,`ClName`,`ClDesc`,`RetensiThn_Active`,`RetensiThn_InActive`,`SusutId`,`CIStatus`,`ClStatusParent`) values ('NlzMuj4vfZ',1,0,'SK','Semua Klasifikasi','Klasifikasi Induk',0,0,'',1,1);

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `GroupKey` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GroupId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GroupId`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `groups` */

insert  into `groups`(`GroupKey`,`GroupId`,`GroupName`) values ('NlzMuj4vfZ',1,'Administrator Pusat'),('NlzMuj4vfZ',2,'Administrator Satuan Organisasi'),('NlzMuj4vfZ',3,'Pejabat Struktural'),('NlzMuj4vfZ',4,'Sekretaris'),('NlzMuj4vfZ',5,'Pencatat Surat'),('NlzMuj4vfZ',6,'Pengelola Surat'),('NlzMuj4vfZ',7,'Staf');

/*Table structure for table `inbox` */

DROP TABLE IF EXISTS `inbox`;

CREATE TABLE `inbox` (
  `NKey` varchar(13) NOT NULL,
  `NId` varchar(100) NOT NULL COMMENT 'Naskah ID',
  `NTglReg` datetime DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreationRoleId` varchar(250) NOT NULL,
  `JenisId` varchar(14) DEFAULT NULL,
  `TPId` varchar(14) DEFAULT NULL,
  `Tgl` date DEFAULT NULL,
  `Nomor` varchar(100) DEFAULT NULL,
  `Hal` varchar(250) DEFAULT NULL,
  `UrgensiId` varchar(14) DEFAULT NULL,
  `SifatId` varchar(14) DEFAULT NULL,
  `KatId` varchar(14) DEFAULT NULL,
  `APId` varchar(14) DEFAULT NULL,
  `Pengirim` varchar(8) DEFAULT NULL,
  `Instansipengirim` varchar(150) NOT NULL,
  `Namapengirim` varchar(150) NOT NULL,
  `JabatanPengirim` varchar(150) DEFAULT NULL,
  `NFileDir` varchar(250) DEFAULT NULL,
  `MediaId` varchar(14) DEFAULT NULL,
  `LangId` varchar(14) DEFAULT NULL,
  `NIsi` text,
  `VitId` varchar(14) DEFAULT NULL,
  `NJml` int(11) DEFAULT NULL,
  `MeasureId` varchar(14) DEFAULT NULL,
  `NLokasi` varchar(100) DEFAULT NULL,
  `BerkasId` int(11) DEFAULT NULL,
  `NTipe` varchar(15) DEFAULT NULL,
  `NAgenda` varchar(150) DEFAULT NULL,
  `Tesaurus` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`NKey`,`NId`),
  KEY `FK_inbox` (`NKey`,`BerkasId`),
  KEY `FK_inbox_AP` (`APId`),
  KEY `FK_inbox_Lang` (`LangId`),
  KEY `FK_inbox_J` (`JenisId`),
  KEY `FK_inbox_K` (`KatId`),
  KEY `FK_inbox_TP` (`TPId`),
  KEY `FK_inbox_U` (`UrgensiId`),
  KEY `FK_inbox_M` (`MediaId`),
  KEY `FK_inbox_V` (`VitId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `inbox` */

/*Table structure for table `inbox_disposisi` */

DROP TABLE IF EXISTS `inbox_disposisi`;

CREATE TABLE `inbox_disposisi` (
  `NId` varchar(100) DEFAULT NULL,
  `GIR_Id` varchar(20) DEFAULT NULL,
  `NoIndex` varchar(25) DEFAULT NULL,
  `Sifat` varchar(25) DEFAULT NULL,
  `Disposisi` varchar(250) DEFAULT NULL,
  KEY `NId` (`NId`),
  KEY `GIR_Id` (`GIR_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `inbox_disposisi` */

/*Table structure for table `inbox_files` */

DROP TABLE IF EXISTS `inbox_files`;

CREATE TABLE `inbox_files` (
  `FileKey` varchar(13) NOT NULL,
  `GIR_Id` varchar(20) NOT NULL DEFAULT '0' COMMENT 'Group ID',
  `NId` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Naskah ID',
  `PeopleID` int(11) DEFAULT NULL,
  `PeopleRoleID` varchar(250) NOT NULL,
  `FileName_real` tinytext,
  `FileName_fake` tinytext,
  `FileStatus` varchar(20) DEFAULT NULL,
  `EditedDate` datetime DEFAULT NULL,
  `Keterangan` varchar(150) DEFAULT NULL,
  KEY `GIR_Id` (`GIR_Id`),
  KEY `NId` (`NId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `inbox_files` */

/*Table structure for table `inbox_receiver` */

DROP TABLE IF EXISTS `inbox_receiver`;

CREATE TABLE `inbox_receiver` (
  `NKey` varchar(13) NOT NULL,
  `NId` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Naskah ID',
  `GIR_Id` varchar(20) NOT NULL DEFAULT '0' COMMENT 'Group ID',
  `From_Id` int(11) DEFAULT NULL,
  `RoleId_From` varchar(150) DEFAULT NULL,
  `To_Id` varchar(50) DEFAULT NULL,
  `RoleId_To` varchar(150) DEFAULT NULL,
  `ReceiverAs` varchar(15) DEFAULT NULL,
  `Msg` text,
  `StatusReceive` varchar(20) DEFAULT NULL,
  `ReceiveDate` datetime DEFAULT NULL,
  `To_Id_Desc` varchar(150) DEFAULT NULL,
  KEY `NId` (`NId`),
  KEY `GIR_Id` (`GIR_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `inbox_receiver` */

/*Table structure for table `inbox_reference` */

DROP TABLE IF EXISTS `inbox_reference`;

CREATE TABLE `inbox_reference` (
  `RefKey` varchar(13) DEFAULT NULL,
  `NId` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Naskah ID',
  `Id_Ref` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Ref ID',
  `Ref_Type` varchar(15) DEFAULT NULL,
  `Ref_With` varchar(15) DEFAULT NULL,
  KEY `FK_inbox_reference` (`NId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `inbox_reference` */

/*Table structure for table `master_aksespublik` */

DROP TABLE IF EXISTS `master_aksespublik`;

CREATE TABLE `master_aksespublik` (
  `APId` varchar(14) NOT NULL,
  `APName` varchar(30) NOT NULL,
  PRIMARY KEY (`APId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_aksespublik` */

insert  into `master_aksespublik`(`APId`,`APName`) values ('NlzMuj4vfZ.1','Tertutup'),('NlzMuj4vfZ.2','Terbuka');

/*Table structure for table `master_bahasa` */

DROP TABLE IF EXISTS `master_bahasa`;

CREATE TABLE `master_bahasa` (
  `LangId` varchar(14) NOT NULL,
  `LangName` varchar(20) NOT NULL,
  PRIMARY KEY (`LangId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_bahasa` */

insert  into `master_bahasa`(`LangId`,`LangName`) values ('NlzMuj4vfZ.1','Indonesia'),('NlzMuj4vfZ.2','Inggris');

/*Table structure for table `master_btn` */

DROP TABLE IF EXISTS `master_btn`;

CREATE TABLE `master_btn` (
  `btn_key` varchar(15) NOT NULL,
  `btn_func` varchar(10) DEFAULT NULL,
  `btn_text` varchar(35) DEFAULT NULL,
  `btn_desc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `master_btn` */

insert  into `master_btn`(`btn_key`,`btn_func`,`btn_text`,`btn_desc`) values ('NlzMuj4vfZ.1','balas','Nota Dinas','Tombol untuk Nota Dinas'),('NlzMuj4vfZ.2','teruskan','Teruskan','Tombol untuk Meneruskan (Forward)'),('NlzMuj4vfZ.3','disposisi','Disposisi','Tombol untuk Disposisi'),('NlzMuj4vfZ.4','usul','Nota Dinas','Tombol untuk Memberi Nota Dinas Usulan'),('NlzMuj4vfZ.5','ubah','Ubah Metadata','Tombol untuk Ubah Metadata'),('NlzMuj4vfZ.6','final','Upload Surat Final','Tombol untuk Surat Final'),('NlzMuj4vfZ.7','kembali','Kembali','Tombol untuk Kembali'),('NlzMuj4vfZ.8','closed','Tutup Berkas','Tombol untuk Menutup Berkas');

/*Table structure for table `master_color` */

DROP TABLE IF EXISTS `master_color`;

CREATE TABLE `master_color` (
  `CKey` varchar(12) DEFAULT NULL,
  `CUsed` varchar(12) DEFAULT NULL,
  `Color` varchar(7) DEFAULT NULL,
  `CDesc` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_color` */

insert  into `master_color`(`CKey`,`CUsed`,`Color`,`CDesc`) values ('NlzMuj4vfZ','to','#a5ee75','Digunakan Untuk Surat Yang Belum Dibuka');

/*Table structure for table `master_disposisi` */

DROP TABLE IF EXISTS `master_disposisi`;

CREATE TABLE `master_disposisi` (
  `DisposisiId` varchar(14) NOT NULL,
  `DisposisiName` varchar(100) NOT NULL,
  `gjabatanId` varchar(14) NOT NULL,
  PRIMARY KEY (`DisposisiId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_disposisi` */

insert  into `master_disposisi`(`DisposisiId`,`DisposisiName`,`gjabatanId`) values ('NlzMuj4vfZ.','Mohon Tindaklanjuti','NlzMuj4vfZ.1'),('NlzMuj4vfZ.1','Mohon Tindaklanjuti','NlzMuj4vfZ.2'),('NlzMuj4vfZ.2','Mohon Tindaklanjuti','NlzMuj4vfZ.3'),('NlzMuj4vfZ.3','Mohon Mewakili','NlzMuj4vfZ.1'),('NlzMuj4vfZ.4','Mohon Tindaklanjuti','NlzMuj4vfZ.4');

/*Table structure for table `master_doc_template` */

DROP TABLE IF EXISTS `master_doc_template`;

CREATE TABLE `master_doc_template` (
  `doc_id` varchar(50) NOT NULL,
  `doc_desc` varchar(250) DEFAULT NULL,
  `doc_file` varchar(250) DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `master_doc_template` */

/*Table structure for table `master_file_allowed` */

DROP TABLE IF EXISTS `master_file_allowed`;

CREATE TABLE `master_file_allowed` (
  `TipeId` varchar(14) NOT NULL,
  `TipeExt` varchar(15) NOT NULL,
  PRIMARY KEY (`TipeId`),
  UNIQUE KEY `TipeId` (`TipeId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_file_allowed` */

insert  into `master_file_allowed`(`TipeId`,`TipeExt`) values ('NlzMuj4vfZ.1','.doc'),('NlzMuj4vfZ.10','.pdf'),('NlzMuj4vfZ.2','.docx'),('NlzMuj4vfZ.3','.pptx'),('NlzMuj4vfZ.4','.ppt'),('NlzMuj4vfZ.5','.xls'),('NlzMuj4vfZ.6','.xlsx'),('NlzMuj4vfZ.7','.txt'),('NlzMuj4vfZ.8','.jpeg'),('NlzMuj4vfZ.9','.jpg');

/*Table structure for table `master_front` */

/*Data for the table `master_front` */

/*Table structure for table `master_gjabatan` */

DROP TABLE IF EXISTS `master_gjabatan`;

CREATE TABLE `master_gjabatan` (
  `gjabatanId` varchar(14) NOT NULL,
  `gjabatanName` varchar(50) NOT NULL,
  PRIMARY KEY (`gjabatanId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_gjabatan` */

insert  into `master_gjabatan`(`gjabatanId`,`gjabatanName`) values ('NlzMuj4vfZ.1','Pimpinan Instansi'),('NlzMuj4vfZ.2','Eselon I'),('NlzMuj4vfZ.3','Eselon II'),('NlzMuj4vfZ.4','Eselon III'),('NlzMuj4vfZ.5','Eselon IV'),('NlzMuj4vfZ.6','Unit Kearsipan'),('NlzMuj4vfZ.7','Staf'),('NlzMuj4vfZ.8','Pengelola Surat'),('NlzMuj4vfZ.9','Eselon V'),('NlzMuj4vfZ.10','SOTK');

/*Table structure for table `master_instansi` */

DROP TABLE IF EXISTS `master_instansi`;

CREATE TABLE `master_instansi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_instansi` varchar(35) DEFAULT NULL,
  `nama_instansi` varchar(250) DEFAULT NULL,
  `nama_resmi` varchar(250) DEFAULT NULL,
  `tipe_instansi` varchar(250) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `fungsi` varchar(250) DEFAULT NULL,
  `mandat` varchar(250) DEFAULT NULL,
  `status_instansi` varchar(2) DEFAULT NULL,
  `creation_by` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `master_instansi` */

/*Table structure for table `master_jnaskah` */

DROP TABLE IF EXISTS `master_jnaskah`;

CREATE TABLE `master_jnaskah` (
  `JenisId` varchar(14) CHARACTER SET latin1 NOT NULL,
  `JenisName` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`JenisId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `master_jnaskah` */

insert  into `master_jnaskah`(`JenisId`,`JenisName`) values ('NlzMuj4vfZ.1','Surat Dinas'),('NlzMuj4vfZ.2','Surat Undangan'),('NlzMuj4vfZ.3','Surat Keputusan'),('NlzMuj4vfZ.4','Peraturan Kepala'),('NlzMuj4vfZ.5','Laporan'),('NlzMuj4vfZ.6','Surat Pengantar');

/*Table structure for table `master_kategoriarsip` */

DROP TABLE IF EXISTS `master_kategoriarsip`;

CREATE TABLE `master_kategoriarsip` (
  `KatId` varchar(14) NOT NULL,
  `KatName` varchar(50) NOT NULL,
  PRIMARY KEY (`KatId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_kategoriarsip` */

insert  into `master_kategoriarsip`(`KatId`,`KatName`) values ('NlzMuj4vfZ.1','Terjaga'),('NlzMuj4vfZ.2','Umum');

/*Table structure for table `master_media` */

DROP TABLE IF EXISTS `master_media`;

CREATE TABLE `master_media` (
  `MediaId` varchar(14) CHARACTER SET latin1 NOT NULL,
  `MediaName` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`MediaId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `master_media` */

insert  into `master_media`(`MediaId`,`MediaName`) values ('NlzMuj4vfZ.1','Kertas');

/*Table structure for table `master_penyusutan` */

DROP TABLE IF EXISTS `master_penyusutan`;

CREATE TABLE `master_penyusutan` (
  `SusutId` varchar(14) NOT NULL,
  `SusutName` varchar(50) NOT NULL,
  PRIMARY KEY (`SusutId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_penyusutan` */

insert  into `master_penyusutan`(`SusutId`,`SusutName`) values ('NlzMuj4vfZ.1','Musnah'),('NlzMuj4vfZ.2','Permanen'),('NlzMuj4vfZ.3','Dinilai Kembali');

/*Table structure for table `master_report_name` */

DROP TABLE IF EXISTS `master_report_name`;

CREATE TABLE `master_report_name` (
  `RId` varchar(14) NOT NULL,
  `RName` varchar(45) NOT NULL,
  PRIMARY KEY (`RId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `master_report_name` */

insert  into `master_report_name`(`RId`,`RName`) values ('NlzMuj4vfZ.1','Laporan Umum'),('NlzMuj4vfZ.10','Laporan arsip Dinilai Kembali'),('NlzMuj4vfZ.11','Laporan arsip Musnah'),('NlzMuj4vfZ.12','Laporan arsip Serah'),('NlzMuj4vfZ.13','Laporan arsip Berdasarkan Petugas Registrasi'),('NlzMuj4vfZ.2','Laporan arsip Terjaga'),('NlzMuj4vfZ.3','Laporan arsip Terbuka'),('NlzMuj4vfZ.4','Laporan arsip Tertutup'),('NlzMuj4vfZ.5','Laporan arsip Vital'),('NlzMuj4vfZ.6','Laporan arsip Aktif'),('NlzMuj4vfZ.7','Laporan arsip InAktif'),('NlzMuj4vfZ.8','Laporan arsip Usul Musnah'),('NlzMuj4vfZ.9','Laporan arsip Usul Serah');

/*Table structure for table `master_satuanunit` */

DROP TABLE IF EXISTS `master_satuanunit`;

CREATE TABLE `master_satuanunit` (
  `MeasureUnitId` varchar(14) NOT NULL,
  `MeasureUnitName` varchar(50) NOT NULL,
  PRIMARY KEY (`MeasureUnitId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_satuanunit` */

insert  into `master_satuanunit`(`MeasureUnitId`,`MeasureUnitName`) values ('NlzMuj4vfZ.1','Lembar'),('NlzMuj4vfZ.2','Halaman');

/*Table structure for table `master_sifat` */

DROP TABLE IF EXISTS `master_sifat`;

CREATE TABLE `master_sifat` (
  `SifatId` varchar(14) NOT NULL,
  `SifatName` varchar(25) NOT NULL,
  PRIMARY KEY (`SifatId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_sifat` */

insert  into `master_sifat`(`SifatId`,`SifatName`) values ('NlzMuj4vfZ.1','Biasa'),('NlzMuj4vfZ.2','Rahasia Terbatas'),('NlzMuj4vfZ.3','Rahasia'),('NlzMuj4vfZ.4','Sangat Rahasia');

/*Table structure for table `master_tperkembangan` */

DROP TABLE IF EXISTS `master_tperkembangan`;

CREATE TABLE `master_tperkembangan` (
  `TPId` varchar(14) NOT NULL,
  `TPName` varchar(50) NOT NULL,
  PRIMARY KEY (`TPId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_tperkembangan` */

insert  into `master_tperkembangan`(`TPId`,`TPName`) values ('NlzMuj4vfZ.1','Asli'),('NlzMuj4vfZ.2','Kopi');

/*Table structure for table `master_urgensi` */

DROP TABLE IF EXISTS `master_urgensi`;

CREATE TABLE `master_urgensi` (
  `UrgensiId` varchar(14) NOT NULL,
  `UrgensiName` varchar(50) NOT NULL,
  PRIMARY KEY (`UrgensiId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_urgensi` */

insert  into `master_urgensi`(`UrgensiId`,`UrgensiName`) values ('NlzMuj4vfZ.1','Biasa'),('NlzMuj4vfZ.2','Segera'),('NlzMuj4vfZ.3','Amat Segera');

/*Table structure for table `master_vital` */

DROP TABLE IF EXISTS `master_vital`;

CREATE TABLE `master_vital` (
  `VitId` varchar(14) NOT NULL,
  `VitName` varchar(50) NOT NULL,
  PRIMARY KEY (`VitId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `master_vital` */

insert  into `master_vital`(`VitId`,`VitName`) values ('NlzMuj4vfZ.1','Tidak Vital'),('NlzMuj4vfZ.2','Vital');

/*Table structure for table `people` */

DROP TABLE IF EXISTS `people`;

CREATE TABLE `people` (
  `PeopleKey` varchar(15) NOT NULL,
  `PeopleId` int(15) NOT NULL,
  `PeopleName` varchar(150) NOT NULL,
  `PeoplePosition` varchar(150) DEFAULT NULL,
  `PeopleUsername` varchar(40) NOT NULL,
  `PeoplePassword` varchar(250) NOT NULL,
  `PeopleActiveStartDate` date DEFAULT NULL,
  `PeopleActiveEndDate` date DEFAULT NULL,
  `PeopleIsActive` tinyint(1) NOT NULL DEFAULT '1',
  `PrimaryRoleId` varchar(250) DEFAULT NULL,
  `GroupId` int(11) DEFAULT NULL,
  `RoleAtasan` varchar(250) NOT NULL,
  PRIMARY KEY (`PeopleKey`,`PeopleId`),
  KEY `FK_people` (`PeopleKey`,`PrimaryRoleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `people` */

insert  into `people`(`PeopleKey`,`PeopleId`,`PeopleName`,`PeoplePosition`,`PeopleUsername`,`PeoplePassword`,`PeopleActiveStartDate`,`PeopleActiveEndDate`,`PeopleIsActive`,`PrimaryRoleId`,`GroupId`,`RoleAtasan`) values ('NlzMuj4vfZ',1,'Administrator','Administrator','admin','0192023a7bbd73250516f069df18b500','0001-01-01','2999-12-31',1,'root',1,'-');

/*Table structure for table `people_history` */

DROP TABLE IF EXISTS `people_history`;

CREATE TABLE `people_history` (
  `HKey` varchar(15) DEFAULT NULL,
  `HId` int(11) DEFAULT NULL,
  `PeopleId` int(11) DEFAULT NULL,
  `PeoplePosition` varchar(150) DEFAULT NULL,
  `RoleId` varchar(250) DEFAULT NULL,
  `RoleName` varchar(150) DEFAULT NULL,
  `HDate` date DEFAULT NULL,
  KEY `FK_people_history` (`HKey`,`PeopleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `people_history` */

/*Table structure for table `peoplesession` */

DROP TABLE IF EXISTS `peoplesession`;

CREATE TABLE `peoplesession` (
  `SessionKey` varchar(15) DEFAULT NULL,
  `PeopleId` int(11) DEFAULT NULL,
  `SessionId` varchar(25) DEFAULT NULL,
  `OnlineSince` datetime DEFAULT NULL,
  `IPAddress` varchar(25) DEFAULT NULL,
  KEY `FK_peoplesession` (`SessionKey`,`PeopleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `peoplesession` */

/*Table structure for table `permohonan_musnah` */

DROP TABLE IF EXISTS `permohonan_musnah`;

CREATE TABLE `permohonan_musnah` (
  `PermohonanKey` varchar(13) NOT NULL,
  `idmusnah` int(11) NOT NULL AUTO_INCREMENT,
  `nomor` varchar(100) NOT NULL,
  `tgl` date NOT NULL,
  `berkasid` text NOT NULL,
  `UploadSurat` text NOT NULL,
  `ket` varchar(30) NOT NULL,
  PRIMARY KEY (`idmusnah`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `permohonan_musnah` */

/*Table structure for table `permohonan_serah` */

DROP TABLE IF EXISTS `permohonan_serah`;

CREATE TABLE `permohonan_serah` (
  `PermohonanKey` varchar(13) NOT NULL,
  `idserah` int(11) NOT NULL AUTO_INCREMENT,
  `nomor` varchar(100) NOT NULL,
  `tgl` date NOT NULL,
  `berkasid` text NOT NULL,
  `UploadSurat` text NOT NULL,
  `ket` varchar(30) NOT NULL,
  PRIMARY KEY (`idserah`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `permohonan_serah` */

/*Table structure for table `permohonanusul` */

DROP TABLE IF EXISTS `permohonanusul`;

CREATE TABLE `permohonanusul` (
  `PermohonanKey` varchar(13) NOT NULL,
  `PermohonanId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(250) NOT NULL,
  `NoSurat` varchar(100) NOT NULL,
  `TglSurat` date NOT NULL,
  `Priode` varchar(10) DEFAULT NULL,
  `status` varchar(5) NOT NULL,
  `berkasid` text NOT NULL,
  `UploadSurat` text NOT NULL,
  `ket` varchar(10) DEFAULT NULL,
  `RefSurat` int(11) DEFAULT NULL,
  PRIMARY KEY (`PermohonanId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `permohonanusul` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `RoleKey` varchar(12) NOT NULL,
  `RoleId` varchar(250) NOT NULL,
  `RoleParentId` varchar(250) NOT NULL,
  `RoleName` varchar(255) NOT NULL,
  `RoleDesc` varchar(255) DEFAULT NULL,
  `RoleStatus` int(2) DEFAULT '1',
  `gjabatanId` varchar(14) NOT NULL,
  PRIMARY KEY (`RoleKey`,`RoleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `role` */

insert  into `role`(`RoleKey`,`RoleId`,`RoleParentId`,`RoleName`,`RoleDesc`,`RoleStatus`,`gjabatanId`) values ('NlzMuj4vfZ','root','','Administrator','Administrator',1,''),('NlzMuj4vfZ','uk','root','Unit Kearsipan','Unit Kearsipan',1,'NlzMuj4vfZ.6');

/*Table structure for table `tb_setting` */

/*Data for the table `tb_setting` */

/*Table structure for table `v_berkas` */

DROP TABLE IF EXISTS `v_berkas`;

/*!50001 DROP VIEW IF EXISTS `v_berkas` */;
/*!50001 DROP TABLE IF EXISTS `v_berkas` */;

/*!50001 CREATE TABLE `v_berkas` (
  `BerkasKey` varchar(13) CHARACTER SET latin1 NOT NULL,
  `BerkasId` int(11) NOT NULL DEFAULT '0',
  `RoleId` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `ClId` int(11) NOT NULL,
  `Klasifikasi` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasNumber` int(8) DEFAULT NULL,
  `BerkasName` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `RetensiTipe_Active` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `RetensiValue_Active` date DEFAULT NULL,
  `RetensiTipe_InActive` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `RetensiValue_InActive` date DEFAULT NULL,
  `SusutId` varchar(14) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasLokasi` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasDesc` text CHARACTER SET latin1,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreationDate` date DEFAULT NULL,
  `BerkasStatus` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasCountSince` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `KetAkhir` varchar(15) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*Table structure for table `v_berkas_aktif` */

DROP TABLE IF EXISTS `v_berkas_aktif`;

/*!50001 DROP VIEW IF EXISTS `v_berkas_aktif` */;
/*!50001 DROP TABLE IF EXISTS `v_berkas_aktif` */;

/*!50001 CREATE TABLE `v_berkas_aktif` (
  `BerkasId` int(11) NOT NULL DEFAULT '0',
  `BerkasStatus` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasNumber` int(8) DEFAULT NULL,
  `RoleId` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `RoleDesc` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasName` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasDesc` text CHARACTER SET latin1,
  `RetensiValue_Active` date DEFAULT NULL,
  `RetensiValue_InActive` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*Table structure for table `v_berkas_inaktif` */

DROP TABLE IF EXISTS `v_berkas_inaktif`;

/*!50001 DROP VIEW IF EXISTS `v_berkas_inaktif` */;
/*!50001 DROP TABLE IF EXISTS `v_berkas_inaktif` */;

/*!50001 CREATE TABLE `v_berkas_inaktif` (
  `BerkasId` int(11) NOT NULL DEFAULT '0',
  `BerkasStatus` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasNumber` int(8) DEFAULT NULL,
  `RoleId` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `RoleDesc` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasName` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasDesc` text CHARACTER SET latin1,
  `RetensiValue_Active` date DEFAULT NULL,
  `RetensiValue_InActive` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*Table structure for table `v_inbox` */

DROP TABLE IF EXISTS `v_inbox`;

/*!50001 DROP VIEW IF EXISTS `v_inbox` */;
/*!50001 DROP TABLE IF EXISTS `v_inbox` */;

/*!50001 CREATE TABLE `v_inbox` (
  `NId` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT 'Naskah ID',
  `Tgl` date DEFAULT NULL,
  `Nomor` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Hal` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `InstansiPengirim` varchar(150) CHARACTER SET latin1 NOT NULL,
  `BerkasId` int(11) DEFAULT NULL,
  `NTipe` varchar(15) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*Table structure for table `v_jejak_surat` */

DROP TABLE IF EXISTS `v_jejak_surat`;

/*!50001 DROP VIEW IF EXISTS `v_jejak_surat` */;
/*!50001 DROP TABLE IF EXISTS `v_jejak_surat` */;

/*!50001 CREATE TABLE `v_jejak_surat` (
  `NId` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT 'Naskah ID',
  `Nomor` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `Hal` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `NTipe` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasId` int(11) DEFAULT NULL,
  `Tgl` date DEFAULT NULL,
  `NIsi` text CHARACTER SET latin1,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreationRoleId` varchar(250) CHARACTER SET latin1 NOT NULL,
  `RoleId_From` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `RoleId_To` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `StatusReceive` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `ReceiverAs` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `Msg` text CHARACTER SET latin1,
  `tindakan` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `RoleId_From2` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `GIR_Id` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT 'Group ID',
  `InstansiPengirim` varchar(150) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*Table structure for table `v_l_keluar` */

DROP TABLE IF EXISTS `v_l_keluar`;

/*!50001 DROP VIEW IF EXISTS `v_l_keluar` */;
/*!50001 DROP TABLE IF EXISTS `v_l_keluar` */;

/*!50001 CREATE TABLE `v_l_keluar` (
  `NId` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT 'Naskah ID',
  `Nomor` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Hal` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `NTipe` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasId` int(11) DEFAULT NULL,
  `UrgensiName` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Tgl` date DEFAULT NULL,
  `NIsi` text CHARACTER SET latin1,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreationRoleId` varchar(250) CHARACTER SET latin1 NOT NULL,
  `InstansiPengirim` varchar(150) CHARACTER SET latin1 NOT NULL,
  `Ntgl` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*Table structure for table `v_l_w` */

DROP TABLE IF EXISTS `v_l_w`;

/*!50001 DROP VIEW IF EXISTS `v_l_w` */;
/*!50001 DROP TABLE IF EXISTS `v_l_w` */;

/*!50001 CREATE TABLE `v_l_w` (
  `StatusReceive` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `NId` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT 'Naskah ID',
  `Nomor` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `InstansiPengirim` varchar(150) CHARACTER SET latin1 NOT NULL,
  `NTglReg` datetime DEFAULT NULL,
  `ReceiveDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*Table structure for table `v_s_keluar` */

DROP TABLE IF EXISTS `v_s_keluar`;

/*!50001 DROP VIEW IF EXISTS `v_s_keluar` */;
/*!50001 DROP TABLE IF EXISTS `v_s_keluar` */;

/*!50001 CREATE TABLE `v_s_keluar` (
  `Tgl` date DEFAULT NULL,
  `Nomor` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Hal` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `InstansiPengirim` varchar(150) CHARACTER SET latin1 NOT NULL,
  `NTipe` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `FileName_real` tinytext CHARACTER SET latin1,
  `NId` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT 'Naskah ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*Table structure for table `v_s_masuk` */

DROP TABLE IF EXISTS `v_s_masuk`;

/*!50001 DROP VIEW IF EXISTS `v_s_masuk` */;
/*!50001 DROP TABLE IF EXISTS `v_s_masuk` */;

/*!50001 CREATE TABLE `v_s_masuk` (
  `NId` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT 'Naskah ID',
  `Nomor` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Hal` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `NTipe` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `BerkasId` int(11) DEFAULT NULL,
  `UrgensiName` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Tgl` date DEFAULT NULL,
  `NIsi` text CHARACTER SET latin1,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreationRoleId` varchar(250) CHARACTER SET latin1 NOT NULL,
  `RoleId_To` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `StatusReceive` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `InstansiPengirim` varchar(150) CHARACTER SET latin1 NOT NULL,
  `ReceiveDate` datetime DEFAULT NULL,
  `zz` varchar(150) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*Table structure for table `v_usu1` */

DROP TABLE IF EXISTS `v_usu1`;

/*!50001 DROP VIEW IF EXISTS `v_usu1` */;
/*!50001 DROP TABLE IF EXISTS `v_usu1` */;

/*!50001 CREATE TABLE `v_usu1` (
  `PermohonanId` int(11) NOT NULL DEFAULT '0',
  `NoSurat` varchar(100) CHARACTER SET latin1 NOT NULL,
  `TglSurat` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 */;

/*View structure for view v_berkas */

/*!50001 DROP TABLE IF EXISTS `v_berkas` */;
/*!50001 DROP VIEW IF EXISTS `v_berkas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_berkas` AS select `berkas`.`BerkasKey` AS `BerkasKey`,`berkas`.`BerkasId` AS `BerkasId`,`berkas`.`RoleId` AS `RoleId`,`berkas`.`ClId` AS `ClId`,`berkas`.`Klasifikasi` AS `Klasifikasi`,`berkas`.`BerkasNumber` AS `BerkasNumber`,`berkas`.`BerkasName` AS `BerkasName`,`berkas`.`RetensiTipe_Active` AS `RetensiTipe_Active`,`berkas`.`RetensiValue_Active` AS `RetensiValue_Active`,`berkas`.`RetensiTipe_InActive` AS `RetensiTipe_InActive`,`berkas`.`RetensiValue_InActive` AS `RetensiValue_InActive`,`berkas`.`SusutId` AS `SusutId`,`berkas`.`BerkasLokasi` AS `BerkasLokasi`,`berkas`.`BerkasDesc` AS `BerkasDesc`,`berkas`.`CreatedBy` AS `CreatedBy`,`berkas`.`CreationDate` AS `CreationDate`,`berkas`.`BerkasStatus` AS `BerkasStatus`,`berkas`.`BerkasCountSince` AS `BerkasCountSince`,`berkas`.`KetAkhir` AS `KetAkhir` from `berkas` */;

/*View structure for view v_berkas_aktif */

/*!50001 DROP TABLE IF EXISTS `v_berkas_aktif` */;
/*!50001 DROP VIEW IF EXISTS `v_berkas_aktif` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_berkas_aktif` AS (select `r`.`BerkasId` AS `BerkasId`,`r`.`BerkasStatus` AS `BerkasStatus`,`r`.`BerkasNumber` AS `BerkasNumber`,`r`.`RoleId` AS `RoleId`,`e`.`RoleDesc` AS `RoleDesc`,`r`.`BerkasName` AS `BerkasName`,`r`.`BerkasDesc` AS `BerkasDesc`,`r`.`RetensiValue_Active` AS `RetensiValue_Active`,`r`.`RetensiValue_InActive` AS `RetensiValue_InActive` from (`berkas` `r` join `role` `e`) where ((`r`.`RoleId` = `e`.`RoleId`) and (`r`.`BerkasId` <> '1') and (`r`.`RetensiValue_Active` < curdate()))) */;

/*View structure for view v_berkas_inaktif */

/*!50001 DROP TABLE IF EXISTS `v_berkas_inaktif` */;
/*!50001 DROP VIEW IF EXISTS `v_berkas_inaktif` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_berkas_inaktif` AS (select `r`.`BerkasId` AS `BerkasId`,`r`.`BerkasStatus` AS `BerkasStatus`,`r`.`BerkasNumber` AS `BerkasNumber`,`r`.`RoleId` AS `RoleId`,`e`.`RoleDesc` AS `RoleDesc`,`r`.`BerkasName` AS `BerkasName`,`r`.`BerkasDesc` AS `BerkasDesc`,`r`.`RetensiValue_Active` AS `RetensiValue_Active`,`r`.`RetensiValue_InActive` AS `RetensiValue_InActive` from (`berkas` `r` join `role` `e`) where ((`r`.`RoleId` = `e`.`RoleId`) and (`r`.`BerkasId` <> '1') and (`r`.`RetensiValue_InActive` < curdate()))) */;

/*View structure for view v_inbox */

/*!50001 DROP TABLE IF EXISTS `v_inbox` */;
/*!50001 DROP VIEW IF EXISTS `v_inbox` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inbox` AS select `inbox`.`NId` AS `NId`,`inbox`.`Tgl` AS `Tgl`,`inbox`.`Nomor` AS `Nomor`,`inbox`.`Hal` AS `Hal`,`inbox`.`Instansipengirim` AS `InstansiPengirim`,`inbox`.`BerkasId` AS `BerkasId`,`inbox`.`NTipe` AS `NTipe` from `inbox` */;

/*View structure for view v_jejak_surat */

/*!50001 DROP TABLE IF EXISTS `v_jejak_surat` */;
/*!50001 DROP VIEW IF EXISTS `v_jejak_surat` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_jejak_surat` AS (select `i`.`NId` AS `NId`,`i`.`Nomor` AS `Nomor`,`rr`.`ReceiveDate` AS `waktu`,`i`.`Hal` AS `Hal`,`i`.`NTipe` AS `NTipe`,`i`.`BerkasId` AS `BerkasId`,`i`.`Tgl` AS `Tgl`,`i`.`NIsi` AS `NIsi`,`i`.`CreatedBy` AS `CreatedBy`,`i`.`CreationRoleId` AS `CreationRoleId`,`rr`.`RoleId_From` AS `RoleId_From`,`rr`.`RoleId_To` AS `RoleId_To`,`rr`.`StatusReceive` AS `StatusReceive`,`rr`.`ReceiverAs` AS `ReceiverAs`,`rr`.`Msg` AS `Msg`,`rr`.`ReceiverAs` AS `tindakan`,`rr`.`RoleId_From` AS `RoleId_From2`,`rr`.`GIR_Id` AS `GIR_Id`,`i`.`Instansipengirim` AS `InstansiPengirim` from (`inbox` `i` join `inbox_receiver` `rr` on(((`rr`.`NKey` = `i`.`NKey`) and (`rr`.`NId` = `i`.`NId`)))) where (`i`.`NId` is not null)) */;

/*View structure for view v_l_keluar */

/*!50001 DROP TABLE IF EXISTS `v_l_keluar` */;
/*!50001 DROP VIEW IF EXISTS `v_l_keluar` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_l_keluar` AS select `i`.`NId` AS `NId`,`i`.`Nomor` AS `Nomor`,`i`.`Hal` AS `Hal`,`i`.`NTipe` AS `NTipe`,`i`.`BerkasId` AS `BerkasId`,`mu`.`UrgensiName` AS `UrgensiName`,`i`.`Tgl` AS `Tgl`,`i`.`NIsi` AS `NIsi`,`i`.`CreatedBy` AS `CreatedBy`,`i`.`CreationRoleId` AS `CreationRoleId`,`i`.`Instansipengirim` AS `InstansiPengirim`,`i`.`NTglReg` AS `Ntgl` from ((`inbox` `i` join `master_urgensi` `mu` on((`mu`.`UrgensiId` = `i`.`UrgensiId`))) join `inbox_files` on((`inbox_files`.`NId` = `i`.`NId`))) where (`i`.`NTipe` = 'outbox') order by `i`.`NTglReg` desc */;

/*View structure for view v_l_w */

/*!50001 DROP TABLE IF EXISTS `v_l_w` */;
/*!50001 DROP VIEW IF EXISTS `v_l_w` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_l_w` AS select `inbox_receiver`.`StatusReceive` AS `StatusReceive`,`inbox`.`NId` AS `NId`,`inbox`.`Nomor` AS `Nomor`,`inbox`.`Instansipengirim` AS `InstansiPengirim`,`inbox`.`NTglReg` AS `NTglReg`,`inbox_receiver`.`ReceiveDate` AS `ReceiveDate` from (`inbox` join `inbox_receiver` on((`inbox_receiver`.`NId` = `inbox`.`NId`))) group by `inbox`.`NId` */;

/*View structure for view v_s_keluar */

/*!50001 DROP TABLE IF EXISTS `v_s_keluar` */;
/*!50001 DROP VIEW IF EXISTS `v_s_keluar` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_s_keluar` AS select `inbox`.`Tgl` AS `Tgl`,`inbox`.`Nomor` AS `Nomor`,`inbox`.`Hal` AS `Hal`,`inbox`.`Instansipengirim` AS `InstansiPengirim`,`inbox`.`NTipe` AS `NTipe`,`inbox_files`.`FileName_real` AS `FileName_real`,`inbox`.`NId` AS `NId` from (`inbox` join `inbox_files` on((`inbox_files`.`NId` = `inbox`.`NId`))) where ((`inbox`.`NTipe` = 'outbox') and (`inbox`.`NId` is not null)) */;

/*View structure for view v_s_masuk */

/*!50001 DROP TABLE IF EXISTS `v_s_masuk` */;
/*!50001 DROP VIEW IF EXISTS `v_s_masuk` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_s_masuk` AS (select `i`.`NId` AS `NId`,`i`.`Nomor` AS `Nomor`,`i`.`Hal` AS `Hal`,`i`.`NTipe` AS `NTipe`,`i`.`BerkasId` AS `BerkasId`,`mu`.`UrgensiName` AS `UrgensiName`,`i`.`Tgl` AS `Tgl`,`i`.`NIsi` AS `NIsi`,`i`.`CreatedBy` AS `CreatedBy`,`i`.`CreationRoleId` AS `CreationRoleId`,`rr`.`RoleId_To` AS `RoleId_To`,`rr`.`StatusReceive` AS `StatusReceive`,`i`.`Instansipengirim` AS `InstansiPengirim`,`rr`.`ReceiveDate` AS `ReceiveDate`,`i`.`Instansipengirim` AS `zz` from ((`inbox` `i` join `inbox_receiver` `rr` on(((`rr`.`NKey` = `i`.`NKey`) and (`rr`.`NId` = `i`.`NId`)))) join `master_urgensi` `mu` on((`mu`.`UrgensiId` = `i`.`UrgensiId`))) where (`i`.`NId` is not null)) */;

/*View structure for view v_usu1 */

/*!50001 DROP TABLE IF EXISTS `v_usu1` */;
/*!50001 DROP VIEW IF EXISTS `v_usu1` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usu1` AS select `permohonanusul`.`PermohonanId` AS `PermohonanId`,`permohonanusul`.`NoSurat` AS `NoSurat`,`permohonanusul`.`TglSurat` AS `TglSurat` from `permohonanusul` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
