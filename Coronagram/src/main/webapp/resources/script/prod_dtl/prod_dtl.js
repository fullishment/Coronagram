
// main
var img1src= "../../resources/images/마스크.jpg";
var img2src= "../../resources/images/마스크2.jpg";
var img3src= "../../resources/images/마스크3.jpg";
var img4src= "../../resources/images/마스크4.jpg";

//증감
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

