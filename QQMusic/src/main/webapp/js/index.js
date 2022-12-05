var $banSec=$(".ban_sec");

var $banBtnPrev=$(".ban_btn>.previous");

var $banBtnNext=$(".ban_btn>.next");
$banSec.mouseover(function(){
    $banBtnPrev.css({left:10});
    $banBtnNext.css({right:10});
    
})
$banSec.mouseout(function(){
    $banBtnPrev.css({left:-80});
    $banBtnNext.css({right:-80});
    
})
//八面体轮播
var ban_deg=0;
var $banul=$(".ban_ul");
var $banWrapBan=$("#banner>.wrap>.ban");
function ban(){
    ban_deg-=45;
    $banWrapBan.css({transform:"rotateY("+ban_deg+"deg)"});
    
    var a=$banul.children(".active").data("index");
    if(a<=6){
        a++;
        $banul.children(".active").next().addClass("active").siblings().removeClass("active");
    }
    else{
        $banul.children().first().addClass("active").siblings().removeClass("active");
    }
}
var timer=setInterval(ban,5000);
$banBtnPrev.click(function(){
    ban_deg+=45;
    $banWrapBan.css({transform:"rotateY("+ban_deg+"deg)"});
    var a=$banul.children(".active").data("index");
    if(a>=1){
        a++;
        $banul.children(".active").prev().addClass("active").siblings().removeClass("active");
    }
    else{
        $banul.children().last().addClass("active").siblings().removeClass("active");
    }
    //每点一次,i+1;
})
$banBtnNext.click(ban);
$(".ban").mouseover(function(){
    clearInterval(timer);
})
$banBtnPrev.mouseover(function(){
        clearInterval(timer);
})
$banBtnPrev.mouseout(function(){
    timer=setInterval(ban,5000);
})
$banBtnNext.mouseover(function(){
    clearInterval(timer);
})
$banBtnNext.mouseout(function(){
timer=setInterval(ban,5000);
})
$(".ban").mouseout(function(){
   timer=setInterval(ban,5000);
})
$banul.mouseover(function(){
    clearInterval(timer);
})
$banul.mouseout(function(){
    timer=setInterval(ban,5000);
})
$banul.on("click","[data-index]",function(e){
    e.preventDefault();
    var j=$(this).parent().children(".active").data("index");
    // console.log(j);
    $(this).addClass("active").siblings().removeClass("active");
    //获取点击的坐标与现在的坐标差值,然后进行旋转;
    var i=$(this).data("index");
    // console.log(i);
    var d;
    d=(i-j)*45;
    ban_deg-=d;
    $banWrapBan.css({transform:"rotateY("+ban_deg+"deg)"});
})
var $banRight=$(".ban_right");
$banRight.click(ban);
$banRight.mouseover(function(){
    clearInterval(timer);
})
$banRight.mouseout(function(){
    timer=setInterval(ban,5000);
})
var $banLeft=$(".ban_left");
$banLeft.click(function(){
    ban_deg+=45;
    $banWrapBan.css({transform:"rotateY("+ban_deg+"deg)"});
    var a=$banul.children(".active").data("index");
    if(a>=1){
        a++;
        $banul.children(".active").prev().addClass("active").siblings().removeClass("active");
    }
    else{
        $banul.children().last().addClass("active").siblings().removeClass("active");
    }
    //每点一次,i+1;
})
// $banLeft.mouseover(function(){
//     clearInterval(timer);
// })
// $banLeft.mouseout(function(){
//     timer=setInterval(ban,3000);
// })
$banLeft.hover(function(){
    clearInterval(timer);
},function(){
    timer=setInterval(ban,5000);
})
//点击图片.获取他在元素中的下标,让ul中的下标相等的点,变灰;
var $listX=$(".gedan_list_x");
$listX.mouseover(function(){
    $(this).children(".gedan_bk").addClass("bk_active");
    $(this).children(".gedan_icon").addClass("icon_active");
    $(this).children(".gedan_mask").addClass("mask_active");
})
$listX.mouseout(function(){
    $(this).children(".gedan_bk").removeClass("bk_active");
    $(this).children(".gedan_mask").removeClass("mask_active");
    $(this).children(".gedan_icon").removeClass("icon_active");
})
// 歌单推荐两侧按钮;
var $gListBody=$(".gedan_list_body");
var $gedan=$("#gedan");
var $gBtnPrev=$(".gedan_btn>.previous");
var $gBtnNext=$(".gedan_btn>.next");
$gedan.mouseover(function(){
    $gBtnPrev.css({left:10});
    $gBtnNext.css({right:10});
})
$gedan.mouseout(function(){
    $gBtnPrev.css({left:-80});
    $gBtnNext.css({right:-80});
    
})
var $gUl=$(".gedan_ul");

