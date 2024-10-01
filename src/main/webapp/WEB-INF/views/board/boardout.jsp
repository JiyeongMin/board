<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background-image: url(./image/짱구제목2.jfif);
	background-size: cover;
}
table {
	border-color: navy;
}
th {
	text-align: center;
}
td {
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="3" width="900px" height="150px" align="center">
<caption><h1 style="text-align: center; color: navy;">게시판</h1></caption>
<tr>
	<th>글번호</th> <th>작성자</th> <th>글제목</th> <th>작성일자</th>
	<th>조회수</th> <th>groups</th> <th>step</th> <th>indent</th>
</tr>
<c:forEach items="${list}" var="my">
<tr>
	<td>${my.boardnumber }</td>
	<td>${my.boardwriter }</td>
	<td style="text-align: left;">
		<c:forEach var="i" begin="0" end="${my.indent}">
		&emsp; <!-- 한칸 띄어쓰는 것  --> 	
		</c:forEach>
	<a href="detail?number=${my.boardnumber}">
	${my.boardtitle }</a></td>
	<td>${my.boarddate }</td>
	<td>${my.boardreadcnt }</td>
	<td>${my.groups }</td>
	<td>${my.step }</td>
	<td>${my.indent }</td>
</tr>
</c:forEach>
<!-- 페이징처리 4444444444-->
<tr style="border-left: none;border-right: none;border-bottom: none">
   <td colspan="8" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="boardout?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}"></a>
   </c:if>   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: red;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="boardout?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
      
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="boardout?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">  </a>
   </c:if>
   
   </td>
</tr>
<!-- 페이징처리 4444444444-->
</table>
</body>
</html>