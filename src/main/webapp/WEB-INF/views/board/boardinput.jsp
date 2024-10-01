<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="boardsave" method="post">
<table border="3" width="400px" height="150px" align="center">
<caption><h1 style="color: navy; text-align: center;">게시글 작성</h1></caption>
<tr>
	<th><span style="color: red;">*</span>작성자</th>
	<td><input type="text" name="boardwriter" placeholder="작성자 입력"></td>
</tr>
<tr>
	<th><span style="color: red;">*</span>글제목</th>
	<td><input type="text" name="boardtitle" placeholder="글제목 입력"></td>
</tr>
<tr>
	<th><span style="color: red;">*</span>글내용</th>
	<td><textarea rows="10" cols="30" name="boardcontent" placeholder="글내용 입력"></textarea> </td>
</tr>
<tr style="text-align: center;">
	<td colspan="2">
	<input type="submit" value="글등록">
	<input type="reset" value="작성취소">
	<input type="button" value="메인으로" onclick="location.href='./'">
	</td>
</tr>
</table>
</form>
</body>
</html>