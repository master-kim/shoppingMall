<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>/client/product/product_buy.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="client/js/daum_address.js"></script>
<script>
	function setUserInfo(){
		$("#buy_name").val('${user_info.user_name}')
		$("#sample2_postcode").val('${user_info.user_post_code}')
		$("#sample2_address").val('${user_info.user_addr1}')
		$("#sample2_detailAddress").val('${user_info.user_addr2}')
		$("#sample2_extraAddress").val('${user_info.user_addr3}')
		$("#buy_phone1").val('${user_info.user_phone1}')
		$("#buy_phone2").val('${user_info.user_phone2}')
		$("#buy_phone3").val('${user_info.user_phone3}')
		
	}
	
	// 구매 이력에 담기
	function buy_complete(){
		
		var params = {
			buy_complete_product_idx : ${param.product_idx},
			buy_complete_cnt : ${param.product_cnt},
			buy_complete_total_price : ${total_price.buy_complete_total_price },
			buy_complete_price : ${product_category_bean.product_price }
		}

		$.ajax({
			url : 'buy_complete_pro.springshoppingmall',
			type : 'post',
			data : params,
			dataType : 'text',
			success : function(result){
				if(result.trim() == 'OK'){
					alert('구매가 완료되었습니다')
					location.href='buy_history.springshoppingmall?page_num=${page_num }'
				} 
			}
			
		})
				
		return false	 
	}

</script>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<%-- 다음 주소 검색 --%>
<div id="daum_address" style="display:none;position:fixed;overflow:hidden;z-index:100;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<%-- 구매 물품 리스트 --%>
<div class='container' style='margin-top:100px;min-height:500px'>
	<h1>구매 리스트</h1>
	<div style='margin-top:20px'></div>
	<table class='table table-hover text-center'>
		<thead>
			<tr>
				<th style='width:10%'>구매번호</th>
				<th class='text-left'>상품명</th>
				<th style='width:15%'>구매단가</th>
				<th style='width:10%'>구매개수</th>
				<th style='width:15%'>총금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td class='text-left'>${product_category_bean.product_name }</td>
				<td><fmt:formatNumber value="${product_category_bean.product_price }" type="number"/>원</td>
				<td>${product_cnt }</td>
				<td><fmt:formatNumber value="${total_price.buy_complete_total_price }" type="number"/>원</td> 
			</tr>
			
		</tbody>
	</table>
</div>

<%-- 구매 정보 입력 --%>
<div class='container' style='margin-top:50px'>
	
	<h2>구매자 정보</h2>
	
	<div style='margin-top:20px'></div>
	<div class='row center'>
		<div class='col-md-1'></div>
		<div class=' card shadow col-md-5'>
			<div class='form-group'>
				<label for='buy_name'>구매자 이름</label>
				<input type='text' id='buy_name' class='form-control'/>
			</div>
			<div class='form-group'>
				<label for='buy_postal'>우편번호</label>
				<div class='input-group'>
					<input type='text' id='sample2_postcode' class='form-control' readonly="readonly"/>
					<div class='input-group-append'>
						<button type='button' class='btn btn-primary' onclick='sample2_execDaumPostcode()'>우편번호 찾기</button>
					</div> 
				</div>
			</div>
			<div class='form-group'>
				<input type='text' id='sample2_address' class='form-control' readonly="readonly"/>
			</div>
			<div class='form-group'>
				<input type='text' id='sample2_detailAddress' class='form-control'/>
			</div>
			<div class='form-group'>
				<input type='text' id='sample2_extraAddress' class='form-control'/>
			</div>
			<div class='form-group'>
				<label for='buy_phone1'>연락처</label>
				<div class='row'>
					<div class='col-md-4'>
						<select id='buy_phone1' class='form-control'>
							<option value='010'>010</option>
							<option value='011'>011</option>
							<option value='017'>017</option>
							<option value='018'>018</option>
							<option value='019'>019</option>
						</select>
					</div>
					<div class='col-md-4'>
						<input type='text' id='buy_phone2' class='form-control' maxlength='4'/>
					</div>
					<div class='col-md-4'>
						<input type='text' id='buy_phone3' class='form-control' maxlength='4'/>
					</div>
				</div>
			</div>
			<div class='form-group text-right'>
				<button type='button' class='btn btn-primary' onclick='setUserInfo()'>회원정보와 동일</button>
			</div>
		</div>
		<div class='card shadow col-md-5' style ='margin-left:20px'>
			<div class='display-3'>총 결제 금액</div>
			<div class='display-3'><fmt:formatNumber value="${total_price.buy_complete_total_price }" type="number"/>원</div>
			<h4 class='text-danger'>결제시 환불은 여행 당일 3일전 까지 <br/> 100% 환불가능 합니다.</h4>
			<br/>
			<br/>
			<div class ='container text-right'style ='margin-top:50px'>
				<button type ='button' onclick='buy_complete()'class='btn btn-primary' style='width:250px;' >구매확정</button>
				<a href='product_list.springshoppingmall?page_num=${page_num }&product_category_idx=${product_category_idx }' class='btn btn-danger' style='width:250px;margin-top:25px'>취소하기</a>
			</div>
		</div>
	</div>
</div>

<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>












