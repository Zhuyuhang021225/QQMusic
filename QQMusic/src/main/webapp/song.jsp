<%@ page import="com.zhuyuhang.utils.SpringBeanUtils" %>
<%@ page import="com.zhuyuhang.service.SongService" %>
<%@ page import="com.zhuyuhang.damain.Song" %>
<%@ page import="com.zhuyuhang.damain.User" %><%--
  Created by IntelliJ IDEA.
  User: Zhuyuhang
  Date: 2022/6/18
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%
        String song_id = request.getParameter("song");
        SongService songService = (SongService) SpringBeanUtils.getSpringBean(SongService.class);
        Song song = songService.getSongById(Integer.valueOf(song_id));
        pageContext.setAttribute("song", song);
    %>
    <title>歌曲-${song.name}</title>
    <link rel="icon" href="img/logo/favicon-20180629082227958.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/song/index.ea0adb959fef9011fc25.chunk.css">
    <link rel="stylesheet" href="css/song/common.ce7a44036a7d9ff4c6ae.chunk.css">
    <link rel="stylesheet" href="css/song/singer.c7a38353c5f4ebb47491.chunk.css">
    <link rel="stylesheet" href="css/song/singer_list.df0961952a2d3f022894.chunk.css">
    <link rel="stylesheet" href="css/song/songDetail.4c080567e394fd45608b.chunk.css">
    <link rel="stylesheet" href="css/song/Page.c2791b3f1236fbac8da9.chunk.css">
    <link rel="stylesheet" href="css/show_details.css">

</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>

<div class="main">
    <div class="mod_data">
        <span class="data__cover" id="logo">
            <img class="data__photo" loading="lazy" src="/img/album/${song.album.cover}" alt="${song.name}">
        </span>
        <div class="data__cont">
            <div class="data__name">
                <h1 class="data__name_txt" title="${song.name}">${song.name}</h1>
            </div>
            <div class="data__singer">
                <img src="img/user.png" height="20px" style="display: inline-block">
                <a class="data__singer_txt" title="${song.singer.name}" href="/singer.jsp?singer=${song.singer.id}">${song.singer.name}</a>
            </div>
            <ul class="data__info">
                <li class="data_info__item_song">专辑：
                    <a title="${song.album.name}" href="/album.jsp?album=${song.album.id}">${song.album.name}</a>
                </li>
                <li class="data_info__item_song">流派：${song.schools.schools_name} </li>
                <li class="data_info__item_song">唱片公司：${song.album.company} </li>
                <li class="data_info__item_song">发行时间：${song.publish_time.toLocaleString()} </li>
            </ul>
            <div class="data__actions" role="toolbar">
                <a class="mod_btn_green" href="/playMusic.jsp?song=${song.id}">
                    <i class="mod_btn_green__icon_play"></i>
                    <span class="btn__txt">播放</span>
                </a>
                <c:if test="${!empty sessionScope.loginUser}">
                    <%
                        User loginUser = (User) request.getSession().getAttribute("loginUser");
                        boolean like = songService.isLike(loginUser.getId(), song.getId());
                        pageContext.setAttribute("like", like);
                    %>
                    <a class="mod_btn" onclick="<c:if test="${!like}">likeSong();</c:if><c:if test="${like}">unLikeSong();</c:if>">
                        <i id="song_like" class="mod_btn__icon_like <c:if test="${like}">mod_btn__icon_like--like</c:if>"></i>
                        <span class="btn__txt">收藏</span>
                    </a>
                </c:if>

                <c:if test="${empty sessionScope.loginUser}">
                    <a class="mod_btn" onclick="login()">
                        <i  class="mod_btn__icon_like"></i>
                        <span class="btn__txt">收藏</span>
                    </a>
                </c:if>
                <a class="mod_btn">
                    <i class="mod_btn__icon_menu"></i>
                    <span class="btn__txt">更多</span>
                </a>
            </div>
        </div>
    </div>
    <div class="detail_layout">
        <div class="detail_layout__main">
            <div class="mod_lyric">
                <div class="lyric__hd">
                    <h2 class="lyric__tit">歌词</h2>
                    <a class="btn_copy sprite" title="复制歌词">
                        <i class="icon_txt">复制</i>
                    </a>
                </div>
                <div class="lyric__cont limit">
                    <div class="lyric__cont_box" id="lrc_content">
                        ${song.lyrics}
                    </div>
                    <a class="c_tx_highlight">[展开]</a>
                </div>
            </div>
        </div>

        <div class="detail_layout__other">
            <div class="mod_about">
                <h3 class="about__tit">简介</h3>
                <div class="about__cont">
                    <p>${song.introduction}</p>
                </div>
                <a class="about__more" onclick="show_details()">[更多]</a>
            </div>
        </div>
    </div>
</div>
<div class="popup_data_detail" id="fav_pop" style="left: 473px; top: 480px;">
    <div class="popup_data_detail__cont">
        <h3 class="popup_data_detail__tit">简介</h3>
        <p>${song.introduction}</p>
    </div>
    <i class="popup_data_detail__arrow"></i>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>

<script src="js/jquery.min.js"></script>
<script>
    var i = 1;
    function show_details() {
        if ((i%2) == 1){
            $(".popup_data_detail").css("display","block");
            i++;
        }else {
            $(".popup_data_detail").css("display","none");
            i++;
        }
    }

    function likeSong() {
        $.post(
            '/likeSong',
            {
                user_id: '${sessionScope.loginUser.id}',
                song_id: '${song.id}'
            }, function(res) {
                $("#song_like").attr("class","mod_btn__icon_like mod_btn__icon_like--like");

            })
    }
    function unLikeSong() {
        $.post(
            '/unLikeSong',
            {
                user_id: '${sessionScope.loginUser.id}',
                song_id: '${song.id}'
            }, function(res) {
                $("#song_like").attr("class","mod_btn__icon_like");
            })
    }
</script>
</body>
</html>
