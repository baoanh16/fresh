"use strict";

var CANHCAM_APP = { "DEV_MODE": false, "DEV_MODE_GIRD_FULL": false, "ACTIVE_FIXED_FOOTER": true, "ACTIVE_BACKTOTOP": true, "ACTIVE_RESPONSIVE": true, "ACTIVE_FIXED_HEADER": true, "HEADER_TRANPARENT": false, "ACTIVE_PADDING_MAIN": true, "ACTIVE_LIST_TO_SELECT": true, "ACTIVE_VALIDATOR": true, "ACTIVE_SELECT": true, "ACTIVE_HEADER_POSITION": 1, "DISPLAY_FOOTER": 600, "DISPLAY_BACKTOTOP": 100, "CHANGE_GRID": 991, "CHANGE_GRID_SM": 767 };
function backToTop() {
    if ($('#back-to-top').length) {
        var backToTop = function backToTop() {
            var scrollTop = $(window).scrollTop();
            if (scrollTop > CANHCAM_APP.DISPLAY_BACKTOTOP) {
                $('#back-to-top').addClass('show');
            } else {
                $('#back-to-top').removeClass('show');
            }
        };
        backToTop();
        $(window).on('scroll', function () {
            backToTop();
        });
        $('#back-to-top').on('click', function (e) {
            e.preventDefault();
            $('html,body').animate({
                scrollTop: 0
            }, 700);
        });
    }
}

$(document).ready(function () {
    if (CANHCAM_APP.ACTIVE_BACKTOTOP) {
        backToTop();
    }
});
function CanhCamResponsive() {
    // Set BG Mask
    $('[bg-mask]').each(function () {
        var bgimg = $(this).attr('bg-mask');
        $(this).css({
            "mask-image": "url(" + bgimg + ")",
            "mask-position": "center center",
            "mask-repeat": "no-repeat",
            "-webkit-mask-image": "url(" + bgimg + ")",
            "-webkit-mask-position": "center center",
            "-webkit-mask-repeat": "no-repeat"
        });
    });
    // Set BG Resposive
    $('[bg-img]').each(function () {
        var bgimg = $(this).attr('bg-img');
        var pos = $(this).attr('bg-pos');
        var size = $(this).attr('bg-size');
        if (pos && pos.length > 0) {
            $(this).css({
                "background-position": pos
            });
        } else {
            $(this).css({
                "background-position": "center center"
            });
        }
        if (size && size.length > 0) {
            $(this).css({
                "background-size": size
            });
        } else {
            $(this).css({
                "background-size": "cover"
            });
        }
        $(this).css({
            "background-image": "url(" + bgimg + ")"
        });
    });

    $('[bg-img-responsive]').each(function () {
        var bgimg = $(this).attr('bg-img-responsive');
        var bgimgsm = $(this).attr('bg-img-responsive-sm');
        var bgimgxs = $(this).attr('bg-img-responsive-xs');
        if ($(window).width() >= CANHCAM_APP.CHANGE_GRID) {
            $(this).css({
                "background-image": "url(" + bgimg + ")",
                "background-position": "center center",
                "background-size": "cover"
            });
        } else if ($(window).width() < CANHCAM_APP.CHANGE_GRID && $(window).width() > CANHCAM_APP.CHANGE_GRID_SM) {
            $(this).css({
                "background-image": "url(" + bgimgsm + ")",
                "background-position": "center center",
                "background-size": "cover"
            });
        } else {
            $(this).css({
                "background-image": "url(" + bgimgxs + ")",
                "background-position": "center center",
                "background-size": "cover"
            });
        }
    });

    $('[img-src-responsive]').each(function () {
        var bgimg2 = $(this).attr('img-src-responsive');
        var bgimg2sm = $(this).attr('img-src-responsive-sm');
        var bgimg2xs = $(this).attr('img-src-responsive-xs');
        if ($(window).width() >= CANHCAM_APP.CHANGE_GRID) {
            $(this).attr("src", "" + bgimg2 + "");
        } else if ($(window).width() < CANHCAM_APP.CHANGE_GRID && $(window).width() > CANHCAM_APP.CHANGE_GRID_SM) {
            $(this).attr("src", "" + bgimg2sm + "");
        } else {
            $(this).attr("src", "" + bgimg2xs + "");
        }
    });
};

