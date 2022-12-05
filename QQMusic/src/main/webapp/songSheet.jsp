<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.zhuyuhang.utils.SpringBeanUtils" %>
<%@ page import="com.zhuyuhang.service.SongSheetService" %>
<%@ page import="com.zhuyuhang.damain.SongSheet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zhuyuhang.service.SongService" %>
<%@ page import="com.zhuyuhang.damain.Song" %>
<%@ page import="com.zhuyuhang.service.SongSheetFollowService" %>
<%@ page import="com.zhuyuhang.damain.User" %><%--
  Created by IntelliJ IDEA.
  User: Zhuyuhang
  Date: 2022/6/19
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String songSheet_id = request.getParameter("songSheet");
        SongSheetService songSheetService = (SongSheetService) SpringBeanUtils.getSpringBean(SongSheetService.class);
        SongSheet songSheet = songSheetService.getSongSheetId(Integer.valueOf(songSheet_id));
        pageContext.setAttribute("songSheet", songSheet);
    %>
    <title>歌单-${songSheet.name}</title>
    <link rel="icon" href="img/logo/favicon-20180629082227958.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/songSheet/common.ce7a44036a7d9ff4c6ae.chunk.css">
    <link rel="stylesheet" href="css/songSheet/index.ea0adb959fef9011fc25.chunk.css">
    <link rel="stylesheet" href="css/songSheet/Page.c2791b3f1236fbac8da9.chunk.css">
    <link rel="stylesheet" href="css/songSheet/playlist.9484fde660fe93d9f9f0.chunk.css">
    <link rel="stylesheet" href="css/songSheet/profile.5e8c651e74b13244f7cf.chunk.css">
    <link rel="stylesheet" href="css/show_details.css">
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>

<div class="main">
    <div class="mod_data">
        <span class="data__cover" id="logo">
            <img class="data__photo" loading="lazy" src="/img/songSheet/${songSheet.cover}" alt="Piano appreciation " data-qar-def="//y.qq.com/mediastyle/global/img/album_300.png?max_age=2592000">
        </span>
        <div class="data__cont">
            <div class="data__name">
                <h1 class="data__name_txt" title="Piano appreciation ">${songSheet.name} </h1>
            </div>
            <div class="data__singer">
                <img src="img/user.png" height="20px" style="display: inline-block">
                <a title="${songSheet.creator.name}" class="data__singer_txt" href="/n/ryqq/profile?uin=oioFoenq7e6k7v**"> ${songSheet.creator.name}</a>
            </div>
            <ul class="data__info">
                <li class="data_info__item">
                    <div class="data_tag_box">标签：
                        <span></span>
                    </div>
                </li>
                <li class="data_info__item">播放量：${songSheet.play_count}</li>
            </ul>
            <div class="data__actions" role="toolbar">
                <a class="mod_btn_green">
                    <i class="mod_btn_green__icon_play"></i>
                    <span class="btn__txt">播放全部</span>
                </a>

                <c:if test="${!empty sessionScope.loginUser}">
                    <%
                        SongSheetFollowService songSheetFollowService = (SongSheetFollowService) SpringBeanUtils.getSpringBean(SongSheetFollowService.class);
                        User loginUser = (User) request.getSession().getAttribute("loginUser");
                        boolean like = songSheetFollowService.isFollowed(loginUser.getId(), songSheet.getId());
                        pageContext.setAttribute("like", like);
                    %>
                    <a class="mod_btn" onclick="<c:if test="${!like}">followSongSheet();</c:if><c:if test="${like}">unFollowSongSheet();</c:if>">
                        <i id="songSheet_follow" class="mod_btn__icon_like <c:if test="${like}">mod_btn__icon_like--like</c:if>"></i>
                        <span class="btn__txt">收藏</span>
                    </a>
                </c:if>

                <c:if test="${empty sessionScope.loginUser}">
                    <a class="mod_btn" onclick="login()">
                        <i class="mod_btn__icon_like"></i>
                        <span class="btn__txt">收藏</span>
                    </a>
                </c:if>

                <a class="mod_btn js_menu_edit" href="/n/ryqq/playlist_edit/3">
                    <i class="mod_btn__icon_edit"></i>编辑歌单
                </a>
                <a class="mod_btn">
                    <i class="mod_btn__icon_menu"></i>
                    <span class="btn__txt">更多</span>
                </a>
            </div>
        </div>
    </div>

    <div class="detail_layout">
        <div class="detail_layout__main">
            <div class="mod_songlist ">
                <ul class="songlist__header">
                    <li class="songlist__header_name">歌曲</li>
                    <li class="songlist__header_author">歌手</li>
                    <li class="songlist__header_album">专辑</li>
                    <li class="songlist__header_time">时长</li>
                </ul>
                <%
                    SongService songService = (SongService) SpringBeanUtils.getSpringBean(SongService.class);
                    List<Song> songList = songService.getSongListBySongSheetId(Integer.valueOf(songSheet_id));
                    pageContext.setAttribute("songList", songList);
                %>
                <ul class="songlist__list">
                    <c:forEach items="${songList}" var="song" varStatus="i">
                        <li>
                            <div class="songlist__item songlist__item--even">
                                <div class="songlist__number songlist__number--top">${i.count}</div>
                                <div class="songlist__songname">
                                    <a class="songlist__icon songlist__icon_mv sprite" title="MV" href="/n/ryqq/mv/u0013yky2np">
                                        <span class="icon_txt">MV</span>
                                    </a>
                                    <i class="songlist__icon songlist__icon_vip sprite" title="VIP"></i>
                                    <span class="songlist__songname_txt">
                                    <a title="${song.name}" href="/song.jsp?song=${song.id}">${song.name}
                                        <span class="songlist__song_txt"></span>
                                    </a>
                                </span>
                                    <div class="mod_list_menu">
                                        <a href="playMusic.jsp?song=${song.id}" class="list_menu__item list_menu__play" title="播放">
                                            <i class="list_menu__icon_play"></i>
                                            <span class="icon_txt">播放</span>
                                        </a>
                                        <a class="list_menu__item list_menu__add" title="添加到歌单">
                                            <i class="list_menu__icon_add"></i>
                                            <span class="icon_txt">添加到歌单</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="songlist__artist">
                                    <a class="playlist__author" title="${song.singer.name}" href="/singer.jsp?singer=${song.singer.id}">${song.singer.name}</a>
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

        <div class="detail_layout__other">
            <div class="mod_about">
                <h3 class="about__tit">简介</h3>
                <div class="about__cont">
                    <p>${songSheet.introduction}</p>
                </div>
                <a class="about__more" onclick="show_details()">[更多]</a>
            </div>
        </div>
    </div>
