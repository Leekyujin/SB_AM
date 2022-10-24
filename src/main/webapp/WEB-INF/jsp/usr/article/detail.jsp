<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE DETAIL"/>
<%@ include file="../common/head.jspf" %>

<script>
	const params = {};
	params.id = parseInt('${param.id}');
</script>

<script>
	function ArticleDetail__increaseHitCount() {
		const localStorageKey = 'article__' + params.id + '__alreadyView';

		if (localStorage.getItem(localStorageKey)) {
			return;
		}
		
		localStorage.setItem(localStorageKey, true);
		
		$.get('../article/doIncreaseHitCountRd', {
			id : params.id,
			ajaxMode: 'Y'
		}, function(data) {
			
			$('.article-detail__hit-count').empty().html(data.data1);
		}, 'json');
	}	
	
	$(function(){
		// 실전코드
		// ArticleDetail__increaseHitCount();
		
		// 연습코드
		setTimeout(ArticleDetail__increaseHitCount, 1000);
	})
</script>

<section class="mt-8">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
			<table>
				<tr>
					<th>번호</th>
					<td>${article.id }</td>
				</tr>
				<tr>
					<th>작성날짜</th>
					<td>${article.regDate }</td>
				</tr>
				<tr>
					<th>수정날짜</th>
					<td>${article.updateDate }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>
						<span class="badge article-detail__hit-count">${article.hitCount }</span>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${article.extra__writerName }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${article.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${article.body}</td>
				</tr>
			</table>
		</div>
		
		<div class="btns mt-1 text-center">
			<a class="btn-text-link btn btn-outline btn-accent" href="">좋아요<span class="badge badge-accent">${article.extra__goodReactionPoint }</span></a>
			<a class="btn-text-link btn btn-outline btn-accent" href="">싫어요<span class="badge badge-accent">${article.extra__badReactionPoint }</span></a>
		</div>
		
		<div class="btns float-right mt-1">
			<button type="button" class="btn-text-link btn btn-outline btn-success" onclick="history.back();">뒤로가기</button>
			<c:if test="${article.extra__actorCanModify }">
				<a class="btn-text-link btn btn-outline btn-success" href="../article/modify?id=${article.id }">수정</a>
			</c:if>
			<c:if test="${article.extra__actorCanDelete }">
				<a class="btn-text-link btn btn-outline btn-success" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" 
					href="../article/doDelete?id=${article.id }">삭제</a>
			</c:if>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf" %>