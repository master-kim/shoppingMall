<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>/client/board/board_write.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<%-- Summernote wysiwyg 라이브러리 --%>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script>
	$(function(){
		$("#qna_content").summernote({
			height : 400
		});
		
		$("#qna_content").summernote('code', '')
	})
	
	// 입력 요소들 유효성검사
	function check_input(){
		var qna_content_subject = $("#qna_content_subject").val()
		var qna_content = $("#qna_content").summernote('code')
		
		if(qna_content_subject.length == 0){
			alert('제목을 입력해주세요')
			$("#qna_content_subject").focus()
			return false
		}
		
		if(qna_content.length == 0){
			alert('내용을 입력해주세요')
			$("#qna_content").summernote('focus')
			return false
		}
		
		alert('문의가 등록되었습니다.')
		location.href = "qna.springshoppingmall"
		return false
	}
	
	
</script>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<div class='container' style='min-height:500px'>
	<div class='row'>
		<div class='col-md-3'></div>
		<div class='col-md-6 font-face' style='margin-top:200px;'>
			<h1>문의하기</h1>
			<div style='margin-top:20px'></div>
			<div class='card'>
				<div class='card-body'>
			
					<form onsubmit='return check_input()'>
						<div class='form-group'>
							<label for='qna_content_subject'>제목</label>
							<input type='text' id='qna_content_subject' class='form-control'/>
						</div>
						<div class='form-group'>
							<label for='qna_content'>내용</label>
							<div id='qna_content'></div>
						</div>
						
						
						<div class='form-group text-right'>
							<button type='submit' class='btn btn-primary'>작성완료</button>
							<a href='qna.springshoppingmall' class='btn btn-primary'>취소</a>
						</div>
					</form>
				
				</div>
			</div>
		</div>
		<div class='col-md-3'></div>
	</div>
</div>

<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>


























