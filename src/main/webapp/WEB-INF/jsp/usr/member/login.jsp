<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"/>
<%@ include file="../common/head.jspf" %>

<section class="mt-8">
	<div class="container mx-auto px-3">
	<script>
		var LoginForm__submitDone = false;
		
		function LoginForm__submit(form) {
			if (LoginForm__submitDone){
				alert('처리중 입니다');
				return;
			}
			
			form.loginId.value = form.loginId.value.trim();
			
			if (form.loginId.value.length == 0) {
				alert('아이디를 입력해주세요');
				form.loginId.focus();
				return;
			}
			
			form.loginPw.value = form.loginPw.value.trim();
			
			if (form.loginPw.value.length == 0) {
				alert('비밀번호를 입력해주세요');
				form.loginPw.focus();
				return;
			}
			
			form.submit();
			LoginForm__submitDone = true;
		}
	</script>
	
		<div class="table-box-type-1">
			<table>
				<tr>
					<th>아이디</th>
					<td><input autocomplete="off" placeholder="아이디를 입력해주세요" name="loginId" type="text" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input autocomplete="off" placeholder="비밀번호를 입력해주세요"	name="loginPw" type="password" /></td>
				</tr>
			</table>
		</div>
		<div>
			<button type="submit">로그인</button>

			<button><a href="../home/main">취소</a></button>
		</div>
	</div>
</section>


<%@ include file="../common/foot.jspf" %>