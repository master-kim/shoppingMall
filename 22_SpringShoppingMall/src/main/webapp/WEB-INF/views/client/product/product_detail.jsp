<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>/client/product/product_detail.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	// 장바구니 담기 
	function add_cart(){
			var cart_cnt = $("#product_cnt").val()
			
			var params = {
				cart_product_idx : ${param.product_idx},
				cart_cnt : cart_cnt,
				cart_price : ${product_info_bean.product_price }
			}

			$.ajax({
				url : 'buy_cart_pro.springshoppingmall',
				type : 'post',
				data : params,
				dataType : 'text',
				success : function(result){
					if(result.trim() == 'OK'){
						alert('장바구니에 담겼습니다')
					} 
				}
				
			})
				
				return false	 
	}
	
	
	// 구매 갯수 늘리기
	function upCnt(){
		var cnt = $("#product_cnt").val()
		if(cnt == 10){
			alert('더이상 추가할 수 없습니다')
		} else {
			cnt++
			$("#product_cnt").val(cnt)
			
		}		
	}
	// 구매 갯수 줄이기
	function downCnt(){
		var cnt = $("#product_cnt").val()
		if(cnt == 1){
			alert('1개 이상이여야 합니다')
		} else {
			cnt--
			$("#product_cnt").val(cnt)
		}
	}

	
	// 구매하기 페이지 
	function buy_button(){
		alert('구매 리스트로 이동합니다.')
		location.href ="product_buy.springshoppingmall?page_num=${page_num }&product_category_idx=${product_category_idx }&product_idx=${product_idx}&product_cnt="+ $("#product_cnt").val()
	}
	


</script>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>


<div class='container' style='margin-top:100px;min-height:500px'>
	<div class='row'>
		<div class='col-md-2'></div>
		<div class='col-md-8'>
			<div class='row'>
				<div class='col-md-4'>
					<div class='card'>
						<div style='padding:5px'>
							<img class='card-img-top' src='client/image/${product_info_bean.product_image_file }' style='width:210px;height:210px'/>
						</div>
					</div>
				</div>
				<div class='col-md-8'>
					<div class='card' style='height:220px;padding:5px'>
						<div class='card-body'>
							<h1 class='card-title'>${product_info_bean.product_name }</h1>
							<h3 class='card-text'><fmt:formatNumber value="${product_info_bean.product_price }" type="number"/>원</h3>
							<h3 class='card-text'>
								구매개수 : 
								<button type='button' class='btn btn-info' onclick='upCnt()'>+</button>
								<input type='text' id='product_cnt' style='width:50px' value='1' readonly="readonly"/>
								<button type='button' class='btn btn-info' onclick='downCnt()'>-</button>
							</h3>
							
							<button type='button' class='btn btn-primary' onclick='add_cart()'>장바구니담기</button>
							<button type ='button' class ='btn btn-danger' onclick='buy_button()'>구매하기</button>
							<a href ="product_list.springshoppingmall?page_num=${page_num }&product_category_idx=${product_category_idx }"class='btn btn-info align' >목록보기</a>
						</div>
					</div>
				</div>
			</div>
			
			<div style='margin-top:50px'>
				<h3 class='card-text'>${product_info_bean.product_info }</h3>
			</div>
		</div>
		<div class='col-md-2'></div>
	</div>
	
	
</div>

<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>

 





