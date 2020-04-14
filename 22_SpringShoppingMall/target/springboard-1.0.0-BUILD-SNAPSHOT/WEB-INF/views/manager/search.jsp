<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>/client/product/product_list.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="client/js/product.js"></script>
<script>
	function add_cart(){
		alert('찜상품에 등록되었습니다.')
		// alert('이미 장바구니에 담겨있는 상품입니다')
	}
	
	

</script>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<%-- 상품 목록 --%>
<div class='container' style='margin-top:200px;min-height:500px'>
	<h1>검색결과</h1>
	<div class='row'>
		<c:forEach var="obj" items ="${requestScope.search_list }">
		<div class='col-sm-3'>
			<div class='card product_card' style='margin-top:20px; '>
				<div style='padding:5px'>
					<img class='card-img-top' src='client/image/${obj.product_image_file }' style='width:100%'/>
				</div>
				<div class='card-body'>
					<h5 class='card-title'>${obj.product_name}</h5>
					<p class='card-text'>저자 : ${obj.product_name1 } <br/> 출판사 : ${obj.product_name2 }
					<br/>낭독자 : ${obj.product_name3 } </p>
					<a href='product_detail.springshoppingmall?page_num=${page_num }&product_category_idx=${product_category_idx }&product_idx=${obj.product_idx }' class='btn btn-primary font-face' style='font-size: 15px'>바로 듣기</a>
					<button type='button' class='btn btn-danger font-face' style='margin-left:30px; font-size: 15px' onclick='add_cart()'>찜하기</button>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>

<%-- pagination --%>
<div class='container' style='margin-top:50px'>
	<ul class='pagination justify-content-center'>
		<c:if test="${page_bean.pagination_min > 1}">
	<a href="search.springshoppingmall?page_num=${page_bean.pagination_min - 1}"class ='page-link'>이전</a>
	</c:if>
	
	<c:forEach var="idx" begin="${page_bean.pagination_min }" end="${page_bean.pagination_max }">
		<a href="search.springshoppingmall?page_num=${idx}" class ='page-link'>${idx }</a>
	</c:forEach>
	
	<c:if test="${page_bean.pagination_max < page_bean.page_cnt}">
	<a href="search.springshoppingmall?page_num=${page_bean.pagination_max + 1}"class ='page-link'>다음</a>
	</c:if>
	
	</ul>
</div>

<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>






