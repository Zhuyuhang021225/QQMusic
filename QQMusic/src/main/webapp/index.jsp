<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.zhuyuhang.utils.SpringBeanUtils" %>
<%@ page import="com.zhuyuhang.service.AlbumService" %>
<%@ page import="com.zhuyuhang.damain.Album" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zhuyuhang.service.SongSheetService" %><%--
  Created by IntelliJ IDEA.
  User: Zhuyuhang
  Date: 2022/6/17
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QQ音乐,分享你的感动</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="icon" href="img/logo/favicon-20180629082227958.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/login.css">

</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>

<div class="ban_sec">
    <div class="ban_btn">
        <i class="previous"><div class="btn_img"></div></i>
        <i class="next"><div class="btn_img"></div></i>
    </div>
    <div id="banner">
        <div class="index__hd">
            <h2 class="index__tit">新歌速送<i class="icon_txt"></i></h2>
        </div>
        <div class="wrap">
            <div class="xx ban_left"></div>
            <div class="ban" style="transform-origin: 50% 50% -966.685px;" >
                <img src="img/banner/banner_1.jpg" style="padding: 0px;position:absolute;">
                <img src="img/banner/banner_2.jpg" style="padding: 0px; transform-origin: 50% 50% -966.685px; position:absolute;transform: rotateY(45deg) ">
                <img src="img/banner/banner_3.jpg" style="padding: 0px; transform-origin: 50% 50% -966.685px; position:absolute;transform: rotateY(90deg) ">
                <img src="img/banner/banner_4.jpg" style="padding: 0px; transform-origin: 50% 50% -966.685px; position:absolute;transform: rotateY(135deg) ">
                <img src="img/banner/banner_5.jpg" style="padding: 0px; transform-origin: 50% 50% -966.685px; position:absolute;transform: rotateY(180deg) ">
                <img src="img/banner/banner_6.jpg" style="padding: 0px; transform-origin: 50% 50% -966.685px; position:absolute;transform: rotateY(225deg) ">
                <img src="img/banner/banner_7.jpg" style="padding: 0px; transform-origin: 50% 50% -966.685px; position:absolute;transform: rotateY(270deg) ">
                <img src="img/banner/banner_8.jpg" style="padding: 0px; transform-origin: 50% 50% -966.685px; position:absolute;transform: rotateY(315deg) ">
            </div>
            <div class="xx ban_right"></div>
        </div>
    </div>
    <ul class="ban_ul">
        <li data-index=0 class="active"></li>
        <li data-index=1></li>
        <li data-index=2></li>
        <li data-index=3></li>
        <li data-index=4></li>
        <li data-index=5></li>
        <li data-index=6></li>
        <li data-index=7></li>
    </ul>
</div>
<div id="gedan">
    <div class="gedan_btn">
        <i class="previous"><div class="btn_img"></div></i>
        <i class="next"><div class="btn_img"></div></i>
    </div>
    <div class="index__hd">
        <h2 class="index__tit">专辑推荐<i class="icon_txt"></i></h2>
    </div>
    <ul class="a_ul">
        <li><a class="a_ul_hover">为你推荐</a></li>
        <li><a >经典国语</a></li>
        <li><a >经典</a></li>
        <li><a >KTV热歌</a></li>
        <li><a >热门游戏</a></li>
        <li><a >情歌</a></li>
    </ul>
    <%
        AlbumService albumService = (AlbumService) SpringBeanUtils.getSpringBean(AlbumService.class);
        List<Album> albumList1 = albumService.findAll(0, 5);
        List<Album> albumList2 = albumService.findAll(5, 5);
        pageContext.setAttribute("albumList1",albumList1);
        pageContext.setAttribute("albumList2",albumList2);
    %>
    <div class="gedan_list_body">
        <div class="gedan_list">
            <div class="gedan_list_1">
                <c:forEach items="${albumList1}" var="album">
                    <div class="gedan_border"><div class="gedan_list_x imga"><div class="gedan_bk"><img src="img/album/${album.cover}" alt="${album.name}"></div><i class="gedan_mask"></i><i class="gedan_icon" onclick="window.location.href='/playMusic.jsp?album=${album.id}'"></i></div><span class="list_title" onclick="window.location.href='/album.jsp?album=${album.id}'">${album.name}</span><span class="title_txt" onclick="window.location.href='/singer.jsp?singer=${album.singer.id}'">${album.singer.name}</span></div>
                </c:forEach>
            </div>
            <div class="gedan_list_2">
                <c:forEach items="${albumList2}" var="album">
                    <div class="gedan_border"><div class="gedan_list_x imga"><div class="gedan_bk"><img src="img/album/${album.cover}" alt="${album.name}"></div><i class="gedan_mask"></i><i class="gedan_icon" onclick="window.location.href='/playMusic.jsp?album=${album.id}'"></i></div><span class="list_title" onclick="window.location.href='/album.jsp?album=${album.id}'">${album.name}</span><span class="title_txt" onclick="window.location.href='/singer.jsp?singer=${album.singer.id}'">${album.singer.name}</span></div>
                </c:forEach>
            </div>
        </div>
    </div>
    <ul class="gedan_ul">
        <li data-index=0 class="active"></li>
        <li data-index=1></li>
    </ul>
