<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}

#top_menu{
	box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.5); 
	max-height: 200px;
}

#image{
	height: 50px; 
	width: 200px;
}

</style>

<%-- /client/common/top_menu.jsp --%>
<nav class="navbar bg-white navbar-light navbar-expand-md navigation-clean-search fixed-top" id='top_menu'>
	<div class="container" style="padding: 0 10px;">
		<!-- 로고 이미지 -->
		<a href='main.springshoppingmall'><img src="client/image/mainlogo.png" id='image'/></a>
		<%-- 모바일 메뉴 버튼 --%>
		<button class='navbar-toggler' type='button' data-toggle='collapse'data-target='#navMenu'>
			<span class='navbar-toggler-icon'></span>
		</button>
		<%-- 메뉴 --%>
		<div class='collapse navbar-collapse' id='navMenu'>
			<%-- 우측 --%>
			<!--  로그인 했을때 화면 -->
			<ul class='navbar-nav ml-auto'>
				<c:choose>
					<c:when test="${sessionScope.login_bean.login == false}">
						<li class='nav-item'><a href='user_login.springshoppingmall' class='nav-link'>로그인</a></li>
						<li class='nav-item'><a href='user_join.springshoppingmall' class='nav-link'>회원가입</a></li>
						
					<!-- 로그인 하지 않았을때 화면 -->
					
					</c:when>
					<c:otherwise>
						<li class='nav-item'><a href='user_info_main.springshoppingmall'class='nav-link'>마이 페이지</a></li>
						<li class='nav-item'><a href='buy_cart.springshoppingmall?page_num=1'class='nav-link'>장바구니</a></li>
						<li class='nav-item'><a href='buy_history.springshoppingmall?page_num=1'class='nav-link'>구매이력</a></li>
						<li class='nav-item'><a href='logout.springshoppingmall'class='nav-link'>로그아웃</a></li>

						<c:if test="${sessionScope.login_bean.user_grade == 1}">
						<li class='nav-item'><a href='manager_menu.springshoppingmall'class='nav-link'>관리자</a></li>
						</c:if>
						
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>	
</nav>









