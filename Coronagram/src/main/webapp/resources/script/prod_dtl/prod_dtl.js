
// main
var img1src= "resources/images/etc/msk1.jpg";
var img2src= "resources/images/etc/msk2.jpg";
var img3src= "resources/images/etc/msk3.jpg";
var img4src= "resources/images/etc/msk4.jpg";

function changeImage(src) {
document.getElementById("mainImage").src = src;
}
$(".qt-plus").click(function(){
    $(this).parent().children(".qt").html(parseInt($(this).parent().children(".qt").html()) + 1);
});

$(".qt-minus").click(function(){
    child = $(this).parent().children(".qt");
    
    if(parseInt(child.html()) > 1) {
    child.html(parseInt(child.html()) - 1);
    }
    
});

