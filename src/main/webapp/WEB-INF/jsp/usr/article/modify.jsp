<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE MODIFY"/>
<%@ include file="../common/head.jspf" %>

<section class="mt-8">
	<div class="container mx-auto px-3">
		<form class="table-box-type-1" method="POST" action="../article/doModify">
		<input type="hidden" name="id" value="${article.id }"/>
			<table>
				<colgroup>
					<col width="200" />
				</colgroup>
				
				<tr>
					<th>번호</th>
					<td>${article.id}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input class="w-full" autocomplete="off" type="text" name="title" placeholder="제목을 입력해주세요." value="${article.title}" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea class="w-full" name="body" placeholder="내용을 입력해주세요." >${article.body }</textarea></td>
				</tr>
				<tr>
					<th></th>
					<td><button class="hover:text-red-600" type="submit" value="수정">수정</button></td>
				</tr>
			</table>
		</form>
		
		<div class="btns">
			<button type="button" class="btn-text-link" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>


<%@ include file="../common/foot.jspf" %>