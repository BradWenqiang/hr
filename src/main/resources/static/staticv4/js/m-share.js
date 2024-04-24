$(document).ready(function () {
    $(".js-tutorials").height(window.innerHeight);
    $('.social-share .manual').click(function () {
        $('.social-share .js-tutorials').show();
    });
    $('.social-share .copyurl').click(function () {
        copy(window.location.href);
    });
    $('.js-tutorials').click(function () {
        $(this).hide();
    });
});


function copy(value) {
    var input = document.createElement("input");
    input.setAttribute("readonly", "readonly"),
        input.setAttribute("value", value),
        document.body.appendChild(input),
        input.setSelectionRange(0, 9999),
        input.select(),
    document.execCommand("copy") &&
    (document.execCommand("copy"),
        alert("已复制到粘贴板")),
        document.body.removeChild(input);
}