$(function () {
    if (CANHCAM_APP.ACTIVE_RESPONSIVE) {
        CanhCamResponsive();
    }
});

$(window).resize(function () {
    if (CANHCAM_APP.ACTIVE_RESPONSIVE) {
        CanhCamResponsive();
    }
});

$(function () {
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover({
        trigger: 'focus'
    });
});
// Thêm [dropdown-type="hover"] vào thẻ a để bật tính năng hover open dropdown 
if ($(window).width() > CANHCAM_APP.CHANGE_GRID) {
    $('.dropdown').on('mouseenter mouseleave', function () {
        var ___d = $(this).find('[dropdown-type="hover"]').parents('.dropdown');
        if (___d && ___d.length > 0) {
            $(this).find('[dropdown-type="hover"]').removeAttr('data-toggle');
            setTimeout(function () {
                ___d[___d.is(':hover') ? 'addClass' : 'removeClass']('show');
                ___d.is(':hover') ? ___d.find('.dropdown-menu').show() : ___d.find('.dropdown-menu').hide();
            }, 10);
        }
    });
} else {
    $('.dropdown').each(function () {
        $(this).addClass('show');
        $(this).find('.dropdown-menu').show();
    });
}

$(document).ready(function () {
    checkDev();
});

$(window).resize(function () {
    checkDev();
});

function checkDev() {
    if ($('#devtools').length) {
        if ($(window).width() < 576) {
            $('.canhcam-develop #devtools .header-devtools h3').html('Dev - XS');
        } else if ($(window).width() >= 576 && $(window).width() < 768) {
            $('.canhcam-develop #devtools .header-devtools h3').html('Dev - SM');
        } else if ($(window).width() >= 768 && $(window).width() < 992) {
            $('.canhcam-develop #devtools .header-devtools h3').html('Dev - MD');
        } else if ($(window).width() >= 992 && $(window).width() < 1200) {
            $('.canhcam-develop #devtools .header-devtools h3').html('Dev - LG');
        } else {
            $('.canhcam-develop #devtools .header-devtools h3').html('Dev - XL');
        }
    }
}

(function ($) {
    $.fn.drags = function (opt) {

        opt = $.extend({ handle: "", cursor: "move" }, opt);

        if (opt.handle === "") {
            var $el = this;
        } else {
            var $el = this.find(opt.handle);
        }

        return $el.find('.header-devtools').css('cursor', opt.cursor).on("mousedown", function (e) {
            // getSizeDevTo()
            if (opt.handle === "") {
                var $drag = $(this).parent().addClass('draggable');
            } else {
                var $drag = $(this).parent().addClass('active-handle').parent().addClass('draggable');
            }
            var z_idx = $drag.css('z-index'),
			    drg_h = $drag.outerHeight(),
			    drg_w = $drag.outerWidth(),
			    pos_y = $drag.offset().top + drg_h - e.pageY,
			    pos_x = $drag.offset().left + drg_w - e.pageX;
            $drag.css('z-index', 99999).parents().on("mousemove", function (e) {
                getSizeDevTo();
                $('.draggable').offset({
                    top: e.pageY + pos_y - drg_h,
                    left: e.pageX + pos_x - drg_w
                }).on("mouseup", function () {
                    // getSizeDevTo()
                    $(this).removeClass('draggable').css('z-index', z_idx);
                });
                $('#devtools .inline').offset({
                    top: e.pageY + pos_y - drg_h
                });
                $('#devtools .online').offset({
                    left: e.pageX + pos_x - drg_w
                });
            });
            e.preventDefault(); // disable selection
        }).on("mouseup", function () {
            // getSizeDevTo()
            if (opt.handle === "") {
                $(this).removeClass('draggable');
            } else {
                $(this).removeClass('active-handle').parent().removeClass('draggable');
            }
        });
    };
})(jQuery);