var $gedanList=$(".gedan_list");
$gUl.on("click","[data-index]",function(e){
    e.preventDefault();
   if($(this).data("index")==1){
    if(!$gedanList.is(":animated")&&$gedanList.css("left")=="0px"){
        move();
    }
   }
   else{
    if(!$gedanList.is(":animated")&&$gedanList.css("left")=="-1200px"){
        if(moved==0){
            moved=$gedanList.children().length-1;
            $gedanList.css({left:-moved*liWidth});
        }
        moved--;
        $gedanList.animate({left:-moved*liWidth},interval,function(){
            $(".gedan_ul").children(":eq("+moved+")").addClass("active").siblings().removeClass("active");
        })
    }
    $(this).addClass("active");
    $(this).siblings().removeClass("active");
   }
})
// 歌单轮播按钮
var liWidth=1200,interval=500,wait=5000,moved=0,gedan_timer=null;
function autoMove(){
    gedan_timer=setInterval(function(){
        move();
    },wait);
}
function move(){
    if(moved<2)
    moved++;
    $gedanList.animate({
        left:-moved*liWidth
    },interval,function(){
        if(moved==$gedanList.children().length-1){
            $gedanList.css("left",0);
            moved=0;
        }
        $(".gedan_ul").children(":eq("+moved+")").addClass("active").siblings().removeClass("active");
    })
}
//自动调用
 //autoMove()
var $gedan=$("#gedan");
$gedan.hover(
    function(){ 
        clearInterval(gedan_timer);
    }//,
    // function(){
    //     gedan_timer=setInterval(function(){
    //         move();
    //     },wait);
    // }
)

$gBtnPrev.click(function(){
    if(!$gedanList.is(":animated")){
        if(moved==0){
            moved=$gedanList.children().length-1;
            $gedanList.css({left:-moved*liWidth});
        }
        moved--;
        $gedanList.animate({left:-moved*liWidth},interval,function(){
            $(".gedan_ul").children(":eq("+moved+")").addClass("active").siblings().removeClass("active");
        })
    }
})
$gBtnNext.click(function(){
    if(!$gedanList.is(":animated")){
        move();
    }
})
// 小标题悬浮效果

$(".a_ul>li").children(":eq(1)").click(function(){
    $(this).addClass("a_ul_hover");
    $(this).parent().siblings().children().removeClass("a_ul_hover");
    $gedanList.html(`<div class="gedan_list_1">
                <c:forEach items="${albumList1}" var="album">
                    <div class="gedan_border"><div class="gedan_list_x imga"><div class="gedan_bk"><img src="img/album/${album.cover}" alt="${album.name}"></div><i class="gedan_mask"></i><i class="gedan_icon"></i></div><span class="list_title">${album.name}</span><span class="title_txt">${album.singer.name}</span></div>
                </c:forEach>
            </div>
            <div class="gedan_list_2">
                <c:forEach items="${albumList2}" var="album">
                    <div class="gedan_border"><div class="gedan_list_x imga"><div class="gedan_bk"><img src="img/album/${album.cover}" alt="${album.name}"></div><i class="gedan_mask"></i><i class="gedan_icon"></i></div><span class="list_title">${album.name}</span><span class="title_txt">${album.singer.name}</span></div>
                </c:forEach>
            </div>`)
});
$(".a_ul>li").children(":eq(0)").click(function(){
    $(this).addClass("a_ul_hover");
    $(this).parent().siblings().children().removeClass("a_ul_hover");
    $gedanList.html(`<div class="gedan_list_1">
                <c:forEach items="${albumList1}" var="album">
                    <div class="gedan_border"><div class="gedan_list_x imga"><div class="gedan_bk"><img src="img/album/${album.cover}" alt="${album.name}"></div><i class="gedan_mask"></i><i class="gedan_icon"></i></div><span class="list_title">${album.name}</span><span class="title_txt">${album.singer.name}</span></div>
                </c:forEach>
            </div>
            <div class="gedan_list_2">
                <c:forEach items="${albumList2}" var="album">
                    <div class="gedan_border"><div class="gedan_list_x imga"><div class="gedan_bk"><img src="img/album/${album.cover}" alt="${album.name}"></div><i class="gedan_mask"></i><i class="gedan_icon"></i></div><span class="list_title">${album.name}</span><span class="title_txt">${album.singer.name}</span></div>
                </c:forEach>
            </div>`)
})
$("#rank").on("mouseover",".rank_body>.rank_div",function(){
    $(this).children(".rank_icon").css({opacity:1});
})
$("#rank").on("mouseout",".rank_body>.rank_div",function(){
    $(this).children(".rank_icon").css({opacity:0});
})

$(".rank_div").click(function(){
    window.open("playMusic.html");
})