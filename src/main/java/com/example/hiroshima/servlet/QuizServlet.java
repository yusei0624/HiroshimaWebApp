package com.example.hiroshima.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.hiroshima.db.DBManager; // 作成したDBManagerをインポート
import com.example.hiroshima.model.Quiz;

/**
 * DB接続をテストし、クイズを1件取得してコンソールに表示するサーブレット
 */
@WebServlet("/QuizServlet") // ブラウザからこの名前でアクセスできるようにする
public class QuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // ★★★ここから修正・追加★★★
        // セッションオブジェクトを取得
        HttpSession session = request.getSession();

        // パラメータからクイズの開始を判断
        String action = request.getParameter("action");

        int questionNum = 1; // 問題番号のデフォルト値

        if (action != null && action.equals("start")) {
            // action=startなら、問題番号を1にリセット
            session.setAttribute("questionNum", 1);
        } else {
            // それ以外（「次の問題へ」ボタン）の場合
            Integer numInSession = (Integer) session.getAttribute("questionNum");
            if (numInSession == null) {
                // セッションに番号がなければ1から始める
                questionNum = 1;
            } else {
                // セッションの番号に1を足す
                questionNum = numInSession + 1;
            }
            session.setAttribute("questionNum", questionNum);
        }
        // ★★★ここまで修正・追加★★★

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Quiz quiz = null;

        try {
            conn = DBManager.getConnection();
            String sql = "SELECT * FROM quizzes ORDER BY RAND() LIMIT 1;";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                quiz = new Quiz();
                quiz.setId(rs.getInt("id"));
                quiz.setCategory(rs.getString("category"));
                quiz.setQuestion(rs.getString("question"));
                quiz.setChoice1(rs.getString("choice1"));
                quiz.setChoice2(rs.getString("choice2"));
                quiz.setChoice3(rs.getString("choice3"));
                quiz.setAnswer(rs.getInt("answer"));
                quiz.setExplanation(rs.getString("explanation"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("quiz", quiz);
        request.setAttribute("questionNum", questionNum); // ★JSPに問題番号を渡す
        
        request.getRequestDispatcher("/quiz.jsp").forward(request, response);
    }
}