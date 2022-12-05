$("#header_ul_nav>li:first").removeClass("nav_current");
$("#header_ul_nav>li:eq(1)").addClass("nav_current");
$("#header").css({height:90,overflow:"hidden"});
// 以下为动态设置这个背景的高度
var $backImg=$("#background_img");
function Height(){
    if($(window).height()-90>=450)
    $backImg.css({height:$(window).height()-90});
    else
    $backImg.css({height:450});
    // console.log($backImg.height());
    var marTop=$backImg.height()/2-104;
    $(".title_love_listen").css({marginTop:marTop})
}
Height();

window.onload = Height;
window.onresize = Height;
// 到此(不能少头文件,详见myMusic.html);

// 跳转主页
$("#header_ul_nav>li:eq(0)").click(function(){
    // window.location.href = "myMusic.html";自身跳转
    window.open("index.html");//新窗口跳转;
});
// 滚动楼层效果

$(".myMusic_btn").click(function(){
    $("#div_dialog").css({display:"inline-block"});
    $("#black_mask").css({display:"inline-block"});
});

$(window).scroll(function(){
    var offsetTop=$backImg.offset().top;
    // console.log(offsetTop);
    var scrollTop=document.documentElement.scrollTop;
    // console.log(scrollTop);
    // 90px console.log(offsetTop);
    if(offsetTop<scrollTop){
        // $("[data-index]=0").css({visibility:"visible"});
        $firstfloor.css({visibility:"visible"});
    }
    else{
        $firstfloor.css({visibility:"hidden"});
    }
});
var $firstfloor =$(".floor>li:eq(0)");

$firstfloor.click(function(){
    $("html,body").stop(true).animate({
        scrollTop:top
    },500);
})
$(".floor>li:eq(2)").click(function(){
    window.open("playMusic.html");
})