$(document).ready(function () {
	$('.canhcam-product-detail-1 ul li').each(function (e) { 
		$(this).click(function (e) { 
			e.preventDefault();
			$(this).siblings().removeClass('active')
			$(this).toggleClass('active')
		});
	});

	$('.canhcam-product-detail-1 .buy').on('click', function(e) {
		e.preventDefault()
		$('.product-linked-shop-wrapper').toggleClass('product-linked-shop-wrapper-active')
	})
});
