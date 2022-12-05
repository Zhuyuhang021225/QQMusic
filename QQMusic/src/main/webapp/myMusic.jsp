<%@ page import="com.zhuyuhang.utils.SpringBeanUtils" %>
<%@ page import="com.zhuyuhang.service.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zhuyuhang.damain.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Zhuyuhang
  Date: 2022/6/18
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%
        User loginUser = (User) request.getSession().getAttribute("loginUser");
    %>
    <title>我的音乐-${sessionScope.loginUser.name}</title>
    <link rel="stylesheet" href="css/myMusic/common.ce7a44036a7d9ff4c6ae.chunk.css">
    <link rel="stylesheet" href="css/myMusic/index.ea0adb959fef9011fc25.chunk.css">
    <link rel="stylesheet" href="css/myMusic/Page.c2791b3f1236fbac8da9.chunk.css">
    <link rel="stylesheet" href="css/myMusic/profile.5e8c651e74b13244f7cf.chunk.css">
    <link rel="icon" href="img/logo/favicon-20180629082227958.ico" type="image/x-icon">
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<jsp:include page="common/myMusicCover.jsp"></jsp:include>

<div class="main main--profile profile_exclusive">
    <div class="mod_tab profile_nav" role="nav" id="nav">
        <a class="mod_tab__item mod_tab__current" id="like_tab" data-tab="like" data-stat="y_new.profile.tab.like" href="/myMusic.jsp">我喜欢</a>
        <a class="mod_tab__item " id="create_tab" data-tab="create" data-stat="y_new.profile.tab.create_playlist" onclick="createdSongSheet()">我创建的歌单</a>
        <a class="mod_tab__item " id="focus_tab" data-tab="focus" data-stat="y_new.profile.tab.focus" onclick="focuss();">关注</a>
        <a class="mod_tab__item " id="fans_tab" data-tab="fans" data-stat="y_new.profile.tab.fans" onclick="fans()">粉丝</a>
        <a class="mod_tab__item " id="uploadmv_tab" data-tab="uploadmv" data-stat="y_new.profile.tab.uploadmv" href="/n/ryqq/profile/uploadmv">我上传的视频</a>
    </div>

    <%
        SongSheetDetailsService songSheetDetailsService = (SongSheetDetailsService) SpringBeanUtils.getSpringBean(SongSheetDetailsService.class);
        // 获取我喜欢歌单歌曲数量
        Integer likeSongCount = songSheetDetailsService.getLikeSongCount(loginUser.getId());
        pageContext.setAttribute("likeSongCount", likeSongCount);

        SongSheetFollowService songSheetFollowService = (SongSheetFollowService) SpringBeanUtils.getSpringBean(SongSheetFollowService.class);
        // 获取我收藏的歌单数量
        Integer followedSongSheetCount = songSheetFollowService.getFollowedSongSheetCount(loginUser.getId());
        pageContext.setAttribute("followedSongSheetCount", followedSongSheetCount);

        AlbumFollowService albumFollowService = (AlbumFollowService) SpringBeanUtils.getSpringBean(AlbumFollowService.class);
        // 获取我收藏的专辑数量
        Integer followedAlbumCount = albumFollowService.getFollowedAlbumCount(loginUser.getId());
        pageContext.setAttribute("followedAlbumCount", followedAlbumCount);

        MVFollowService mVFollowService = (MVFollowService) SpringBeanUtils.getSpringBean(MVFollowService.class);
        // 获取我收藏的MV数量
        Integer followedMVCount = mVFollowService.getFollowedMVCount(loginUser.getId());
        pageContext.setAttribute("followedMVCount", followedMVCount);
    %>

    <div class="js_box" id="like_box">
        <div class="mod_tab" role="nav">
            <a id="likeSongA" class="mod_tab__item mod_tab__current" data-tab="like_song" data-stat="y_new.profile.like.tab.song" onclick="likeSong()">歌曲 ${likeSongCount}</a>
            <a id="likeSongSheetA" class="mod_tab__item " data-tab="like_playlist" data-stat="y_new.profile.like.tab.playlist" onclick="likeSongSheet()">歌单 ${followedSongSheetCount}</a>
            <a id="likeAlbumA" class="mod_tab__item " data-tab="like_album" data-stat="y_new.profile.like.tab.album" onclick="likeAlbum()">专辑 ${followedAlbumCount}</a>
            <a class="mod_tab__item " data-tab="like_mv" data-stat="y_new.profile.like.tab.mv" href="/n/ryqq/profile/like/mv">视频 ${followedMVCount}</a>
        </div>

        <%
            SongSheetService songSheetService = (SongSheetService) SpringBeanUtils.getSpringBean(SongSheetService.class);
            // 获取我喜欢歌单中的歌曲列表
            List<Song> likeSongs = songSheetService.getLikeSongs(loginUser.getId());
            pageContext.setAttribute("likeSongs", likeSongs);
        %>
        <div id="likeSong" class="profile_cont">
            <div class="js_sub" id="like_song_box">
                <div class="mod_songlist ">
                    <ul class="songlist__header">
                        <li class="songlist__header_name">歌曲</li>
                        <li class="songlist__header_author">歌手</li>
                        <li class="songlist__header_album">专辑</li>
                        <li class="songlist__header_time">时长</li>
                    </ul>
                    <c:forEach items="${likeSongs}" var="likeSong" varStatus="i">
                        <ul id="likeSong${likeSong.id}" class="songlist__list">
                            <li>
                                <div class="songlist__item songlist__item--even">
                                    <div class="songlist__number songlist__number--top">${i.count}</div>
                                    <div class="songlist__songname">
                                        <a class="songlist__icon songlist__icon_mv sprite" title="MV" href="/n/ryqq/mv/h00265b4j17">
                                            <span class="icon_txt">MV</span>
                                        </a>
                                        <i class="songlist__icon songlist__icon_vip sprite" title="VIP"></i>
                                        <span class="songlist__songname_txt">
                                        <a title="Dawn of us" href="/song.jsp?song=${likeSong.id}">${likeSong.name}</a>
                                    </span>
                                        <div class="mod_list_menu">
                                            <a class="list_menu__item list_menu__play" title="播放" href="/playMusic.jsp?song=${likeSong.id}">
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
                                        <a class="playlist__author" title="${likeSong.singer.name}" href="/singer.jsp?singer=${likeSong.singer.id}">${likeSong.singer.name}</a>
                                    </div>
                                    <div class="songlist__time songlist__time_delete">${likeSong.time_length}</div>
                                    <div class="songlist__album">
                                        <a href="/album.jsp?album=${likeSong.album.id}">${likeSong.album.name}</a>
                                    </div>
                                    <a class="songlist__delete" onclick="unLikeSong(${likeSong.id}, '#likeSong${likeSong.id}')">
                                        <span class="icon_txt">删除</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </c:forEach>

                </div>
            </div>
        </div>

        <%
            AlbumService albumService = (AlbumService) SpringBeanUtils.getSpringBean(AlbumService.class);
            // 获取用户关注的专辑列表
            List<Album> albumList = albumService.findAlbumListByUserId(loginUser.getId());
            pageContext.setAttribute("albumList", albumList);
        %>

        <div id="likeAlbum" class="profile_cont">
            <div class="js_sub" id="like_playlist_box" style="display: block;">
                <div class="mod_playlist ">
                    <ul class="playlist__list ">
                        <c:forEach items="${albumList}" var="album">
                            <li class="playlist__item ">
                                <div class="playlist__item_box">
                                    <div class="playlist__cover mod_cover">
                                        <a href="/album.jsp?album=${album.id}">
                                            <img class="playlist__pic" loading="lazy" src="/img/album/${album.cover}" alt="${album.name}" data-qar-def="//y.qq.com/mediastyle/global/img/playlist_300.png?max_age=2592000">
                                            <i class="mod_cover__mask"></i>
                                            <a href="/playMusic.jsp?album=${album.id}">
                                                <i class="mod_cover__icon_play"></i>
                                            </a>
                                        </a>
                                    </div>
                                    <h4 class="playlist__title">
                                    <span class="playlist__title_txt">
                                        <a href="/album.jsp?album=${album.id}">${album.name}</a>
                                    </span>
                                    </h4>
                                    <div class="playlist__author">
                                        <a href="/singer.jsp?singer=${album.singer.id}">${album.singer.name}</a>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                </div>
            </div>
        </div>

        <%
            // 获取收藏歌单的列表
            List<SongSheet> songSheetList = songSheetService.getSongSheetListByUserId(loginUser.getId());
            pageContext.setAttribute("songSheetList", songSheetList);
        %>

        <div id="likeSongSheet" class="profile_cont">
            <div class="js_sub" id="like_playlist_box1" style="display: block;">
                <div class="mod_playlist ">
                    <ul class="playlist__list ">
                        <c:forEach items="${songSheetList}" var="songSheet">
                            <li class="playlist__item ">
                                <div class="playlist__item_box">
                                    <div class="playlist__cover mod_cover">
                                        <a href="/songSheet.jsp?songSheet=${songSheet.id}">
                                            <img class="playlist__pic" loading="lazy" src="/img/songSheet/${songSheet.cover}" alt="${songSheet.name}" data-qar-def="//y.qq.com/mediastyle/global/img/playlist_300.png?max_age=2592000">
                                            <i class="mod_cover__mask"></i>
                                            <i class="mod_cover__icon_play"></i>
                                        </a>
                                    </div>
                                    <h4 class="playlist__title">
                                    <span class="playlist__title_txt">
                                        <a href="${pageContext.request.contextPath}/songSheet.jsp?songSheet=${songSheet.id}">${songSheet.name}</a>
                                    </span>
                                    </h4>
                                    <div class="playlist__author">
                                        <a href="https://y.qq.com/n/ryqq/profile?uin=owSFoivANKnioz**">${songSheet.creator.name}</a>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <%
        songSheetService = (SongSheetService) SpringBeanUtils.getSpringBean(SongSheetService.class);
        List<SongSheet> createdSongSheetList = songSheetService.getSongSheetListByCreator(loginUser.getId());
        pageContext.setAttribute("createdSongSheetList", createdSongSheetList);
    %>

    <div id="createdSongSheet">
        <div class="playlist_toolbar">
            <button onclick="openCreate()" class="mod_btn js_create_new" data-stat="y_new.profile.create_playlist.create_new">
                <i class="mod_btn__icon_new"></i>新建歌单
            </button>
        </div>
        <div class="mod_playlist" style="margin-top: 35px">
            <ul class="playlist__list ">
                <c:forEach items="${createdSongSheetList}" var="createdSongSheet">
                    <li class="playlist__item ">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover">
                                <a href="/songSheet.jsp?songSheet=${createdSongSheet.id}">
                                    <img class="playlist__pic" loading="lazy" src="/img/songSheet/${createdSongSheet.cover}" alt="${createdSongSheet.name}" data-qar-def="//y.qq.com/mediastyle/global/img/playlist_300.png?max_age=2592000">
                                    <i class="mod_cover__mask"></i>
                                    <i class="mod_cover__icon_play"></i>
                                </a>
                            </div>
                            <h4 class="playlist__title">
                            <span class="playlist__title_txt">
                                <a href="/songSheet.jsp?songSheet=${createdSongSheet.id}">${createdSongSheet.name}</a>
                            </span>
                            </h4>
                            <div class="playlist__author">${createdSongSheet.creator.name}</div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="js_box" id="focus_box" >
        <div class="mod_tab" role="nav">
            <a id="focus_singer" class="mod_tab__item mod_tab__current" data-tab="focus_singer" data-stat="y_new.profile.focus.tab.singer" onclick="focus_singer()">歌手</a>
            <a id="focus_user" class="mod_tab__item " data-tab="focus_user" data-stat="y_new.profile.focus.tab.user" onclick="focus_user()">用户</a>
        </div>
        <div class="profile_cont">
            <%
                SingerFollowService singerFollowService = (SingerFollowService) SpringBeanUtils.getSpringBean(SingerFollowService.class);
                List<Singer> focusSingerList = singerFollowService.getFocusSingerList(loginUser.getId());
                pageContext.setAttribute("focusSingerList", focusSingerList);
            %>
            <div class="js_sub" id="focus_singer_box">
                <div class="profile_cont">
                    <div class="mod_singer_list mod_singer_list--fans">
                        <ul class="singer_list__list">
                            <c:forEach items="${focusSingerList}" var="focusSinger">
                                <li class="singer_list__item">
                                    <div class="singer_list__item_box">
                                        <a class="singer_list__cover" title="${focusSinger.name}" href="/singer.jsp?singer=${focusSinger.id}">
                                            <img class="singer_list__pic" loading="lazy" src="/img/singer/${focusSinger.head}" alt="${focusSinger.name}" data-qar-def="//y.qq.com/mediastyle/global/img/singer_300.png?max_age=2592000">
                                        </a>
                                        <h3 class="singer_list__title" style="min-height: 20px;">
                                            <a href="/singer.jsp?singer=${focusSinger.id}">${focusSinger.name}</a>
                                        </h3>
                                        <p class="singer_list__info">1792.0万人关注</p>
                                        <div class="singer_list__focus">
                                            <a class="mod_btn singer_list__btn_focus js_follow_user">
                                            <span class="btn_focus__cont">
                                                <i class="mod_btn__icon_yes"></i>已关注
                                            </span>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

            <%
                UserFollowService userFollowService = (UserFollowService) SpringBeanUtils.getSpringBean(UserFollowService.class);
                List<User> focusUserList = userFollowService.getFocusUserList(loginUser.getId());
                pageContext.setAttribute("focusUserList", focusUserList);
            %>
            <div class="js_sub" id="focus_user_box">
                <div class="profile_cont">
                    <div class="mod_singer_list mod_singer_list--fans">
                        <ul class="singer_list__list">
                            <c:forEach items="${focusUserList}" var="focusUser">
                                <li class="singer_list__item">
                                    <div class="singer_list__item_box">
                                        <a class="singer_list__cover" title="${focusUser.name}" href="/n/ryqq/singer/001BLpXF2DyJe2">
                                            <img class="singer_list__pic" loading="lazy" src="/img/user/${focusUser.head}" alt="${focusUser.name}" data-qar-def="//y.qq.com/mediastyle/global/img/singer_300.png?max_age=2592000">
                                        </a>
                                        <h3 class="singer_list__title" style="min-height: 20px;">
                                            <a href="/n/ryqq/singer/001BLpXF2DyJe2">${focusUser.name}</a>
                                        </h3>
                                        <p class="singer_list__info">1792.0万人关注</p>
                                        <div class="singer_list__focus">
                                            <a class="mod_btn singer_list__btn_focus js_follow_user">
                                            <span class="btn_focus__cont">
                                                <i class="mod_btn__icon_yes"></i>已关注
                                            </span>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <%
        userFollowService = (UserFollowService) SpringBeanUtils.getSpringBean(UserFollowService.class);
        List<User> fansList = userFollowService.getFansList(loginUser.getId());
        pageContext.setAttribute("fansList", fansList);
    %>
    <div class="profile_cont" id="fans_box">
        <div class="mod_singer_list mod_singer_list--fans">
            <ul class="singer_list__list">
                <c:forEach items="${fansList}" var="fans">
                    <li class="singer_list__item">
                        <div class="singer_list__item_box">
                            <a class="singer_list__cover" title="${fans.name}" href="/n/ryqq/profile/like/song?uin=owCqowciow6A7v**">
                                <img class="singer_list__pic" loading="lazy" src="/img/user/${fans.head}" alt="${fans.name}" data-qar-def="//y.qq.com/mediastyle/global/img/singer_300.png?max_age=2592000">
                            </a>
                            <h3 class="singer_list__title" style="min-height: 20px;">
                                <a href="/n/ryqq/profile/like/song?uin=owCqowciow6A7v**">${fans.name}</a>
                            </h3>
                            <p class="singer_list__info">1人关注</p>
                            <div class="singer_list__focus">
                                <a class="mod_btn singer_list__btn_focus js_follow_user">
                                    <span class="btn_focus__cont"><i class="mod_btn__icon_yes"></i>已关注</span>
                                </a>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<div id="createSongSheet">
    <div class="yqq-dialog-root">
        <div class="yqq-dialog-mask"></div>
        <div tabindex="-1" class="yqq-dialog-wrap" role="dialog">
            <div role="document" class="yqq-dialog yqq-dialog_centered" style="width: 520px;">
                <div tabindex="0" aria-hidden="true" style="width: 0px; height: 0px; overflow: hidden; outline: none;"></div>
                <div class="yqq-dialog-content">
                    <button onclick="closeCreate()" type="button" aria-label="Close" class="yqq-dialog-close">
                        <span class="yqq-dialog-close-x"></span>
                    </button>
                    <form action="/createSongSheet" method="post">
                    <div class="yqq-dialog-body">
                        <div class="mod_popup popup_new_list">
                            <div class="popup__hd">
                                <h2 class="popup__tit">创建新歌单</h2>
                            </div>
                            <div class="popup__bd">
                                <label class="form__label">歌单名</label>
                                <div class="mod_form_txt">
                                    <input name="name" type="text" class="form_txt__input" id="new_playlist">
                                    <span class="form_txt__tips" id="name_leftnum" style="color: rgb(153, 153, 153);">20</span>
                                </div>
                            </div>
                            <div class="popup__ft">
                                <button onclick="closeCreate()" class="upload_btns__item mod_btn">取消</button>
                                <button class="upload_btns__item mod_btn_green" onclick="onsubmit()">确定</button>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
                <div tabindex="0" aria-hidden="true" style="width: 0px; height: 0px; overflow: hidden; outline: none;">

                </div>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="css/careateSongSheet.css">
