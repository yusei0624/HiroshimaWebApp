<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<jsp:include page="/WEB-INF/jsp/common/header.jsp" />

<div class="container">
    
    <c:if test="${not empty quiz}">
        <h2>第${questionNum}問 (${quiz.category})</h2>
        
        <p class="question-text">${quiz.question}</p>
        
        <%-- 回答をAnswerServletにPOST送信 --%>
        <form action="${pageContext.request.contextPath}/AnswerServlet" method="post">
            
            <div class="choices">
                <label><input type="radio" name="userAnswer" value="1" required> ${quiz.choice1}</label>
                <label><input type="radio" name="userAnswer" value="2"> ${quiz.choice2}</label>
                <label><input type="radio" name="userAnswer" value="3"> ${quiz.choice3}</label>
            </div>
            
            <%-- 正解番号・解説・外部リンクをサーブレットに渡す --%>
            <input type="hidden" name="correctAnswer" value="${quiz.answer}">
            <input type="hidden" name="explanation" value="${quiz.explanation}">
            <input type="hidden" name="externalLink" value="${quiz.externalLink}">
            
            
            <div class="submit-area">
                <input type="submit" value="回答する" class="btn btn-primary">
            </div>
        </form>
    
    </c:if>
    
   
</div>


<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

