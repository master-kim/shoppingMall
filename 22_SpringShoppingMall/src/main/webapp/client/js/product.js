// /client/js/product.js

// 상품 카드 그림자 처리
$(function(){
	
	$('.product_card').hover(function(){
		$(this).addClass('shadow')
	}, function(){
		$(this).removeClass('shadow')
	})
})