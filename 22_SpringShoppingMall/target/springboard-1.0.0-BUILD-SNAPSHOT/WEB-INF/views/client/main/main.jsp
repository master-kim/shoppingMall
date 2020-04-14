<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='client/js/product.js'></script>

<style>
	#background{
		background: url('bg-masthead.jpg') no-repeat center center; 
		background-size: cover; 
		background-image: url('client/image/background.jpg'); 
		height: 700px;"
	
	}
	#overlay1{
		background-size: auto; 
		height: 150px;
	}
	#extain{
		font-size:15px;
	}
	#detail{
		position:relative;
		left:160px;
		
	
	}
	#cost{
		text-align:right;
		margin-top:10px;
		border-style : ridge;

	}

</style>

<title>요한이의 홈페이지</title>

</head>
<body>
	<%-- 메인화면 내부 이미지 --%>
	<c:import url="/client/common/top_menu.jsp"/>
	<div id='background'class="masthead text-white text-center" >
		<div class="overlay" id='overlay1'></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-left">
					<h1 style = 'font-size:45px;'>
					행복과 즐거움이 가득한 전주에서<br/>
					올 여름 휴가를 떠나 보는게 어떨까요?<br/>
					당신의 여름휴가를 책임지는 사이트 JeonJu & Holic
					</h1>
				</div>
			</div>
			<%-- 검색어 부분 --%>
			<div class="col-md-10 col-lg-8 col-xl-7 mx-auto" style = 'margin-top:70px'>
					<form>
						<div class="form-row">
							<div class="col-12 col-md-9">
								<input type="text" class="form-control form-control-lg" placeholder="검색어를 입력해주세요" />
							</div>
							<div class="col-12 col-md-3">
								<button class="btn btn-primary btn-block btn-lg" type="submit" >검색</button>
							</div>
						</div>
					</form>
			</div>
		</div>
	</div>
	
	<%-- 밑에 카테고리 들어가는 항목 4개 --%>
	<section class="features-icons bg-light text-center shadow-lg" style='margin-top: 50px; box-shadow: 0px 2px 15px 5px #000000;'>
		<div class="container">
			<div class="row">
				
				<div class="col-3" style = 'margin-top:15px'>
					<a href="main_product_box.springshoppingmall?product_main_idx=1"><img src="client/image/mybox.png" /></a>
				</div>
				<div class="col-3" style = 'margin-top:15px'>
					<a href="main_product_box.springshoppingmall?product_main_idx=2"><img src="client/image/package.png" /></a>
				</div>
				
				
				<div class="col-3">
					<a href="https://www.bustago.or.kr/newweb/kr/index.do" target ="_blank"><img src="client/image/transport.png" /></a>
				</div>
				<div class="col-3" style = 'margin-top:5px'>
					<a href="board_main.springshoppingmall"><img src="client/image/board.png" /></a>
				</div>
			</div>
		</div>
	</section>


	<!--  밑에 이벤트 및 행사 설명 -->
	<div class='container' style='margin-top: 50px; min-height: 500px'>
		<div>
			<h1>Hot 축제 & 소식 </h1><br/>
			<div class ='container'>
				<%-- 회전목마 넘어가는거 설정 부분 --%>
				<div class='container' style='min-height: 300px'>
					<div class='carousel slide' data-ride='carousel'
						data-interval='3000' id='banner'>
						
						<%-- 이미지 부분 --%>
						<div class='carousel-inner '>
							<div class='carousel-item active'>
								<a href ='board_main_list.springshoppingmall?page_num=1&board_category_idx=2'><img class='w-100 d-block' src='client/image/banner_5.jpg' /></a> 
							</div>
							<div class='carousel-item'>
								<a href ='board_main_list.springshoppingmall?page_num=1&board_category_idx=2'><img class='w-100 d-block' src='client/image/banner_2.jpg' /></a>
							</div>
							<div class='carousel-item '>
								<a href ='board_main_list.springshoppingmall?page_num=1&board_category_idx=2'><img class='w-100 d-block' src='client/image/banner_1.jpg' /></a>
							</div>
						</div>
						
						<%-- 인디케이터 부분 --%>
						<ul class='carousel-indicators'>
							<li data-target='#banner' data-slide-to='0' class='active'></li>
							<li data-target='#banner' data-slide-to='1'></li>
							<li data-target='#banner' data-slide-to='2'></li>
						</ul>
						
						<%-- 좌우 버튼 --%>
						<a class='carousel-control-prev' href='#banner' data-slide='prev'>
							<span class='carousel-control-prev-icon'></span>
						</a> <a class='carousel-control-next' href='#banner' data-slide='next'>
							<span class='carousel-control-next-icon'></span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 주요 HOT 상품 -->
	<div class ='container' style ='margin-top:50px'>
		<h1>Best 추천 상품</h1>
		
		<div class='row' style='margin-top: 50px;' >
			<c:forEach var ='i' begin ='1' end ='4'>
			<div class="col-3" >
				<a href ='product_best_detail.springshoppingmall'><img src="client/image/best1.PNG" class='rounded'></a>
				<p id ='extain'>패키지 1유형<br/>여름을 시원하게 즐기는 유형</p>
				<a href ='product_best_detail.springshoppingmall'><button type ='submit' class ='btn btn-danger' id ='detail'>자세히 보기</button></a>
				<p id ='cost'>가격150,000 ~ </p>
			</div>
			</c:forEach>
		</div>
		<div class='row' style='margin-top: 50px;' >
			<c:forEach var ='i' begin ='1' end ='4'>
			<div class="col-3" >
				<a href ='product_best_detail.springshoppingmall'><img src="client/image/best5.PNG"class='rounded'></a>
				<p id ='extain'>패키지 1유형<br/>여름을 시원하게 즐기는 유형</p>
				<a href ='product_best_detail.springshoppingmall'><button type ='submit' class ='btn btn-danger' id ='detail'>자세히 보기</button></a>
				<p id ='cost'>가격150,000 ~ </p>
			</div>
			</c:forEach>
		</div>
	</div>

	



	<c:import url="/client/common/bottom_info.jsp" />
</body>
</html>