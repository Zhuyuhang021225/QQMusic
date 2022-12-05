<%@ page import="com.zhuyuhang.utils.SpringBeanUtils" %>
<%@ page import="com.zhuyuhang.service.SongService" %>
<%@ page import="com.zhuyuhang.damain.Song" %>
<%@ page import="com.zhuyuhang.service.AlbumService" %>
<%@ page import="com.zhuyuhang.damain.Album" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Zhuyuhang
  Date: 2022/6/21
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <%
        String song_id = request.getParameter("song");
        String album_id = request.getParameter("album");
        if (song_id != null){
            SongService songService = (SongService) SpringBeanUtils.getSpringBean(SongService.class);
            List<Song> songList = songService.getSongListById(Integer.valueOf(song_id));
            pageContext.setAttribute("songList", songList);
        }if (album_id != null){
            AlbumService albumService = (AlbumService) SpringBeanUtils.getSpringBean(AlbumService.class);
            Album album = albumService.findAlbumById(Integer.valueOf(album_id));
            pageContext.setAttribute("album", album);
            SongService songService = (SongService) SpringBeanUtils.getSpringBean(SongService.class);
            List<Song> songList = songService.getSongListByAlbumId(Integer.valueOf(album_id));
            pageContext.setAttribute("songList",songList);
        }
    %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <c:if test="${!empty songList.get(0)}">
        <title>正在播放-歌曲-${songList.get(0).name}</title>
    </c:if>
    <c:if test="${!empty album}">
        <title>正在播放-专辑-${album.name}</title>
    </c:if>
    <link rel="stylesheet" href="css/playMusic.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="icon" href="img/logo/favicon-20180629082227958.ico" type="image/x-icon">
</head>
<body>
<div class="top_icon"><img src="img/myMusic/title.png" alt=""></div>
<c:if test="${!empty songList.get(0)}">
    <img class="play_mask_img" src="img/album/${songList.get(0).album.cover}">
</c:if>
<c:if test="${!empty album}">
    <img class="play_mask_img" src="img/album/${album.cover}">
</c:if>
<div class="play_mask"></div>
<div class="player_body">
    <div class="player_bd">
        <div class="toolbar">
            <a href="javascript:;" class="mod_btn like"><i class="icon_like"></i>收藏</a>
            <a href="javascript:;" class="mod_btn add"><i class="icon_add"></i>添加到</a>
            <a href="javascript:;" class="mod_btn download"><i class="icon_down"></i>下载</a>
            <a href="javascript:;" class="mod_btn delete"><i class="icon_delete"></i>删除</a>
            <a href="javascript:;" class="mod_btn clear"><i class="icon_clear"></i>清空列表</a>
        </div>
        <div id="songList">
            <div class="song_list">
                <ul class="song_title">
                    <li class="songlist_edit sprite">
                        <a class="songlist_checkbox js_check_all"></a>
                    </li>
                    <li class="songlist_header_name">歌曲</li>
                    <li class="songlist_header_author">歌手</li>
                    <li class="songlist_header_time">时长</li>
                </ul>
                <ul class="songlist_list">
                    <c:forEach items="${songList}" var="song" varStatus="i" begin="1">
                        <li id="songList${song.id}" onclick="switchSong('#songList${song.id}')">
                            <div>
                                <div class="songlist_show">
                                    ${i.count+1}
                                </div>
                                <div class="songlist_list_name">${song.name}</div>
                                <div class="songlist_list_author">${song.singer.name}</div>
                                <div class="songlist_list_time">${song.time_length}</div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="song_pic">
            <div class="song_pic_a">
                <img src="img/album/${songList.get(0).album.cover}" id="song_pic_img" alt="">
                <div class="song_pic_bg"></div>
            </div>
            <div class="song_pic_div" id="song_pic_title">歌曲名: ${songList.get(0).name}</div>
            <div class="song_pic_div" id="song_pic_singer">歌手名: ${songList.get(0).singer.name}</div>
            <div class="song_pic_div" >专辑名: ${songList.get(0).album.name}</div>
        </div>
        <div class="song_lrc" style="overflow-y: auto;overflow-x: hidden;">
            <div class="qrc_ctn" id="qrc_ctn" data-mod="1" style="transition:all 0.1s ease-out">
                <p data-id="line_null">&nbsp;</p>
                ${songList.get(0).lyrics}
                <p data-id="line_null">&nbsp;</p>
                <p data-id="line_null">&nbsp;</p>
                <p data-id="line_null">&nbsp;</p>
                <p data-id="line_null">&nbsp;</p>
                <p data-id="line_null">&nbsp;</p>
                <p data-id="line_null">&nbsp;</p>
                <p data-id="line_null">&nbsp;</p>
            </div>
        </div>
        <div class="song_ctrl">
            <audio id="player" controls autoplay="autoplay" loop preload="auto" style="display: none">
                <source src="song/${songList.get(0).path}" type="audio/mpeg">
            </audio>
            <a class="song_prev"></a>
            <a class="song_play js_play" onclick="songPlay()"></a>
            <a class="song_next"></a>
            <div class="song_text">
                <a class="song_text_song">${songList.get(0).name}</a>
                -
                <a class="song_text_singer">${songList.get(0).singer.name}</a>
                <a class="song_text_time">00:00/${songList.get(0).time_length}</a>
            </div>
            <div class="player_progress" id="progress" style="width: 645px;">
                <div class="player_progress_inner" id="spanplayer_bgbar" style="width: 645px;">
                    <div class="player_progress_play" style="width: 645px;" id="spanplaybar">
                        <i class="player_progress_dot" id="spanprogress_op"></i>
                    </div>
                </div>
            </div>
            <div class="song_ctrl_btn">
                <a class="btn_style"></a>
                <a class="btn_unlike js_like"></a>
                <a class="btn_down"></a>
                <a class="btn_danmu">
                    <span class="btn_danmuu_number">
                    </span>
                </a>
                <a class="btn_close js_only"></a>
                <a class="btn_voice js_voice"></a>
                <a class="btn_voice_width">
                    <a class="btn_voice_dotted"></a>
                </a>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/playMusic.js"></script>
<script src="js/common.js"></script>
<script>
    var i = 0;
    function songPlay() {
        if (i%2 == 1){
            document.getElementById("player").play();
            i++;
        }else {
            document.getElementById("player").pause();
            i++;
        }
    }
    function switchSong(song) {
        $(song).hide();
    }
</script>
</body>
</html>
