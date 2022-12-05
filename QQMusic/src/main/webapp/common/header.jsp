<%--
  Created by IntelliJ IDEA.
  User: Zhuyuhang
  Date: 2022/6/17
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/login.css">

</head>
<body>
<header>
    <div id="header_nav">
        <div class="header_logo">
            <img src="../img/logo/l_logo.png" alt="">
        </div>
        <ul id="header_ul_nav" >
            <li id="index" class="nav_current" onclick="click_index()">音乐馆</li>
            <li id="myMusic" <c:if test="${empty sessionScope.loginUser}">onclick="login();"</c:if> <c:if test="${!empty sessionScope.loginUser}">onclick="click_myMusic();"</c:if> >我的音乐</li>
            <li>客户端</li>
            <li>音乐号</li>
            <li>VIP</li>
        </ul>
        <div id="search_nav">
            <form action="../search.jsp" method="post">
                <input name="kw" type="text" placeholder=" 搜索音乐、MV、歌单、歌手" >
                <button onclick="onsubmit()"><span></span></button>
            </form>
        </div>

        <c:if test="${empty sessionScope.loginUser}">
            <input type="button" value="登录" id="login">
        </c:if>

        <c:if test="${!empty sessionScope.loginUser}">
            <img src="../img/user/${sessionScope.loginUser.head}" onclick="window.location.href='/myMusic.jsp'" style="height: 50px;width: 50px;border-radius: 50%;display: inline-block;margin-bottom: 20px">
            <a class="login_pic">
                <ul class="user_info">
                    <li class="user_top"><img src="../img/user/${sessionScope.loginUser.head}" alt="" class="user_pic"><span class="user_name"></span></li>
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
                        <div class="user_item" id="quit" onclick="window.location.href='/logout'">退出登录</div>
                    </li>
                </ul>
            </a>
        </c:if>

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
                    <form action="/login" method="post" id="loginform" style="display:none">
                        <input type="text" id="account" name="account" value="zhuyuhang">
                        <a href="" class="clear_qq"></a>
                        <input type="password" id="password" name="password" value="123456">
                        <a href="" class="clear_upwd"></a>
                        <input type="submit" id="form_submit" value="登 录">
                    </form>
                    <div class="safe_login">
                        <div class="login_erwei"> <img src="../img/login/ptqrshow.jpg" alt=""></div>
                        <div class="login_img"></div>
                        <div> <img src="../img/login/qq.jpg" alt="" id="img_login"></div>
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

</header>
<script src="../js/jquery.min.js"></script>
<script src="../js/login.js"></script>
<script>
    function click_index() {
        window.location.href='../index.jsp';
    }
    function click_myMusic() {
        window.location.href='../myMusic.jsp';
    }
</script>
</body>
</html>
