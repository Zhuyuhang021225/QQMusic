<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.zhuyuhang.utils.SpringBeanUtils" %>
<%@ page import="com.zhuyuhang.service.SongService" %>
<%@ page import="com.zhuyuhang.damain.Song" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zhuyuhang.service.SingerService" %>
<%@ page import="com.zhuyuhang.damain.Singer" %>
<%@ page import="com.zhuyuhang.service.AlbumService" %>
<%@ page import="com.zhuyuhang.damain.Album" %><%--
  Created by IntelliJ IDEA.
  User: Zhuyuhang
  Date: 2022/6/30
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        request.setCharacterEncoding("utf-8");

        String kw = request.getParameter("kw");
        pageContext.setAttribute("kw",kw);
    %>
    <title>搜索-${kw}</title>
    <link rel="icon" href="img/logo/favicon-20180629082227958.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/search.b2d11f89ea6a512a2302.chunk.css">
    <link rel="stylesheet" href="css/myMusic/Page.c2791b3f1236fbac8da9.chunk.css">
</head>
<body>
    <jsp:include page="common/header.jsp"></jsp:include>
    <div id="app">
        <div class="search_exclusive">
            <div class="mod_search" role="search" style="background-image:url(//y.qq.com/mediastyle/yqq/img/bg_search.jpg?max_age=2592000)">
                <div class="mod_search_input">
                    <form action="search.jsp" method="post">
                        <input name="kw" onchange="result();" onblur="resultClose()" type="text" class="search_input__input" placeholder="搜索音乐、MV、歌单、用户" value="${kw}">
                        <button class="search_input__btn" onclick="onsubmit()">
                            <i class="icon_search sprite"></i>
                            <span class="icon_txt">搜索</span>
                        </button>
                    </form>
                </div>

                <div class="mod_search_result ">
                    <div id="result" class="search_result__sort">
                        <h4 class="search_result__tit">
                            <i class="search_result__icon_song"></i>单曲
                        </h4>
                        <ul class="search_result__list">
                            <li>
                                <a class="search_result__link" target="_blank" href="https://y.qq.com/n/ryqq/songDetail/001PLl3C4gPSCI">
                                    <span class="search_result__name">我是如此相信</span>-
                                    <span class="search_result__singer">
                                        <span class="search_result__keyword">周杰伦</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="search_result__link" target="_blank" href="https://y.qq.com/n/ryqq/songDetail/0039MnYb0qxYhV">
                                    <span class="search_result__name">晴天</span>-
                                    <span class="search_result__singer">
                                        <span class="search_result__keyword">周杰伦</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="search_result__link" target="_blank" href="https://y.qq.com/n/ryqq/songDetail/003cI52o4daJJL">
                                    <span class="search_result__name">花海</span>-
                                    <span class="search_result__singer">
                                        <span class="search_result__keyword">周杰伦</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="search_result__link" target="_blank" href="https://y.qq.com/n/ryqq/songDetail/0017K7gL4WYnw2">
                                    <span class="search_result__name">反方向的钟</span>-
                                    <span class="search_result__singer">
                                        <span class="search_result__keyword">周杰伦</span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="search_result__sort">
                        <h4 class="search_result__tit">
                            <i class="search_result__icon_singer"></i>歌手
                        </h4>
                        <ul class="search_result__list">
                            <li>
                                <a class="search_result__link" target="_blank" href="https://y.qq.com/n/ryqq/singer/0025NhlN2yWrP4">
                                    <span class="search_result__name">
                                        <span class="search_result__keyword">周杰伦</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="search_result__link" target="_blank" href="https://y.qq.com/n/ryqq/singer/003fA5G40k6hKc">
                                    <span class="search_result__name">周深</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="search_result__sort">
                        <h4 class="search_result__tit">
                            <i class="search_result__icon_album"></i>专辑
                        </h4>
                        <ul class="search_result__list">
                            <li>
                                <a class="search_result__link" target="_blank" href="https://y.qq.com/n/ryqq/albumDetail/002Neh8l0uciQZ">
                                    <span class="search_result__name">魔杰座</span>
                                    <span class="search_result__singer">
                                        <span class="search_result__keyword">周杰伦</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="search_result__link" target="_blank" href="https://y.qq.com/n/ryqq/albumDetail/0024bjiL2aocxT">
                                    <span class="search_result__name">十一月的萧邦</span>
                                    <span class="search_result__singer">
                                        <span class="search_result__keyword">周杰伦</span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="search_result__sort">
                        <h4 class="search_result__tit">
                            <i class="search_result__icon_mv"></i>MV
                        </h4>
                        <ul class="search_result__list">
                            <li>
                                <a class="search_result__link" target="_blank" href="https://y.qq.com/n/ryqq/mv/a0043kusx94">
                                    <span class="search_result__name">You jump,I jump</span>-
                                    <span class="search_result__singer">周震南</span>
                                </a>
                            </li>
                            <li>
                                <a class="search_result__link" target="_blank" href="https://y.qq.com/n/ryqq/mv/h0043hjf8lw">
                                    <span class="search_result__name">
                                        <span class="search_result__keyword">周杰伦</span>2022年专辑前导·巴黎创作纪录片
                                    </span>-
                                    <span class="search_result__singer">
                                        <span class="search_result__keyword">周杰伦</span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="mod_search_tips">热门搜索：
                    <a class="search_tips__item" href="/search.jsp?kw=周杰伦">周杰伦 </a>
                    <a class="search_tips__item" href="/search.jsp?kw=反方向的钟">反方向的钟 </a>
                    <a class="search_tips__item" href="/search.jsp?kw=许嵩">许嵩 </a>
                    <a class="search_tips__item" href="/search.jsp?kw=如果当时">如果当时 </a>
                    <a class="search_tips__item" href="/search.jsp?kw=陈奕迅">陈奕迅 </a>
                </div>
            </div>

            <div class="main" style="padding-bottom:40px">
                <div class="main__inner">
                    <div class="result">
                        <%
                            SingerService singerService = (SingerService) SpringBeanUtils.getSpringBean(SingerService.class);
                            Singer singerByKeyWords = singerService.findSingerByKeyWords(kw);
                            pageContext.setAttribute("singerByKeyWords",singerByKeyWords);
                        %>
                        <c:if test="${!empty singerByKeyWords}">
                            <div class="mod_intro mod_intro_singer" id="zhida_singer">
                                <a class="mod_intro__cover js_singer" href="/singer.jsp?singer=${singerByKeyWords.id}">
                                    <img src="/img/singer/${singerByKeyWords.head}" alt="${singerByKeyWords.name}" class="mod_intro__pic mod_intro_singer__pic">
                                </a>
                                <div class="mod_intro__info">
                                    <div class="mod_intro__base">
                                        <h2 class="mod_intro__title">
                                            <a href="/singer.jsp?singer=${singerByKeyWords.id}" class="mod_intro_singer__singer js_singer" title="${singerByKeyWords.name}">${singerByKeyWords.name}
                                                <span class="c_tx_highlight"></span>
                                            </a>
                                        </h2>
                                        <a class="mod_intro_singer__link js_singer" href="https://y.qq.com/n/ryqq/singer/0025NhlN2yWrP4/song">单曲
                                            <strong>813</strong>
                                        </a>
                                        <a class="mod_intro_singer__link js_singer" href="https://y.qq.com/n/ryqq/singer/0025NhlN2yWrP4/album">专辑
                                            <strong>36</strong>
                                        </a>
                                        <a class="mod_intro_singer__link js_singer" href="https://y.qq.com/n/ryqq/singer/0025NhlN2yWrP4/mv">MV
                                            <strong>8637</strong>
                                        </a>
                                    </div>
                                    <div class="mod_intro__toolbar">
                                        <button class="mod_btn_green js_singer_radio">
                                            <i class="mod_btn_green__icon_play"></i>播放歌手热门歌曲
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="mod_tab" role="nav">
                            <a id="song" class="mod_tab__item mod_tab__current" data-tab="song" onclick="showSong()">单曲</a>
                            <a id="album" class="mod_tab__item " onclick="showAlbum()">专辑</a>
                            <a id="MV" class="mod_tab__item " onclick="showMV()">MV</a>
                            <a id="songSheet" class="mod_tab__item " onclick="showSongSheet()">歌单</a>
                            <a id="user" class="mod_tab__item " onclick="showUser()">用户</a>
                            <a id="lyrics" class="mod_tab__item " onclick="showLyrics()">歌词</a>
                        </div>
                        <div id="song_toolbar" class="mod_songlist_toolbar">
                            <a class="mod_btn_green">
                                <i class="mod_btn_green__icon_play"></i>播放全部
                            </a>
                            <a class="mod_btn">
                                <i class="mod_btn__icon_add"></i>添加到
                            </a>
                            <a class="mod_btn">
                                <i class="mod_btn__icon_down"></i>下载
                            </a>
                            <a class="mod_btn">
                                <i class="mod_btn__icon_batch"></i>批量操作
                            </a>
                        </div>
                        <div id="song_box" class="mod_songlist ">
                            <ul class="songlist__header">
                                <li class="songlist__header_name">歌曲</li>
                                <li class="songlist__header_author">歌手</li>
                                <li class="songlist__header_album">专辑</li>
                                <li class="songlist__header_time">时长</li>
                            </ul>

                            <%
                                SongService songService = (SongService) SpringBeanUtils.getSpringBean(SongService.class);
                                List<Song> songListByKeyWords = songService.getSongListByKeyWords(kw);
                                pageContext.setAttribute("songListByKeyWords",songListByKeyWords);
                            %>

                            <ul class="songlist__list">
                                <c:forEach items="${songListByKeyWords}" var="song" varStatus="i">
                                    <li>
                                        <div class="songlist__item songlist__item--even">
                                            <div class="songlist__number songlist__number--top">${i.index+1}</div>
                                            <div class="songlist__songname">
                                                <a class="songlist__icon songlist__icon_mv sprite" title="MV" href="https://y.qq.com/n/ryqq/mv/r00127x0yzd">
                                                    <span class="icon_txt">MV</span>
                                                </a>
                                                <i class="songlist__icon songlist__icon_vip sprite" title="VIP"></i>
                                                <span class="songlist__songname_txt">
                                                <a title="${song.name}" href="/song.jsp?song=${song.id}">
                                                    <div class="keyrender_default" title="${song.name}">${song.name}</div>
                                                </a>
                                            </span>
                                                <div class="mod_list_menu">
                                                    <a class="list_menu__item list_menu__play" href="playMusic.jsp?song=${song.id}" title="播放">
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
                                                <a class="playlist__author" title="${song.singer.name}" href="/singer.jsp?singer=${song.singer.id}">
                                                        ${song.singer.name}
                                                </a>
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

                        <%
                            AlbumService albumService = (AlbumService) SpringBeanUtils.getSpringBean(AlbumService.class);
                            List<Album> albumListByKeyWords = albumService.findAlbumListByKeyWords(kw);
                            pageContext.setAttribute("albumListByKeyWords",albumListByKeyWords);
                        %>
                        <div id="album_box" class="mod_playlist_text ">
                            <ul class="playlist__header">
                                <li class="playlist__header_name">专辑</li>
                                <li class="playlist__header_author">歌手</li>
                                <li class="playlist__header_other">发行时间</li>
                            </ul>
                            <ul class="playlist__list ">
                                <c:forEach items="${albumListByKeyWords}" var="album" varStatus="i">
                                    <li class="playlist__item ">
                                        <div class="playlist__cover ">
                                            <a href="/album.jsp?album=${album.id}">
                                                <img class="playlist__pic" loading="lazy" src="/img/album/${album.cover}" alt="${album.name}" data-qar-def="//y.qq.com/mediastyle/global/img/playlist_300.png?max_age=2592000">
                                            </a>
                                        </div>
                                        <h4 class="playlist__title">
                                        <span class="playlist__title_txt">
                                            <a href="/album.jsp?album=${album.id}">
                                                <div class="keyrender_default" title="${album.name}">
                                                        ${album.name}
                                                </div>
                                            </a>
                                        </span>
                                        </h4>
                                        <div class="mod_list_menu">
                                            <a class="list_menu__item list_menu__play" title="播放">
                                                <i class="list_menu__icon_play"></i>
                                                <span class="icon_txt">播放</span>
                                            </a>
                                            <a class="list_menu__item list_menu__add" title="添加到歌单">
                                                <i class="list_menu__icon_add"></i>
                                                <span class="icon_txt">添加到歌单</span>
                                            </a>
                                            <a class="list_menu__item list_menu__down" title="VIP下载">
                                                <i class="list_menu__icon_down"></i>
                                                <span class="icon_txt">VIP下载</span>
                                            </a>
                                            <a class="list_menu__item list_menu__share" title="分享">
                                                <i class="list_menu__icon_share"></i>
                                                <span class="icon_txt">分享</span>
                                            </a>
                                        </div>
                                        <div class="playlist__author">
                                            <a class=" " title="${album.singer.name}" href="/singer.jsp?singer=${album.singer.id}">${album.singer.name}</a>
                                        </div>
                                        <div class="playlist__other">${album.publish_time.toLocaleString()}</div>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="common/footer.jsp"></jsp:include>

    <script src="js/jquery.min.js"></script>
    <script>
        $('.mod_top_subnav').css("display","none");
        $('#album_box').css("display","none");

        function result() {
            $('#result').css('visibility','visible');
            $('.mod_search_result').css('max-height','900px');
            $('.mod_search_result').css('visibility','visible');
        }
        function resultClose() {
            $('#result').css('visibility','none');
            $('.mod_search_result').css('max-height','0');
            $('.mod_search_result').css('visibility','none');
        }

        function showSong() {
            $('#song').attr('class','mod_tab__item mod_tab__current');
            $('#album').attr('class','mod_tab__item');
            $('#song_box').css("display","block");
            $('#album_box').css("display","none");
        }

        function showAlbum() {
            $('#song').attr('class','mod_tab__item');
            $('#album').attr('class','mod_tab__item mod_tab__current');
            $('#song_box').css("display","none");
            $('#album_box').css("display","block");
        }
    </script>
</body>
</html>
