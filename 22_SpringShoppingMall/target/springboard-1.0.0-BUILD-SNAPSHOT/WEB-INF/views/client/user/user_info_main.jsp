<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>/client/user/user_info.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='client/js/regex.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="client/js/daum_address.js"></script>
<style>

#cardbody{
	margin-top:200px;
	margin-bottom:100px;
	border-style:outset;
	opacity: 0.9;
}


#bigdiv{
	text-align:left;
	width:900px;
	
}

#imgstyle{
	margin-left:35px;
	border-style:ridge;
	
	
}
img:hover, img:focus{
	
	border:2px red;
}

#background{
		background: no-repeat center center; 
		background-size: cover; 
		background-image: url('client/image/air.jpg'); 
		height: 1000px;
		
}

#myinfo{
	position:absolute; 
	top:150px;left:480px;
	border-style:ridge;
	border-color:white

}
	

</style>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

	
	<div id='background' class="text-white">
		
		<div class='container' style='margin-top: 100px'>
			<div class='text' id='myinfo'>
				<h1>내 정보 페이지</h1>
			</div>
			<div>
				
				<div class='row'>
					<div class='col-1'></div>
					<div class='card shdow col-10'id='cardbody'>
						<div id='bigdiv'>
							<div style='margin-top: 30px' >
								<a href='user_info.springshoppingmall'><img src='client/image/myinfo.png' id='imgstyle'></a> 
								<a href='#'><img src='client/image/mycoupon.png' id='imgstyle'></a>
								<a href='https://www.cjlogistics.com/ko/tool/parcel/tracking' target ="_blank"><img src='client/image/myorder.png' id='imgstyle'></a>
							</div>
							<div style='margin-top: 60px; margin-bottom: 30px'>
								<a href='board_main_list.springshoppingmall?page_num=1&board_category_idx=3'><img src='client/image/myquestion.png'id='imgstyle'></a>
								<a href='buy_cart.springshoppingmall?page_num=1'><img src='client/image/mycart.png' id='imgstyle'></a>
								<a href='buy_history.springshoppingmall'><img src='client/image/mybuy.png' id='imgstyle'></a>
							</div>
						</div>
					</div>
					<div class='col-1'></div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>





