<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>/client/board/board_main.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel='stylesheet' href='client/css/jica.css'/>
<script>
	$(function(){
		$("#board_list > tbody > tr").click(function(){
			var board_content_idx =$(this).data('board-content-idx')
			location.href = 'board_read.springshoppingmall?page_num=${page_num}&board_category_idx=${board_category_idx}&board_content_idx=' + board_content_idx 
		})
	})
</script>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<%-- 게시글 리스트 --%>
<div class='container' style='margin-top:100px;min-height:500px'>
	
	<h1>${board_category_bean.board_category_name }</h1>
	
	<div style='margin-top:20px'></div>
	<table class='table table-hover text-center' id='board_list'>
		<thead>
			<tr>
				<th style='width:10%'>글번호</th>
				<th class='text-left'>제목</th>
				<th style='width:20%'>작성자</th>
				<th style='width:20%'>작성날짜</th>
			</tr>
		</thead>
		<tbody class='mouse_hand'>
			<c:forEach var='obj' items ='${requestScope.board_list }'>
			<tr data-board-content-idx='${obj.board_content_idx }'>
				<td>${obj.board_content_idx }</td>
				<td class='text-left'>${obj.board_content_subject }</td>
				<td>${obj.board_writer_name }</td>
				<td>${obj.board_content_date }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%-- 글쓰기 버튼 --%>
	<c:choose>
		<c:when test='${board_category_idx == 1 }'>
			<div class='container' style='text-align: right; margin-top: 30px'>
				<a href='board_write.springshoppingmall?page_num=${page_bean.now_page }&board_category_idx=1'>
				<button type='button' class='btn btn-primary'>글쓰기</button></a>
			</div>
		</c:when>
		<c:when test='${board_category_idx == 2 }'>
		</c:when>
		<c:otherwise>
			<div class='container' style='text-align: right; margin-top: 30px'>
				<a href='board_write.springshoppingmall??page_num=${page_bean.now_page }&board_category_idx=3'>
				<button type='button' class='btn btn-danger'>문의하기</button></a>
			</div>
		</c:otherwise>
	</c:choose>
	
	<%-- pagination --%>
	<div class='container ' style='margin-top:50px'>
		<ul class='pagination justify-content-center'>
			<c:if test="${page_bean.pagination_min > 1}">
			<li class='page-item'>
				<a href="board_main_list.springshoppingmall?page_num=${page_bean.pagination_min - 1}&board_category_idx=${board_category_bean.board_category_idx }" class='page-link'>이전</a>
			</li>
			</c:if>
			<c:forEach var="idx" begin="${page_bean.pagination_min }" end="${page_bean.pagination_max }">
				<a href="board_main_list.springshoppingmall?page_num=${idx}&board_category_idx=${board_category_bean.board_category_idx }" class='page-link'>${idx }</a>
			</c:forEach>
			
			<c:if test="${page_bean.pagination_max < page_bean.page_cnt}">
			<li class='page-item'>
				<a href="board_main_list.springshoppingmall?page_num=${page_bean.pagination_max + 1}&board_category_idx=${board_category_bean.board_category_idx }" class='page-link'>다음</a>
			</li>
			</c:if>
		</ul>
	</div>



<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>