if (CANHCAM_APP.DEV_MODE) {

    $('body').append('<div id="devtools"> <div class="online"></div><div class="inline"></div><div class="header-devtools"> <h3>Dev - XL</h3> </div><div class="body-devtools"> <button class="btn btn-block btn-secondary btn-sm" type="button">Toogle Grid</button> </div></div>');

    $('#devtools').drags();
    createDevTo();

    $(document).ready(function () {
        if ($('.canhcam-develop #devtools').length) {
            var devtls = $('.canhcam-develop #devtools').find('.body-devtools button');
            devtls.click(function () {
                if ($(this).attr('data-click-state') == 1) {
                    $(this).attr('data-click-state', 0);
                    $('body').toggleClass('active');
                    $('body').find('.devtool-gird').remove();
                } else {
                    $(this).attr('data-click-state', 1);
                    $('body').toggleClass('active');
                    if (CANHCAM_APP.DEV_MODE_GIRD_FULL) {
                        $('body').append('<div class="devtool-gird"><div class="container-fluid d-flex"><div class="row d-flex align-items-stretch bd-highlight"><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div></div></div></div>');
                    } else {
                        $('body').append('<div class="devtool-gird"><div class="container d-flex"><div class="row d-flex align-items-stretch bd-highlight"><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div><div class="col d-flex align-items-stretch"><div class="item"></div></div></div></div></div>');
                    }
                }
            });
        }
    });
}

function getSizeDevTo() {
    $('#devtools .body-devtools .size .width').html('W: ' + $(window).width() + '');
    $('#devtools .body-devtools .size .height').html('H: ' + $(window).height() + '');
    $('#devtools .body-devtools .size .top').html('T: ' + $('#devtools').offset().top + '');
    $('#devtools .body-devtools .size .left').html('L: ' + $('#devtools').offset().left + '');
}

$(window).resize(function () {
    if ($('#devtools').length) {
        getSizeDevTo();
    }
});

function createDevTo() {
    $('#devtools .body-devtools').append('<div class="size"><div class="width">W: ' + $(window).width() + '</div><div class="height">H: ' + $(window).height() + '</div><div class="top">T: ' + $('#devtools').offset().top + '</div><div class="left">L: ' + $('#devtools').offset().left + '</div></div>');
}

function countUpCanhCam() {

    $('[data-count]').each(function () {
        var elm = $(this).offset().top;
        var docH = $(window).height();
        var docS = $(window).scrollTop();
        var padingTop = 0;
        if ($(this).attr('data-top') && $(this).attr('data-top').length) {
            padingTop = parseInt($(this).attr('data-top'));
        }
        var result = elm + padingTop - (docH + docS);
        var run = false;

        if (result <= 0 && !run) {
            var $this = $(this),
			    countTo = $this.attr('data-count'),
			    durationTo = parseInt($this.attr('data-duration'));
            $({ countNum: $this.text() }).animate({
                countNum: countTo
            }, {
                duration: durationTo,
                easing: 'linear',
                step: function step() {
                    $this.text(Math.floor(this.countNum));
                },
                complete: function complete() {
                    $this.text(this.countNum);
                    run = true;
                }
            });
        }
    });
}

$(document).ready(function () {
    countUpCanhCam();
});

$(window).scroll(function () {
    countUpCanhCam();
});

$(window).resize(function () {
    countUpCanhCam();
});

function CanhCamChangeDataHoverClick() {
    $('[data-change]').each(function () {
        var newSrc = $(this).attr('data-new');
        var oldSrc = $(this).attr('data-old');
        var typeChange = $(this).attr('data-change');
        if (typeChange && typeChange.length > 0) {
            if (typeChange === 'src') {
                $(this).hover(function () {
                    $(this).attr(typeChange, newSrc);
                }, function () {
                    $(this).attr(typeChange, oldSrc);
                });
            } else if (typeChange === 'background' || typeChange === 'background-image') {
                $(this).hover(function () {
                    $(this).css(typeChange, "url(" + newSrc + ")");
                }, function () {
                    $(this).css(typeChange, "url(" + oldSrc + ")");
                });
            } else if (typeChange === 'class') {
                $(this).hover(function () {
                    $(this).removeClass(oldSrc).addClass(newSrc);
                }, function () {
                    $(this).removeClass(newSrc).addClass(oldSrc);
                });
            }
        }
    });
};

