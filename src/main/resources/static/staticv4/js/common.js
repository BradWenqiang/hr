$(function () {
    var isRefreshKuaixunShowallBtn = false;
    $(".tabmenu .lk").click(function () {
        $(this).addClass("cur").siblings().removeClass("cur");
        var index = $(this).parents('.tabmenu').find('.lk').index(this);
        $(this).parents(".tabmenu").siblings(".tabwrap").find(".module").eq(index).show(0, function () {
            if ($(".prodet-menu .cur").html().trim() == "相关快讯") {
                if (!isRefreshKuaixunShowallBtn) {
                    refreshKuaixunShowallBtn($('.tabwrap a.summary:not(.showAll)'));
                    isRefreshKuaixunShowallBtn = true;
                }
            }
        }).siblings(".module").hide();
    });

    $('.hd-sear .ico').click(function () {
        $(this).toggleClass('close').siblings('.menu-drop').slideToggle();
    });
    $('.searbox .cancel').click(function () {
        $('.hd-sear .ico').toggleClass('close').siblings('.menu-drop').slideToggle();
    });
    $('.hd-menu .ico').click(function () {
        $(this).toggleClass('close').siblings('.menu-drop').slideToggle();
    });
});

function formatDate(date, fmt) {
    date = new Date(date);

    if (!fmt) fmt = "yyyy-MM-dd HH:mm:ss";

    if (!date || date == null) return null;
    var o = {
        'M+': date.getMonth() + 1, // 月份
        'd+': date.getDate(), // 日
        'H+': date.getHours(), // 小时
        'm+': date.getMinutes(), // 分
        's+': date.getSeconds(), // 秒
        'q+': Math.floor((date.getMonth() + 3) / 3), // 季度
        'S': date.getMilliseconds() // 毫秒
    }
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length))
    for (var k in o) {
        if (new RegExp('(' + k + ')').test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)))
    }
    return fmt;
}


function refreshKuaixunShowallBtn($obj) {
    $obj.each(function () {
        //console.log("scrollHeight:" + $(this).prop('scrollHeight') + "   height:" + $(this).height());
        if ($(this).prop('scrollHeight') <= $(this).height()) {
            $(this).next(".showAllBtn").remove();
        }
    });
    console.log("refresh success");
}

$(function () {
    toTop("#backTop");
});

function toTop(selector) {
    if ($(window).scrollTop() < 300) {
        $(selector).hide(200);
    } else {
        $(selector).show(200);
    }
    $(window).scroll(function (event) {
        if ($(this).scrollTop() < 300) {
            $(selector).hide(200);
        } else {
            $(selector).show(200);
        }
    });
    $(selector).click(function (event) {
        $("html,body").animate({scrollTop: "0px"}, 666)
    });
}