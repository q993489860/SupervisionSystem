<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <!-- header -->
            <li class="nav-header">
                <div class="dropdown profile-element text-center"> <span>
                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath }/resources/img/update/profile_small.jpg" />
                             </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><sec:authentication property="principal.username"/></strong>
                             </span></span> </a>
                </div>
            </li>

        </ul>

    </div>
</nav>

<script type="text/javascript">
    $(function () {
        //目录图标
        var iconlist = ['fa-th-large','fa-user-o','fa-bar-chart-o','fa-envelope','fa-pie-chart','fa-flask','fa-edit','fa-desktop'];
        var iconNum = 0;
        $.ajax({
            url: '${pageContext.request.contextPath }/menu/getMenus',
            cache: false,
            dataType: "json",
            success: function (r) {

                var httpMenuList = r.obj;
                var length = r.obj.length;
                var str = "";

                //一级目录
                for (var i = 0; i < length; i++) {
                    var temp = httpMenuList[i];
                    if(!temp.parent){
                        if(i==0){
                            str += "<li id="+ temp.id +">";
                        }else{
                            str += "<li id="+ temp.id +">";
                        }
                        var menuUrl = temp.menuUrl;
                        if (menuUrl == '#') {
                            str += "<a><i class='fa "+ iconlist[iconNum] +"'></i><span class='nav-label'> ";
                        } else {
                            str += "<a href='${pageContext.request.contextPath }" + temp.menuUrl + "'><i class='fa "+ iconlist[iconNum] +"'></i><span class='nav-label'>";
                        }
                        iconNum++;
                        str += temp.menuName + "</span><span class='fa arrow'></span>";
                        str += "</a><ul class='nav nav-second-level'></ul></li>";
                    }
                }
                $('#side-menu').append(str);

                //二级目录
                for (var i = 0; i < length; i++) {
                    var temp = httpMenuList[i];
                    var secMenuStr = "";
                    if(temp.parent){
                        var parentId = temp.parent.id;
                        //菜单默认显示设置
                        if(temp.menuUrl&&window.location.href.indexOf(temp.menuUrl)!=-1){
                            secMenuStr += "<li class='active'><a  href='${pageContext.request.contextPath }" +
                                    temp.menuUrl + "' onclick='secin(this)'>";
                            $("#"+parentId).addClass("active");
                        }else{
                            secMenuStr += "<li><a  href='${pageContext.request.contextPath }" +
                                    temp.menuUrl + "' onclick='secin(this)'>";
                        }
                        secMenuStr += temp.menuName + "</a></li>";
                        $('#'+ parentId +" .nav-second-level").append(secMenuStr);
                    }


                }

                // MetisMenu
                $('#side-menu').metisMenu();

                menu();
                toActive();
            }
        });

        /*
         * 左边菜单栏自适应
         * */
        function toActive() {
            if ($("#side-menu .active").length>0) {
                $("#side-menu").scrollTop($("#side-menu .active").offset().top - 100);
            }
        }

        $(".menuBtn").on("click", function (event) {
            event.stopPropagation();
            $(".menu").toggle();
        })
    });

    function menu() {
        var titleValue = $.trim($('title').text());
        var objs = $('.nav-label');
        for (var i = 0; i < objs.length; i++) {
            var str = $(objs[i]).text();
            if ($.trim($(objs[i]).text()) === titleValue) {
                $(objs[i]).parent().addClass('current');
                return;
            }

        }
        var href = window.location.href;
        var objsUl = $('.nav-second-level > li > a');
        for(var j=0;j<objsUl.length;j++){
            if($.trim($(objsUl[j]).text())===titleValue){
                $(objsUl[j]).parent().addClass('active');
                $(objsUl[j]).parent().parent().addClass('nav nav-second-level collapse in');
            }
        }
    }

    function checkin(obj) {
        $(obj).addClass('current');
        $(obj).siblings().removeClass('current');
    }
    function secin(obj) {
        $(obj).addClass('active');
        $(obj).siblings().removeClass('active');
        $(obj).addClass('current');
    }

</script>