$(document).ready(function () {
    $(".contentIndex").fadeIn(1000);
    $(".titleRegister").fadeIn(1000);
    $(".contentRegister").fadeIn(1000);
    $(".learnmoreBtn").on("click", function (e)
    {
        $("body,html").animate({
            scrollTop: $(".indexContent").offset().top
        }, 'slow');
    })
});

$(window).scroll(function () {
    if ($(window).scrollTop() > 700) {
        $(".descriptionNotes").fadeIn(600);
        $(".descriptionPict").fadeIn(600);
        $(".descIllustration").fadeIn(600);
    }
});