</div>

<div id="rank">
    <div class="index__hd">
        <h2 class="index__tit">排行榜<i class="icon_txt"></i></h2>
    </div>
    <div class="rank_body">
        <div class="rank_div rank_img_1" >
            <h3 class="rank_top">巅峰榜</h3>
            <h3 class="rank_hd"><a class="rank_tit">流行指数</a></h3>
            <i class="rank_icon"></i>
            <i class="rank_x"></i>
            <ul class="rank_songlist">
                <li class="rank_song">
                    <div class="rank_number">1</div>
                    <div class="rank_songname">
                        <a class="js_song">那是你离开了北京的生活</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">薛之谦</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">2</div>
                    <div class="rank_songname">
                        <a class="js_song">阳光彩虹小白马</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">大张伟</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">3</div>
                    <div class="rank_songname">
                        <a class="js_song">天地</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">吴亦凡</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">4</div>
                    <div class="rank_songname">
                        <a class="js_song">摩天轮的眼泪</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">张紫宁/杨芸晴</a>
                    </div>
                </li>

            </ul>
        </div>
        <div class="rank_div rank_img_2" >
            <h3 class="rank_top">巅峰榜</h3>
            <h3 class="rank_hd"><a class="rank_tit">热歌</a></h3>
            <i class="rank_icon"></i>
            <i class="rank_x"></i>
            <ul class="rank_songlist">
                <li class="rank_song">
                    <div class="rank_number">1</div>
                    <div class="rank_songname">
                        <a class="js_song">那是你离开了北京的生活</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">薛之谦</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">2</div>
                    <div class="rank_songname">
                        <a class="js_song">答案</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">杨坤/郭采洁</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">3</div>
                    <div class="rank_songname">
                        <a class="js_song">讲真的</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">于晴</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">4</div>
                    <div class="rank_songname">
                        <a class="js_song">纸短情长</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">烟把儿乐队</a>
                    </div>
                </li>

            </ul>
        </div>
        <div class="rank_div rank_img_3">
            <h3 class="rank_top">巅峰榜</h3>
            <h3 class="rank_hd"><a class="rank_tit">新歌</a></h3>
            <i class="rank_icon"></i>
            <i class="rank_x"></i>
            <ul class="rank_songlist">
                <li class="rank_song">
                    <div class="rank_number">1</div>
                    <div class="rank_songname">
                        <a class="js_song">那是你离开了北京的生活</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">薛之谦</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">2</div>
                    <div class="rank_songname">
                        <a class="js_song">如约而至</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">许嵩</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">3</div>
                    <div class="rank_songname">
                        <a class="js_song">摩天轮的眼泪</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">张紫宁/杨芸晴</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">4</div>
                    <div class="rank_songname">
                        <a class="js_song">边走边爱</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">冯提莫</a>
                    </div>
                </li>

            </ul>
        </div>
        <div class="rank_div rank_img_4">
            <h3 class="rank_top">巅峰榜</h3>
            <h3 class="rank_hd"><a class="rank_tit">欧美</a></h3>
            <i class="rank_icon"></i>
            <i class="rank_x"></i>
            <ul class="rank_songlist">
                <li class="rank_song">
                    <div class="rank_number">1</div>
                    <div class="rank_songname">
                        <a class="js_song">5 In The Morning</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">Charli XCX</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">2</div>
                    <div class="rank_songname">
                        <a class="js_song">Ignite</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">K-391/Alan Walker</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">3</div>
                    <div class="rank_songname">
                        <a class="js_song">Solo</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">Clean Bandit</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">4</div>
                    <div class="rank_songname">
                        <a class="js_song">I Thought About Killing You
                        </a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">Kanye West</a>
                    </div>
                </li>

            </ul>
        </div>
        <div class="rank_div rank_img_5">
            <h3 class="rank_top">巅峰榜</h3>
            <h3 class="rank_hd"><a class="rank_tit">韩国</a></h3>
            <i class="rank_icon"></i>
            <i class="rank_x"></i>
            <ul class="rank_songlist">
                <li class="rank_song">
                    <div class="rank_number">1</div>
                    <div class="rank_songname">
                        <a class="js_song">빙글뱅글 (Bingle Bangle)
                        </a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">AOA (에이오에이)</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">2</div>
                    <div class="rank_songname">
                        <a class="js_song">흔한 이별 (常见的离别)
                        </a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">The One (더원)</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">3</div>
                    <div class="rank_songname">
                        <a class="js_song">LOVE YA!</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">혁오 (Hyukoh)</a>
                    </div>
                </li>

                <li class="rank_song">
                    <div class="rank_number">4</div>
                    <div class="rank_songname">
                        <a class="js_song">OSAKA (Feat. ZICO)</a>
                    </div>
                    <div class="rank_artist">
                        <a class="js_singer">ELO (엘로)/지코</a>
                    </div>
                </li>

            </ul>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>

<script src="js/jquery.min.js"></script>
<script src="js/index.js"></script>
<script src="js/header.js"></script>
<script src="js/footer.js"></script>
<script src="js/login.js"></script>
<script src="js/common.js"></script>
</body>
</html>
