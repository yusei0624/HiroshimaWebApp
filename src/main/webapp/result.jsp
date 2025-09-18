<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- 共通ヘッダーを読み込み --%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp" />

<div class="container">
    <%-- isCorrect の値によって 'correct' または 'incorrect' のクラスを動的に適用 --%>
    <div class="result-box ${isCorrect ? 'correct' : 'incorrect'}">
        <div class="result-title">${resultMessage}</div>
    </div>
    
    <%-- 解説表示エリア --%>
    <div class="explanation-box">
        <h4>【解説】</h4>
        <p>${explanation}</p>
        
        <%-- 外部リンクが存在する場合のみ表示 --%>
        <c:if test="${not empty externalLink}">
            <div class="external-link">
                <a href="${externalLink}" target="_blank" rel="noopener noreferrer">
                    関連情報をもっと見る &raquo;
                </a>
            </div>
        </c:if>
    </div>
    
    <br>
    
    <%-- 「次の問題へ」ボタン --%>
    <div class="submit-area">
	    <a href="${pageContext.request.contextPath}/QuizServlet" class="btn btn-next">
	        次の問題へ
	    </a>
    </div>
</div>

<%-- 共通フッターを読み込み --%>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

