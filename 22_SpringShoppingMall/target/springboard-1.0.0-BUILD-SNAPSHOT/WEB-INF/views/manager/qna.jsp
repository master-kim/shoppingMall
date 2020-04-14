<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>이디스 북 홈페이지입니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='client/js/product.js'></script>
<style type="text/css">

</style>
<script>
function info_detail_click(product_idx, product_category_idx){
		
	location.href = 'product_detail.springshoppingmall?page_num=1&product_category_idx=' + product_category_idx + '&product_idx='+ product_idx
}
</script>
</head>
<body>




<c:import url="/client/common/top_menu.jsp"/>

<div class='container' style='margin-top: 200px;'>
	<div class='row'>
		<img src='client/image/qna.PNG' style='text-align: center;' />
		<a href='qna_pro.springshoppingmall' class='btn btn-primary' style='position: absolute; margin-top: 310px; margin-left: 645px;'>문의하기</a>
	</div>
	
	</div>
<c:import url="/client/common/bottom_info.jsp"/>

</body>
</html>

