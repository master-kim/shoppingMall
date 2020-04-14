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
		$("#board_content_text").summernote({
			height : 400
		});
		
		$("#board_content_text").summernote('code', '')
	})
	
	// 입력 요소들 유효성검사
	function check_input(){
		var board_content_subject = $("#board_content_subject").val()
		var board_content_text = $("#board_content_text").summernote('code')
		
		if(board_content_subject.length == 0){
			alert('제목을 입력해주세요')
			$("#board_content_subject").focus()
			return false
		}
		
		if(board_content_text.length == 0){
			alert('내용을 입력해주세요')
			$("#board_content_text").summernote('focus')
			return false
		}
		var params = {
				board_content_subject : board_content_subject,
				board_content_text : board_content_text,
				board_category_idx : ${requestScope.board_category_idx}
				
			}
			
			$.ajax({
				url : 'board_write_pro.springshoppingmall',
				type : 'post',
				data : params,
				dataType : 'json',
				success : function(result){
					if(result.result == 'OK'){
						alert('작성이 완료되었습니다')
						location.href = "board_read.springshoppingmall?page_num="
								+ result.page_num + "&board_category_idx="
								+ result.board_category_idx +"&board_content_idx="
								+ result.board_content_idx
					}
				}
			})
			
			
			return false
		}
	
</script>

</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<div class='container' style='margin-top:100px;min-height:500px'>
	<div class='row'>
		<div class='col-md-3'></div>
		<div class='col-md-6'>
			<h1>글쓰기</h1>
			<div style='margin-top:20px'></div>
			<div class='card'>
				<div class='card-body'>
					<form onsubmit='return check_input()'>
						<div class='form-group'>
							<label for='board_name'>게시판명</label>
							<input type='text' id='board_name' class='form-control' value='${board_category_bean.board_category_name }' disabled="disabled"/>
						</div>
						<div class='form-group'>
							<label for='board_content_subject'>제목</label>
							<input type='text' id='board_content_subject' class='form-control'/>
						</div>
						<div class='form-group'>
							<label for='board_content_text'>내용</label>
							<div id='board_content_text'></div>
						</div>
						<div class='form-group text-right'>
							<button type='submit' class='btn btn-primary'>작성완료</button>
							<a href='board_main_list.springshoppingmall?page_num=${page_num}&board_category_idx=${board_category_idx}' class='btn btn-primary'>취소</a>
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




