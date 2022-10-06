<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>
<body>
	<h1 align="center">${article.id}번 게시물 상세보기</h1>
	<hr />
	
	<table border="1" bordercolor="orange" align="center">
		<tr>
			<td>번호</td>
			<td>${article.id}</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${article.regDate.substring(0,10)}</td>
		</tr>
		<tr>
			<td>수정날짜</td>
			<td>${article.updateDate.substring(0,10)}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${article.memberId}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${article.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${article.body}</td>
		</tr>
	</table>

</body>
</html>