<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>/client/user/user_login.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='client/js/regex.js'></script>
<script>
	function check_input(){
		var user_id = $("#user_id").val()
		var user_pw = $("#user_pw").val()
		
		if(userid_regex.test(user_id) == false){
			alert('아이디가 잘못되었습니다(영문,숫자,4~20글자)')
			$("#user_id").val('')
			$("#user_id").focus()
			return false
		}
		
		if(userpw_regex.test(user_pw) == false){
			alert('비밀번호가 잘못되었습니다(영문,숫자,4~20글자)')
			$("#user_pw").val('')
			$("#user_pw").focus()
			return false
		}
		
		var param = {
				user_id : user_id,
				user_pw : user_pw
		}
		
		$.ajax({
			url : 'user_login_pro.springshoppingmall',
			type : 'post',
			data : param,
			dataType : 'text',
			success : function(result){
				if(result.trim() == 'YES'){
					alert('로그인 되었습니다')
					location.href = 'main.springshoppingmall'
				} else {
					alert('로그인에 실패하였습니다')
					$("#user_id").val('');
					$("#user_pw").val('');
					$("#user_id").focus();
				}
			}
			
		})
		
		return false
	}
</script>
<style>
	#background{
		background:no-repeat center center; 
		background-size: cover; 
		background-image: url('client/image/background.jpg'); 
		height: 450px;
		
	
	}
	#text{
	text-align:left;
	margin-left:50px;
	
	}
	#button{
		width:195px;
	
	}
	#loginbutton{
		width : 100px;
		height: 100px;
		position : absolute;
		bottom:80px;
		left:430px;
	}
	
</style>	
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>
<div id='background'class=" text-white">
	<div style='margin-top:100px'>
		<h1 id ='text'>천년의 역사 전주! <br/> JeonJu & Holic 홈페이지 오신것을 환영합니다.</h1>
	</div>
	
</div>

	<%-- 로그인 부분 --%>
	<div class='container' style='margin-top: 50px; min-height: 500px'>
		<div class='row'>

			<div class='col-3'></div>
			<div class='col-6'>
				<h3>로그인</h3>
				<div class='card shadow'>
					<div class='card-body'>
						<form action='main.springshoppingmall' method='post'
							onsubmit='return check_input()'>
							<div class='form-group'>
								<input type='text' id='user_id' class='form-control'
									placeholder="아이디를 입력해주세요" style='width: 400px' />
							</div>

							<div class='form-group' style='margin-top: 15px'>
								<input type='password' id='user_pw' class='form-control'
									placeholder="비밀번호를 입력해주세요" style='width: 400px' />
							</div>
							<div class='form-group'>
								<a href='user_search.springshoppingmall'><button
										type='button' class='btn btn-danger' id='button'>ID/PW
										찾기</button></a> <a href='user_join.springshoppingmall'><button
										type='button' class='btn btn-info' id='button'>회원가입</button></a>
								<button type='submit' class='btn btn-primary' id='loginbutton'>로그인</button>
							</div>
						</form>
					</div>

				</div>

			</div>
			<div class='col-3'></div>
		</div>
	</div>

	<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>









