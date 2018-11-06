$(document).ready(function () {
	$('.nav-product .toggle').click(function (e) { 
		e.preventDefault();
		$('.nav-product ul').toggleClass('show')
	});
});