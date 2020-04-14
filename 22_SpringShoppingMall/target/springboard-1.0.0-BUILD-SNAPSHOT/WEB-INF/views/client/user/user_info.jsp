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
<script>
	// 사용자 정보 셋팅 (소스보기 하면 보이니깐 비밀번호는 금지)
	$(function(){
		$("#user_name").val('${requestScope.user_bean.user_name}')
		$("#user_id").val('${requestScope.user_bean.user_id}')
		$("#sample2_postcode").val('${requestScope.user_bean.user_post_code}')
		$("#sample2_address").val('${requestScope.user_bean.user_addr1}')
		$("#sample2_detailAddress").val('${requestScope.user_bean.user_addr2}')
		$("#sample2_extraAddress").val('${requestScope.user_bean.user_addr3}')
		$("#user_phone1").val('${requestScope.user_bean.user_phone1}')
		$("#user_phone2").val('${requestScope.user_bean.user_phone2}')
		$("#user_phone3").val('${requestScope.user_bean.user_phone3}')
	})

	function check_input(){
		var user_pw = $("#user_pw").val()
		var user_pw2 = $("#user_pw2").val()		
		var user_postal = $("#sample2_postcode").val()
		var user_addr1 = $("#sample2_address").val()
		var user_addr2 = $("#sample2_detailAddress").val()
		var user_addr3 = $("#sample2_extraAddress").val()
		var user_phone1 = $("#user_phone1").val()
		var user_phone2 = $("#user_phone2").val()
		var user_phone3 = $("#user_phone3").val()
			
		if(user_pw.length > 0 && userpw_regex.test(user_pw) == false){
			alert('비밀번호가 잘못되었습니다(영문,숫자,4~20글자)')
			$("#user_pw").val('')
			$("#user_pw").focus()
			return false
		}
		
		if(user_pw2.length > 0 && userpw_regex.test(user_pw2) == false){
			alert('비밀번호가 잘못되었습니다(영문,숫자,4~20글자)')
			$("#user_pw2").val('')
			$("#user_pw2").focus()
			return false
		}
		
		if(user_pw != user_pw2){
			alert('비밀번호가 일치하지 않습니다')
			$("#user_pw").val('')
			$("#user_pw2").val('')
			$("#user_pw").focus()
			return false
		}
		
		if(user_postal.length == 0){
			alert('우편번호를 검색해주세요')
			$("#sample2_postcode").focus()
			return false
		}
		
		if(user_addr2.length == 0){
			alert('상세 주소를 입력해주세요')
			$("#sample2_detailAddress").focus()
			return false
		}
		
		if(phone_regex.test(user_phone2) == false){
			alert('휴대폰 번호가 잘못되었습니다(숫자, 3~4글자)')
			$("#user_phone2").val('')
			$("#user_phone2").focus()
			return false
		}
		
		if(phone_regex.test(user_phone3) == false){
			alert('휴대폰 번호가 잘못되었습니다(숫자, 3~4글자)')
			$("#user_phone3").val('')
			$("#user_phone3").focus()
			return false
		}
		
		var params = {
			user_post_code : user_postal,
			user_addr1 : user_addr1,
			user_addr2 : user_addr2,
			user_addr3 : user_addr3,
			user_phone1 : user_phone1,
			user_phone2 : user_phone2,
			user_phone3 : user_phone3,
			user_idx : ${requestScope.user_bean.user_idx}
		}
		
		// 비밀번호 입력한 것이 있을 때만 비밀번호를 셋팅해준다.
		if(user_pw.length > 0){
			params.user_pw = user_pw
		}
		
		$.ajax({
			url : 'modify_user_info.springshoppingmall',
			type : 'post',
			data : params,
			dataType : 'text',
			success : function(result){
				if(result.trim() == 'OK'){
					alert('수정되었습니다')
				}
			}
		})
	
		return false
		
	}
</script>
</head>
<body>

<c:import url="/client/common/top_menu.jsp"/>

<%-- 다음 주소 검색 --%>
<div id="daum_address" style="display:none;position:fixed;overflow:hidden;z-index:100;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<div class='container' style='margin-top:100px;min-height:500px'>
	<div class='row'>
		<div class='col-md-3'></div>
		<div class='col-md-6'>
			<h1>회원정보 페이지</h1>
			<div style='margin-top:20px'></div>
			<div class='card'>
				<div class='card-body'>
					<form onsubmit='return check_input()'>
						<div class='form-group'>
							<label for='user_name'>이름</label>
							<input type='text' id='user_name' class='form-control' readonly="readonly"/>
						</div>
						<div class='form-group'>
							<label for='user_id'>아이디</label>
							<input type='text' id='user_id' class='form-control' readonly="readonly"/>
						</div>
						<div class='form-group'>
							<label for='user_pw'>비밀번호</label>
							<input type='password' id='user_pw' class='form-control'/>
						</div>
						<div class='form-group'>
							<label for='user_pw2'>비밀번호 확인</label>
							<input type='password' id='user_pw2' class='form-control'/>
						</div>
						<div class='form-group'>
							<label for='sample2_postcode'>주소</label>
							<div class='input-group'>
								<input type='text' id='sample2_postcode' class='form-control' readonly="readonly" />
								<div class='input-group-append'>
									<button type='button' class='btn btn-primary' onclick='sample2_execDaumPostcode()'>주소검색</button>
								</div>
							</div>
						</div>
						<div class='form-group'>
							<input type='text' id='sample2_address' class='form-control' readonly="readonly" />
						</div>
						<div class='form-group'>
							<input type='text' id='sample2_detailAddress' class='form-control' />
						</div>
						<div class='form-group'>
							<input type='text' id='sample2_extraAddress' class='form-control'/>
						</div>
						<div class='form-group'>
							<label for='user_phone1'>휴대폰 번호</label>
							<div class='row'>
								<div class='col-md-4'>
									<select id='user_phone1' class='form-control'>
										<option value='010'>010</option>
										<option value='011'>011</option>
										<option value='017'>017</option>
										<option value='018'>018</option>
										<option value='019'>019</option>
									</select>
								</div>
								<div class='col-md-4'>
									<input type='text' id='user_phone2' class='form-control' maxlength='4'/>
								</div>
								<div class='col-md-4'>
									<input type='text' id='user_phone3' class='form-control' maxlength='4'/>
								</div>
							</div>
						</div>
						<div class='form-group text-right'>
							<button type='submit' class='btn btn-primary'>수정완료</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class='col-md-3'></div>
	</div>
</div>

<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>





