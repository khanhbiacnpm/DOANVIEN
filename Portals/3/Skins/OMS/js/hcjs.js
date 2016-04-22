// JavaScript Document
$(document).ready(function () {
  
     $("#menu ul li").hover(function () {
    $(this).find('.submenuf1:first').css({ visibility: "visible", display: "none" }).fadeIn(500);
    }, function () {
        $(this).find('.submenuf1:first').hide(200);

    });


 $(".submenuf1 li").hover(function () {
    $(this).find('ul:first').show('slide', {direction: 'left'},200);
    }, function () {
        $(this).find('ul:first').hide('slide', {direction: 'left'},200);

    });

    $(".itsme").parent().parent().addClass("selected");
    $("#menu ul li ul .itsme").parent().parent().parent().parent().addClass("selected");



    $(".features-wrap .head a").click(function () {
        $(".features-wrap .head a").removeClass('selected');
        $(this).addClass("selected");
        $(".tab_content").hide();
        var selected_tab = $(this).attr("href");
        $(selected_tab).fadeIn();
    });


});



/*--------------------------------------*/
function reDirect() {
    var response = document.getElementById('txtSearch').value;
    location = '/tim-kiem/' + response.replace(/(^[\s]+|[\s]+$)/g, '') + '/';
    return false;
}