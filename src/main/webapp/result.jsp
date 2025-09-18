<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<jsp:include page="/WEB-INF/jsp/common/header.jsp" />

<div class="container">
    <%-- isCorrect の値によって 'correct' または 'incorrect' のクラス --%>
    <div class="result-box ${isCorrect ? 'correct' : 'incorrect'}">
        <div class="result-title">${resultMessage}</div>
    </div>
    
    <div class="explanation-box">
        <h4>【解説】</h4>
        <p>${explanation}</p>
        
        <%-- 外部リンク表示 --%>
        <c:if test="${not empty externalLink}">
            <div class="external-link">
                <a href="${externalLink}" target="_blank" rel="noopener noreferrer">
                    関連情報をもっと見る &raquo;
                </a>
            </div>
        </c:if>
    </div>
    
    <br>
    
    <div class="submit-area">
	    <a href="${pageContext.request.contextPath}/QuizServlet" class="btn btn-next">
	        次の問題へ
	    </a>
    </div>
</div>


<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