</div>
<div class="popup_data_detail" id="fav_pop" style="left: 473px; top: 480px;">
    <div class="popup_data_detail__cont">
        <h3 class="popup_data_detail__tit">简介</h3>
        <p>${songSheet.introduction}</p>
    </div>
    <i class="popup_data_detail__arrow"></i>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>

<script src="js/jquery.min.js"></script>
<script src="js/login.js"></script>
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

    function followSongSheet() {
        $.post(
            '/followSongSheet',
            {
                user_id: '${sessionScope.loginUser.id}',
                songSheet_id: '${songSheet.id}'
            }, function(res) {
                $("#songSheet_follow").attr("class","mod_btn__icon_like mod_btn__icon_like--like");
                <%
                    SongSheetFollowService songSheetFollowService = (SongSheetFollowService) SpringBeanUtils.getSpringBean(SongSheetFollowService.class);
                    User loginUser = (User) request.getSession().getAttribute("loginUser");
                    boolean flag = songSheetFollowService.isFollowed(loginUser.getId(), songSheet.getId());
                    pageContext.setAttribute("like",flag);
                %>
            })
    }
    function unFollowSongSheet() {
        $.post(
            '/unFollowSongSheet',
            {
                user_id: '${sessionScope.loginUser.id}',
                songSheet_id: '${songSheet.id}'
            }, function(res) {
                $("#songSheet_follow").attr("class","mod_btn__icon_like");
                <%
                    songSheetFollowService = (SongSheetFollowService) SpringBeanUtils.getSpringBean(SongSheetFollowService.class);
                    flag = songSheetFollowService.isFollowed(loginUser.getId(), songSheet.getId());
                    pageContext.setAttribute("like",flag);
                %>
            })
    }
</script>
</body>
</html>
