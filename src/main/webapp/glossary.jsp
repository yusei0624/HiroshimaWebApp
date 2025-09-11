<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/jsp/common/header.jsp" />

<div class="container">
    <h2>用語集</h2>
    <p>広島の魅力に関連するキーワードです。</p>

    <!-- 検索フォーム -->
    <div class="search-box">
        <form action="GlossaryServlet" method="get">
            <input type="text" name="keyword" placeholder="キーワードで検索">
            <input type="submit" value="検索">
        </form>
    </div>

    <!-- 50音順リンク -->
    <div class="sort-links">
        <strong>50音順で探す:</strong><br>
        <a href="GlossaryServlet?initial=あ">あ行</a> |
        <a href="GlossaryServlet?initial=か">か行</a> |
        <a href="GlossaryServlet?initial=さ">さ行</a> |
        <a href="GlossaryServlet?initial=た">た行</a> |
        <a href="GlossaryServlet?initial=な">な行</a> |
        <a href="GlossaryServlet?initial=は">は行</a> |
        <a href="GlossaryServlet?initial=ま">ま行</a> |
        <a href="GlossaryServlet?initial=や">や行</a> |
        <a href="GlossaryServlet?initial=ら">ら行</a> |
        <a href="GlossaryServlet?initial=わ">わ行</a> |
        <a href="GlossaryServlet">すべて表示</a>
    </div>
    
    <!-- 用語リストの表示 -->
    <c:forEach var="glossary" items="${glossaryList}">
        <div class="glossary-item">
            <h3>${glossary.term}</h3>
            <p>${glossary.description}</p>
        </div>
    </c:forEach>
    
    <br>
    <a href="index.jsp">トップに戻る</a>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
