<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>고객응대글 삭제 확인</title>
</head>
<body>
    <h2>고객응대글 삭제 확인</h2>

    <p>다음 글을 삭제하시겠습니까?</p>

    <p><strong>제목:</strong> ${custHdlg.custHdlgTitle}</p>
    <p><strong>작성자:</strong> ${custHdlg.custHdlgWriter}</p>

    <form action="${pageContext.request.contextPath}/custHdlg/delete" method="post">
        <input type="hidden" name="custHdlgId" value="${custHdlg.custHdlgId}" />
        <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');">삭제하기</button>
        <a href="${pageContext.request.contextPath}/custHdlg/list">취소</a>
    </form>
</body>
</html>
