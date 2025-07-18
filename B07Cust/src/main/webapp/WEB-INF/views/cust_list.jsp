<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객응대 리스트</title>
    <link rel="stylesheet" href="<c:url value='/css/list.css'/>">
</head>
<body>
    <h2>고객응대 리스트</h2>

    <form method="get">
        <table width="90%">
            <tr>
                <td style="text-align: left;"> 
                    <select name="searchField">
                        <option value="CUST_POST_ID">번호</option>
                        <option value="TITLE">제목</option>
                        <option value="LOC">지역</option>
                        <option value="REG_USER_ID">작성자</option>
                        <option value="REG_DT">작성일</option>
                    </select>
                    <input type="text" name="searchKeyword" />
                    <input type="submit" value="검색하기" class="search-button" />
                </td>
            </tr>
        </table>      
    </form>

    <table width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="*">제목</th>
            <th width="15%">지역</th>
            <th width="10%">작성자</th>
            <th width="15%">작성일</th>
        </tr>

        <c:choose>
            <c:when test="${empty lists}"> 
                <tr>
                    <td colspan="5" align="center">
                        등록된 고객응대 게시물이 없습니다.
                    </td>
                </tr>
            </c:when> 
            <c:otherwise> 
                <c:forEach items="${lists}" var="row" varStatus="loop">    
                    <tr align="center">
                        <td>
                            <c:set var="vNum" value="${maps.totalCount - (((maps.pageNum-1) * maps.pageSize) + loop.index)}" />
                            ${vNum}
                        </td>
                        <td align="left"> 
                            <a href="./view.do?custPostId=${row.custPostId}&vNum=${vNum}">
                                ${row.title}
                            </a>
                        </td> 
                        <td>${row.loc}</td> 
                        <td>${row.regUserId}</td> 
                        <td>${row.regDt}</td> 
                    </tr>
                </c:forEach>        
            </c:otherwise>    
        </c:choose>
    </table>

    <table width="90%" class="pagination-table">
        <tr>
            <td>
                ${pagingImg}
            </td>
            <td style="text-align: right;">
                <button type="button"
                        onclick="location.href='./write.do';"
                        class="write-button">글쓰기</button>
            </td>
        </tr>
    </table>
</body>
</html>