$(function () {
    CanhCamChangeDataHoverClick();
});

function setFooter() {
    var bodyHeight = $("body").outerHeight(),
	    headerHeight = $("header").outerHeight(),
	    footerHeight = $("footer").outerHeight(),
	    mainHeight = $("main").outerHeight(),
	    curentHeight = mainHeight + headerHeight + footerHeight,
	    curentfixedHeight = mainHeight + footerHeight,
	    newHeight = bodyHeight - (headerHeight + footerHeight),
	    newfixedHeight = bodyHeight - footerHeight;
    if ($(window).width() > CANHCAM_APP.DISPLAY_FOOTER) {
        if ($(window).width() <= CANHCAM_APP.CHANGE_GRID) {
            $("main").css('min-height', newfixedHeight + 'px');
        } else {
            if (!CANHCAM_APP.ACTIVE_FIXED_HEADER) {
                $("main").css('min-height', newHeight + 'px');
            } else {
                $("main").css('min-height', newfixedHeight + 'px');
            }
        }
    } else {
        $("main").css('min-height', 'initial');
    }
}

$(document).ready(function () {
    if (CANHCAM_APP.ACTIVE_FIXED_FOOTER) {
        setFooter();
    }
});

$(window).resize(function () {
    if (CANHCAM_APP.ACTIVE_FIXED_FOOTER) {
        setFooter();
    }
});
function setHeader(elm) {
    if (elm >= CANHCAM_APP.ACTIVE_HEADER_POSITION) {
        $("header").addClass('active');
    } else {
        $("header").removeClass('active');
    }
}

$(document).ready(function () {
    if (CANHCAM_APP.ACTIVE_FIXED_HEADER) {
        $("header").addClass('fixedheader');
        if ($(window).scrollTop() >= CANHCAM_APP.ACTIVE_HEADER_POSITION) {
            setHeader($(window).scrollTop());
        }
    } else {
        if ($(window).width() <= CANHCAM_APP.CHANGE_GRID) {
            $("header").addClass('fixedheader');
        } else {
            $("header").removeClass('fixedheader');
        }
    }
    if ($("header").hasClass("fixedheader")) {
        $("main").addClass('main-fixedheader');
    }
});

// Fixed Header
$(window).scroll(function () {
    setHeader($(document).scrollTop());
});
// Fixed Header
$(window).resize(function () {
    if (!CANHCAM_APP.ACTIVE_FIXED_HEADER) {
        if ($(window).width() <= CANHCAM_APP.CHANGE_GRID) {
            $("header").addClass('fixedheader');
        } else {
            $("header").removeClass('fixedheader');
        }
    }
});

function setMain() {
    var headerHeight = $("header").outerHeight();
    if ($(window).width() <= CANHCAM_APP.CHANGE_GRID) {
        $("main").css('padding-top', headerHeight + 'px');
    } else {
        if (!CANHCAM_APP.ACTIVE_PADDING_MAIN) {
            $("main").css('padding-top', '0px');
        } else {
            if (!CANHCAM_APP.ACTIVE_FIXED_HEADER) {
                $("main").css('padding-top', 'initial');
            } else {
                $("main").css('padding-top', headerHeight + 'px');
            }
        }
    }
}

$(document).ready(function () {
    setMain();
});

$(window).resize(function () {
    setMain();
});

function setHeaderTranparent(elm) {
    if (elm >= CANHCAM_APP.ACTIVE_HEADER_POSITION) {
        $("header").removeClass('has-tranparent');
    } else {
        $("header").addClass('has-tranparent');
    }
}

$(document).ready(function () {
    if (CANHCAM_APP.HEADER_TRANPARENT) {
        $("header").addClass('has-tranparent');
        if ($(window).scrollTop() >= CANHCAM_APP.ACTIVE_HEADER_POSITION) {
            setHeaderTranparent($(window).scrollTop());
        }
    }
});

