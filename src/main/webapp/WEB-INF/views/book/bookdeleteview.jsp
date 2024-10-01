<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${booklist}" var="bb">
<form action="bookdelete2" method="post">
<table border="3" width="800px" align="center">
<caption>삭제정보</caption>
<tr>
	<th>도서번호</th>
	<td><input type="text" name="booknumber" value="${bb.booknumber}" placeholder="도서번호" readonly></td>
</tr>
<tr>
	<th>도서명</th>
	<td><input type="text" name="bookname" value="${bb.bookname}" placeholder="도서명" readonly></td>
</tr>
<tr>
	<th>저자명</th>
	<td><input type="text" name="bookwriter" value="${bb.bookwriter}" placeholder="저자명" readonly></td>
</tr>
<tr>
	<th>출판사</th>
	<td><input type="text" name="bookcompany" value="${bb.bookcompany}" placeholder="출판사" readonly></td>
</tr>
<tr>
	<th>가격</th>
	<td><input type="number" name="bookprice" value="${bb.bookprice}" placeholder="가격" readonly></td>
</tr>
<tr>
	<th>출판일자</th>
	<td><input type="date" name="bookdate" value="${bb.bookdate}" placeholder="출판일자" readonly></td>
</tr>
<tr>
	<th>도서내용</th>
	<td><textarea rows="15" cols="15" name="bookcontent" placeholder="도서내용" readonly>${bb.bookcontent}</textarea> </td>
</tr>
<tr style="text-align: center;">
	<td colspan="2">
	<input type="submit" value="삭제">
	<input type="reset" value="취소">
	<input type="button" value="메인으로" onclick="location.href='./'">
	</td>
</tr>
</table>
</form>
</c:forEach>
</body>
</html>