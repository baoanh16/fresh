$(document).ready(function () {
	$('.nav-about .toggle').click(function (e) { 
		e.preventDefault();
		$('.nav-about ul').toggleClass('show')
	});
});