<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객응대 등록</title>
</head>
<body>
<h2>고객응대 등록</h2>

<form method="post" action="write.do">
    <table border="1" width="90%">
        <tr>
            <td>고객 ID</td>
            <td><input type="text" name="custId" /></td>
        </tr>
        <tr>
            <td>발생 일시</td>
            <td><input type="text" name="ocurDttm" placeholder="YYYYMMDDHHMMSS" /></td>
        </tr>
        <tr>
            <td>지역</td>
            <td><input type="text" name="loc" /></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" /></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name="ctnt" rows="6" cols="50"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">등록</button>
                <button type="reset">다시쓰기</button>
                <button type="button" onclick="location.href='list.do'">목록</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>