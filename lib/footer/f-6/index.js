function CCFooter6() {

};

$(function () {
	CCFooter6();
	$('.canhcam-footer-6 .subscribebutton').text('')
	$('.canhcam-footer-6 .subscribebutton').prepend('<span class="mdi mdi-email text-white"></span>')
	var d = $('.canhcam-footer-6 .fa')
	$(d).each().change(function (e) { 
		$('.canhcam-footer-6 .subscribebutton').text('')
		$('.canhcam-footer-6 .subscribebutton').prepend('<span class="mdi mdi-email text-white"></span>')
	});
	
	
})

$(window).resize(function () {})
