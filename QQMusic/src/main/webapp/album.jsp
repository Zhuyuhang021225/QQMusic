<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.zhuyuhang.utils.SpringBeanUtils" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.zhuyuhang.damain.Album" %>
<%@ page import="com.zhuyuhang.damain.Song" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zhuyuhang.damain.User" %>
<%@ page import="com.zhuyuhang.service.*" %>
<%@ page import="com.zhuyuhang.damain.SongSheet" %><%--
  Created by IntelliJ IDEA.
  User: Zhuyuhang
  Date: 2022/6/19
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String album_id = request.getParameter("album");
        AlbumService albumService = (AlbumService) SpringBeanUtils.getSpringBean(AlbumService.class);
        // 获取专辑信息
        Album album = albumService.findAlbumById(Integer.valueOf(album_id));
        pageContext.setAttribute("album", album);

        SongService songService = (SongService) SpringBeanUtils.getSpringBean(SongService.class);
        // 获取该专辑的歌曲列表
        List<Song> songList = songService.getSongListByAlbumId(Integer.valueOf(album_id));
        pageContext.setAttribute("songList", songList);
    %>
    <title>专辑-${album.name}</title>
    <link rel="icon" href="img/logo/favicon-20180629082227958.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/album/albumDetail.798353db5b0eb05d5358.chunk.css">
    <link rel="stylesheet" href="css/album/common.ce7a44036a7d9ff4c6ae.chunk.css">
    <link rel="stylesheet" href="css/album/index.ea0adb959fef9011fc25.chunk.css">
    <link rel="stylesheet" href="css/album/Page.c2791b3f1236fbac8da9.chunk.css">
    <link rel="stylesheet" href="css/album/singer.c7a38353c5f4ebb47491.chunk.css">
    <link rel="stylesheet" href="css/album/singer_list.df0961952a2d3f022894.chunk.css">
    <link rel="stylesheet" href="css/show_details.css">
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<div class="main">
    <div class="mod_data">
        <span class="data__cover" id="logo">
            <img class="data__photo" loading="lazy" src="img/album/${album.cover}" alt="${album.name}" data-qar-def="//y.qq.com/mediastyle/global/img/album_300.png?max_age=2592000">
            <i class="data__cover_mask"></i>
        </span>
        <div class="data__cont">
            <div class="data__name">
                <h1 class="data__name_txt" title="${album.name}">${album.name}</h1>
            </div>
            <div class="data__singer">
                <img src="img/user.png" height="20px" style="display: inline-block">
                <a class="data__singer_txt" title="${songList.get(0).singer.name}" href="/singer.jsp?singer=${songList.get(0).singer.id}">${songList.get(0).singer.name}</a>
            </div>
            <ul class="data__info">
                <li class="data_info__item_song">流派：SOUNDTRACK原声</li>
                <li class="data_info__item_song">语种：国语</li>
                <li class="data_info__item_song">发行时间：${album.publish_time.toLocaleString()}</li>
                <li class="data_info__item_song">唱片公司：${album.company}</li>
                <li class="data_info__item_song">类型：Single</li>
            </ul>
            <div class="data__actions" role="toolbar">
                <a class="mod_btn_green" href="/playMusic.jsp?album=${album.id}">
                    <i class="mod_btn_green__icon_play"></i>
                    <span class="btn__txt">播放全部</span>
                </a>
                <c:if test="${!empty sessionScope.loginUser}">
                    <%
                        AlbumFollowService albumFollowService = (AlbumFollowService) SpringBeanUtils.getSpringBean(AlbumFollowService.class);
                        User loginUser = (User) request.getSession().getAttribute("loginUser");
                        boolean like = albumFollowService.isFollowed(loginUser.getId(), album.getId());
                        pageContext.setAttribute("like", like);
                    %>
                    <a class="mod_btn" onclick="<c:if test="${!like}">followAlbum();</c:if><c:if test="${like}">unFollowAlbum();</c:if>">
                        <i id="album_follow" class="mod_btn__icon_like <c:if test="${like}">mod_btn__icon_like--like</c:if>"></i>
                        <span class="btn__txt">收藏</span>
                    </a>
                </c:if>

                <c:if test="${empty sessionScope.loginUser}">
                    <a class="mod_btn" onclick="login()">
                        <i  class="mod_btn__icon_like"></i>
                        <span class="btn__txt">收藏</span>
                    </a>
                </c:if>
            </div>
        </div>
    </div>
    <div class="detail_layout">
        <div class="detail_layout__main ">
            <div class="mod_songlist ">
                <ul class="songlist__header">
                    <li class="songlist__header_name">歌曲</li>
                    <li class="songlist__header_author">歌手</li>
                    <li class="songlist__header_time">时长</li>
                </ul>
                <ul class="songlist__list">
                    <c:forEach items="${songList}" var="song" varStatus="i">
                        <li>
                            <div class="songlist__item songlist__item--even">
                                <div class="songlist__number songlist__number--top">${i.count}</div>
                                <div class="songlist__songname">
                                    <a class="songlist__icon songlist__icon_mv sprite" title="MV" href="https://y.qq.com/n/ryqq/mv/g0033tvp7sb">
                                        <span class="icon_txt">MV</span>
                                    </a>
                                    <span class="songlist__songname_txt">
                                    <a title="${song.name}" href="/song.jsp?song=${song.id}">${song.name}
                                        <span class="songlist__song_txt"></span>
                                    </a>
                                </span>
                                    <div class="mod_list_menu">
                                        <a class="list_menu__item list_menu__play" href="/playMusic.jsp?song=${song.id}" title="播放">
                                            <i class="list_menu__icon_play"></i>
                                            <span class="icon_txt">播放</span>
                                        </a>
                                        <a class="list_menu__item list_menu__add" title="添加到歌单" onclick="<c:if test="${!empty sessionScope.loginUser}">songToSongSheet(${song.id})</c:if> <c:if test="${empty sessionScope.loginUser}">login()</c:if>">
                                            <i class="list_menu__icon_add"></i>
                                            <span class="icon_txt">添加到歌单</span>
                                        </a>
                                        <a class="list_menu__item list_menu__share" title="分享">
                                            <i class="list_menu__icon_share"></i>
                                            <span class="icon_txt">分享</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="songlist__artist">
                                    <a class="playlist__author" title="${song.singer.name}" href="/singer.jsp?singer=${song.singer.id}">${song.singer.name}</a>
                                </div>
                                <div class="songlist__time">${song.time_length}</div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="detail_layout__other">
            <div class="mod_about">
                <h3 class="about__tit">简介</h3>
                <div class="about__cont">
                    <p>${album.introduction}</p>
                </div>
                <a class="about__more" onclick="show_details()">[更多]</a>
            </div>
        </div>
    </div>
