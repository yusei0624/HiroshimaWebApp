<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/jsp/common/header.jsp" />

<div class="container">
    <c:if test="${not empty quiz}">
        <h2>第${questionNum}問 (${quiz.category})</h2>
        <p style="font-size: 1.2em; font-weight: bold;">${quiz.question}</p>
        
        <form action="AnswerServlet" method="post">
            <p><input type="radio" name="userAnswer" value="1" required> ${quiz.choice1}</p>
            <p><input type="radio" name="userAnswer" value="2"> ${quiz.choice2}</p>
            <p><input type="radio" name="userAnswer" value="3"> ${quiz.choice3}</p>
            
            <input type="hidden" name="correctAnswer" value="${quiz.answer}">
            <input type="hidden" name="explanation" value="${quiz.explanation}">
            <%-- --- ↓↓↓ 追加 ↓↓↓ --- --%>
            <input type="hidden" name="imageUrl" value="${quiz.imageUrl}">
            <input type="hidden" name="externalLink" value="${quiz.externalLink}">
            <%-- --- ↑↑↑ 追加 ↑↑↑ --- --%>
            
            <br>
            <input type="submit" value="回答する">
        </form>
    </c:if>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
