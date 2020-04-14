<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>/client/board/board_read.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<div class='container' style='margin-top:100px;min-height:500px'>
	<div class='row'>
		<div class='col-md-3'></div>
		<div class='col-md-6'>
			<h1>[${board_category_bean.board_category_name}]</h1>
			<div style='margin-top:20px'></div>
			<div class='card'>
				<div class='card-body'>
					<form>
						<div class='form-group'>
							<label for='board_writer_name'>제목</label>
							<input type='text' id='board_writer_name' class='form-control' value='${get_board_info_list.board_content_subject }' disabled="disabled"/>
						</div>
						
						
						<div class='form-group'>
							<label for='board_writer_name'>작성자</label>
							<input type='text' id='board_writer_name' class='form-control' value='${get_board_info_list.board_writer_name }' disabled="disabled"/>
						</div>
						
						
						
						<hr/>
						
						<div class='form-group'>
							${get_board_info_list.board_content_text }
						</div>
						
						<hr/>
						
						<div class='form-group text-right'>
							<a href='board_main_list.springshoppingmall?page_num=${page_num}&board_category_idx=${board_category_idx}' 
							class='btn btn-primary'>목록보기</a>
							<a href='board_modify.springshoppingmall?page_num=${page_num}&board_category_idx=${board_category_idx}&board_content_idx=${board_content_idx }' 
							class='btn btn-info'>수정하기</a>
							<a href='board_delete.springshoppingmall?page_num=${page_num}&board_category_idx=${board_category_idx}&board_content_idx=${board_content_idx }' 
							class='btn btn-danger'>삭제하기</a>
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





