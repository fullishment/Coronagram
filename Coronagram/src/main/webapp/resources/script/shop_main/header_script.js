
  function bannerSwitcher() {
    next = $('.sec-1-input').filter(':checked').next('.sec-1-input');
    if (next.length) next.prop('checked', true);
    else $('.sec-1-input').first().prop('checked', true);
  }
setInterval(function(){
        var timer = new Date();
        var h = 23-timer.getHours();
        var m = 59-timer.getMinutes();
        var s = 59-timer.getSeconds();
        document.getElementById('clock').innerHTML = h + ":" + m + ":" + s;
    },1000);
  var bannerTimer = setInterval(bannerSwitcher, 5000);

  $('nav .controls label').click(function() {
    clearInterval(bannerTimer);
    bannerTimer = setInterval(bannerSwitcher, 5000)
  });

  $(document).ready(function(){
    $(".heart").on("click",function(){

    });
    $("#img_ch1").on("mouseover",function(){
      $("#story_img").attr("src","resources/images/shop/shop1.jpg");
      $(".story_img_change1").css('color','black');
      $(".story_img_change1").css('border-top','2px solid black');
      $(".story_img_change2").css('color','rgba(80,80,80,0.7)');
      $(".story_img_change2").css('border-top','2px solid rgba(80,80,80,0.7)');
      $(".story_img_change3").css('color','rgba(80,80,80,0.7)');
      $(".story_img_change3").css('border-top','2px solid rgba(80,80,80,0.7)');
    });
    $("#img_ch2").on("mouseover",function(){
      $("#story_img").attr("src","resources/images/shop/shop3.jpg");
      $(".story_img_change2").css('color','black');
      $(".story_img_change2").css('border-top','2px solid black');
      $(".story_img_change1").css('color','rgba(80,80,80,0.7)');
      $(".story_img_change1").css('border-top','2px solid rgba(80,80,80,0.7)');
      $(".story_img_change3").css('color','rgba(80,80,80,0.7)');
      $(".story_img_change3").css('border-top','2px solid rgba(80,80,80,0.7)');
    });
    $("#img_ch3").on("mouseover",function(){
      $("#story_img").attr("src","resources/images/shop/shop4.jpg");
      $(".story_img_change3").css('color','black');
      $(".story_img_change3").css('border-top','2px solid black');
      $(".story_img_change1").css('color','rgba(80,80,80,0.7)');
      $(".story_img_change1").css('border-top','2px solid rgba(80,80,80,0.7)');
      $(".story_img_change2").css('color','rgba(80,80,80,0.7)');
      $(".story_img_change2").css('border-top','2px solid rgba(80,80,80,0.7)');
    });
  });