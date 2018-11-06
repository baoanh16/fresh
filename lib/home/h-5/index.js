$(document).ready(function () {
	baodeptrai()
})

$(window).resize(function () { 
	
});

function baodeptrai() {
	$('.canhcam-home-5 .feedback').owlCarousel({
		autoplay: true,
		items: 1,
		nav: true,
		loop: false,
		mouseDrag: false,
		dots: false,
		margin: 20,
		animateOut: 'slideOutRight',
		animateIn: 'slideInRight',
		responsive: {
			320: {
				navText: ["<span class='lnr lnr-arrow-left-circle'></span>", "<span class='lnr lnr-arrow-right-circle'></span>"]
			},
			992: {
				animateOut: 'slideOutUp',
				animateIn: 'slideInUp',
				navText: ["<span class='lnr lnr-arrow-down-circle'></span>", "<span class='lnr lnr-arrow-up-circle'></span>"]
			}
		}
	})
}
