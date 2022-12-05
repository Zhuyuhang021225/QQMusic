var link=document.createElement("link");
	link.rel="stylesheet";
	link.href="css/header.css";
	document.head.appendChild(link);
$("#header").html(`<div id="header_nav">
<div class="header_logo">
    <img src="img/logo/l_logo.png" alt="">
</div>
<ul id="header_ul_nav" >
        <li class="nav_current">音乐馆</li><li>我的音乐</li><li id="download">客户端</li><li>音乐号</li><li>VIP</li>   
</ul>
<div id="search_nav">
        <input type="text" placeholder=" 搜索音乐、MV、歌单、歌手" >
        <button><span></span></button>
</div>
<input type="button" value="登录" id="login">
<a href="" class="login_pic">
    <ul class="user_info">
        <li class="user_top"><img src="" alt="" class="user_pic"><span class="user_name"></span></li>
        <li>
            <div class="user_item">
                <div>
                    绿钻豪华版 <button class="greenA">开通</button>
                </div>
            </div>
            <div class="user_item">
                <div>
                    付费音乐包 <button class="greenA">开通</button>
                </div>
            </div>
            <div class="user_item">评论通知</div>
            <div class="user_item" id="quit">退出登录</div>
        </li>
    </ul>
</a>
<input type="button" value="开通绿钻豪华版" id="greenZ">
<input type="button" value="开通付费包" id="fufei">
</div>
<ul class="mod_top_subnav" >
<li class="top_subnav_item">
    <a href="//y.qq.com" class="top_subnav_link link_current">首页</a>
</li>
<li class="top_subnav_item">
    <a class="top_subnav_link">歌手</a>
</li>
<li class="top_subnav_item">
    <a class="top_subnav_link">专辑</a>
</li>
<li class="top_subnav_item">
    <a class="top_subnav_link">排行榜</a>
</li>
<li class="top_subnav_item">
    <a class="top_subnav_link">分类歌单</a>
</li>
<li class="top_subnav_item">
    <a class="top_subnav_link">电台</a>
</li>
<li class="top_subnav_item">
    <a href="mv.html" class="top_subnav_link" target="_blank">MV</a>
</li>
<li class="top_subnav_item">
    <a class="top_subnav_link">数字专辑</a>
</li>
</ul>
<div id="div_dialog" class="mod_popup popup_login" data-aria="popup" >
        <div class="popup_hd">
            <h2 class="popup_tit"><a class="popup_tit_item tit_top">QQ登录</a><a class="popup_tit_item ">微信登录</a></h2>
        </div>
        <a class="popup_close" title="关闭"></a>
    
        <div class="popup_bd " id="dialogbox">
            <div class="login_body">
                <h1 class="login_body_tit">快速安全登录</h1>
                <div class="login_body_a">请使用
                    <a class="link_tips" href="#">
                        QQ手机版
                    </a>扫描二维码，
                    <br>或点击头像授权登录。
                </div>
                <div class="login_img_body" >
                    <form action="" method="post" id="loginform" style="display:none">
                        <input type="text" value="2059354371" id="form_qq">
                        <a href="" class="clear_qq"></a>
                        <input type="password" id="form_upwd" value="daohaode74">
                        <a href="" class="clear_upwd"></a>
                        <input type="button" id="form_submit" value="登 录">
                    </form>
                    <div class="safe_login">
                        <div class="login_erwei"> <img src="img/login/ptqrshow.jpg" alt="">   </div>
                        <div class="login_img"></div>
                        <div> <img src="img/login/qq.jpg" alt="" id="img_login"></div>
                    </div>
                </div>
                <div class="bottom_hide">
                        <div class="login_check">
                            <a class="auto_login_checked" id="auto_login_check"></a><label class="auto_login">下次自动登录</label>
                        </div> 
                    <a href="#" class="login_link">帐号密码登录</a>  
                    <span class="dotted">|</span> 
                    <a href="reg.html" class="link reg_link" target="_blank">注册新帐号</a><span class="dotted">|</span>
                    <a class="link" id="feedback_qlogin" target="_blank">意见反馈</a>  
                </div>
            </div>
        </div>
    </div>
    <div id="black_mask"></div>
`);

    