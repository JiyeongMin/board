<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {

}
caption {
	margin-bottom: 10px;
	text-align: center;
}
th {
	background-color: 	#DDDDDD;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="reply" method="post">
<table border="3" width="600px" height="150px" align="center">
<caption><h3><strong style="color: lime;">${dto.boardwriter}</strong><span style="font-size: 10px;">님의 글 읽기</span></h3>
<h1 style="text-align: center;"><strong style="color: navy;">${dto.boardtitle}</strong></h1></caption>
	<input type="hidden" value="${dto.boardnumber}" name="number">
<tr>
	<th>글번호</th>
	<td style="background-color: #D2FFD2;">${dto.boardnumber}</td>
	<th>조회수</th>
	<td style="background-color: #D2FFD2;">${dto.boardreadcnt}</td>
</tr>
<tr>
	<th style="text-align: center;">작성자</th>
	<td style="background-color: #D2FFD2;">${dto.boardwriter}</td>
	<th style="text-align: center;">작성일자</th>
	<td style="background-color: #D2FFD2;">${dto.boarddate}</td>

</tr>
<tr>
	<th>글제목</th>
	<td colspan="4" style="background-color: #D2FFD2;">${dto.boardtitle}</td>
</tr>
<tr>
	<th>글내용</th>
	<td colspan="4"><textarea rows="10" cols="30">${dto.boardcontent}</textarea></td>
</tr>

<tr style="text-align: center;">
	<td colspan="4">
	<input type="submit" value="댓글달기"> | 
	<input type="button" value="목록" onclick="location.href='./'">
	</td>
</tr>
</table>
</form>
</body>
</html>