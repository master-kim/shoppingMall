<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>/client/user/user_history.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel='stylesheet' href='client/css/jica.css'/>

</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<div class='container' style='margin-top:100px;min-height:500px'>
	<h1>구매이력</h1>
	<div style='margin-top:20px'></div>
	
	<table class='table table-hover text-center mouse_hand' >
		<thead>
			<tr>
				<th style='width:10%'>구매번호</th>
				<th class='text-left'>상품명</th>
				<th style='width:20%'>총 구매가격</th>
				<th style='width:15%'>구매개수</th>
				<th style='width:20%'>구매날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="obj" items="${requestScope.buy_complete_list }">
			<tr>
				<td>${obj.buy_complete_idx} </td>
				<td class='text-left'>${obj.buy_complete_name }</td>
				<td><fmt:formatNumber value="${obj.buy_complete_total_price}" type="number"/>원</td>
				<td>${obj.buy_complete_cnt}</td>
				<td>${obj.buy_complete_date}</td>
			</tr>			
			</c:forEach>
		</tbody>
	</table>
	
	<%-- pagination --%>
	<div class='container ' style='margin-top:50px'>
		<ul class='pagination justify-content-center'>
			<c:if test="${page_bean.pagination_min > 1}">
			<li class='page-item'>
				<a href="buy_history.springshoppingmall?page_num=${page_bean.pagination_min - 1}" class='page-link'>이전</a>
			</li>
			</c:if>
			<c:forEach var="idx" begin="${page_bean.pagination_min }" end="${page_bean.pagination_max }">
				<a href="buy_history.springshoppingmall?page_num=${idx}" class='page-link'>${idx }</a>
			</c:forEach>
			
			<c:if test="${page_bean.pagination_max < page_bean.page_cnt}">
			<li class='page-item'>
				<a href="buy_history.springshoppingmall?page_num=${page_bean.pagination_max + 1}" class='page-link'>다음</a>
			</li>
			</c:if>
		</ul>
	</div>
</div>

<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>







