-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Sam 14 Octobre 2017 à 07:26
-- Version du serveur: 5.6.11
-- Version de PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `nienluan`
--
CREATE DATABASE IF NOT EXISTS `nienluan` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `nienluan`;

-- --------------------------------------------------------

--
-- Structure de la table `ad`
--

CREATE TABLE IF NOT EXISTS `ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tieude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tomtat` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` varchar(7000) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Contenu de la table `ad`
--

INSERT INTO `ad` (`id`, `tieude`, `tomtat`, `noidung`, `path`) VALUES
(15, 'Hot giảm các dòng Nokia Lumia. Nhanh tay lên nhé các bạn!', 'Hot giảm các dòng Nokia Lumia. Nhanh tay lên nhé các bạn', ' <!--Giam gia mat hang Nokia-->\r\n        <h4 style="color:blue">Công ty chúng tôi giảm giá mặt hàng như sau:</h4>\r\n        <p class="text-muted">\r\n            Cuối tuần là thời điểm lý tưởng để đi mua sắm, nhất là săn đồ công nghệ giá giảm, giá sốc. Giảm giá 10 % các loại điện thoại NOKIA LUMIA. Các bạn hãy nhanh tay đặt mua kẻo hết.\r\n        </p>\r\n        <br>\r\n        <img src="https://compass-ssl.microsoft.com/assets/8e/ca/8eca6e45-3b1b-46c1-bb9f-b30f854debda.jpg?n=Image1_768x431.jpg" class="img-responsive">\r\n        <br>\r\n        <p class="text-muted">\r\n            Mẫu smartphone giá rẻ Nokia Lumia 620, mới đây đã được giảm giá thêm lần nữa trong chương trình mua online giá tiết kiệm tại Thế giới di động.\r\n        </p>\r\n        <br>\r\n        <img src="http://cdn.mos.cms.futurecdn.net/47c442f2811ce8e314cebadf910e14d7-1200-80.jpg" class="img-responsive">\r\n        <br>\r\n        <p>\r\n            Về thiết kế, Nokia Lumia  có khung vỏ bằng nhựa nhưng mặt sau với họa tiết phay xước giả kim loại trông khá là sang trọng. Mặt sau cũng được làm bo cong để dễ dàng cầm nắm, trang bị nút âm lượng khá lớn và lạ mắt, đây cũng là điểm nhấn cho máy khi nhìn từ phía sau.\r\n\r\n            Về cấu hình, Nokia lumia  trang bị màn hình 5 inch HD, bên trong là vi xử lý Snapdragon 410 64-bit, bộ nhớ RAM 2 GB, ROM 16 GB có hỗ trợ khe cắm microSD.\r\n        </p>\r\n        <img src="https://compass-ssl.microsoft.com/assets/ec/66/ec66b3b2-9038-4930-ac3e-10fdb9d8d247.jpg?n=Desktop_Latest-windows-phone.jpg" class="img-responsive">\r\n        <p>\r\n        <br>\r\n           Hiện giá bán của Nokia Lumai tại thị trường nước rất cao, chúng ta cùng đợi thêm ít ngày nữa xem giá bán sẽ hạ xuống bao nhiêu nhé.\r\n        </p>\r\n        ', 'tinvenokia640.jpg'),
(16, 'Giam nokia 640', 'Giam nokia 640', '<!--Giam gia mat hang Nokia-->\r\n        <h4 style="color:blue">Công ty chúng tôi giảm giá mặt hàng như sau:</h4>\r\n        <p class="text-muted">\r\n            Cuối tuần là thời điểm lý tưởng để đi mua sắm, nhất là săn đồ công nghệ giá giảm, giá sốc. Giảm giá 10 % các loại điện thoại NOKIA LUMIA. Các bạn hãy nhanh tay đặt mua kẻo hết.\r\n        </p>\r\n        <img src="https://compass-ssl.microsoft.com/assets/8e/ca/8eca6e45-3b1b-46c1-bb9f-b30f854debda.jpg?n=Image1_768x431.jpg" class="img-responsive">\r\n        <p class="text-muted">\r\n            Mẫu smartphone giá rẻ Nokia Lumia 620, mới đây đã được giảm giá thêm lần nữa trong chương trình mua online giá tiết kiệm tại Thế giới di động.\r\n        </p>\r\n        <img src="http://cdn.mos.cms.futurecdn.net/47c442f2811ce8e314cebadf910e14d7-1200-80.jpg" class="img-responsive">\r\n        <p>\r\n            Về thiết kế, Nokia Lumia  có khung vỏ bằng nhựa nhưng mặt sau với họa tiết phay xước giả kim loại trông khá là sang trọng. Mặt sau cũng được làm bo cong để dễ dàng cầm nắm, trang bị nút âm lượng khá lớn và lạ mắt, đây cũng là điểm nhấn cho máy khi nhìn từ phía sau.\r\n\r\n            Về cấu hình, Nokia lumia  trang bị màn hình 5 inch HD, bên trong là vi xử lý Snapdragon 410 64-bit, bộ nhớ RAM 2 GB, ROM 16 GB có hỗ trợ khe cắm microSD.\r\n        </p>\r\n        <img src="https://compass-ssl.microsoft.com/assets/ec/66/ec66b3b2-9038-4930-ac3e-10fdb9d8d247.jpg?n=Desktop_Latest-windows-phone.jpg" class="img-responsive">\r\n        <p>\r\n           Hiện giá bán của Nokia Lumai tại thị trường nước rất cao, chúng ta cùng đợi thêm ít ngày nữa xem giá bán sẽ hạ xuống bao nhiêu nhé.\r\n        </p>\r\n        ', 'DauTuanGiaSoc.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `coment`
--

CREATE TABLE IF NOT EXISTS `coment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventoryId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- Contenu de la table `coment`
--

