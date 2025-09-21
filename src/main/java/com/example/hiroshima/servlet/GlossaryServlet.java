package com.example.hiroshima.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.hiroshima.db.DBManager;
import com.example.hiroshima.model.Glossary;

@WebServlet("/GlossaryServlet")
public class GlossaryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 50音順リンクから送られてくる 'initial' パラメータのみを取得
        String initial = request.getParameter("initial");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Glossary> glossaryList = new ArrayList<>();

        try {
            conn = DBManager.getConnection();
            
            StringBuilder sql = new StringBuilder("SELECT * FROM glossaries WHERE 1=1");
            List<Object> params = new ArrayList<>();

            // 50音順絞り込みの条件のみを処理
            if (initial != null && !initial.isEmpty()) {
                String start = "";
                String end = "";
                switch (initial) {
                    case "あ": start = "あ"; end = "お"; break;
                    case "か": start = "か"; end = "ご"; break;
                    case "さ": start = "さ"; end = "ぞ"; break;
                    case "た": start = "た"; end = "ど"; break;
                    case "な": start = "な"; end = "の"; break;
                    case "は": start = "は"; end = "ぽ"; break;
                    case "ま": start = "ま"; end = "も"; break;
                    case "や": start = "や"; end = "よ"; break;
                    case "ら": start = "ら"; end = "ろ"; break;
                    case "わ": start = "わ"; end = "ん"; break;
                }
                if (!start.isEmpty() && !end.isEmpty()) {
                    sql.append(" AND term_yomi >= ? AND term_yomi < ?");
                    params.add(start);
                    params.add(getNextInitial(end)); 
                }
            }

            // 読み仮名順で並び替え
            sql.append(" ORDER BY term_yomi;");
            
            pstmt = conn.prepareStatement(sql.toString());
            
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i + 1, params.get(i));
            }
            
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Glossary glossary = new Glossary();
                glossary.setId(rs.getInt("id"));
                glossary.setTerm(rs.getString("term"));
                glossary.setDescription(rs.getString("description"));
                glossary.setTermYomi(rs.getString("term_yomi"));
                glossary.setExternalLink(rs.getString("external_link"));
                glossaryList.add(glossary);
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
        
        request.setAttribute("glossaryList", glossaryList);
        request.getRequestDispatcher("/glossary.jsp").forward(request, response);
    }
    
    private String getNextInitial(String endChar) {
        switch (endChar) {
            case "お": return "か";
            case "ご": return "さ";
            case "ぞ": return "た";
            case "ど": return "な";
            case "の": return "は";
            case "ぽ": return "ま";
            case "も": return "や";
            case "よ": return "ら";
            case "ろ": return "わ";
            case "ん": return "ん";
            default: return "";
        }
    }
}

