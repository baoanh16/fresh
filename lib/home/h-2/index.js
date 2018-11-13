
$(document).ready(function () {
	$(".fancybox").fancybox();
});
var swiper = new Swiper('.canhcam-home-2 .swiper-container', {
	slidesPerView: 'auto',
	loop: true,
	spaceBetween: 30,
	autoplay: {
		delay: 4000,
		disableOnInteraction: false,
	},
	navigation: {
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev',
	},
	breakpoints: {
		// when window width is <= 320px
		576: {
			slidesPerView: 1,
			spaceBetween: 10,
			navigation: {
				nextEl: null,
				prevEl: null,
			},
			autoplay: {
				delay: 3000,
				disableOnInteraction: false,
			},
		}
	}
});
