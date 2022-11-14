<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MEMBER JOIN" />
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>

<script>
	let submitJoinFormDone = false;
	
	let validLoginId = "";
	
	function submitJoinForm(form) {
		if (submitJoinFormDone) {
			alert('처리중입니다.');
			return;
		}
		
		form.loginId.value = form.loginId.value.trim();
		
		if (form.loginId.value == 0) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}
		
		if (form.loginId.value != validLoginId) {
			alert('사용할 수 없는 아이디입니다.');
			form.loginId.focus();
			return;
		}
		
		form.loginPw.value = form.loginPw.value.trim();
		
		if (form.loginPw.value == 0) {
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();
			return;
		}
		
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
		
		if (form.loginPwConfirm.value == 0) {
			alert('비밀번호 확인을 입력해주세요.');
			form.loginPwConfirm.focus();
			return;
		}
		
		if (form.loginPwConfirm.value != form.loginPw.value) {
			alert('비밀번호가 일치하지 않습니다.');
			form.loginPw.focus();
			return;
		}
		
		form.name.value = form.name.value.trim();
		
		if (form.name.value == 0) {
			alert('이름을 입력해주세요.');
			form.name.focus();
			return;
		}
		
		form.nickname.value = form.nickname.value.trim();
		
		if (form.nickname.value == 0) {
			alert('닉네임을 입력해주세요.');
			form.nickname.focus();
			return;
		}
		
		form.cellphoneNum.value = form.cellphoneNum.value.trim();
		
		if (form.cellphoneNum.value == 0) {
			alert('전화번호를 입력해주세요.');
			form.cellphoneNum.focus();
			return;
		}
		
		form.email.value = form.email.value.trim();
		
		if (form.email.value == 0) {
			alert('이메일을 입력해주세요.');
			form.email.focus();
			return;
		}
		
		submitJoinFormDone = true;
		form.submit();
	}
	
	function checkLoginIdDup(el) {
		$('.loginId-msg').html('<div class="mt-2">확인중...</div>');
		const form = $(el).closest('form').get(0);
		
		if (form.loginId.value.length == 0) {
			validLoginId = '';
			return;
		}
		
		$.get('../member/getLoginIdDup', {
			isAjax : 'Y',
			loginId: form.loginId.value
		}, function(data) {
			$('.loginId-msg').html('<div class="mt-2">' + data.msg + '</div>');
			if (data.success) {
				validLoginId = data.data1;
			} else {
				validLoginId = '';
			}
		}, 'json');
	}
	
</script>
<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<form onsubmit="submitJoinForm(this); return false;" class="table-box-type-1" method="POST"  action="../member/doJoin">
			<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }"/>
			<table>
				<colgroup>
					<col width="200" />
				</colgroup>

				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							<input class="w-full input input-bordered input-info w-full max-w-xs" type="text" name="loginId"
								 placeholder="아이디를 입력해주세요." autocomplete="off" onkeyup="checkLoginIdDup(this);"/>
							<div class="loginId-msg"></div>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input class="w-full input input-bordered input-info w-full max-w-xs" 
								name="loginPw" type="password" placeholder="비밀번호를 입력해주세요."/>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input class="w-full input input-bordered input-info w-full max-w-xs" 
								name="loginPwConfirm" type="password" placeholder="비밀번호 확인을 입력해주세요."/>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input class="w-full input input-bordered input-info w-full max-w-xs" 
								name="name" type="text" placeholder="이름을 입력해주세요." autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>
							<input class="w-full input input-bordered input-info w-full max-w-xs" 
								name="nickname" type="text" placeholder="닉네임을 입력해주세요." autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input class="w-full input input-bordered input-info w-full max-w-xs" 
								name="cellphoneNum" type="text" placeholder="전화번호를 입력해주세요." autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input class="w-full input input-bordered input-info w-full max-w-xs" 
								name="email" type="text" placeholder="이메일을 입력해주세요." autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<button class="btn btn-outline btn-success" type="submit" value="회원가입">회원가입</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div class="container mx-auto px-3 btns mt-1">
		<button class="btn-text-link btn btn-outline btn-success float-right" type="button" 
			onclick="history.back();">뒤로가기</button>
	</div>

</section>

<%@ include file="../common/foot.jspf"%>