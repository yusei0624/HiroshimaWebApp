卒業論文Web教材「知っとる？広島の魅力発見クイズ！」取扱説明書
本ドキュメントは、Webアプリケーションをローカル環境で動作させるための手順書です。

1. 概要
本アプリケーションは、インストラクショナル・デザインに基づき開発された、広島の魅力をクイズ形式で学習するWeb教材です。
開発言語: Java (Jakarta Servlet 6.0, JSP 4.0)
データベース: MySQL 8.0
Webサーバー: Apache Tomcat 10.1

2. 動作環境
本アプリケーションを動作させるには、以下の環境が必要です。
JDK: 17 以降
IDE: Eclipse IDE for Enterprise Java and Web Developers
Webサーバー: Apache Tomcat 10.1
データベース: MySQL 8.0

3. セットアップ手順

	3.1. データベースの構築MySQLサーバーを起動します。
	MySQL Workbenchなどのクライアントツールを使用して、このプロジェクトのルートディレクトリにあるdb_setup_final.sqlファイルを実行してください。
	これにより、hiroshima_quiz_dbデータベース、quizzesテーブル、glossariesテーブルが作成され、初期データが登録されます。

	3.2. データベース接続情報の確認
	src/main/java/com/example/hiroshima/db/DBManager.java ファイルを開き、以下の3つの定数がご自身のMySQL環境と一致しているか確認してください。必要に応じて修正をお願いいたします。
	private static final String URL = "jdbc:mysql://localhost/hiroshima_quiz_db";
	private static final String USER = "your_username"; // ご自身のMySQLユーザー名 (例: "root")
	private static final String PASSWORD = "your_password"; // ご自身のMySQLパスワード

	3.3. Eclipseへのプロジェクトのインポートと実行
	Eclipseで本プロジェクトをインポートします。
	Tomcatサーバーを構成し、本プロジェクトを追加します。
	サーバーを起動し、Webブラウザで以下のURLにアクセスしてください。http://localhost:8080/{プロジェクト名}/(例: http://localhost:8080/HiroshimaWebApp/)以上で、アプリケーションのトップページが表示されます。