// Tranparent Header
$(window).scroll(function () {
    if (CANHCAM_APP.HEADER_TRANPARENT) {
        setHeaderTranparent($(document).scrollTop());
    }
});

function canhcamID(e) {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    for (var i = 0; i < e; i++) {
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    } return text;
}

function b64EncodeUnicode(str) {
    return btoa(encodeURIComponent(str).replace(/%([0-9A-F]{2})/g, function toSolidBytes(match, p1) {
        return String.fromCharCode('0x' + p1);
    }));
}

function b64DecodeUnicode(str) {
    return decodeURIComponent(atob(str).split('').map(function (c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));
}

// Copyright 2014-2017 The Bootstrap Authors
// Copyright 2014-2017 Twitter, Inc.
if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
    var msViewportStyle = document.createElement('style');
    msViewportStyle.appendChild(document.createTextNode('@-ms-viewport{width:auto!important}'));
    document.head.appendChild(msViewportStyle);
}

$(function () {
    var nua = navigator.userAgent;
    var isAndroid = nua.indexOf('Mozilla/5.0') > -1 && nua.indexOf('Android ') > -1 && nua.indexOf('AppleWebKit') > -1 && nua.indexOf('Chrome') === -1;
    if (isAndroid) {
        $('select.form-control').removeClass('form-control').css('width', '100%');
    }
});
function listToSelect() {
    $('[data-select]').each(function () {
        var list = $(this),
		    select = $(document.createElement('select')).insertBefore($(this).hide());
        select.addClass('custom-select').attr('data-select-show', '');
        $('>li a', this).each(function () {
            var option = $(document.createElement('option')).appendTo(select).val(this.href).html($(this).html());
        });
        list.hide().removeAttr('data-select').attr('data-select-changed', '');
        select.on('change', function () {
            var url = $(this).val();
            if (url) {
                window.location = url;
            }
            return false;
        });
    });
}

function selectChangeToList() {
    if (CANHCAM_APP.ACTIVE_LIST_TO_SELECT) {
        if ($(window).width() > CANHCAM_APP.CHANGE_GRID_SM) {
            $('[data-select-changed]').each(function () {
                $(this).show().removeAttr('data-select-changed').attr('data-select', '');
            });
            $('[data-select-show]').remove();
        } else {
            listToSelect();
        }
    }
}

$(document).ready(function () {
    if (CANHCAM_APP.ACTIVE_LIST_TO_SELECT) {
        if ($(window).width() <= CANHCAM_APP.CHANGE_GRID_SM) {
            listToSelect();
        }
    }
});

$(window).resize(function () {
    if (CANHCAM_APP.ACTIVE_LIST_TO_SELECT) {
        selectChangeToList();
    }
});

console.log('%cCANHCAM', 'font-size:100px;color:#ff451a;text-shadow:0 1px 0 #f73936,0 2px 0 #f73936 ,0 3px 0 #f73936 ,0 4px 0 #f73936 ,0 5px 0 #f73936 ,0 6px 1px rgba(0,0,0,.1),0 0 5px rgba(0,0,0,.1),0 1px 3px rgba(0,0,0,.3),0 3px 5px rgba(0,0,0,.2),0 5px 10px rgba(0,0,0,.25),0 10px 10px rgba(0,0,0,.2),0 20px 20px rgba(0,0,0,.15);');
console.log('%c CANHCAM ' + '%c - The best Web Solutions Provider', 'border-radius: 2px; padding: 3px; background: #ff451a; color: #FFF', 'color: #ff451a');
console.warn("CANHCAM warning: This is a browser feature intended for developers. If someone told you to copy and paste something here to enable a CANHCAM feature or 'hack' someone's account, it is a scam and will give them access to your CANHCAM account.");
document.onkeyup = function (a) {
    if ((a = a || window.event).altKey && a.ctrlKey && a.shiftKey && 13 == a.which) return $("body"), alert(b64DecodeUnicode("QkFPIE5HVVlFTiAtIDA5Njk2ODk4OTMKRW1haWw6IGJhb25ndXllbnlhbUBnbWFpbC5jb20KV2ViOiBiYW9uZ3V5ZW55YW0uZ2l0aHViLmlv")), !1;
};

