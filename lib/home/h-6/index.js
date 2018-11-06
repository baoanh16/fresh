$(document).ready(function () {
	$('.canhcam-home-6 .news-list').owlCarousel({
		items: 1,
		nav: true,
		loop: false,
		dots: false,
		navText: ["<span class='lnr lnr-chevron-left'></span>", "<span class='lnr lnr-chevron-right'></span>"],
		responsive:{
			576:{
				items: 2,
				margin: 30
			},
			992:{
				items: 3,
				margin: 30
			}
		}
	})
});