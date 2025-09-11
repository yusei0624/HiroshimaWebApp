package com.example.hiroshima.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AnswerServlet")
public class AnswerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userAnswerStr = request.getParameter("userAnswer");
        String correctAnswerStr = request.getParameter("correctAnswer");
        String explanation = request.getParameter("explanation");
        
        boolean isCorrect = userAnswerStr != null && userAnswerStr.equals(correctAnswerStr);
        String resultMessage = isCorrect ? "正解！" : "残念、不正解…";

        // ★★★ JSPで色分けに使うための boolean 値も渡す ★★★
        request.setAttribute("isCorrect", isCorrect);
        request.setAttribute("resultMessage", resultMessage);
        request.setAttribute("explanation", explanation);
        
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }
}
