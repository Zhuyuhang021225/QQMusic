<%@ page import="com.zhuyuhang.damain.User" %>
<%@ page import="com.zhuyuhang.service.UserFollowService" %>
<%@ page import="com.zhuyuhang.utils.SpringBeanUtils" %><%--
  Created by IntelliJ IDEA.
  User: Zhuyuhang
  Date: 2022/6/19
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../css/myMusic/common.ce7a44036a7d9ff4c6ae.chunk.css">
<link rel="stylesheet" href="../css/myMusic/index.ea0adb959fef9011fc25.chunk.css">
<link rel="stylesheet" href="../css/myMusic/Page.c2791b3f1236fbac8da9.chunk.css">
<link rel="stylesheet" href="../css/myMusic/profile.5e8c651e74b13244f7cf.chunk.css">
<link rel="icon" href="../img/logo/favicon-20180629082227958.ico" type="image/x-icon">
<%
    User loginUser = (User) request.getSession().getAttribute("loginUser");
    UserFollowService userFollowService = (UserFollowService) SpringBeanUtils.getSpringBean(UserFollowService.class);
    // 获取关注数
    Integer followCount = userFollowService.getFollowCount(loginUser.getId());
    pageContext.setAttribute("followCount", followCount);

    // 获取粉丝数
    Integer fansCount = userFollowService.getFansCount(loginUser.getId());
    pageContext.setAttribute("fansCount", fansCount);
%>
<div class="mod_profile" style="background-image: url(/img/my/download.webp);height: 380px;margin-top: -50px">
    <div class="section_inner">
        <div class="profile__cover_link">
            <img src="img/user/${sessionScope.loginUser.head}" alt="" class="profile__cover">
        </div>
        <h1 class="profile__tit">
            <span class="profile__name">${sessionScope.loginUser.name}</span>
        </h1>
        <ul class="mod_user_statistic">
            <li class="user_statistic__item">
                <a onclick="focuss();">
                    <strong class="user_statistic__number">${followCount}</strong>
                    <span class="user_statistic__tit">关注</span>
                </a>
            </li>
            <li class="user_statistic__item user_statistic__item--last">
                <a onclick="fans()">
                    <strong class="user_statistic__number">${fansCount}</strong>
                    <span class="user_statistic__tit">粉丝</span>
                </a>
            </li>
        </ul>
    </div>
</div>
<script>
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
</script>