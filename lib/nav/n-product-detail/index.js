$(document).ready(function () {
	$('.nav-product-detail .toggle').click(function (e) { 
		e.preventDefault();
		$('.nav-product-detail ul').toggleClass('show')
	});
});