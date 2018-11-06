function changeNewsItemNews2() {
	if ($(window).width() > CANHCAM_APP.CHANGE_GRID) {
		$('.canhcam-news-2 .news-hot').each(function () {
			var geth = $(this).find('.top-list .item figure').outerHeight();
			var countitem = $(this).find('.part-list').find('.item').length
			$(this).find('.part-list .item figure').each(function () {
				$(this).css({
					'height': 'calc(' + (geth / countitem) + 'px + 0.15rem)'
				})
			});
		})
	} else {
		$('.canhcam-news-2 .part-list .item figure').each(function () {
			$(this).css({
				'height': 'initial'
			})
		});
	}
}


$(document).ready(function() {
	changeNewsItemNews2()
});

$(window).resize(function () {
	changeNewsItemNews2()
})
