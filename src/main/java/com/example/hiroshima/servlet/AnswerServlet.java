package com.example.hiroshima.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AnswerServlet")
public class AnswerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ★★★ セッションオブジェクトを取得 ★★★
        HttpSession session = request.getSession();

        // JSPからのデータを受け取る
        String userAnswerStr = request.getParameter("userAnswer");
        String correctAnswerStr = request.getParameter("correctAnswer");
        String explanation = request.getParameter("explanation");
        String imageUrl = request.getParameter("imageUrl");
        String externalLink = request.getParameter("externalLink");
        
        // 正誤判定
        boolean isCorrect = userAnswerStr != null && userAnswerStr.equals(correctAnswerStr);
        String resultMessage = isCorrect ? "正解！" : "残念、不正解…";

        // ★★★ セッションから現在の成績を取得 ★★★
        Integer totalCount = (Integer) session.getAttribute("totalCount");
        Integer correctCount = (Integer) session.getAttribute("correctCount");
        
        // セッションに初めて成績を記録する場合の初期化
        if(totalCount == null) totalCount = 0;
        if(correctCount == null) correctCount = 0;

        // ★★★ 総問題数をカウントアップ ★★★
        totalCount++;
        
        // ★★★ 正解なら正解数もカウントアップ ★★★
        if(isCorrect) {
            correctCount++;
        }
        
        // ★★★ 更新した成績をセッションに保存 ★★★
        session.setAttribute("totalCount", totalCount);
        session.setAttribute("correctCount", correctCount);
        
        // JSPに渡すデータをリクエストスコープに保存
        request.setAttribute("isCorrect", isCorrect);
        request.setAttribute("resultMessage", resultMessage);
        request.setAttribute("explanation", explanation);
        request.setAttribute("imageUrl", imageUrl);
        request.setAttribute("externalLink", externalLink);
        
        // result.jspにフォワード
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }
}