// Ripple
function ccCreateRipple() {
    $('[ripple]').on('click', function (e) {
        var rippleDiv = $('<div class="ripple" />'),
		    rippleOffset = $(this).offset(),
		    rippleY = e.pageY - rippleOffset.top,
		    rippleX = e.pageX - rippleOffset.left,
		    ripple = $('.ripple');

        rippleDiv.css({
            top: rippleY - ripple.height() / 2,
            left: rippleX - ripple.width() / 2,
            background: $(this).attr("ripple-color")
        }).appendTo($(this));
        window.setTimeout(function () {
            rippleDiv.remove();
        }, 1500);
    });
}

$(document).ready(function () {
    ccCreateRipple();
});

$(document).ready(function () {
    if (CANHCAM_APP.ACTIVE_SELECT) {
        $(".select2").select2({
            placeholder: "Chọn một"
        });

        $('.select2').on("select2:select", function (e) {
            var valSelect = $(e.currentTarget).val();
        });
        $('.select2').on("select2:unselect", function (e) {
            var valUnselect = $(e.currentTarget).val();
        });
    }
});

function selectResset(e) {
    $(e).val(null).trigger("change", 0);
}

function canhCamStickyComtent() {

    $('[data-fix]').each(function () {
        $(this).css({
            "z-index": '500'
        });
        if ($(this).attr('data-top') && $(this).attr('data-top').length) {
            $(this).css({
                "top": $(this).attr('data-top')
            });
        }
        if ($(this).attr('data-left') && $(this).attr('data-left').length) {
            $(this).css({
                "left": $(this).attr('data-left')
            });
        }
        if ($(this).attr('data-bottom') && $(this).attr('data-bottom').length) {
            $(this).css({
                "bottom": $(this).attr('data-bottom')
            });
        }
        if ($(this).attr('data-right') && $(this).attr('data-right').length) {
            $(this).css({
                "right": $(this).attr('data-right')
            });
        }

        var toFix = 0;
        var typeFix = 'fixed';
        var changeFix = 'static';

        if ($(this).attr('data-fix') && $(this).attr('data-fix').length) {
            toFix = parseInt($(this).attr('data-fix'));
        }
        if ($(this).attr('data-fix-type') && $(this).attr('data-fix-type').length) {
            typeFix = $(this).attr('data-fix-type');
        }
        if ($(this).attr('data-fix-change') && $(this).attr('data-fix-change').length) {
            changeFix = $(this).attr('data-fix-change');
        }

        $(this).css({
            "position": typeFix
        });

        var scrollTop = $(window).scrollTop();
        var elementOffset = $(this).offset().top;
        var currentElementOffset = elementOffset - scrollTop;
        if (currentElementOffset <= toFix) {
            $(this).css({
                "position": changeFix,
                "top": toFix + 'px'
            });
        }
    });
}

$(document).ready(function () {
    canhCamStickyComtent();
});

$(window).scroll(function () {
    canhCamStickyComtent();
});

$(window).resize(function () {
    canhCamStickyComtent();
});

$(document).ready(function () {
    if (CANHCAM_APP.ACTIVE_VALIDATOR) {
        $('[data-toggle="validator"]').validator({
            feedback: {
                success: 'fa fa-check',
                error: 'fa fa-close'
            }
        }).on('submit', function (e) {
            if (e.isDefaultPrevented()) {
                $('[data-toggle="validator"]').find('select').parent('.form-group').addClass('has-danger');
            }
        });
        if ($('[data-toggle="validator"]').find('select').hasClass('has-success')) {
            this.removeClass('has-danger');
        }
    }
});

