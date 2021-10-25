  /* menu */
  
  
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


// main








const myslide = document.querySelectorAll('.myslide'),
	  dot = document.querySelectorAll('.dot');
let counter = 1;
slidefun(counter);

let timer = setInterval(autoSlide, 8000);
function autoSlide() {
	counter += 1;
	slidefun(counter);
}
function plusSlides(n) {
	counter += n;
	slidefun(counter);
	resetTimer();
}
function currentSlide(n) {
	counter = n;
	slidefun(counter);
	resetTimer();
}
function resetTimer() {
	clearInterval(timer);
	timer = setInterval(autoSlide, 8000);
}

function slidefun(n) {
	
	let i;
	for(i = 0;i<myslide.length;i++){
		myslide[i].style.display = "none";
	}
	for(i = 0;i<dot.length;i++) {
		dot[i].className = dot[i].className.replace(' active', '');
	}
	if(n > myslide.length){
	   counter = 1;
	   }
	if(n < 1){
	   counter = myslide.length;
	   }
	myslide[counter - 1].style.display = "block";
	dot[counter - 1].className += " active";
}












/*$(document).ready(function() {

createBullets()

});




    function createBullets() {
      for (var i = 0; i <myslide.length+1; i++) {
        var $li = $("<li class='dot_elem'></li>");
        $li.addClass("dot_elem-"+i).data("page", i);
        if (!i) $li.addClass("active");
        dot.append($li);
      }
          };
    
    createBullets();





    $(document).on("click", ".dot_elem", function() {
      curSlide = $(this).data("page");
      changeSlides();
    });
*/







/*
$(document).ready(function() {
  
    var $slider = $(".slider"),
        $slideBGs = $(".slide__bg"),
        diff = 0,
        curSlide = 0,
        numOfSlides = $(".slide").length-1,
        animating = false,
        animTime = 500,
        autoSlideTimeout,
        autoSlideDelay = 4000,
        $pagination = $(".slider-pagi");
    
    function createBullets() {
      for (var i = 0; i < numOfSlides+1; i++) {
        var $li = $("<li class='slider-pagi__elem'></li>");
        $li.addClass("slider-pagi__elem-"+i).data("page", i);
        if (!i) $li.addClass("active");
        $pagination.append($li);
      }
    };
    
    createBullets();
    
    function manageControls() {
      $(".slider-control").removeClass("inactive");
      if (!curSlide) $(".slider-control.left").addClass("inactive");
      if (curSlide === numOfSlides) $(".slider-control.right").addClass("inactive");
    };
    
    function autoSlide() {
      autoSlideTimeout = setTimeout(function() {
        curSlide++;
        if (curSlide > numOfSlides) curSlide = 0;
        changeSlides();
      }, autoSlideDelay);
    };
    
    autoSlide();
    
    function changeSlides(instant) {
      if (!instant) {
        animating = true;
        manageControls();
        $slider.addClass("animating");
        $slider.css("top");
        $(".slide").removeClass("active");
        $(".slide-"+curSlide).addClass("active");
        setTimeout(function() {
          $slider.removeClass("animating");
          animating = false;
        }, animTime);
      }
      window.clearTimeout(autoSlideTimeout);
      $(".slider-pagi__elem").removeClass("active");
      $(".slider-pagi__elem-"+curSlide).addClass("active");
      $slider.css("transform", "translate3d("+ -curSlide*100 +"%,0,0)");
      $slideBGs.css("transform", "translate3d("+ curSlide*50 +"%,0,0)");
      diff = 0;
      autoSlide();
    }
  
    function navigateLeft() {
      if (animating) return;
      if (curSlide > 0) curSlide--;
      changeSlides();
    }
  
    function navigateRight() {
      if (animating) return;
      if (curSlide < numOfSlides) curSlide++;
      changeSlides();
    }
  
    $(document).on("mousedown touchstart", ".slider", function(e) {
      if (animating) return;
      window.clearTimeout(autoSlideTimeout);
      var startX = e.pageX || e.originalEvent.touches[0].pageX,
          winW = $(window).width();
      diff = 0;
      
      $(document).on("mousemove touchmove", function(e) {
        var x = e.pageX || e.originalEvent.touches[0].pageX;
        diff = (startX - x) / winW * 70;
        if ((!curSlide && diff < 0) || (curSlide === numOfSlides && diff > 0)) diff /= 2;
        $slider.css("transform", "translate3d("+ (-curSlide*100 - diff) +"%,0,0)");
        $slideBGs.css("transform", "translate3d("+ (curSlide*50 + diff/2) +"%,0,0)");
      });
    });
    
    $(document).on("mouseup touchend", function(e) {
      $(document).off("mousemove touchmove");
      if (animating) return;
      if (!diff) {
        changeSlides(true);
        return;
      }
      if (diff > -8 && diff < 8) {
        changeSlides();
        return;
      }
      if (diff <= -8) {
        navigateLeft();
      }
      if (diff >= 8) {
        navigateRight();
      }
    });
    
    $(document).on("click", ".slider-control", function() {
      if ($(this).hasClass("left")) {
        navigateLeft();
      } else {
        navigateRight();
      }
    });
    
    $(document).on("click", ".slider-pagi__elem", function() {
      curSlide = $(this).data("page");
      changeSlides();
    });
    
  });*/