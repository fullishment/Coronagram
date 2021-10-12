const toggler = document.querySelector('.cm_menu__toggler');
const menu = document.querySelector('.cm_menu');

toggler.addEventListener('click', () => {
    toggler.classList.toggle('active');
    menu.classList.toggle('active');
});
// 드롭다운
document.querySelector('.cm_dropbtn').addEventListener('click', () => {
    document.querySelector('.cm_dropdown').classList.toggle('cm_show');
})
//메뉴 화살표
var cm_arrow = '<span class="cm_arrowspan"></span>'
$(cm_arrow).insertBefore('.cm_mcon');

$('.cm_menu .cm_arrowspan').click(function () {
    if (
        $(this).next('.cm_mcon').hasClass('deployed')) {
        $(this).removeClass('cm_up-arrow');
        $(this).next('.cm_mcon').slideUp('fast').removeClass('deployed');
    } else {
        $(this).addClass('cm_up-arrow');
        // $('.mcon').slideUp('fast').removeClass('deployed'); // Close Other Elements
        $(this).next('.cm_mcon').slideDown('fast').addClass('deployed');
    }
});
// sc
window.onscroll = function () { myFunction() };

function myFunction() {
    var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
    var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
    var scrolled = (winScroll / height) * 100;
    document.getElementById("myBar").style.width = scrolled + "%";
}
var acc = document.getElementsByClassName("scQ");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function () {
        this.classList.toggle("SCactive");
        var scA = this.nextElementSibling;
        if (scA.style.display === "block") {
            scA.style.display = "none";
        } else {
            scA.style.display = "block";
        }
    });
}