function CCHeader11() {
    $('.canhcam-header-11 #demoResAllInOneMenu').kResponsiveMenu({
        animationSpeed: 'fast', // slow, fast, 200
        resizeWidth: 975.9, // 'xs', 'sm', 'md', 'lg', 'xl', 480,
        menuType: 'horizontal', // horizontal, vertical
        menuPush: 'right', // right, left
        menuPushPosition: 'fixed', // absolute
        menuPushWidth: '300px', // px, %, rem
        menuBackDrop: true // px, %, rem
    });
};

$(document).ready(function () {
    CCHeader11();
});
// Fixed Header
$(window).scroll(function () { });

$(window).resize(function () { });

$(function () { });

$(function () { });
var swiper = new Swiper('.home-banner .swiper-container', {
    pagination: {
        el: '.swiper-pagination',
        type: 'fraction'
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev'
    }
});
$(function () { });
var swiper = new Swiper('.page-banner .swiper-container', {
    pagination: {
        el: '.swiper-pagination',
        type: 'fraction'
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev'
    }
});

$(document).ready(function () {
    $('.nav-about .toggle').click(function (e) {
        e.preventDefault();
        $('.nav-about ul').toggleClass('show');
    });
});
$(document).ready(function () {
    $('.nav-product .toggle').click(function (e) {
        e.preventDefault();
        $('.nav-product ul').toggleClass('show');
    });
});
$(document).ready(function () {
    $('.nav-product-detail .toggle').click(function (e) {
        e.preventDefault();
        $('.nav-product-detail ul').toggleClass('show');
    });
});

$(document).ready(function () {
    $('.canhcam-product-detail-1 ul li').each(function (e) {
        $(this).click(function (e) {
            e.preventDefault();
            $(this).siblings().removeClass('active');
            $(this).toggleClass('active');
        });
    });
});

/*
$(function () {
    $('.helpdesk-step .content .selection .item').each(function (e) {
        $(this).click(function (e) {
            e.preventDefault();
            $(this).siblings().removeClass('active');
            $(this).toggleClass('active');
        });
    });
});
*/

function changeNewsItemNews2() {
    if ($(window).width() > CANHCAM_APP.CHANGE_GRID) {
        $('.canhcam-news-2 .news-hot').each(function () {
            var geth = $(this).find('.top-list .item figure').outerHeight();
            var countitem = $(this).find('.part-list').find('.item').length;
            $(this).find('.part-list .item figure').each(function () {
                $(this).css({
                    'height': 'calc(' + geth / countitem + 'px + 0.15rem)'
                });
            });
        });
    } else {
        $('.canhcam-news-2 .part-list .item figure').each(function () {
            $(this).css({
                'height': 'initial'
            });
        });
    }
}

$(document).ready(function () {
    changeNewsItemNews2();
});

$(window).resize(function () {
    changeNewsItemNews2();
});

function changeNewsDetail1() {
    $(".canhcam-news-details-1 .news-read").lightGallery({
        thumbnail: true,
        animateThumb: false,
        showThumbByDefault: false,
        selector: '.item-news-read'
    });
}
function createNewsSocial1() {
    var newsFullPath = document.URL;
    var newsFullPathEncode = encodeURIComponent(document.URL);
    $('.fb-like').attr('data-href', newsFullPath);
    $('.fb-like .fb-xfbml-parse-ignore').attr('href', 'https://www.facebook.com/sharer/sharer.php?u=' + newsFullPathEncode + '&src=sdkpreparse');
    $('.twitter-share-button').attr('data-url', newsFullPath);
}

function changeIMGtoDiv1() {
    $('.canhcam-news-details-1 .othernews .item figure').each(function () {
        var tmp = $(this).find('img').attr('src');
        $(this).append('<div class="thumb"></div>');
        $(this).find('.thumb').css({
            "background-image": "url(" + tmp + ")",
            "background-position": "center center",
            "background-size": "cover"
        });
    });
}

$(document).ready(function () {
    changeNewsDetail1();
    createNewsSocial1();
    changeIMGtoDiv1();
});

$(window).resize(function () {
    changeIMGtoDiv1();
});

