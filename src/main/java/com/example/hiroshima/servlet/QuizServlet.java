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

import com.example.hiroshima.db.DBManager;
import com.example.hiroshima.model.Quiz;

@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        int questionNum = 1;

        if (action != null && action.equals("start")) {
            session.setAttribute("questionNum", 1);
            // クイズの開始時に成績をリセット
            session.setAttribute("totalCount", 0);
            session.setAttribute("correctCount", 0);
        } else {
            Integer numInSession = (Integer) session.getAttribute("questionNum");
            if (numInSession == null) {
                questionNum = 1;
            } else {
                questionNum = numInSession + 1;
            }
            session.setAttribute("questionNum", questionNum);
        }

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
                quiz.setImageUrl(rs.getString("image_url"));
                quiz.setExternalLink(rs.getString("external_link"));
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
        request.setAttribute("questionNum", questionNum);
        request.getRequestDispatcher("/quiz.jsp").forward(request, response);
    }
}