</div>
<div class="popup_data_detail" id="fav_pop" style="left: 473px; top: 480px;">
    <div class="popup_data_detail__cont">
        <h3 class="popup_data_detail__tit">简介</h3>
        <p>${album.introduction}</p>
    </div>
    <i class="popup_data_detail__arrow"></i>
</div>

<c:if test="${!empty sessionScope.loginUser}">
    <%
        SongSheetService songSheetService = (SongSheetService) SpringBeanUtils.getSpringBean(SongSheetService.class);
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        List<SongSheet> songSheetListByCreator = songSheetService.getSongSheetListByCreator(loginUser.getId());
        pageContext.setAttribute("songSheetListByCreator", songSheetListByCreator);
    %>

    <div class="mod_operate_menu" id="fav_pop_add" style="left: 589px; top: 620px;">
        <div class="operate_menu__cont">
            <a class="operate_menu__link" title="添加到以下歌单">添加到以下歌单</a>
            <ul role="menu" class="operate_menu__list operate_menu__top_line operate_menu__bottom_line" style="display: block;">
                <c:forEach items="${songSheetListByCreator}" var="songSheet">
                    <li class="operate_menu__item" onclick="addSongToSongSheet(${songSheet.id})">
                        <a class="operate_menu__link" title="${songSheet.name}">${songSheet.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</c:if>


<jsp:include page="common/footer.jsp"></jsp:include>
<link rel="stylesheet" href="css/play.css">
<script src="js/jquery.min.js"></script>
<script>
    var song_id = 0;
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

    function followAlbum() {
        $.post(
            '/followAlbum',
            {
                user_id: '${sessionScope.loginUser.id}',
                album_id: '${album.id}'
            }, function(res) {
                $("#album_follow").attr("class","mod_btn__icon_like mod_btn__icon_like--like");
            })
    }
    function unFollowAlbum() {
        $.post(
            '/unFollowAlbum',
            {
                user_id: '${sessionScope.loginUser.id}',
                album_id: '${album.id}'
            }, function(res) {
                $("#album_follow").attr("class","mod_btn__icon_like");
            })
    }
    function songToSongSheet(song) {
        $('#fav_pop_add').css("display","block");
        song_id = song;
    }
    function addSongToSongSheet(songSheet_id) {
        $.post(
            '/addSongToSongSheet',
            {
                song_id: song_id,
                songSheet_id: songSheet_id
            }, function(res) {
                $('#fav_pop_add').css("display","none");
                alert('添加成功！')
            })
    }
</script>
</body>
</html>
