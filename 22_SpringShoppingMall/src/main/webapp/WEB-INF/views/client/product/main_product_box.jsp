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
#background{
		margin-top:70px;
		background: no-repeat center center; 
		background-size: cover; 
		background-image: url('client/image/board_back.jpg'); 
		height: 1000px;
		
		
}

#con{
	position:absolute;
	top:150px;
	left:350px;
	
}
#imgstyle{
	margin-top:35px;
	margin-left:27px;
	border-style:ridge;
	width:250px;
	height:200px
}
#cardstyle{
	width:300px;
	opacity: 0.9;
}
#cardright{
	positon:absolute;
	top:80px; 
	left:700px;
	width:1000px;
	opacity: 0.8;
}

img:hover, img:focus{
	
	border:2px red;
	
}

#p1{
	font-size:42px;
	margin-top:90px
}

#p2{
	font-size:42px;
	margin-top:180px

}	

#p2_1{
	font-size:42px;
	margin-top:90px
}

#p2_2{
	font-size:42px;
	margin-top:180px

}	



</style>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

	<c:choose>
	<c:when test ='${product_main_idx == 1 }'>
	<div id='background' class="text-black">
		<div class='container' id='con'>
			<div class='card'  id ='cardstyle'>
				<div>
					<a href='product_list.springshoppingmall?page_num=1&product_category_idx=1'>
					<img src='client/image/hotel_main.png'id='imgstyle'></a>
					<br/>
					<a href='product_list.springshoppingmall?page_num=1&product_category_idx=2'>
					<img src='client/image/food_main.png' id='imgstyle'></a>
					<br/>
					<a href='product_list.springshoppingmall?page_num=1&product_category_idx=3'>
					<img src='client/image/leisure_main.png' id='imgstyle' style ='margin-bottom:35px'></a>
					
				</div>
			</div>
		</div>
			<div class='card shadow' id='cardright'>
				<div class='row'>
					<div class ='col-md-3' style ='margin-top:45px;margin-left:15px'>
						<img src ='client/image/point.png'>
						<img src ='client/image/point.png' style ='margin-top:85px'>
						<img src ='client/image/point.png' style ='margin-top:85px;margin-bottom:43px'>
					</div>
					
					<div class ='col-md-8' style ='width:800px'>
						<div style='width:700px'>
							<p id='p1'>숙박시설을 비교분석하여 골라가자</p>
							<p id='p2'>내가 원하는 음식들만 가득하게 담아</p>
							<p id='p2'>원하는 레저와 테마파크를 보로가자</p>
						</div>
					</div>
					<div class='col-1'></div>
				</div>
			</div>
		</div>
		</c:when>
	
	<c:otherwise>
	<div id='background' class="text-black">
		<div class='container' id='con'>
			<div class='card'  id ='cardstyle'>
				<div>
					<a href='product_list.springshoppingmall?page_num=1&product_category_idx=4'>
					<img src='client/image/day.png'id='imgstyle'></a>
					<br/>
					<a href='product_list.springshoppingmall?page_num=1&product_category_idx=5'>
					<img src='client/image/oneandtwo.png' id='imgstyle'></a>
					<br/>
					<a href='product_list.springshoppingmall?page_num=1&product_category_idx=6'>
					<img src='client/image/twoandthree.png' id='imgstyle' style ='margin-bottom:35px'></a>
				</div>
			</div>
		</div>
			<div class='card shadow' id='cardright'>
				<div class='row'>
					<div class ='col-md-3' style ='margin-top:45px;margin-left:15px'>
						<img src ='client/image/point.png'>
						<img src ='client/image/point.png' style ='margin-top:85px'>
						<img src ='client/image/point.png' style ='margin-top:85px;margin-bottom:43px'>
					</div>
					
					<div class ='col-md-8' style ='width:800px'>
						<div style='width:700px'>
							<p id='p2_1'>전주의 핵심 부분만 골라 가는 당일치기 코스</p>
							<p id='p2_2'>전주 맛집과 더불어 투어를 떠나본다</p>
							<p id='p2_2'>전주 곳곳에 숨은 명소를 찾아 떠난다.</p>
						</div>
					</div>
					<div class='col-1'></div>
				</div>
			</div>
		</div>
		</c:otherwise>
	</c:choose>
						
	<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>





