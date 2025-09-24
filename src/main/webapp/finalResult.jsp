<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>クイズ結果発表！ | 知っとる？広島の魅力発見クイズ！</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <%@ include file="WEB-INF/jsp/common/header.jsp" %>
        
        <main>
            <div class="result-container" style="text-align: center;"> 
                <h2>最終結果</h2>
                <p class="final-score" style="font-size: 1.5em; margin: 20px 0;"> 
                    10問中、<span class="score-highlight" style="font-size: 2em; color: #dc3545; font-weight: bold;">${sessionScope.correctCount}</span> 問正解です！
                </p>
                
                <%
                    Integer correctCount = (Integer) session.getAttribute("correctCount");
                    if (correctCount != null) {
                        if (correctCount >= 8) {
                %>
                    <p class="result-message">素晴らしい！あなたはもう広島マスターですね！</p>
                <%
                        } else if (correctCount >= 5) {
                %>
                    <p class="result-message">おしい！半分以上正解です！また挑戦してみてくださいね。</p>
                <%
                        } else {
                %>
                    <p class="result-message">まだまだ伸びしろがありますね！用語集で復習してみましょう。</p>
                <%
                        }
                    }
                %>

                <div class="button-container" style="margin-top: 30px;"> 
                    
                    <a href="QuizServlet?action=start" class="btn btn-primary">もう一度挑戦する</a>
                    <a href="index.jsp" class="btn btn-secondary">トップに戻る</a>
                </div>
            </div>
        </main>
        
        <%@ include file="WEB-INF/jsp/common/footer.jsp" %>
    </div>
</body>
</html>