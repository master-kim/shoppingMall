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
<style>
	#backgroundimage{
	margin-top: 80px; 
	background: url("client/image/board_back.jpg") no-repeat center center;
	 background-size: cover; 
	 min-height:900px;
	
	}
	
	#boxstyle{
	margin-top:100px;
	 text-align:auto;
	 height:110px;
	
	}
</style>
<script>
	$(function(){
		$("#board_list > tbody > tr").click(function(){
			location.href = 'board_read.springshoppingmall'
		})
	})
</script>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<div class='contanier text-center' id ='backgroundimage'>
	<div class ='container' style ='margin-top:50px'>
		<div class ='row'>
			<div class ='col-3' ></div>
			<div class ='col-6'>
				<c:forEach var='obj' items='${board_category_list }'>
				<div class='card shadow text-center' style ='margin-top:120px; text-align:auto; height:110px'>	
					<a href ='board_main_list.springshoppingmall?page_num=1&board_category_idx=${obj.board_category_idx}'>
					<h3><br/>${obj.board_category_name }</h3><br/></a>
				</div>
				</c:forEach>
			</div>	
			<div class ='col-3' ></div>
		</div>
	</div>	
</div>
	<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>






