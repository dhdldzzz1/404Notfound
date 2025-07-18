<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>고객응대글 수정</title>
</head>
<body>
    <h2>고객응대글 수정</h2>

    <form action="${pageContext.request.contextPath}/custHdlg/modify" method="post">
        <input type="hidden" name="custHdlgId" value="${custHdlg.custHdlgId}" />

        <label for="title">제목:</label><br/>
        <input type="text" id="title" name="custHdlgTitle" value="${custHdlg.custHdlgTitle}" required/><br/><br/>

        <label for="content">내용:</label><br/>
        <textarea id="content" name="custHdlgContent" rows="10" cols="50" required>${custHdlg.custHdlgContent}</textarea><br/><br/>

        <label for="writer">작성자:</label><br/>
        <input type="text" id="writer" name="custHdlgWriter" value="${custHdlg.custHdlgWriter}" readonly/><br/><br/>

        <button type="submit">수정 완료</button>
        <a href="${pageContext.request.contextPath}/custHdlg/list">목록으로</a>
    </form>
</body>
</html>
