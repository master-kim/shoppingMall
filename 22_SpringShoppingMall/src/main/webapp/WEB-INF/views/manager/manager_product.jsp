<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>/client/manager_product/manager_product_write.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<%-- Summernote wysiwyg 라이브러리 --%>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script>
	$(function(){
		$("#product_content").summernote({
			height : 400
		});
		
		$("#product_content").summernote('code', '')
	})
	
	// 입력 요소들 유효성검사
	function check_input(){
		var product_name = $("#product_name").val()
		var product_info = $("#product_content").summernote('code')
		var product_category_idx = $("#inputGroupSelect01").val()
		var product_price = $("#product_price").val()
		var product_image_file = $("#product_image_file").val()
		
		if(product_name.length == 0){
			alert('제목을 입력해주세요')
			$("#product_name").focus()
			return false
		}
		if(product_info.length == 0){
			alert('내용을 입력해주세요')
			$("#product_content").summernote('focus')
			return false
		}
		if(product_price.length == 0){
			alert('가격을 입력해주세요')
			$("#product_price").summernote('focus')
			return false
		}
		
		
		
		$.ajax({
			url : 'manager_product_pro.springshoppingmall',
			type : 'post',
			dateType : 'text',
			success : function(result){
				if(result.result == 'OK'){
					alert('작성이 완료되었습니다')
					location.href = "manager_menu.springshoppingmall"
				}
			}
		})
		
		return false
	}
	
	function set_product_info(){
		
		var product_info = $("#product_content").summernote('code')
		
		$("#product_content2").val(product_info)
		
		
		return true
	}
	
	
</script>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<div class='container' style='min-height:1000px'>
	<div class='row'>
		
		<div class='col-md-6 font-face' style='margin-top:150px;'>
			<h1>상품등록</h1>
			<div style='margin-top:20px'></div>
			<div class='card'  style='width:1100px;'>
				<div class='card-body'>
			
					<form action="manager_product_pro.springshoppingmall" method="post" enctype="multipart/form-data" onsubmit='set_product_info()'>
						<div class="input-group mb-3">
							  <div class="input-group-prepend">
							    <label class="input-group-text" for="inputGroupSelect01">게시판명</label>
							  </div>
							  <select class="custom-select" name="inputGroupSelect01">
							    <option selected>게시판을 선택하세요.</option>
							    <option value="1">숙박시설</option>
							    <option value="2">음식탐방</option>
							    <option value="3">레저*티켓</option>
							    <option value="4">당일치기코스</option>
							    <option value="5">1박2일코스</option>
							    <option value="6">2박3일코스</option>
							  </select>
						</div>
					
						<div class='form-group '>
							<label for='product_name'>제목</label>
							<input type='text' name='product_name' class='form-control'/>
						</div>
						<div class='form-group'>
							<label for='product_price'>가격</label>
							<input type='text' name='product_price' class='form-control'/>
						</div>
						<div class='form-group'>
							<label for='product_image_file'>상품 표지 이미지</label>
							<input type='file' name='product_image_file' accept="image/*"/>
						</div>
						<div class='form-group'>
							<label for='product_content'>내용</label>
							<div  id ='product_content'></div>
							<input type='hidden' name='product_content' id='product_content2'/>
						</div>

						<div class='form-group text-right'>
							<button type='submit' class='btn btn-primary'>작성완료</button>
							<a href='manager_menu.springshoppingmall' class='btn btn-primary'>취소</a>
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


























