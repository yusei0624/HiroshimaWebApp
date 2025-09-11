<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ↓↓↓ この1行を追加することが解決策です！ ↓↓↓ --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/jsp/common/header.jsp" />

<div class="container">
    <%-- isCorrect の値によって表示するクラスを切り替える --%>
    <div class="result-box ${isCorrect ? 'correct' : 'incorrect'}">
        <div class="result-title">${resultMessage}</div>
    </div>
    
    <div class="explanation-box">
        <h4>【解説】</h4>
        <p>${explanation}</p>
    </div>
    
    <br>
    
    <div style="text-align: center;">
	    <a href="QuizServlet" class="btn-next">
	        次の問題へ
	    </a>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
