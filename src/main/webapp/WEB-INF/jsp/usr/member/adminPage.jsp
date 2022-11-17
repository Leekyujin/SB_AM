<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ADMIN"/>
<%@ include file="../common/head.jspf" %>

<section class="mt-8">
	<div class="container mx-auto px-3">
		<div class="flex">
			<div class="text-lg">회원수 : <span class="badge">${membersCount }명</span></div>
		</div>
		
		<div class="table-box-type-1 mt-3">
			<table>
				<colgroup>
				<col width="60"/>
				<col width="80"/>
				<col width="100"/>
				<col width="100"/>
				<col width="100"/>
				<col width="100"/>
				<col width="100"/>
				<col width="100"/>
				</colgroup>
				
				<thead>
					<tr>
						<th>선택</th>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>가입날짜</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="member" items="${members }">
					<tr>
						<td><input type="checkbox" class="checkbox checkbox-accent" /></td>
						<td>${member.id }</td>
						<td>${member.loginId}</td>
						<td>${member.name }</td>
						<td>${member.nickname }</td>
						<td>${member.cellphoneNum }</td>
						<td>${member.email }</td>
						<td>${member.forPrintType1RegDate }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="btns float-right">
			<c:if test="${rq.isLogined() }">
				<a class="btn-text-link btn btn-outline btn-success" href="#">회원 삭제</a>
			</c:if>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf" %>