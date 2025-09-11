package com.example.hiroshima.db;

// DBManager.java

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {
    // データベースの接続情報（自分の環境に合わせて変更してください）
	private static final String URL = "jdbc:mysql://localhost:3306/hiroshima_quiz_db";
    private static final String USER = "root";
    private static final String PASSWORD = "password";
    /**
     * データベースへの接続を取得します。
     * @return データベース接続オブジェクト
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        try {
            // JDBCドライバのロード
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("JDBCドライバのロードに失敗しました。", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    /**
     * データベース接続を安全にクローズします。
     * @param conn クローズする接続オブジェクト
     */
    public static void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    // StatementやResultSetをクローズするメソッドも同様に用意するとさらに便利です。
}