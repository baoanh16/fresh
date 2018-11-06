$(document).ready(function () {
	$('.canhcam-product-detail-1 ul li').each(function (e) { 
		$(this).click(function (e) { 
			e.preventDefault();
			$(this).siblings().removeClass('active')
			$(this).toggleClass('active')
		});
	});
});