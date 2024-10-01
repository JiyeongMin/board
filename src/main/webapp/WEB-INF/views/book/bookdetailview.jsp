<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th {
	background-color: #DDDDDD;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="bookreply" method="post">
<table border="3" width="600px" align="center">
<caption><h2><strong style="color: lime;">${bdto.bookname}</strong> 자세히 보기</h2></caption>
	<input type="hidden" value="${bdto.booknumber}" name="bnumber">
<tr>
	<th>도서번호</th>
	 <td>${bdto.booknumber}</td>
	 <th>조회수</th>
	 <td>${bdto.bookreadcnt}</td>
</tr>
<tr>
	<th>작가</th>
	 <td>${bdto.bookwriter}</td>
	 <th>출판일자</th>
	 <td>${bdto.bookdate}</td>
</tr>
<tr>
	<th>도서명</th>
	 <td colspan="3">${bdto.bookname }</td>
</tr>
<tr>
	<th>도서내용</th>
	 <td colspan="3"><textarea rows="20" cols="20" readonly> ${bdto.bookcontent }</textarea></td>
</tr>
<tr>
	<th>도서표지</th>
	 <td colspan="3"><img alt="" src="./image/${bdto.bookimage}" width="200px" height="200px"> </td>
</tr>

<tr style="text-align: center;">
	<td colspan="4">
	<input type="submit" value="댓글달기">
	<input type="button" value="목록" onclick="location.href='./'">
	</td>
</table>
</form>
</body>
</html>