INSERT INTO `coment` (`id`, `inventoryId`, `name`, `path`, `comment`, `date`) VALUES
(1, 'NL640', 'Võ Lê Trúc Quỳnh', 'gm.jpg', 'Tôi đã bình luận', 'Mon Sep 26 2016'),
(2, 'NL640', 'Võ Lê Trúc Quỳnh', 'gm.jpg', 'Hoài Anh đã bình luận', 'Mon Sep 26 2016'),
(3, 'NL830', 'Đỗ Thành Đạt', 'sad.jpg', 'Tôi đã bình luận dt 830', 'Mon Sep 26 2016'),
(4, 'NL640', 'Đỗ Thành Đạt', 'sad.jpg', 'Sản phẩm nokia 640 quá đẹp', 'Mon Sep 26 2016'),
(5, 'NL640', 'Đỗ Thành Đạt', 'sad.jpg', 'Tôi là phùng văn mỹ', 'Mon Sep 26 2016'),
(6, 'NL830', 'Võ Lê Trúc Quỳnh', 'gm.jpg', 'Cho tao bình luận với', 'Mon Sep 26 2016'),
(7, 'NL620', 'Võ Lê Trúc Quỳnh', 'gm.jpg', 'Tôi đã bình luận sản phẩm Lumia 620', 'Mon Sep 26 2016'),
(8, 'ON3', 'Đỗ Thành Đạt', 'zneymar.jpg', 'Tôi đã bình luận Neo 3', 'Tue Sep 27 2016'),
(9, 'NL550', 'Võ Lê Minh Trung', 'minion.jpg', 'Đã bình luận sản phẩm Nokia 550.', 'Tue Sep 27 2016'),
(12, 'NL550', 'Trần Công Hậu', 'zneymar.jpg', 'Đã xem', 'Tue Sep 27 2016'),
(13, 'ON9', 'Võ Lê Minh Trung', 'reus.jpg', 'Tôi đã bình luận neo 9', 'Wed Sep 28 2016'),
(14, 'ON7', 'Võ Lê Minh Trung', 'reus.jpg', 'Toi binh luan neo 7\n', 'Thu Sep 29 2016'),
(15, 'NL620', 'Phan Minh Tiễn', 'images.jpg', 'Đã xem Lumia 620', 'Fri Sep 30 2016'),
(16, 'NL525', 'Phan Minh Tiễn', 'dracula.jpg', 'Ahihi\n', 'Tue Oct 04 2016'),
(17, 'NL530', 'Võ Lê Minh Trung', 'images.jpg', 'I have a pen', 'Tue Oct 04 2016'),
(18, 'NL830', 'Võ Lê Minh Trung', 'dou.png', 'Da binh luan nokia 630', 'Wed Oct 05 2016'),
(19, 'NL525', 'Phan Minh Tiễn', 'images.jpg', 'Toi da binh luan', 'Sat Oct 08 2016'),
(20, 'NL525', 'Phan Minh Tiễn', 'images.jpg', 'Toi da binh luan', 'Sat Oct 08 2016'),
(21, 'NL620', 'Phan Minh Tiễn', 'images.jpg', 'ok', 'Sat Oct 08 2016'),
(22, 'ON10', 'Võ Lê Minh Trung', 'dracula.jpg', 'ahihi', 'Mon Oct 10 2016'),
(23, 'HTG', 'Võ Lê Minh Trung', 'dou.png', 'adu', 'Mon Oct 10 2016'),
(24, 'NL720', 'Võ Lê Minh Trung', 'reus.jpg', 'đã bình luận', 'Mon Oct 10 2016'),
(25, 'NL525', 'Võ Lê Minh Trung', 'gm.jpg', 'chem ', 'Tue Oct 11 2016'),
(26, 'NL525', 'Phan Minh Tiễn', 'dracula.jpg', 'ggggh', 'Sun Oct 16 2016'),
(27, 'NL620', 'Phan Minh Tiễn', 'images.jpg', 'kakaa', 'Tue Oct 18 2016'),
(28, 'ON3', 'Huỳnh Hoài Anh', 'matial.jpg', 'ahihi', 'Wed Oct 19 2016'),
(29, 'NL620', 'Võ Lê Minh Trung', 'gm.jpg', 'haiz', 'Wed Nov 02 2016'),
(30, 'SA7', 'Võ Lê Minh Trung', 'zneymar.jpg', 'ahiaha', 'Fri Nov 04 2016'),
(31, 'NL640', 'Võ Lê Minh Trung', 'zneymar.jpg', 'binh luan', 'Fri Nov 11 2016');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `traloi` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cauhoi` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `tinhtrang` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Contenu de la table `contact`
--

INSERT INTO `contact` (`id`, `user`, `email`, `traloi`, `cauhoi`, `tinhtrang`) VALUES
(8, 'Trung1995', 'Votrung017@gmail.com', 'Tôi đã trả lời bạn Trung1995.                      ', 'Tôi xin hỏi admin.', 'yes'),
(9, 'Trung1995', 'Votrung017@gmail.com', NULL, 'Tôi muốn hỏi admin.', 'no');

-- --------------------------------------------------------

--
-- Structure de la table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `InventoryID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `sreen` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hdh` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `cpu` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ram` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `camera` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `pin` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `gia` decimal(10,0) NOT NULL,
  `count` int(11) NOT NULL,
  `color` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `sale` int(11) NOT NULL,
  PRIMARY KEY (`InventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `inventory`
--

INSERT INTO `inventory` (`InventoryID`, `name`, `path`, `sreen`, `hdh`, `cpu`, `ram`, `camera`, `pin`, `gia`, `count`, `color`, `sale`) VALUES
('HTG', 'HTC Desire 820 +', 'htcdes.jpg', 'Super LCD 3, 5.5', 'Android 4.4 (KitKat)', 'MT6592 8 nhân 32-bit, 1.7 GHz', '1 GB', '8 MP', '2600 Mah', '4890000', 10, 'trắng', 0),
('IP5', 'Iphone 5 S', 'ip5.jpg', 'LED-backlit IPS LCD, 4', 'IOS 6', 'Apple A6 2 nhan 32-bit, 1.3 GHz', '1 GB', '8 MP', '1440 mAh', '5200000', 10, 'đen', 0),
('IP64', 'Iphone 6 Plus 64 GB', 'iphone64plus.jpg', 'LED-backlit IPS LCD, 5.5', 'iOS 8.0', 'Apple A8 2 nhan 64-bit, 1.4 GHz', '2 GB', '8 MP', '2915 mAh', '16450000', 9, 'trắng', 0),
('IP732', 'Iphone 7 32 GB', 'iphone732.png', ' 	Retina , 4.7 inches, 750 x 1334 pixels', 'IOS 10', ' Apple A10 Fusion', '2 GB', '12 MP, 4K Video', '2560 mah', '19190000', 2, 'đen ', 0),
('LN535', 'Nokia Lumia 535', 'lumia535.jpg', 'Super AMOLED, 6", Full HD', 'Android 5.1 (Lollipop)', 'Qualcomm Snapdragon S4, 1 GHz', '1 GB', '5 MP', '2000', '2000000', 0, 'xanh lá', 0),
('NL525', 'Nokia Lumia 525', 'lumia525.png', '4.0 inch (480 x 800 pixels)', 'Windows Phone 8', 'Cortex - A7 2 nhân', '512 GB', '5 MP', '2000 mAh', '1369000', 2, 'đen', 0),
('NL530', 'Nokia Lumia 530', 'lumia530w.jpg', 'TFT, 4', 'Windows Phone 8.1', 'Qualcomm Snapdragon 200 4 nhân 32-bit, 1.2 GHz', '512 MB', '5 MP', '1300 mah', '1700000', 0, 'trắng', 0),
('NL550', 'Nokia Lumia 550', 'lumia550.jpg', 'LCD, 4.7", HD', 'Windows 10 (for Mobile)', 'Snapdragon 210 4 nhân 32-bit, 1.15 GHz', '1 GB', '5 MP', '2000 mAh', '1950000', 3, 'đen', 0),
('NL620', 'Nokia Lumia 620', 'l620.jpg', 'IPS LCD, 3.8', 'Windows Phone 8', 'Qualcomm Snapdragon S4, 1 GHz', '512 MB', '5 MP', '2000 mah', '1250000', 6, 'vàng', 0),
('NL640', 'Nokia Lumia 640 XL', 'nokia640XL.jpg', 'IPS LCD, 4.5', 'Windows hone 8.1', 'Cortex-A7 2 nhân 32-bit, 1.3 GHz', '2 GB', '5 MP', '1900 mAh', '3500000', 4, 'trắng', 0),
('NL720', 'Nokia Lumia 720', 'lumia720.jpg', 'IPS LCD, 4.3', 'Windows Phone 8', 'Qualcomm MSM8227, 1 GHz', '2 MB', '5 MP', '2000 mah', '2350000', 1, 'vàng', 0),
('NL830', 'Nokia Lumia 830', 'nokia830.png', 'IPS LCD, 5", HD', 'Windows Phone 8.1 (Nâng cấp lên Windows 10)', 'Qualcomm Snapdragon 400 4 nhân 32-bit, 4 nhân 1.2 GHz', '1 GB', '10 MP', '2150 mAh', '2220000', 2, 'đen', 0),
('ON01', 'Oppo F1s', 'oppof1.png', 'IPS LCD, 4.5", FWVGA', 'Android 6.0 (Marshmallow)', 'Cortex-A7 2 nhân 32-bit, 1.3 GHz', '2 GB', '16 MP', '2630 mAh', '7850000', 5, 'hồng', 0),
('ON10', 'Oppo Neo 10', 'oppm5.jpg', 'IPS LCD, 4.5', 'Android 4.2.2 (Jelly Bean)', 'Cortex-A7 2 nhân 32-bit, 1.3 GHz', '1 GB', '5 MP', '2000 mAh', '3500000', 9, 'trắng', 0),
('ON3', 'Oppo Neo 3', 'OppoNeo3white.jpg', 'IPS LCD, 4.5', 'Android 4.2.2 (Jelly Bean)', 'Cortex-A7 2 nhân 32-bit, 1.3 GHz', '1 GB', '5 MP', '1900 mAh', '3500000', 6, 'trắng', 0),
('ON7', 'Oppo Neo 7', 'opponeo7.png', 'IPS LCD, 5", qHD', 'Android 5.1 (Lollipop)', 'MTK 6582 4 nhân 32-bit, 1.3 GHz', '1 GB', '16 MP', '2420 mAh', '5400000', 6, 'trắng', 0),
('ON9', 'Oppo Neo 9', 'neo9.jpg', 'IPS LCD, 5', 'Android 5.1 (Lollipop)', 'Qualcomm Snapdragon 410 4 nhân 64-bit, 1.2 GHz', '2 GB', '8 MP', '2630 mAh', '4490000', 8, 'hồng', 10),
('SA05', 'Samsung Galaxy Note 5', 'galaxyn5.jpg', 'Super AMOLED, 5.7', 'Android 6.0 (Marshmallow)', 'Apple A6 2 nhan 32-bit, 1.3 GHz', '4 GB', '16 MP', '3000 mAh', '12000000', 10, 'trắng', 0),
('SA07', 'Samsung Galaxy J7 Prime', 'Samsung07.jpg', '5.5 inch (1080 x 1920 pixels)', 'Android Marshmallow 6.0.1', 'Cortex-A7 2 nhan 32-bit, 1.3 GHz', '2 GB', '13 MP', '2420 mAh', '6290000', 4, 'đen', 0),
('SA5', 'Samsung Galaxy J5 2016', 'saj5.jpg', 'IPS LCD, 5", HD', 'Android 6.0 (Marshmallow)', 'Cortex-A7 2 nhân 32-bit, 1.3 GHz', '2 GB', '16 MP', '2630 mAh', '4990000', 5, 'hồng', 0),
('SA6', 'Samsung Tab A6', 'satapa6.png', 'HFFS - LCD, 10.1', 'Android 6.0 (Marshmallow)', 'Exynos 7870, 1.6 GHz', '2 GB', '16 MP', '7300 mAh', '8990000', 5, 'đen', 0),
('SA7', 'Samsung Galaxy A7', 'sa7png.png', 'Super AMOLED, 5.5', 'Android 5.0 (Lollipop)', 'Snapdragon 615 8 nhân 64-bit, Quad-core 1.5 GHz + Quad-core 1 GHz', '2 GB', '8 MP', '2630 mAh', '6590000', 10, 'trắng', 0),
('SA9', 'Samsung Galaxy A9 Pro', 'samsunA9.jpg', 'Super AMOLED, 6', 'Android 6.0 (Marshmallow)', 'Qualcomm Snapdragon 652 8 nhân, 4 nhân 1.8 GHz Cortex ', '5000 mAh', '5 MP', '5000 mAh', '4200000', 10, 'đen', 0),
('SaE5', 'Samsung galaxy E5', 'sae5.jpg', 'Super AMOLED, 5', 'Android 4.4 (KitKat)', 'Qualcomm Snapdragon 410 4 nhan 64-bit, 1.2 GHz', '1.5 GB', '5 MP', '2400 mAh', '5000000', 15, 'trắng', 0);

-- --------------------------------------------------------

--
-- Structure de la table `jops`
--

CREATE TABLE IF NOT EXISTS `jops` (
  `id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `tieude` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` varchar(3000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `jops`
--

INSERT INTO `jops` (`id`, `tieude`, `noidung`) VALUES
('1', 'Day la trang 1', '<a>\r\n            Ngày nay, ghế sofa, thảm được sử dụng rộng rãi trong kiến trúc nhà cửa, phòng ốc, công ty v.v. Không chỉ đem đến cảm giác thoải mái cho người sử dụng, sofa, thảm còn đem đến vẻ đẹp sang trọng cho căn phòng chúng ta\r\n.\r\n\r\n        Để sở hữu một bộ sofa, thảm ưng ý tại thời điểm này là khá dễ dàng bởi sự đa dạng của chủng loại, mẫu mã, kích thước sản phẩm. Tuy nhiên để giữ cho nó luôn sạch đẹp theo thời gian là đều mà người dùng khó có thể làm được vì những vết bẩn thường trực, sẵn sàng bám trên bề mặt trong quá trình sử dụng.\r\n\r\n\r\n        Vì vậy, giặt ghế, thảm là việc cần thiết bạn phải làm để giữ cho sản phẩm luôn ở tình trạng sạch đẹp, tạo cảm giác thoải mái khi sử dụng cũng như giữ được sự sang trọng cho không gian nội thất căn phòng của bạn.\r\n\r\n\r\n        Để giúp bạn tiết kiệm thời gian, công sức cũng như đạt hiệu quả cao nhất, Vietcarework cung ứng dịch vụ giặt tận nhà các loại ghế sofa, thảm, ghế văn phòng\r\n        </a>\r\n        <img src="http://vietcarework.com/source/dich%20vu/giat_tham.jpg?1482566174277">'),
('2', '1. Giới thiệu: Vệ sinh công nghiệp là gì?', ' <p>\r\n           \r\n        Vệ sinh công nghiệp là sự kết hợp giữa bàn tay con người và tri thức trong việc làm sạch. Khác với các hình thức vệ sinh thông dụng, vệ sinh công nghiệp cần đến việc sử dụng các hóa chất chuyên dụng, các thiết bị vệ sinh công nghiệp đặc thù để làm sạch nhanh với diện tích làm sạch lớn và đánh bật các vết bẩn khó mà việc làm vệ sinh thông thường hàng ngày không giải quyết được. Trả lại cho tòa nhà sự mới mẻ ban đầu, làm khung cảnh trở nên đẹp, tươi sáng, sạch sẽ và trong lành.\r\n\r\n        Dịch vụ vệ sinh công nghiệp tại Vietcarework được áp dụng các phương pháp hiện đại, máy móc và các phương tiện dịch vụ vệ sinh đều được thực hiện theo quy trình chuẩn mực, khắt khe mà Vietcarework đã hướng dẫn nhân viên của mình. Chúng tôi luôn muốn tạo một môi trường làm việc hiện đại để sẵn sàng đáp ứng các yêu cầu làm sạch cho quý khách hàng.\r\n        </p>\r\n        <img src="http://vietcarework.com/source/dich%20vu/anh_ve_sinh_cn.jpg?1482565751221">\r\n        \r\n\r\n        <p>2. Đội ngũ nhân viên:\r\n\r\n        Đội ngũ nhân viên Vietcarework luôn đáp ứng các yêu cầu khắt khe của khách hàng, toàn thể cán bộ nhân viên công ty luôn ý thức được rằng chính sự phục vụ tận tình, và niềm đam mê nghề nghiệp làm đến đâu sạch đến đó, cùng phương châm hết lòng vì khách hàng để phục vụ thật tốt các yêu cầu mà khách hàng đề ra.\r\n\r\n        3. Công việc nhận làm:\r\n\r\n        Chúng tôi chuyên cung cấp dịch vụ vệ sinh chà sàn cho các công trình lớn: Tòa nhà cao tầng, văn phòng công ty, vệ sinh trường học, vệ sinh bệnh viện, chung cư, xí nghiệp các khu công nghiệp, công trình sau xây dựng v.v\r\n\r\n        - Tổng vệ sinh toàn bộ tòa nhà, lau kính mặt trong.\r\n\r\n        - Chà sàn, đánh bóng.\r\n\r\n        4. Quy trình làm việc:</p>\r\n        <img src="http://vietcarework.com/source/dich%20vu/quy_trinh_vscn.jpg?1482565774029">\r\n        <p>Để sử dụng dịch vụ Quý khách hàng vui lòng đăt trước dịch vụ 1 ngày..\r\n\r\nĐến trực tiếp trụ sở công ty: 56 Đường C12, Phường 13, Quận Tân Bình, TP.HCM\r\n\r\nChi nhánh: 451/50 XVNT, P.26, Bình Thạnh, TP.HCM</p>'),
('3', 'Day la trang 3', 'Noi dung cua trang so 3');

-- --------------------------------------------------------

--
-- Structure de la table `kh`
--

CREATE TABLE IF NOT EXISTS `kh` (
  `user` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `repassword` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gioitinh` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `kh`
--

INSERT INTO `kh` (`user`, `password`, `repassword`, `name`, `phone`, `address`, `gioitinh`, `path`, `note`) VALUES
('admin', 'admin', 'admin', 'Huỳnh Hoài Anh', '01663550900', 'Thới Bình-Cà Mau', 'nam', 'dracula.jpg', 'Tôi vừa cập nhật lại'),
('pmt1995', '12345', '12345', 'Phan Minh Tiễn', '01663550900', 'Tân Lược- Bình Tân -Vĩnh Long', 'nam', 'dracula.jpg', 'Tôi đã sửa lại'),
('Trung1995', '12345', '12345', 'Huỳnh Hoài Anh', '01663550900', 'Tân Lược- Bình Tân -Vĩnh Long', 'nam', 'zneymar.jpg', 'A hihi'),
('vlmt1995', '123456', '123456', 'Võ Lê Minh Trung', '1663550900', 'Tân Lược-Bình Tân-Vĩnh Long', 'nam', 'dou.png', '');

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `repassword` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `person`
--

INSERT INTO `person` (`username`, `password`, `repassword`, `name`, `phone`, `address`, `sex`, `path`, `note`) VALUES
('', '', '', '', NULL, NULL, NULL, NULL, NULL),
('admin', 'admin', 'admin', 'Vo le minh trung', NULL, NULL, NULL, NULL, NULL),
('anh', '123456', '12345', 'anh', NULL, NULL, NULL, NULL, NULL),
('Anh1995', '12345', '12345', 'Huynh hoai anh', NULL, NULL, NULL, NULL, NULL),
('Trung1995', '123456', '123456', 'Vlmt', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `purchaseorder`
--

CREATE TABLE IF NOT EXISTS `purchaseorder` (
  `purchaseId` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `purchaseName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `purchaseDate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total` decimal(25,0) NOT NULL,
  `status` int(11) NOT NULL,
  `give` int(11) NOT NULL,
  PRIMARY KEY (`purchaseId`),
  KEY `user` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Contenu de la table `purchaseorder`
--

INSERT INTO `purchaseorder` (`purchaseId`, `user`, `purchaseName`, `purchaseDate`, `total`, `status`, `give`) VALUES
(37, 'Trung1995', 'Võ Lê Minh Trung', 'Wed Nov 09 2016', '7400000', 1, 0),
(38, 'Trung1995', 'Huỳnh Hoài Anh', 'Fri Nov 11 2016', '4869000', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `purchaseorderdetail`
--

CREATE TABLE IF NOT EXISTS `purchaseorderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseId` int(11) NOT NULL,
  `InventoryId` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cost` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `InventoryId` (`InventoryId`),
  KEY `purchaseId` (`purchaseId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=56 ;

--
-- Contenu de la table `purchaseorderdetail`
--

INSERT INTO `purchaseorderdetail` (`id`, `purchaseId`, `InventoryId`, `count`, `color`, `cost`) VALUES
(52, 37, 'NL640', 1, 'trắng', 3500000),
(53, 37, 'NL550', 2, 'đen', 3900000),
(54, 38, 'NL640', 1, 'trắng', 3500000),
(55, 38, 'NL525', 1, 'đen', 1369000);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD CONSTRAINT `purchaseorder_ibfk_1` FOREIGN KEY (`user`) REFERENCES `kh` (`user`);

--
-- Contraintes pour la table `purchaseorderdetail`
--
ALTER TABLE `purchaseorderdetail`
  ADD CONSTRAINT `purchaseorderdetail_ibfk_1` FOREIGN KEY (`InventoryId`) REFERENCES `inventory` (`InventoryID`),
  ADD CONSTRAINT `purchaseorderdetail_ibfk_2` FOREIGN KEY (`purchaseId`) REFERENCES `purchaseorder` (`purchaseId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
