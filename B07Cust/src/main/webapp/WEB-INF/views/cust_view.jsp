<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객응대 상세보기</title>
    <style>
        table {
            width: 90%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #aaa;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .center {
            text-align: center;
        }
    </style>
    <script>
    function deletePost(custPostId){
        if(confirm("정말로 삭제하시겠습니까?")){
            const form = document.forms['deleteFrm'];
            form.custPostId.value = custPostId;
            form.submit();
        }
    }
    </script>
</head>
<body>
<h2>고객응대 내용</h2>

<form name="deleteFrm" method="post" action="<c:url value='/cust/delete.do' />">
    <input type="hidden" name="custPostId" value="${dto.custPostId}" />
</form>

<table>
    <tr>
        <th>번호</th><td>${dto.custPostId}</td>
        <th>작성자</th><td>${dto.regUserId}</td>
    </tr>
    <tr>
        <th>작성일</th>
        <td>
            <c:out value="${dto.regDt}" /> <c:out value="${dto.regTm}" />
        </td>
        <th>수정일</th>
        <td>
            <c:out value="${dto.udtDt}" /> <c:out value="${dto.udtTm}" />
        </td>
    </tr>
    <tr>
        <th>제목</th><td colspan="3"><c:out value="${dto.title}" /></td>
    </tr>
    <tr>
        <th>내용</th><td colspan="3"><pre style="white-space: pre-wrap;"><c:out value="${dto.ctnt}" /></pre></td>
    </tr>
    <tr>
        <td colspan="4" class="center">
        <button type="button" onclick="location.href='cust/edit.do?custPostId=${dto.custPostId}'">수정</button>
        <button type="button" onclick="deletePost('${dto.custPostId}')">삭제</button>
        <button type="button" onclick="location.href='cust/list'">목록</button>
    </td>
    </tr>
</table>
</body>
</html>
