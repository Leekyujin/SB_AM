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
					<th>작성날짜</th>
					<td>${article.regDate.substring(2,16)}</td>
				</tr>
				<tr>
					<th>수정날짜</th>
					<td>${article.updateDate.substring(2,16)}</td>
				</tr>
				<tr>
					<th>추천</th>
					<td>
						<c:if test="${actorCanMakeReaction }">
							<button class="btn-text-link btn btn-outline btn-accent">좋아요 👍</button>
							<span>&nbsp;</span>
						</c:if>
						<span class="badge badge-accent">👍 ${article.extra__goodReactionPoint }</span>
						<c:if test="${actorCanMakeReaction }">
							<button class="btn-text-link btn btn-outline btn-accent ml-2">싫어요 👎</button>
							<span>&nbsp;</span>
						</c:if>
						<span class="badge badge-accent">👎 ${article.extra__badReactionPoint }</span>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${article.extra__writerName}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input class="w-full input input-bordered input-info w-full max-w-xs" autocomplete="off" type="text" name="title" placeholder="제목을 입력해주세요." value="${article.title}" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea class="w-full textarea textarea-info" name="body" placeholder="내용을 입력해주세요." >${article.body }</textarea></td>
				</tr>
				<tr>
					<th></th>
					<td><button class="btn btn-outline btn-success" type="submit" value="수정">수정</button></td>
				</tr>
			</table>
		</form>
		
		<div class="btns float-right">
			<button type="button" class="btn-text-link btn btn-outline btn-success" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>


<%@ include file="../common/foot.jspf" %>