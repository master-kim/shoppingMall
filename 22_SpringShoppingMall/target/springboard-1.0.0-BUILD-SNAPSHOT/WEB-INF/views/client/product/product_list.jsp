<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<style>
	#detail{
		position:relative;
		left:150px;
		
	
	}
	.cost{
		text-align:right;
		margin-top:10px;
		border-style : ridge;

	}
	.align{
		position:relative;
		left:130px;
		
	}

</style>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>


	<div class='container' style='margin-top: 100px; min-height: 500px'>
		<div class='container ' style='margin-top: 50px'>
		<%-- 베스트 상품 --%>
			<h1>Best 추천 상품</h1>
			<div class='row' style='margin-top: 50px;'>
			<c:forEach var ='i' begin ='1' end ='4'>
				<div class="col-3">
					<a href='product_best_detail.springshoppingmall'>
					<img src="client/image/best5.PNG" class='rounded'></a>
					<p>패키지 1유형<br/>여름을 시원하게 즐기는 유형</p>
					<a href='product_best_detail.springshoppingmall'>
					<button type='submit' class='btn btn-danger' id='detail'>자세히 보기</button></a>
					<p class='cost'>가격100,000 ~</p>
				</div>
			</c:forEach>	
			</div>
		</div>

		<%-- 상품 --%>
		<div style='margin-top: 70px'>
			<h1>${product_category_bean.product_category_name }</h1>
		</div>
		<div class='row' id ='product_idx'>
			<c:forEach var="obj" items="${requestScope.product_list }">
				<div class='col-sm-3' >
					<div class='card product_card' style='margin-top: 20px'>
						<div style='padding: 5px'>
							<img class='card-img-top' src='client/image/${obj.product_image_file }'style='width: 100%' />
						</div>
						<div class='card-body'>
							<h4 class='card-title'>${obj.product_name }</h4>
							<a href ="product_detail.springshoppingmall?page_num=${page_num }&product_category_idx=${product_category_idx }&product_idx=${obj.product_idx }"class='btn btn-primary align' >자세히보기</a>
							<p class='card-text cost'><fmt:formatNumber value="${obj.product_price }" type="number"/>원</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- 페이지네이션 -->
	<div class='container ' style='margin-top:50px'>
		<ul class='pagination justify-content-center'>
			<c:if test="${page_bean.pagination_min > 1}">
			<li class='page-item'>
				<a href="product_list.springshoppingmall?page_num=${page_bean.pagination_min - 1}&product_category_idx=${product_category_bean.product_category_idx }" class='page-link'>이전</a>
			</li>
			</c:if>
			<c:forEach var="idx" begin="${page_bean.pagination_min }" end="${page_bean.pagination_max }">
				<a href="product_list.springshoppingmall?page_num=${idx}&product_category_idx=${product_category_bean.product_category_idx }" class='page-link'>${idx }</a>
			</c:forEach>
			
			<c:if test="${page_bean.pagination_max < page_bean.page_cnt}">
			<li class='page-item'>
				<a href="product_list.springshoppingmall?page_num=${page_bean.pagination_max + 1}&product_category_idx=${product_category_bean.product_category_idx }" class='page-link'>다음</a>
			</li>
			</c:if>
		</ul>
	</div>

<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>















