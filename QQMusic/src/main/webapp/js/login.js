$(".login_erwei").hover(function(){
    $(".login_img").css({display:"inline-block"});
},function(){
    $(".login_img").css({display:"none"});
});
$("#login").click(function(){
    $("#div_dialog").css({display:"inline-block"});
    $("#black_mask").css({display:"inline-block"});
    $("body").css({height:"100%",overflow:"hidden"})
});

$(".popup_close").click(function(){
    $("#div_dialog").css({display:"none"});
    $("#black_mask").css({display:"none"});
    $("body").css({height:"100%",overflowY:"scroll"})
})
$("#auto_login_check").click(function(){
    var $this=$(this);
    if($this.hasClass("auto_login_checked")){
        $this.removeClass("auto_login_checked").addClass("auto_login_unchecked")
    }
    else{
        $this.removeClass("auto_login_unchecked").addClass("auto_login_checked")
    }
})
// 点击账号密码登录改变的样式
$(".login_link").click(function(e){
    e.preventDefault();
    $(".login_body_tit").html("帐号密码登录");
    $(".login_body_a").html(`推荐使用
    <a class="link_tips" href="#">
        快速安全登录
    </a>防止盗号`);
    $("#loginform").show().siblings().hide();
    $(".link_tips").click(function(e){
        e.preventDefault();
        $(".login_body_tit").html("快速安全登录");
         $(".login_body_a").html(`请使用
         <a class="link_tips" href="#">
             QQ手机版
         </a>扫描二维码，
         <br>或点击头像授权登录。`);
        $(".safe_login").show().siblings().hide();
    })
});
// 用户信息表
var t1;
$(".login_pic").mouseout(function(){
    t1=setTimeout(function(){
        console.log(1);
        $(".user_info").removeClass("in");
    },3000);
})
$(".login_pic").mouseover(function(){
    $(this).children(".user_info").addClass("in");
    clearTimeout(t1);
    t1=null;
});
function login() {
    $("#div_dialog").css({display:"inline-block"});
    $("#black_mask").css({display:"inline-block"});
    $("body").css({height:"100%",overflow:"hidden"})
}

