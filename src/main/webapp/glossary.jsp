<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/jsp/common/header.jsp" />

<div class="container">
    <h2>用語集</h2>
    <p>広島の魅力に関連するキーワードです。</p>

    <%-- 50音順リンク --%>
    <div class="sort-links">
        <strong>50音順で探す:</strong><br>
        <a href="${pageContext.request.contextPath}/GlossaryServlet?initial=あ">あ行</a> |
        <a href="${pageContext.request.contextPath}/GlossaryServlet?initial=か">か行</a> |
        <a href="${pageContext.request.contextPath}/GlossaryServlet?initial=さ">さ行</a> |
        <a href="${pageContext.request.contextPath}/GlossaryServlet?initial=た">た行</a> |
        <a href="${pageContext.request.contextPath}/GlossaryServlet?initial=な">な行</a> |
        <a href="${pageContext.request.contextPath}/GlossaryServlet?initial=は">は行</a> |
        <a href="${pageContext.request.contextPath}/GlossaryServlet?initial=ま">ま行</a> |
        <a href="${pageContext.request.contextPath}/GlossaryServlet?initial=や">や行</a> |
        <a href="${pageContext.request.contextPath}/GlossaryServlet?initial=ら">ら行</a> |
        <a href="${pageContext.request.contextPath}/GlossaryServlet?initial=わ">わ行</a> |
        <a href="${pageContext.request.contextPath}/GlossaryServlet">すべて表示</a>
    </div>
    
    <c:forEach var="glossary" items="${glossaryList}">
        <div class="glossary-item">
            <h3>${glossary.term}</h3>
            <p>${glossary.description}</p>
            
            <c:if test="${not empty glossary.externalLink}">
	            <div class="external-link">
	                <a href="${glossary.externalLink}" target="_blank" rel="noopener noreferrer">
	                    関連情報をもっと見る &raquo;
	                </a>
	            </div>
            </c:if>
        </div>
    </c:forEach>
    
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

