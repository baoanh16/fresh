$(function() {

});
var swiper = new Swiper('.page-banner .swiper-container',{
    pagination: {
        el: '.swiper-pagination',
        type: 'fraction',
      },
    navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
    },
});