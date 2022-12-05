var $sideR=$(".side_right");
function width(){
    if($(window).width()-90>=450)
    $sideR.css({width:$(window).width()-480});
    else
    $sideR.css({width:450});
    // console.log($backImg.height());
}
width();

window.onload = width;
window.onresize = width;

$(".tiaokuan").click(function(){
    var $this=$(".tk_img");
    if($this.attr("src")=="img/reg/checkbox_check.png"){
        $this.attr("src","img/reg/checkbox_normal.png");
    }
    else{
        $this.attr("src","img/reg/checkbox_check.png");
    }
})
var $name=$(".input_uname");
var $upwd=$(".input_upwd");
var $phone=$(".input_phone");
var regN= /^[\u4E00-\u9FA5a-zA-Z\d`~@#\$%\^&\*\(\)\-_=\+\[\]\{\}\\\|;\:'",<\.>\/\?]{0,12}$/;
var regP=/[0-9a-z_]{8,16}/i;
var regP2=/^(?=[a-zA-Z]*[0-9])(?=[0-9]*[a-zA-Z])[a-zA-Z0-9]{8,16}$/;
var regPh=/^1[3-8][0-9]{9}$/;
$name.on("blur",function(){
    var $this=$(this);
    // console.log($(".input_uname").val());
    if($this.val()==""){
        $this.css({borderColor:"#ff5b5b"});
        $this.next().css({height:18});
    }
    else if(!regN.test($this.val())){
        $this.css({borderColor:"#ff5b5b"});
        $this.next().next().css({height:18});
    }
    else{
        $this.parent().children(".input_img").show();
        $this.css({borderColor:"#aaa"});
    }
})
$name.on("focus",function(){
    var $this=$(this);
    $this.next().css({height:0});
    $this.next().next().css({height:0});
    $this.css({borderColor:"#549df8"});
    $this.parent().children(".input_img").hide();
})
$upwd.on("blur",function(){
    var $this=$(this);
    // console.log($(".input_uname").val());
    if($this.val()==""){
        $this.css({borderColor:"#ff5b5b"});
        $this.parent().children("div:eq(0)").css({height:18,backgroundImage:"url(img/reg/error.png)",color:"#ff5b5b"});
    }
    else{
        $this.parent().children("div:eq(0)").css({height:18,backgroundImage:"url(img/reg/green.png)",color:"#333"});
    }
    if(!regP.test($this.val())){
        $this.css({borderColor:"#ff5b5b"});  
        $this.parent().children("div:eq(1)").css({height:18,backgroundImage:"url(img/reg/error.png)",color:"#ff5b5b"});
    }
    else{
        $this.parent().children("div:eq(1)").css({height:18,backgroundImage:"url(img/reg/green.png)",color:"#333"});
    }
    if(!regP2.test($this.val())){
        $this.css({borderColor:"#ff5b5b"});      
        $this.parent().children("div:eq(2)").css({height:18,backgroundImage:"url(img/reg/error.png)",color:"#ff5b5b"});
    }
    else{
        $this.parent().children("div:eq(2)").css({height:18,backgroundImage:"url(img/reg/green.png)",color:"#333"});
    }
    if($this.val()!=""&&regP.test($this.val())&&regP2.test($this.val())){
        $this.parent().children(".error-tips").css({height:0});
        $this.parent().children(".input_img").show();
        $this.css({borderColor:"#aaa"});
    } 
})
$upwd.on("focus",function(){
    var $this=$(this);
    // console.log($(".input_uname").val());
    $this.css({borderColor:"#549df8"});
    $this.parent().children(".input_img").hide();
    $this.parent().children(".error-tips").css({height:18,backgroundImage:"url(img/reg/info.png)",color:"#333"});
    // if($this.val()!=""){
    //     $this.parent().children("div:eq(0)").css({height:18,backgroundImage:"url(img/reg/green.png)",color:"#333"});
    // }
    // else{
    //     $this.parent().children("div:eq(0)").css({height:18,backgroundImage:"url(img/reg/info.png)",color:"#333"});
    // }
})
$phone.on("focus",function(){
    var $this=$(this);
    // console.log($(".input_uname").val());
    $this.css({borderColor:"#549df8"});
    $this.parent().children(".input_img").hide();
})
$phone.on("blur",function(){
    var $this=$(this);
    // console.log($(".input_uname").val());
    if(!regPh.test($this.val())){
        $this.css({borderColor:"#ff5b5b"});      
        $this.parent().children(".error-tips").css({height:18,backgroundImage:"url(img/reg/error.png)",color:"#ff5b5b"});
    }
    else{
        $this.parent().children(".error-tips").css({height:0});
        $this.parent().children(".input_img").show();
        $this.css({borderColor:"#aaa"});
    }
})
var $img=$("#tk_img");
$("#submit").click(function(){
    if($img.attr("src")=="img/reg/checkbox_check.png"){
        if($name.val()!=""&&regN.test($name.val())){
            if($upwd.val()!=""&&regP.test($upwd.val())&&regP2.test($upwd.val())){
               if(regPh.test($phone.val())){
                var qq=2000000000+parseInt(Math.random()*100000000);
                var pic="img/login/timg.jpg";
                var uname=$name.val();
                var upwd=$upwd.val();
                $.ajax({
                    url:"data/music_user/reg.php",
                    type:"post",
                    data:{uname,upwd,qq,pic},
                    success:function(data){
                        alert(data+",你所注册的qq为"+qq);
                        location.href='index.html';
                    },
                    error:function(){
                        alert("请检查网络")
                    }
                })
               }
               else{
                alert("请输入正确手机号");
               }
            }
            else{
                alert("请输入正确密码")
            }
        } 
        else{
            alert("请输入正确账号");
        }
    }
    else{
        alert("请先同意条款!");
    }
})