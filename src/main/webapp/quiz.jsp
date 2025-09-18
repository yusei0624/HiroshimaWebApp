<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- 共通ヘッダーを読み込み --%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp" />

<div class="container">
    <%-- サーブレットから渡されたquizオブジェクトが存在する場合のみ表示 --%>
    <c:if test="${not empty quiz}">
        <h2>第${questionNum}問 (${quiz.category})</h2>
        
        <p class="question-text">${quiz.question}</p>
        
        <%-- 回答をAnswerServletにPOST送信するフォーム --%>
        <form action="${pageContext.request.contextPath}/AnswerServlet" method="post">
            
            <%-- 選択肢をラジオボタンで表示 --%>
            <div class="choices">
                <label><input type="radio" name="userAnswer" value="1" required> ${quiz.choice1}</label>
                <label><input type="radio" name="userAnswer" value="2"> ${quiz.choice2}</label>
                <label><input type="radio" name="userAnswer" value="3"> ${quiz.choice3}</label>
            </div>
            
            <%-- 画面には表示されない隠しデータとして、正解番号・解説・外部リンクを次のサーブレットに渡す --%>
            <input type="hidden" name="correctAnswer" value="${quiz.answer}">
            <input type="hidden" name="explanation" value="${quiz.explanation}">
            <input type="hidden" name="externalLink" value="${quiz.externalLink}">
            
            <%-- 回答ボタン --%>
            <div class="submit-area">
                <input type="submit" value="回答する" class="btn btn-primary">
            </div>
        </form>
    
    </c:if>
    
    <%-- もしクイズが取得できなかった場合の表示 --%>
    <c:if test="${empty quiz}">
        <p>クイズの問題を取得できませんでした。データベースを確認してください。</p>
    </c:if>
</div>

<%-- 共通フッターを読み込み --%>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

