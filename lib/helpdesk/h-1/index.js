$(function() {
	$('.helpdesk-step .content .selection .item').each(function (e) { 
		$(this).click(function (e) { 
			e.preventDefault();
			$(this).siblings().removeClass('active')
			$(this).toggleClass('active')
		});
	});
});
