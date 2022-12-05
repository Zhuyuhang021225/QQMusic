<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.zhuyuhang.utils.SpringBeanUtils" %>
<%@ page import="com.zhuyuhang.damain.Singer" %>
<%@ page import="com.zhuyuhang.damain.Song" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zhuyuhang.service.*" %>
<%@ page import="com.zhuyuhang.damain.Album" %>
<%@ page import="com.zhuyuhang.damain.MV" %><%--
  Created by IntelliJ IDEA.
  User: Zhuyuhang
  Date: 2022/6/18
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String singer_id = request.getParameter("singer");
        SingerService singerService = (SingerService) SpringBeanUtils.getSpringBean(SingerService.class);
        // 通过歌手编号查找歌手信息
        Singer singer = singerService.getSingerById(Integer.valueOf(singer_id));
        pageContext.setAttribute("singer", singer);
    %>
    <title>歌手-${singer.name}</title>
    <link rel="icon" href="img/logo/favicon-20180629082227958.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/singer/common.ce7a44036a7d9ff4c6ae.chunk.css">
    <link rel="stylesheet" href="css/singer/Page.c2791b3f1236fbac8da9.chunk.css">
    <link rel="stylesheet" href="css/singer/playlist.9484fde660fe93d9f9f0.chunk.css">
    <link rel="stylesheet" href="css/singer/profile.5e8c651e74b13244f7cf.chunk.css">
    <link rel="stylesheet" href="css/singer/singer.c7a38353c5f4ebb47491.chunk.css">
    <link rel="stylesheet" href="css/singer/songDetail.4c080567e394fd45608b.chunk.css">
    <link rel="stylesheet" href="css/singer/singer.css">
    <link rel="stylesheet" href="css/show_details.css">
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<div class="main">
    <div class="mod_data">
        <a class="data__cover" href="https://y.qq.com/n/ryqq/singer/0025NhlN2yWrP4">
            <img class="data__photo" loading="lazy" src="/img/singer/${singer.head}" alt="${singer.name}">
        </a>
        <div class="data__cont">
            <div class="data__name">
                <h1 class="data__name_txt">${singer.name}</h1>
            </div>
            <div class="data__desc">
                <div class="data__desc_txt">
                    ${singer.introduction}
                </div>
                <a onclick="show_details()">[更多]</a>
            </div>
            <%
                SongService songService = (SongService) SpringBeanUtils.getSpringBean(SongService.class);
                // 查找歌手单曲数量
                Integer songCount = songService.getSongCountBySingerId(Integer.valueOf(singer_id));
                pageContext.setAttribute("songCount", songCount);

                // 查找歌手专辑数量
                Integer albumCount = songService.getAlbumCountBySingerId(Integer.valueOf(singer_id));
                pageContext.setAttribute("albumCount", albumCount);

                // 查找歌手MV数量
                MVService mvService = (MVService) SpringBeanUtils.getSpringBean(MVService.class);
                Integer mvCount = mvService.getMVCountBySingerId(Integer.valueOf(singer_id));
                pageContext.setAttribute("mvCount", mvCount);
            %>
            <ul class="mod_data_statistic">
                <li class="data_statistic__item">
                    <a title="单曲 ${songCount}" onclick="songList()">
                        <span class="data_statistic__tit">单曲</span>
                        <strong class="data_statistic__number">${songCount}</strong>
                    </a>
                </li>
                <li class="data_statistic__item">
                    <a title="专辑 ${albumCount}" onclick="albumList()">
                        <span class="data_statistic__tit">专辑</span>
                        <strong class="data_statistic__number">${albumCount}</strong>
                    </a>
                </li>
                <li class="data_statistic__item data_statistic__item--last">
                    <a title="MV ${mvCount}" onclick="MVList()">
                        <span class="data_statistic__tit">MV</span>
                        <strong class="data_statistic__number">${mvCount}</strong>
                    </a>
                </li>
            </ul>
            <%
                SingerFollowService singerFollowService = (SingerFollowService) SpringBeanUtils.getSpringBean(SingerFollowService.class);
                Integer singerFollowCount = singerFollowService.getSingerFollowCount(Integer.valueOf(singer_id));
                pageContext.setAttribute("singerFollowCount", singerFollowCount);
            %>
            <div class="data__actions" role="toolbar">
                <a class="mod_btn_green">
                    <i class="mod_btn_green__icon_play"></i>播放歌手热门歌曲
                </a>
                <a class="mod_btn">
                    <i class="mod_btn__icon_yes"></i>已关注
                    <span>${singerFollowCount}</span>
                </a>
            </div>
        </div>
        <div class="popup_data_detail" id="popup_data_detail">
            <div class="popup_data_detail__cont">
                <h3 class="popup_data_detail__tit">歌手简介</h3>
                <a class="opt_edit_singer_info" id="editWiki">编辑</a>
                ${singer.introduction}
            </div>
            <i class="popup_data_detail__arrow"></i>
        </div>
    </div>

    <%--获取歌手热门歌曲--%>
    <div id="songList" class="mod_part">
        <div class="part__hd">
            <h2 class="part__tit">热门歌曲</h2>
            <a class="part__more" href="https://y.qq.com/n/ryqq/singer/0025NhlN2yWrP4/song">全部
                <i class="icon_part_arrow sprite"></i>
            </a>
        </div>
        <%
            // 获取歌手热门歌曲
            List<Song> songList = songService.getSongListBySingerId(Integer.valueOf(singer_id));
            pageContext.setAttribute("songList", songList);
        %>
        <div class="mod_songlist ">
            <ul class="songlist__header">
                <li class="songlist__header_name">歌曲</li>
                <li class="songlist__header_album">专辑</li>
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
                                    <a class="list_menu__item list_menu__add" title="添加到歌单">
                                        <i class="list_menu__icon_add"></i>
                                        <span class="icon_txt">添加到歌单</span>
                                    </a>
                                    <a class="list_menu__item list_menu__share" title="分享">
                                        <i class="list_menu__icon_share"></i>
                                        <span class="icon_txt">分享</span>
                                    </a>
                                </div>
                            </div>
                            <div class="songlist__time">${song.time_length}</div>
                            <div class="songlist__album">
                                <a href="/album.jsp?album=${song.album.id}">${song.album.name}</a>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <%--获取歌手专辑--%>
    <div id="albumList" class="mod_part">
        <div class="part__hd">
            <h2 class="part__tit">专辑 ${albumCount}</h2>
        </div>
        <%
            AlbumService albumService = (AlbumService) SpringBeanUtils.getSpringBean(AlbumService.class);
            List<Album> albumList = albumService.findAlbumListBySingerId(Integer.valueOf(singer_id));
            pageContext.setAttribute("albumList", albumList);
        %>
        <ul class="playlist__list mod_playlist">
            <c:forEach items="${albumList}" var="album">
                <li class="playlist__item">
                    <div class="playlist__item_box">
                        <div class="playlist__cover mod_cover">
                            <a class="js_album" href="/album.jsp?album=${album.id}">
                                <img class="playlist__pic" loading="lazy" src="img/album/${album.cover}" alt="${album.name}" data-qar-def="//y.qq.com/mediastyle/global/img/album_300.png?max_age=2592000">
                                <i class="mod_cover__icon_play js_play"></i>
                            </a>
                        </div>
                        <h4 class="playlist__title">
                            <span class="playlist__title_txt">
                                <a title="Mojito" class="js_album" href="/album.jsp?album=${album.id}">${album.name}</a>
                            </span>
                        </h4>
                        <div class="playlist__other">${album.publish_time.toLocaleString()}</div>
                    </div>
                </li>
            </c:forEach>

        </ul>
    </div>

    <%--获取歌手MV--%>
    <div id="MVList" class="mod_part">
        <div class="part__hd">
            <h2 class="part__tit">MV ${mvCount}</h2>
        </div>
        <%
            List<MV> mvList = mvService.getMVListBySingerId(Integer.valueOf(singer_id));
            pageContext.setAttribute("mvList", mvList);
        %>
        <ul class="mv_list__list">
            <c:forEach items="${mvList}" var="mv">
                <li class="mv_list__item mv_list_slide__item" style="width: 25%; padding-bottom: 44px;">
                    <div class="mv_list__item_box">
                        <a class="mv_list__cover mod_cover" title="${mv.name}">
                            <img class="mv_list__pic" loading="lazy" src="//y.qq.com/music/photo_new/T015R640x360M1010020MVhA4HS2kl.jpg?max_age=2592000" alt="${mv.name}" data-qar-def="//y.qq.com/mediastyle/global/img/mv_300.png?max_age=2592000">
                            <i class="mod_cover__mask"></i>
                            <i class="mod_cover__icon_play"></i>
                        </a>
                        <h3 class="mv_list__title">
                            <a>${mv.name}</a>
                        </h3>
                        <div class="mv_list__info">
                        <span class="mv_list__listen">
                            <img src="img/playCounts.png" style="height: 20px;display: inline-block;margin-right: 5px;">2103.1万
                        </span>
                        </div>
                    </div>
                </li>
            </c:forEach>

        </ul>
    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>

<script src="js/jquery.min.js"></script>
<script>
    $("#albumList").css("display", "none");
    $("#MVList").css("display", "none");
    function songList() {
        $("#songList").css("display", "block");
        $("#albumList").css("display", "none");
        $("#MVList").css("display", "none");
    }
    function albumList() {
        $("#songList").css("display", "none");
        $("#albumList").css("display", "block");
        $("#MVList").css("display", "none");
    }
    function MVList() {
        $("#songList").css("display", "none");
        $("#albumList").css("display", "none");
        $("#MVList").css("display", "block");
    }
</script>
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
</script>
</body>
</html>
