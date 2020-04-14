<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>/client/buy/buy_cart.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>

	// 장바구니 한개 삭제하기
	function remove_product(idx){

		var params = {
				
			cart_idx : idx,
			
	
		}
		
		$.ajax({
			url : 'buy_delete.springshoppingmall',
			type : 'post',
			data : params,
			dataType : 'text',
			success : function(result){
				if(result.trim() == 'OK'){
					alert('삭제되었습니다.')
					$("#cart_top_" + idx).remove()
					
				} 
			}
			
		})
			
			return false	
	}
	
	// 장바구니 전체 삭제하기
	function remove_all(){
		
		$.ajax({
			url : 'buy_delete_pro.springshoppingmall',
			type : 'post',
			dataType : 'text',
			success : function(result){
				if(result.trim() == 'OK'){
					alert('전부 삭제되었습니다.')
					$("#cart_top_table > tbody").empty()
				} 
			}
			
		})
			
			return false	
			
	}
	
	// 장바구니 구매하기
	function move_top(){
		alert('구매 리스트로 이동합니다.')
		location.href ="product_cart_buy.springshoppingmall?page_num=${page_num }"
	}
		
	
</script>
	
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<%-- 장바구니 리스트 부분 --%>
<div class='container' style='margin-top:100px;min-height:500px'>
	<h1>장바구니</h1>
	<div style='margin-top:20px'></div>
	
	<table class='table text-center' id ='cart_top_table'>
		<thead>
			<tr>
				<th style='width:10%'>번호</th>
				<th style='width:10%'>제품번호</th>
				<th class='text-left'>상품명</th>
				<th style='width:15%'>가격</th>
				<th style='width:10%'>구매개수</th>
				<th style='width:15%'>총 구매 가격</th>
				<th style='width:15%'>날짜</th>
				<th style='width:7%'></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var='obj' items ='${requestScope.cart_list }'>
			<tr id='cart_top_${obj.cart_idx}'>
				<td>${obj.cart_idx }</td>
				<td>${obj.cart_product_idx }</td>
				<td class='text-left'>${obj.cart_product_name }</td>
				<td><fmt:formatNumber value="${obj.cart_price }" type="number"/>원</td>
				<td>${obj.cart_cnt }</td>
				<td><fmt:formatNumber value="${obj.cart_total_price }" type="number"/>원</td>
				<td>${obj.cart_date }</td>
				<td>
					<div>
						<button type='button' class='btn btn-danger' onclick='remove_product(${obj.cart_idx})'>삭제</button>
					</div>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<%-- pagination --%>
	<div class='container ' style='margin-top:50px'>
		<ul class='pagination justify-content-center'>
			<c:if test="${page_bean.pagination_min > 1}">
			<li class='page-item'>
				<a href="buy_cart.springshoppingmall?page_num=${page_bean.pagination_min - 1}" class='page-link'>이전</a>
			</li>
			</c:if>
			<c:forEach var="idx" begin="${page_bean.pagination_min }" end="${page_bean.pagination_max }">
				<a href="buy_cart.springshoppingmall?page_num=${idx}" class='page-link'>${idx }</a>
			</c:forEach>
			
			<c:if test="${page_bean.pagination_max < page_bean.page_cnt}">
			<li class='page-item'>
				<a href="buy_cart.springshoppingmall?page_num=${page_bean.pagination_max + 1}" class='page-link'>다음</a>
			</li>
			</c:if>
		</ul>
	</div>
	
	<div class='text-right' style='margin-top:100px'>
		<button type ='button' class='btn btn-primary' onclick='move_top()'>구매하기</button>
		<button type='button' class='btn btn-warning' onclick='remove_all()'>장바구니 비우기</button>
	</div>
</div>

<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>
















