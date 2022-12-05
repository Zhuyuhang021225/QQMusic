var $playBody=$(".player_body");
function padding(){
    var Width=$(window).width()*0.06;
    $playBody.css({paddingLeft:Width,paddingRight:Width});
    // console.log(Width);
    if($playBody.css("paddingLeft")<=71){
        $playBody.css({paddingLeft:71,paddingRight:71})
    }
    // console.log($backImg.height());
}
padding();
window.onload = padding;
window.onresize = padding;
$(".top_icon").click(function(){
    window.open("index.html");
})
var $songPic=$("#song_pic_img");
var $checkAll=$(".js_check_all");
var $checkList=$(".songlist_show>.songlist_checkbox");
$checkAll.click(function(){
    var $this=$(this);
    if($this.hasClass("box_click")){
        $this.removeClass("box_click");
        $(".songlist_show>.songlist_checkbox").removeClass("box_click");
        
    }
    else{
        $this.addClass("box_click");
        $(".songlist_show>.songlist_checkbox").addClass("box_click");
        
    }
});
// $songPic.attr("src","img/myMusic/015.jpg");
(function(){
    var html="";
    var $songListList= $(".songlist_list");
    $.ajax({
        type:"get",
        url:"php/getMusic.php",
        dataType:"json",
        success:function(list){
            // console.log(1);
            for(var key of list){
                var {mid,mtitle,mtime,msinger,mpic} =key;
                $songListList.html($songListList.html()+`
                <li>
                    <div>
                        <div class="songlist_show">
                            <a class="songlist_checkbox"></a>
                            <a class="list_number">${mid}</a>
                            <img class="nonegif" src="img/myMusic/wave.gif">
                        </div>
                        <div class="songlist_list_name">${mtitle}</div>
                        <div class="songlist_list_author">${msinger}</div>
                        <div class="songlist_list_time">${mtime}</div>
                    </div>
                </li>`);
        }
        // 全选
        $(".songlist_show>.songlist_checkbox").click(function(e){
            e.preventDefault();
            var $this=$(this);
            if($this.hasClass("box_click")){
                $this.removeClass("box_click");
                $checkAll.removeClass("box_click");
                
            }
            else{
                $this.addClass("box_click");
                
            }
        });
            var $songName=$(".songlist_list_name");
            var $songPic=$("#song_pic_img");
            var $songSinger=$("#song_pic_singer");
            var $songTitle=$("#song_pic_title");
            var $songMaskPic=$(".play_mask_img");
            $songName.click(function(){
                var mid=$(this).parent().children(":first").children(".list_number").text();
                $.ajax({
                    type:"get",
                    url:"php/getPic.php",
                    data:{mid},
                    dataType:"json",
                    success:function(output){
                        // 这里不能用php的row,因为row只是索引数组
                        var {mpic,mtitle,msinger}=output;
                        $songPic.attr("src",mpic);
                        $songSinger.text("歌手名: "+msinger);
                        $songTitle.text("歌曲名: "+mtitle);
                        $songMaskPic.attr("src",mpic);
                    }
                })
                var $gif=$(this).parent().children(":first").children("img");
                if($gif.hasClass("nonegif")){
                    $gif.removeClass("nonegif");
                }
                else{
                    $gif.addClass("nonegif");
                }
                $(this).parent().parent().siblings().find("img").attr("class","nonegif");
                 
                
            })
        }
    })
})();
$(".js_play").click(function(){
    $(this).toggleClass("song_play");
    $(this).toggleClass("song_pause");
})
$(".js_only").click(function(){
    $(this).toggleClass("btn_open");
    $(this).toggleClass("btn_close");
})
$(".js_like").click(function(){
    $(this).toggleClass("btn_like");
    $(this).toggleClass("btn_unlike");
});
$(".js_voice").click(function(){
    var $this=$(this);
    $this.toggleClass("btn_voice");
    $this.toggleClass("btn_voice_close");
    if($this.hasClass("btn_voice")){
        $(".btn_voice_dotted").css({right:20})
    }else{
        $(".btn_voice_dotted").css({right:96})
    }
})
var srcY=0;
var dataId=0;
var $src=$(".qrc_ctn")
//这个方法太复杂,有没有什么办法简化呢?
function move(){
    // if($src.find("[data-id]").index()==dataId){
    var $a=$(".qrc_ctn>p");
    for( var key in $a){
            $($a[dataId-1]).css({color:"rgba(255,255,255,0.6)"});
            $($a[dataId]).css({color:"#31c27c"});
   }
    dataId++;
    $src.css({top:srcY});
    srcY-=32;
    if(srcY<=-1200){
        clearInterval(timer);
    }
}
move();
var timer=setInterval(move,4000);
// 滚动事件
$(".song_list").scroll(function(){
    console.log(1);
})