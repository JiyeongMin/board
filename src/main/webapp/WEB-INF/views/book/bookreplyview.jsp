<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="bookreplysave" method="post" enctype="multipart/form-data">
<table border="3" width="400px" align="center">
<caption>댓글 작성</caption>
<input type="hidden" value="${bdto.booknumber}" name="booknumber">
<input type="hidden" value="${bdto.groups}" name="groups">
<input type="hidden" value="${bdto.step}" name="step">
<input type="hidden" value="${bdto.indent}" name="indent">
<tr>
	<th>댓글작성자</th>
	<td><input type="text" name="bookwriter" placeholder="댓글작성자"></td>
</tr>
<tr>
	<th>댓글제목</th>
	<td><input type="text" name="bookname" placeholder="댓글제목"></td>
</tr>
<tr>
	<th>댓글내용</th>
	<td><textarea rows="10" cols="30" name="bookcontent" placeholder="댓글내용"></textarea> </td>
</tr>
<tr>
	<th>이모티콘</th>
	<td><input type="file" name="bookimage"> </td>
</tr>
<tr style="text-align: center;">
	<td colspan="2">
	<input type="submit" value="댓글등록">
	<input type="reset" value="댓글작성취소">
	<input type="button" value="메인으로" onclick="location.href='./'">
	</td>
</tr>
</table>
</form>
</body>
</html>