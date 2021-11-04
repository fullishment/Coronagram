
// sc

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