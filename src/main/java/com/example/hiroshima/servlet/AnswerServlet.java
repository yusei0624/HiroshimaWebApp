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

    // 1セットの問題数を定義
    private static final int TOTAL_QUESTIONS = 10;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //  セッションを取得 
        HttpSession session = request.getSession();

        // JSPからデータを受け取る
        String userAnswerStr = request.getParameter("userAnswer");
        String correctAnswerStr = request.getParameter("correctAnswer");
        String explanation = request.getParameter("explanation");
        String externalLink = request.getParameter("externalLink");
        
        // 正解不正化の判定
        boolean isCorrect = userAnswerStr != null && userAnswerStr.equals(correctAnswerStr);
        String resultMessage = isCorrect ? "正解！" : "残念、不正解…";

        //  セッションから現在の成績を取得 
        Integer totalCount = (Integer) session.getAttribute("totalCount");
        Integer correctCount = (Integer) session.getAttribute("correctCount");
        
        // セッションに初めて成績を記録する時の初期化
        if(totalCount == null) totalCount = 0;
        if(correctCount == null) correctCount = 0;

        // 問題の合計をカウント
        totalCount++;
        
        // 正解なら正解数もカウント
        if(isCorrect) {
            correctCount++;
        }
        
        //  更新した成績をセッションに保存 
        session.setAttribute("totalCount", totalCount);
        session.setAttribute("correctCount", correctCount);
        
        
        // 10問未満の場合
        if (totalCount < TOTAL_QUESTIONS) {
            // JSPに渡すデータをリクエストスコープに保存
        	request.setAttribute("isCorrect", isCorrect);
            request.setAttribute("resultMessage", resultMessage);
            request.setAttribute("explanation", explanation);
            request.setAttribute("externalLink", externalLink);
            
            // 今まで通り、各問題の結果ページへ
            request.getRequestDispatcher("/result.jsp").forward(request, response);
            
        // 10問に達した場合
        } else {
            // 最終結果ページへ
            request.getRequestDispatcher("/finalResult.jsp").forward(request, response);
        }
    }
}