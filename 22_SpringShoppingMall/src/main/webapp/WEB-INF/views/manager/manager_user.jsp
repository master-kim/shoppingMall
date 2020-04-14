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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel='stylesheet' href='client/css/jica.css'/>
<script>
	$(function(){
		<c:forEach var='obj' items ="${requestScope.user_list }">
			$('#user_grade'+${obj.user_idx }).val(${obj.user_grade})
		</c:forEach>
			
		<c:forEach var='obj' items ="${requestScope.user_list }">
			$('#user_status'+${obj.user_idx }).val(${obj.user_status})
		</c:forEach>
	})

	function setGrade(idx){
		
		var user_idx = idx
		var user_grade = $('#user_grade'+idx).val()
		
		var params = {
			user_idx : user_idx,
			user_grade : user_grade
		}
		
		$.ajax({
			url : 'manager_user_pro.springshoppingmall',
			type : 'post',
			data : params,
			dataType : 'text',
			success : function(result){
				if(result.trim() == 'OK'){
					alert('회원등급이 변경되었습니다.')
					location.reload()
				}
			}
			
		})
	}
	
	function setStatus(idx){
		
		var user_idx = idx
		var user_status = $('#user_status'+idx).val()
		
		var params = {
			user_idx : user_idx,
			user_status : user_status,
		}
		
		$.ajax({
			url : 'manager_user_pro2.springshoppingmall',
			type : 'post',
			data : params,
			dataType : 'text',
			success : function(result){
				if(result.trim() == 'OK'){
					alert('회원상태가 변경되었습니다.')
					location.reload()
				}
			}
			
		})
	}
</script>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<%-- 게시글 리스트 --%>
<div class='container font-face' style='margin-top:200px;min-height:500px'>
	<h1>${board_category_bean.board_category_name }</h1>
	<div style='margin-top:20px'></div>
	<table class='table table-hover text-center' id='board_list'>
		<thead>
			<tr>
				<th style='width:15%'>회원번호</th>
				<th style='width:15%'>회원이름</th>
				<th style='width:20%'>유저등급</th>
				<th style='width:15%'></th>				
				<th style='width:20%'>활성/비활성</th>
				<th style='width:15%'></th>
			</tr>
		</thead>
		<tbody class='mouse_hand'>
			<c:forEach var='obj' items ="${requestScope.user_list }">
			<tr>
				<td>${obj.user_idx }</td>
				<td>${obj.user_name }</td>
				<c:choose>
					<c:when test="${obj.user_grade == 2 }"><td>일반회원</td></c:when>
					<c:otherwise><td>관리자</td></c:otherwise>
				</c:choose>
				<td>
					<select class='form-control' id='user_grade${obj.user_idx }' onchange="setGrade(${obj.user_idx })">
						
						<option value='2'>일반회원</option>
						<option value='1'>관리자</option>
					</select>
				</td>
				<td>
					<c:choose>
						<c:when test="${obj.user_status == 1 }">
							<span class='badge badge-primary'>활성상태</span>
						</c:when>
						<c:otherwise>
							<span class='badge badge-danger'>비활성상태</span>
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<select class='form-control' id='user_status${obj.user_idx }' onchange="setStatus(${obj.user_idx })">
							
							<option value='1'>활성상태</option>
							<option value='2'>비활성상태</option>
					</select>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
		<%-- 메뉴 목록 --%>
		<div class='container' style='margin-top: 30px'>
			<div class='text-right'>
				<a href='manager_menu.springshoppingmall' class='btn btn-primary'>메뉴목록</a>
			</div>
		</div>



<%-- pagination --%>
<div class='container' style='margin-top:50px'>
	<ul class='pagination justify-content-center'>
		<c:if test="${page_bean.pagination_min > 1}">
	<a href="manager_user.springshoppingmall?page_num=${page_bean.pagination_min - 1}"class ='page-link'>이전</a>
	</c:if>
	
	<c:forEach var="idx" begin="${page_bean.pagination_min }" end="${page_bean.pagination_max }">
		<a href="manager_user.springshoppingmall?page_num=${idx}" class ='page-link'>${idx }</a>
	</c:forEach>
	
	<c:if test="${page_bean.pagination_max < page_bean.page_cnt}">
	<a href="manager_user.springshoppingmall?page_num=${page_bean.pagination_max + 1}"class ='page-link'>다음</a>
	</c:if>
	</ul>

		
</div>



<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>






