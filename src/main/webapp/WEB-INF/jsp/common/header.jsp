<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>知っとる？広島の魅力発見クイズ！</title>
<%-- Google Fontsの読み込み --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <header class="header">
        <h1>知っとる？広島の魅力発見クイズ！</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/index.jsp">トップ</a>
            <a href="${pageContext.request.contextPath}/QuizServlet?action=start">クイズ</a>
            <a href="${pageContext.request.contextPath}/GlossaryServlet">用語集</a>
        </nav>
        
        <%-- ★★★ 成績表示エリアを追加 ★★★ --%>
        <%-- セッションにtotalCountがあり、かつ1問以上解答した場合のみ表示 --%>
        <c:if test="${not empty sessionScope.totalCount && sessionScope.totalCount > 0}">
            <div class="score-board">
                現在の成績: ${sessionScope.totalCount}問中 ${sessionScope.correctCount}問正解
            </div>
        </c:if>

    </header>
    <main>

