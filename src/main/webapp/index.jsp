<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- 共通ヘッダーを読み込み --%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp" />

<div class="top-container"> <%-- style属性を削除し、classを適用 --%>
    <h2>「知っとる？広島の魅力発見クイズ！」へようこそ！</h2>
    <p>このWeb教材は、広島のあまり知られていない魅力をクイズや用語集を通して楽しく学ぶことができます。</p>
    <p>あなたの広島知識を試してみましょう！</p>
    
    <div class="btn-group"> <%-- style属性を削除し、classを適用 --%>
		<%-- 「クイズに挑戦する」ボタンの a タグを修正 --%>
		<a href="QuizServlet?action=start" class="btn btn-primary">
			クイズに挑戦する </a> <a href="GlossaryServlet" class="btn btn-secondary"> <%-- style属性を削除し、classを適用 --%>
            用語集を見る
        </a>
    </div>
</div>

<%-- 共通フッターを読み込み --%>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />