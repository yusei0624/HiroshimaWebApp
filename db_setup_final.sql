-- 卒業論文Web教材「知っとる？広島の魅力発見クイズ！」
-- ----------------------------------------------------

-- データベース `hiroshima_quiz_db` を作成
CREATE DATABASE IF NOT EXISTS `hiroshima_quiz_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `hiroshima_quiz_db`;

-- `quizzes` テーブルを作成
CREATE TABLE `quizzes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `question` text NOT NULL,
  `choice1` varchar(255) NOT NULL,
  `choice2` varchar(255) NOT NULL,
  `choice3` varchar(255) NOT NULL,
  `answer` int NOT NULL,
  `explanation` text,
  `image_url` varchar(255) DEFAULT NULL,
  `external_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

-- `glossaries` テーブルを作成
CREATE TABLE `glossaries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `term` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `term_yomi` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `external_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

-- `quizzes` テーブルにデータを登録
INSERT INTO `quizzes` VALUES
(1,'産業','広島県に本社を置く企業で、平均年収ランキング1位（984万円）を誇る、半導体などを製造する装置の会社はどこでしょう？','マツダ株式会社','ローツェ株式会社','株式会社大創産業',2,'マツダは売上高でトップですが、年収トップはローツェ株式会社です。高い技術力を持つ企業が広島の経済を支えています。',NULL,'https://www.rorze.com/'),
(2,'産業','100円ショップ「DAISO」を運営する株式会社大創産業の本社があるのは、広島県のどこでしょう？','広島市','呉市','東広島市',3,'実は、世界的な企業であるダイソーの本社は広島県東広島市にあります。広島の隠れた自慢の一つです。',NULL,'https://www.daiso-sangyo.co.jp/'),
(3,'自然','広島県尾道市と愛媛県今治市を結び「サイクリストの聖地」として世界的に有名な絶景ルートの名前は何でしょう？','やまなみ街道','しまなみ海道','ゆめしま海道',2,'しまなみ海道は、日本で初めて海峡を横断できるサイクリングロードが併設された道で、多くのサイクリストを魅了しています。',NULL,'https://dive-hiroshima.com/feature/island-shimanami/'),
(4,'自然','鞆の浦から船で約5分の仙酔島にある、全国的にも珍しくパワースポットとしても有名な5色（青・赤・黄・白・黒）の岩の名前は何でしょう？','七色岩','三色岩','五色岩',3,'この五色岩が見られるのは仙酔島だけで、仙人が住んでいたという伝説も残る神秘的な場所です。',NULL,'https://visittomonoura.com/2020/01/976/'),
(5,'食文化','今や広島のソウルフードであるお好み焼き。そのルーツとなった、昭和初期に駄菓子屋で売られていた食べ物の名前は何でしょう？','一銭洋食','十円焼き','百円食堂',1,'戦後の食料不足の時代に、安くてお腹いっぱいになる食事として、この「一銭洋食」から発展しました。',NULL,'https://www.maff.go.jp/j/keikaku/syokubunka/k_ryouri/search_menu/menu/42_7_hiroshima.html'),
(6,'食文化','広島が誇るカキの養殖では、最先端の技術が導入されています。ドローンやAIの他に、水温などをリアルタイムで把握するために使われているものは何でしょう？','海中ロボット','人工衛星','通信機能付きICTブイ',3,'伝統的な養殖技術に加えて、ICTブイなどのデータサイエンスを用いることで、高品質なカキを安定して生産しています。',NULL,'https://www.maff.go.jp/j/pr/aff/2202/spe1_03.html'),
(7,'食文化','広島の山間部で「ごちそう」として食べられている「ワニ料理」。この「ワニ」とは、何の肉のことでしょう？','ワニ','サメ','スッポン',2,'ワニとは、実はサメのことです。山間部では貴重なたんぱく源として、ハレの日に食べられてきました。',NULL,'https://www.nisshin-oillio.com/report/kikou/vol16.html'),
(8,'イベント','広島の夏の訪れを告げる風物詩として知られ、毎年6月の第1金曜日から3日間開催される広島三大祭の一つは何でしょう？','えびす講','とうかさん大祭','住吉祭',2,'「広島はとうかさん大祭で夏がくる」と言われるほど、市民に親しまれている伝統的なお祭りです。',NULL,'https://toukasan.jp/'),
(9,'イベント','毎年8月に広島で開催され、日本で唯一アカデミー賞の公認を受けているアニメーションの映画祭は何でしょう？','広島国際映画祭','ひろしまアニメーションシーズン','広島平和映画祭',2,'かつての「広島国際アニメーションフェスティバル」の精神を引き継ぎ、平和のメッセージを込めて開催される国際的な映画祭です。',NULL,'https://animation.hiroshimafest.org/about/'),
(10,'新名物','広島県が国内トップクラスの生産量を誇ることから生まれた新しい名物グルメで、皮ごと食べられるのが特徴の鍋料理は何でしょう？','レモン鍋','みかん鍋','かぼす鍋',1,'広島産のレモンを使ったさっぱりとした味わいが人気を呼び、今では新しい広島名物として定着しつつあります。',NULL,'https://dive-hiroshima.com/feature/ichioshi-lemon/');

-- `glossaries` テーブルにデータを登録
INSERT INTO `glossaries` VALUES
(1,'一銭洋食','戦後の食料不足の時代に、安くてお腹いっぱいになる食事として、この「一銭洋食」から発展しました。','いっせんようしょく',NULL,'https://www.maff.go.jp/j/keikaku/syokubunka/k_ryouri/search_menu/menu/42_7_hiroshima.html'),
(2,'五色岩','この五色岩が見られるのは仙酔島だけで、仙人が住んでいたという伝説も残る神秘的な場所です。','ごしきいわ',NULL,'https://visittomonoura.com/2020/01/976/'),
(3,'しまなみ海道','しまなみ海道は、日本で初めて海峡を横断できるサイクリングロードが併設された道で、多くのサイクリストを魅了しています。','しまなみかいどう',NULL,'https://dive-hiroshima.com/feature/island-shimanami/'),
(4,'ダイソー','100円ショップ「DAISO」を運営する株式会社大創産業のこと。本社は広島県東広島市にあります。','だいそー',NULL,'https://www.daiso-sangyo.co.jp/'),
(5,'とうかさん大祭','「広島はとうかさん大祭で夏がくる」と言われるほど、市民に親しまれている伝統的なお祭りです。','とうかさんたいさい',NULL,'https://toukasan.jp/'),
(6,'ひろしまアニメーションシーズン','かつての「広島国際アニメーションフェスティバル」の精神を引き継ぎ、平和のメッセージを込めて開催される国際的な映画祭です。','ひろしまあにめーしょんしーずん',NULL,'https://animation.hiroshimafest.org/about/'),
(7,'レモン鍋','広島産のレモンを使ったさっぱりとした味わいが人気を呼び、今では新しい広島名物として定着しつつあります。','れもんなべ',NULL,'https://dive-hiroshima.com/feature/ichioshi-lemon/'),
(8,'ローツェ株式会社','マツダは売上高でトップですが、年収トップはローツェ株式会社です。高い技術力を持つ企業が広島の経済を支えています。','ろーつぇかぶしきがいしゃ',NULL,'https://www.rorze.com/'),
(9,'ワニ料理','ワニとは、実はサメのことです。山間部では貴重なたんぱく源として、ハレの日に食べられてきました。','わにりょうり',NULL,'https://www.nisshin-oillio.com/report/kikou/vol16.html');

