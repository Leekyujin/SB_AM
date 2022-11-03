<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MEMBER MODIFY"/>
<%@ include file="../common/head.jspf" %>

<section class="mt-8">
	<div class="container mx-auto px-3">
		<form class="table-box-type-1" method="POST" action="../member/doModify">
			<table>
				<colgroup>
						<col width="200" />
				</colgroup>
				
				<tr>
					<th>가입날짜</th>
					<td>${rq.loginedMember.regDate }</td>
				</tr>
				<tr>
					<th>로그인 아이디</th>
					<td>${rq.loginedMember.loginId }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" placeholder="${rq.loginedMember.name }" autocomplete="off"/></td>
				</tr>
				<tr>
					<th>nickname</th>
					<td><input type="text" name="nickname" placeholder="${rq.loginedMember.nickname }" autocomplete="off"/></td>
				</tr>
				<tr>
					<th>cellphoneNum</th>
					<td><input type="text" name="nickname" placeholder="${rq.loginedMember.cellphoneNum }" autocomplete="off"/></td>
				</tr>
				<tr>
					<th>email</th>
					<td><input type="text" name="email" placeholder="${rq.loginedMember.email }" autocomplete="off"/></td>
				</tr>
				<tr>
					<th></th>
					<td>
						<button class="btn btn btn-outline btn-success" type="submit" value="회원정보 수정">회원정보 수정</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
		
		<div class="btns text-right mt-1">
			<button type="button" class="btn-text-link btn btn-outline btn-success" onclick="history.back();">뒤로가기</button>
			<c:if test="${rq.logined }">
				<a class="btn-text-link btn btn-outline btn-success" onclick="if(confirm('정말 탈퇴하시겠습니까?') == false) return false;" 
					href="../member/doDelete?id=${rq.loginedMember.id }">회원 탈퇴</a>
			</c:if>
		</div>
	
</section>

<%@ include file="../common/foot.jspf" %>