$(document).ready(function () {
    $(".fancybox").fancybox();
});
var swiper = new Swiper('.canhcam-home-2 .swiper-container', {
    slidesPerView: 'auto',
    loop: true,
    spaceBetween: 30,
    autoplay: {
        delay: 4000,
        disableOnInteraction: false
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev'
    },
    breakpoints: {
        // when window width is <= 320px
        576: {
            slidesPerView: 1,
            spaceBetween: 10,
            navigation: {
                nextEl: null,
                prevEl: null
            },
            autoplay: {
                delay: 3000,
                disableOnInteraction: false
            }
        }
    }
});

$(document).ready(function () {
    baodeptrai();
});

$(window).resize(function () { });

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
    });
}

$(document).ready(function () {
    $('.canhcam-home-6 .news-list').owlCarousel({
        items: 1,
        nav: true,
        loop: false,
        dots: false,
        navText: ["<span class='lnr lnr-chevron-left'></span>", "<span class='lnr lnr-chevron-right'></span>"],
        responsive: {
            576: {
                items: 2,
                margin: 30
            },
            992: {
                items: 3,
                margin: 30
            }
        }
    });
});

function CCFooter6() { };

$(function () {
    CCFooter6();
    $('.canhcam-footer-6 .subscribebutton').text('');
    $('.canhcam-footer-6 .subscribebutton').prepend('<span class="mdi mdi-email text-white"></span>');
    var d = $('.canhcam-footer-6 .fa');
    $(d).each().change(function (e) {
        $('.canhcam-footer-6 .subscribebutton').text('');
        $('.canhcam-footer-6 .subscribebutton').prepend('<span class="mdi mdi-email text-white"></span>');
    });
});

$(window).resize(function () { });
//# sourceMappingURL=app.js.map


$(function () {
    $('body').on('click', 'a.ajaxfilternext', function (e) {
        e.preventDefault();

        if ($(this).hasClass('disabled'))
            return false;

        var parent = $(this).parents('.filter-group');
        if (!parent.find('.filter-option.active').length) {
            alert('Vui lòng chọn trước khi qua bước tiếp theo.');
            return false;
        }

        var next = parent.next();
        if (next.hasClass('filter-group')) {
            parent.hide();
            next.show();

            $('.filter-steps .item').eq(next.index()).addClass('active');
        }
        else {
            $('.filter-group').hide();
            var optionId = $('.filter-group').eq(0).find('.filter-option.active').attr('data-id');
            var url = '/product/services/productservice.aspx';
            $.ajax({
                url: url, data: { 'method': 'SearchProduct', 'optionId': optionId }, type: 'post', success: function (data) {
                    if (data.success) {
                        $('.ajaxresponseresults').html(data.data).show();
                        $('.filter-steps .item-result').addClass('active');
                    }
                    else
                        $('.ajaxresponseresults').html(data.message).show();
                }
            });
        }

        return false;
    });

    $('body').on('click', 'a.filter-option', function (e) {
        e.preventDefault();

        $(this).parents('.product-options').next('.button').find('.ajaxfilternext').removeClass('disabled');
        $(this).parents('.product-options').find('.filter-option').removeClass('active');
        $(this).addClass('active');

        return false;
    });

    $('body').on('click', '.helpdesk-intro .btn-more', function (e) {
        e.preventDefault();

        $('.helpdesk-intro').remove();
        $('.helpdesk-step').show();

        return false;
    });
	
	$("body").on("click", "a.ajaxpagerlink", function (e) {
        e.preventDefault();
        
        //get the link location that was clicked
        var obj = $(this);
        var pageurl = $(this).attr('href');

        //to get the ajax content and display in div with id 'content'
        $.ajax({ url: pageurl, data: { isajax: true }, success: function (data) {
            $('.ajaxresponse .ajaxresponsewrap').append($(data).find('.ajaxresponsewrap').html());
            obj.remove();
        }
        });

        //to change the browser URL to 'pageurl'
        if (pageurl != window.location) {
            window.history.pushState({ path: pageurl }, '', pageurl);
        }

        //window.scrollTo(0, 0);

        return false;
    });

});