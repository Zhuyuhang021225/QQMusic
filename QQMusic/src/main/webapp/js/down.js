// var x1,y1,x2,y2,x3,y3,x4,x5,x6,y4,y5,y6;
// // var a=parseInt($("body").width());
// // var b=1073;
// var x=[];
// var y=[];
// for(var i=1;i<7;i++){
//     x[i-1]=$(".star"+i).css("left");
//     y[i-1]=$(".star"+i).css("top");
// }
// console.log(x,y);

// function random(n){
//     return n*Math.random();
// }

// function starx(){
//     return random(a);
// }
// function stary(){
//     return random(b);
// }
// var t1=setInterval(function(){
//     x1=starx();
//     x2=starx();
//     x3=starx();
//     y1=stary();
//     y2=stary();
//     y3=stary();
//     $star1.css({left:x1,top:y1});
//     $star2.css({left:x2,top:y2});
//     $star3.css({left:x3,top:y3});
//     if(!$star1.is(":animated")){
//         $star1.animate({
//             left:x1-400,top:y1+400
//         },2000)
        
//     };
//     if(!$star2.is(":animated")){
//         $star2.animate({
//             left:x2-400,top:y2+400
//         },2000);
//     };
//     if(!$star3.is(":animated")){
//         $star3.animate({
//             left:x3-400,top:y3+400
//         },2000);
//     };


// },2000)

// var timer1=setInterval()
var $con=$(".container");
var $bj=$("#bj");
var $bMask=$(".bj_mask");
var $bjIphone=$(".bj_iphone");
var timer;
$(".foot_list").on("click","li",function(){
    var index=$(this).index();
    console.log(index);
    $(this).addClass("footer_hover").siblings().removeClass("footer_hover");
    $con.children(":eq("+index+")").removeClass("box_hidden").siblings().addClass("box_hidden");
    $bj.children(":eq("+index+")").removeClass("box_hidden").siblings().addClass("box_hidden");
    if(index!==0){
        $(".star").hide();
    }
    else{
        $(".star").show();
    }
    
    $bMask.css({opacity:0.8,display:"block"});
    if(!$bMask.is(":animated")){
        $bMask.animate({opacity:0},300)
    }
    if(index==2){
        i=1;
        autoPlay();
    }
    else{
        $bjIphone.css({backgroundImage:"url(img/bj/iphone_play_1.jpg)"});
        clearInterval(timer);
        timer=null;
    }
})
var i=1;
 function autoPlay(){
     timer=setInterval(function(){
         i%=3;
         i++;
         url="url(img/bj/iphone_play_"+i+".jpg)";
         $bjIphone.css({backgroundImage:url});
     },3000)
 }
// 跳转首页
$("#nav_logo").click(function(){
    window.open("index.html");
})