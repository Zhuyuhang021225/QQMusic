var link=document.createElement("link");
	link.rel="stylesheet";
	link.href="css/footer.css";
	document.head.appendChild(link);
$("#footer").html(`<div class="section_inner">
<div class="footer_info">
    <div class="footer_download">
        <h3 class="footer_tit">下载QQ音乐客户端</h3>
        <ul class="footer_download_list">
            <li class="footer_download_list__item"><a href="//y.qq.com/download/" class="js_footer_down" data-type="pc" data-stat="y_new.footer.download.pc"><i class="icon_qm_pc"></i>PC版</a></li>
            <li class="footer_download_list__item"><a href="//y.qq.com/download/" class="js_footer_down" data-type="mac" data-stat="y_new.footer.download.mac"><i class="icon_qm_mac"></i>Mac版</a></li>
            <li class="footer_download_list__item"><a href="//y.qq.com/download/" class="js_footer_down" data-type="andriod" data-stat="y_new.footer.download.andriod"><i class="icon_qm_android"></i>Android版</a></li>
            <li class="footer_download_list__item"><a href="//y.qq.com/download/" class="js_footer_down" data-type="iphone" data-stat="y_new.footer.download.iphone"><i class="icon_qm_iphone"></i>iPhone版</a></li>
        </ul>
    </div>

    <div class="footer_product">
        <h3 class="footer_tit">特色产品</h3>
        <ul class="footer_product_list">
            <li class="footer_product_list__item footer_product_list__item--pic"><a href="http://kg.qq.com/?pgv_ref=qqmusic.y.topmenu" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_music.k"><i class="icon_qm_kg"></i>全民K歌</a></li>
            <li class="footer_product_list__item footer_product_list__item--pic"><a href="http://y.qq.com/vip/voice_intro/index.html" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_music.supersound"><i class="icon_qm_ss"></i>Super Sound</a></li>
            <li class="footer_product_list__item footer_product_list__item--pic"><a href="http://y.qq.com/y/static/down/qplay.html?pgv_ref=qqmusic.y.topmenu" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_music.qplay"><i class="icon_qm_qp"></i>QPlay</a></li>
            <li class="footer_product_list__item other_li"><a href="http://y.qq.com/y/static/down/car_introduce.html" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_music.car_play" >车载互联</a></li>
            <li class="footer_product_list__item other_li"><a href="http://y.qq.com/yanchu/?pgv_ref=qqmusic.y.topmenu" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_music.yanchu" >QQ演出</a></li>
        </ul>
    </div>

    <div class="footer_link">
        <h3 class="footer_tit">合作链接</h3>
        <!-- 显示全部 footer_link_list--show -->
        <ul class="footer_link_list">
            <li class="footer_link_list__item"><a href="//y.qq.com/portal/company_detail.html?id=297" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">CJ E&amp;M</a></li>
            <li class="footer_link_list__item"><a href="http://v.qq.com/" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">腾讯视频</a></li>
            <li class="footer_link_list__item"><a href="http://z.qzone.com/" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">手机QQ空间</a></li>
            <li class="footer_link_list__item"><a href="http://im.qq.com/" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">最新版QQ</a></li>
            <li class="footer_link_list__item"><a href="http://e.qq.com/index.shtml" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">腾讯社交广告</a></li>
            <li class="footer_link_list__item"><a href="http://guanjia.qq.com/" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">电脑管家</a></li>
            <li class="footer_link_list__item"><a href="http://browser.qq.com/" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">QQ浏览器</a></li>
            <li class="footer_link_list__item"><a href="http://www.weiyun.com/" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">腾讯微云</a></li>
            <li class="footer_link_list__item"><a href="https://cloud.tencent.com/?fromSource=gwzcw.756433.756433.756433" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">腾讯云</a></li>
            <li class="footer_link_list__item"><a href="http://fm.qq.com/" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">企鹅FM</a></li>
            <li class="footer_link_list__item"><a href="http://www.znds.com/" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">智能电视网</a></li>
            <li class="footer_link_list__item"><a href="http://www.dangbei.com/" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">当贝市场</a></li>
            <!--li class="footer_link_list__item js_last" style="display:none;"><a href="http://fm.qq.com/" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">企鹅FM</a></li>
            <li class="footer_link_list__item"><a href="javascript:;" class="js_footer_more">更多</a></li>
            <li class="footer_link_list__item footer_link_list__item--more"><a href="https://cloud.tencent.com/?fromSource=gwzcw.756433.756433.756433" rel="noopener" target="_blank" class="js_other_link" data-stat="y_new.footer.other_link">腾讯云</a></li-->
        </ul>
    </div>
    <div class="footer_platform">
            <h3 class="footer_tit">开放平台</h3>
            <ul class="footer_platform_list">
                <li class="footer_platform_list__item"><a href="http://y.tencentmusic.com/" target="_blank" class="js_other_link" data-stat="y_new.footer.other_music.tme">腾讯音乐人平台</a></li>
                <li class="footer_platform_list__item"><a href="//y.qq.com/vip/daren_recruit/apply.html" target="_blank" class="js_other_link" data-stat="y_new.footer.other_music.daren_recruit">音乐号认证</a></li>
                <li class="footer_platform_list__item"><a href="//y.qq.com/portal/mv/mv_upload.html" target="_blank" class="js_other_link" data-stat="y_new.footer.other_music.ugc">上传视频</a></li>
                <li class="footer_platform_list__item"><a href="http://y.qq.com/cp/homepage.html#/home" target="_blank" class="js_other_link" data-stat="y_new.footer.other_music.cp">上传音频</a></li>
                
                
            </ul>
        </div>
</div>
<div class="footer_copyright">

    <p>
        <a href="http://www.tencent.com/" rel="noopener nofollow" target="_blank" title="关于腾讯">关于腾讯</a> | 
        <a href="http://www.tencent.com/index_e.shtml" rel="noopener nofollow" target="_blank" title="About Tencent">About Tencent</a> | 
        <a href="http://www.qq.com/contract.shtml" rel="noopener nofollow" target="_blank" title="服务条款">服务条款</a> | 
        <a href="http://y.qq.com/y/static/tips/service_tips.html" rel="noopener nofollow" target="_blank" title="用户服务协议">用户服务协议</a> | 
        <a href="http://www.qq.com/privacy.htm" rel="noopener nofollow" target="_blank" title="隐私政策">隐私政策</a> | 
        <a href="https://y.qq.com/vip/right_declare/index.html" rel="noopener nofollow" target="_blank" title="权利声明">权利声明</a> | 
        <a href="http://www.tencentmind.com/" rel="noopener nofollow" target="_blank" title="广告服务">广告服务</a> | 
        <a href="http://hr.tencent.com/" rel="noopener nofollow" target="_blank" title="腾讯招聘">腾讯招聘</a> | 
        <a href="http://service.qq.com/" rel="noopener nofollow" target="_blank" title="客服中心">客服中心</a> | 
        <a href="http://www.qq.com/map/" rel="noopener nofollow" target="_blank" title="网站导航">网站导航</a>
    </p>
    <p>Copyright © 1998 - 2018 Tencent. <a target="_blank" href="http://www.tencent.com/en-us/le/copyrightstatement.shtml" rel="noopener nofollow" title="All Rights Reserved.">All Rights Reserved.</a></p>
    <p>腾讯公司 <a target="_blank" href="http://www.tencent.com/zh-cn/le/copyrightstatement.shtml" rel="noopener nofollow" title="版权所有">版权所有</a> <a target="_blank" href="http://www.tencent.com/law/mo_law.shtml?/law/copyright.htm" rel="noopener nofollow" title="腾讯网络文化经营许可证">腾讯网络文化经营许可证</a></p>
</div>
</div>`)