<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE WIRTE" />
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>

<script>
	let submitWriteFormDone = false;
	
	function submitWriteForm(form){
		if(submitWriteFormDone){
			alert('처리중입니다.');
			return;
		}
		
  		form.title.value = form.title.value.trim();
  
  		if(form.title.value == 0) {
			alert('제목을 입력해주세요.');
		  	return;
		}

		const editor = $(form).find('.toast-ui-editor').data('data-toast-editor');
		const markdown = editor.getMarkdown().trim();
	  
		if(markdown.length == 0){
	    	alert('내용을 입력해주세요.');
	    	editor.focus();
	    
	    	return;
	  	}
	  	
		form.body.value = markdown;
		
	  	form.submit();
	  
		submitWriteFormDone = true;
	}
</script>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<form onsubmit="submitWriteForm(this); return false;" class="table-box-type-1" method="POST"
			action="../article/doWrite">
			<input type="hidden" name="body"/>
			<table>
				<colgroup>
					<col width="200" />
				</colgroup>

				<tbody>
					<tr>
						<th>작성자</th>
						<td>${rq.loginedMember.nickname }</td>
					</tr>
					<tr>
						<th>게시판</th>
						<td>
							<select class="select select-info w-full max-w-xs" name="boardId">
							  <option disabled>게시판을 선택해주세요</option>
							  <option value=1>공지사항</option>
							  <option value=2>자유</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input required="required" class="w-full input input-bordered input-info w-full max-w-xs" 
								name="title" type="text" placeholder="제목을 입력해주세요." />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div class="toast-ui-editor">
		    					<script type="text/x-template"></script>
		  					</div>
						</td>
					</tr>
					<tr>
						<th></th>
						<td><button class="btn btn-outline btn-success" type="submit" value="작성">작성</button></td>
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