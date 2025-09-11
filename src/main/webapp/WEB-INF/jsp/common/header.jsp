<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>知っとる？広島の魅力発見クイズ！</title>
<%-- ↓↓↓ 以下の2行を追加・修正 ↓↓↓ --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <header class="header">
        <h1>知っとる？広島の魅力発見クイズ！</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/QuizServlet">クイズ</a>
            <a href="${pageContext.request.contextPath}/GlossaryServlet">用語集</a>
        </nav>
    </header>
    <main>