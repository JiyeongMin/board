<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="booksave" method="post" enctype="multipart/form-data">
<table border="1" width="500px" align="center">
<caption><h2>도서정보입력</h2></caption>
<tr>
	<th>도서명</th>
	<td><input type="text" name="bookname" placeholder="도서명"></td>
</tr>
<tr>
	<th>저자명</th>
	<td><input type="text" name="bookwriter" placeholder="저자명"></td>
</tr>
<tr>
	<th>출판사</th>
	<td><input type="text" name="bookcompany" placeholder="출판사"></td>
</tr>
<tr>
	<th>가격</th>
	<td><input type="number" name="bookprice" placeholder="가격"></td>
</tr>
<tr>
	<th>출판일자</th>
	<td><input type="date" name="bookdate" placeholder="출판일자"></td>
</tr>
<tr>
	<th>도서내용</th>
	<td><textarea rows="15" cols="15" name="bookcontent" placeholder="도서내용"></textarea> </td>
</tr>
<tr>
	<th>도서이미지</th>
	<td><input type="file" name="bookimage" placeholder="표지"></td>
</tr>
<tr style="text-align: center;">
	<td colspan="2">
	<input type="submit" value="전송">
	<input type="reset" value="취소">
	<input type="button" value="메인으로" onclick="location.href='./'">
	</td>
</tr>

</table>
</form>
</body>
</html>