<jsp:include page="common/footer.jsp"></jsp:include>

<script src="js/jquery.min.js"></script>
<script>
    $("#index").attr("class","");
    $("#myMusic").attr("class","nav_current");

    $('.mod_top_subnav').css("display","none");

    $('#likeAlbum').css("display","none");
    $('#likeSongSheet').css("display","none");

    $('#focus_user_box').css("display","none");

    $('#createdSongSheet').css("display","none");
    $('#focus_box').css("display","none");
    $('#fans_box').css("display","none");

    function likeSong() {
        $('#likeSong').css("display","block");
        $('#likeAlbum').css("display","none");
        $('#likeSongSheet').css("display","none");

        $('#likeSongA').attr("class", "mod_tab__item mod_tab__current");
        $('#likeSongSheetA').attr("class", "mod_tab__item");
        $('#likeAlbumA').attr("class", "mod_tab__item");
    }
    function likeSongSheet() {
        $('#likeSong').css("display","none");
        $('#likeAlbum').css("display","none");
        $('#likeSongSheet').css("display","block");

        $('#likeSongA').attr("class", "mod_tab__item");
        $('#likeSongSheetA').attr("class", "mod_tab__item mod_tab__current");
        $('#likeAlbumA').attr("class", "mod_tab__item");
    }
    function likeAlbum() {
        $('#likeSong').css("display","none");
        $('#likeAlbum').css("display","block");
        $('#likeSongSheet').css("display","none");

        $('#likeSongA').attr("class", "mod_tab__item");
        $('#likeSongSheetA').attr("class", "mod_tab__item");
        $('#likeAlbumA').attr("class", "mod_tab__item mod_tab__current");
    }
    function focus_singer() {
        $('#focus_singer_box').css("display","block");
        $('#focus_user_box').css("display","none");

        $('#focus_singer').attr("class","mod_tab__item mod_tab__current");
        $('#focus_user').attr("class","mod_tab__item");
    }
    function focus_user() {
        $('#focus_singer_box').css("display","none");
        $('#focus_user_box').css("display","block");

        $('#focus_singer').attr("class","mod_tab__item");
        $('#focus_user').attr("class","mod_tab__item mod_tab__current");
    }
    function createdSongSheet() {
        $('#like_box').css("display","none");
        $('#createdSongSheet').css("display","block");
        $('#focus_box').css("display","none");
        $('#fans_box').css("display","none");

        $('#like_tab').attr("class", "mod_tab__item");
        $('#create_tab').attr("class", "mod_tab__item mod_tab__current");
        $('#focus_tab').attr("class", "mod_tab__item");
        $('#fans_tab').attr("class", "mod_tab__item");
    }
    function focuss() {
        $('#like_box').css("display","none");
        $('#createdSongSheet').css("display","none");
        $('#focus_box').css("display","block");
        $('#fans_box').css("display","none");

        $('#like_tab').attr("class", "mod_tab__item");
        $('#create_tab').attr("class", "mod_tab__item");
        $('#focus_tab').attr("class", "mod_tab__item mod_tab__current");
        $('#fans_tab').attr("class", "mod_tab__item");
    }
    function fans() {
        $('#like_box').css("display","none");
        $('#createdSongSheet').css("display","none");
        $('#focus_box').css("display","none");
        $('#fans_box').css("display","block");

        $('#like_tab').attr("class", "mod_tab__item");
        $('#create_tab').attr("class", "mod_tab__item");
        $('#focus_tab').attr("class", "mod_tab__item");
        $('#fans_tab').attr("class", "mod_tab__item mod_tab__current");
    }

    function unLikeSong(song_id, box) {
        $.post(
            '/unLikeSong',
            {
                user_id: '${sessionScope.loginUser.id}',
                song_id: song_id
            }, function(res) {
                $(box).css("display","none")
            })
    }

    function openCreate() {
        $('#createSongSheet').css("display","block");
    }

    function closeCreate() {
        $('#createSongSheet').css("display","none");
    }
</script>
</body>
</html>
