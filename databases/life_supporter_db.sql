-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 172.18.0.2:3306
-- 生成日時: 2020 年 3 月 29 日 22:39
-- サーバのバージョン： 8.0.19
-- PHP のバージョン: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `life_supporter`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `shopping_supporter_coupon_ticket`
--

CREATE TABLE `shopping_supporter_coupon_ticket` (
  `coupon_id` int NOT NULL,
  `type_id` int NOT NULL COMMENT 'どの種別か',
  `date_begin` date NOT NULL COMMENT '開始日',
  `date_end` date NOT NULL COMMENT '終了日（1日のみなら=date_begin）',
  `param_1` int NOT NULL COMMENT '説明文に埋め込むパラメータ',
  `param_2` int NOT NULL,
  `param_3` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='クーポン1枚の定義';

-- --------------------------------------------------------

--
-- テーブルの構造 `shopping_supporter_coupon_type`
--

CREATE TABLE `shopping_supporter_coupon_type` (
  `type_id` int NOT NULL,
  `type_name` varchar(13) NOT NULL,
  `description` varchar(64) NOT NULL COMMENT '使える条件など'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='クーポンの種別など';

-- --------------------------------------------------------

--
-- テーブルの構造 `shopping_supporter_item_master`
--

CREATE TABLE `shopping_supporter_item_master` (
  `item_id` int NOT NULL,
  `type_id` int NOT NULL,
  `item_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品定義';

-- --------------------------------------------------------

--
-- テーブルの構造 `shopping_supporter_item_possession`
--

CREATE TABLE `shopping_supporter_item_possession` (
  `item_id` int NOT NULL,
  `number_possession` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='現在の保有数';

-- --------------------------------------------------------

--
-- テーブルの構造 `shopping_supporter_item_purchase`
--

CREATE TABLE `shopping_supporter_item_purchase` (
  `item_id` int NOT NULL,
  `count` int NOT NULL COMMENT '一度の購入で何個買うか'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品の購入数定義';

-- --------------------------------------------------------

--
-- テーブルの構造 `shopping_supporter_item_type`
--

CREATE TABLE `shopping_supporter_item_type` (
  `type_id` int NOT NULL,
  `type_name` varchar(16) NOT NULL COMMENT '種別名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品種別';

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `shopping_supporter_coupon_ticket`
--
ALTER TABLE `shopping_supporter_coupon_ticket`
  ADD PRIMARY KEY (`coupon_id`),
  ADD KEY `type_id` (`type_id`);

--
-- テーブルのインデックス `shopping_supporter_coupon_type`
--
ALTER TABLE `shopping_supporter_coupon_type`
  ADD PRIMARY KEY (`type_id`);

--
-- テーブルのインデックス `shopping_supporter_item_master`
--
ALTER TABLE `shopping_supporter_item_master`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `type_id` (`type_id`);

--
-- テーブルのインデックス `shopping_supporter_item_possession`
--
ALTER TABLE `shopping_supporter_item_possession`
  ADD PRIMARY KEY (`item_id`);

--
-- テーブルのインデックス `shopping_supporter_item_purchase`
--
ALTER TABLE `shopping_supporter_item_purchase`
  ADD PRIMARY KEY (`item_id`);

--
-- テーブルのインデックス `shopping_supporter_item_type`
--
ALTER TABLE `shopping_supporter_item_type`
  ADD PRIMARY KEY (`type_id`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `shopping_supporter_coupon_ticket`
--
ALTER TABLE `shopping_supporter_coupon_ticket`
  MODIFY `coupon_id` int NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `shopping_supporter_coupon_type`
--
ALTER TABLE `shopping_supporter_coupon_type`
  MODIFY `type_id` int NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `shopping_supporter_item_master`
--
ALTER TABLE `shopping_supporter_item_master`
  MODIFY `item_id` int NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `shopping_supporter_item_type`
--
ALTER TABLE `shopping_supporter_item_type`
  MODIFY `type_id` int NOT NULL AUTO_INCREMENT;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `shopping_supporter_coupon_ticket`
--
ALTER TABLE `shopping_supporter_coupon_ticket`
  ADD CONSTRAINT `shopping_supporter_coupon_ticket_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `shopping_supporter_coupon_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- テーブルの制約 `shopping_supporter_item_master`
--
ALTER TABLE `shopping_supporter_item_master`
  ADD CONSTRAINT `shopping_supporter_item_master_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `shopping_supporter_item_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- テーブルの制約 `shopping_supporter_item_possession`
--
ALTER TABLE `shopping_supporter_item_possession`
  ADD CONSTRAINT `shopping_supporter_item_possession_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `shopping_supporter_item_master` (`item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- テーブルの制約 `shopping_supporter_item_purchase`
--
ALTER TABLE `shopping_supporter_item_purchase`
  ADD CONSTRAINT `shopping_supporter_item_purchase_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `shopping_supporter_item_master` (`item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
