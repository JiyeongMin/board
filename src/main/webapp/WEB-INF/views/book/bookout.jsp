<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="3" width="900px" align="center">
<caption><h2>도서자료출력</h2></caption>
<tr>
	<th>도서번호</th>
	<th>도서명</th>
	<th>저자명</th>
	<th>출판사</th>
	<th>가격</th>
	<th>출판일자</th>
	<th>조회수</th>
	<th>삭제/수정</th>
	<th>groups</th> <th>step</th> <th>indent</th>
</tr>
<c:forEach items="${booklist}" var="bb">
<tr>
	<td>${bb.booknumber}</td>
	<td style="text-align: left;">
		<c:forEach var="i" begin="0" end="${bb.indent}">
		&emsp;
		</c:forEach>
	<a href="bookdetail?bnumber=${bb.booknumber}">
	${bb.bookname}</a>
	</td>
	<td>${bb.bookwriter}</td>
	<td>${bb.bookcompany}</td>
	<td>${bb.bookprice}</td>
	<td>${bb.bookdate}</td>
	<td>${bb.bookreadcnt}</td>
	<td>
	<a href="bookdelete?bnumber=${bb.booknumber}">삭제</a>
	
	</td>de
	<td>${bb.groups}</td>	<td>${bb.step}</td>	<td>${bb.indent}</td>
</tr>
</c:forEach>
<!-- 페이징처리 4444444444-->
<tr style="border-left: none;border-right: none;border-bottom: none">
   <td colspan="8" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="bookout?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}"></a>
   </c:if>   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: red;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="bookout?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
      
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="bookout?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">  </a>
   </c:if>
   
   </td>
</tr>
<!-- 페이징처리 4444444444-->

</table>
</body>
</html>