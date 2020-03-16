<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="keywords" content="JFinal,JFinal官网,JFinal教程,JFinal微信,JFinal Weixin,极速开发,快速开发框架,web框架">
    <meta name="description" content="JFinal 极速开发官方网站">
    <title>巢湖学院 督导系统</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->

    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.min.css">

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->

    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/login.min.css" rel="stylesheet">
    <style type="text/css">
        .group-form-text {
            color: #000;
        }
        .signinpanel .form-control {

            display: block;
            margin-top: 0;

        }
    </style>
</head>
<body class="  pace-done"><div class="pace  pace-inactive"><div class="pace-progress" style="width: 100%;" data-progress-text="100%" data-progress="99">
    <div class="pace-progress-inner"></div>
</div>
    <div class="pace-activity"></div></div>

<div class="jf-body-box clearfix">
    <form method="post" action="${pageContext.request.contextPath }/j_spring_security_check" id="loginForm">
        <div class="signinpanel" onload="init()">

            <div class="row">
                <div class="col-xs-10 col-sm-8">
                    <div class="signin-info">
                        <div class="logopanel m-b" style="margin-left: -5%;">
                            <h1 style="font-family: 楷体; color: #454545; font-size: 45px;">
                                <img alt="" src="${pageContext.request.contextPath}/resources/img/chxy.png" style="width: 100px; height: 100px;"> &nbsp; 督导系统
                            </h1>
                            <!-- <h1 style="font-family:楷体;color:#454545;font-size:45px;" ><img alt="" src="${pageContext.request.contextPath}/resources/img/kjxy.png" style="width: 100px ;height: 100px ;">&nbsp;科研管理系统</h1> -->
                        </div>
                    </div>
                </div>

                <div class="group-form-text col-xs-10 col-sm-4">

                    账号：<input id="userName" name="username" class="form-control uname m-b" placeholder="账号" type="text">
                    原有密码：<input id="oldPassWord" name="oldPassWord" class="form-control pword m-b" placeholder="原有密码" type="password">
                    新密码：<input id="newPassWord" name="newPassWord" class="form-control pword m-b" placeholder="新密码" type="password">
                    确认密码：<input id="rePassWord" name="rePassWord" class="form-control pword m-b" placeholder="确认密码" type="password">
                    <button id="edit" class="btn btn-primary btn-block" type="button">修改</button>
                    <p><a href="${pageContext.request.contextPath}/user/userPasswordUpdateView">修改密码</a></p>
                    <p class="text-muted text-center col-red"><a id="msg" style="color:#FF0C05">${msg}</a></p>
                </div>
            </div>

            <div class="signup-footer">
                <div class="pull-left">
                    <!-- 科技学院@2017 -->
                    © 巢湖学院 @2018
                </div>
            </div>
        </div>
    </form>
    <!-- 浏览器版本错误-->
    <div class="modal fade" id="llqbbcwModel">
        <div class="modal-dialog" style="width: 350px;">
            <div class="modal-content message_align">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">提示信息</h4>
                </div>
                <div class="modal-body">
                    <center>
                        <p>本系统对浏览器要求最低为IE 10.0以上,建议使用火狐浏览器!</p>
                    </center>
                </div>
                <div class="modal-footer">
                    <input id="url" type="hidden">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 选取判断2-->
    <div class="modal fade" id="dlcwModel">
        <div class="modal-dialog" style="width: 350px;">
            <div class="modal-content message_align">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">提示信息</h4>
                </div>
                <div class="modal-body">
                    <center>
                        <p style="color: black;">您填写的信息有误!</p>
                    </center>
                </div>
                <div class="modal-footer">
                    <input id="" type="hidden">
                    <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/update/jquery-3.1.1.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.base64.js"></script>

<script type="text/javascript">
    /*        $(window).on('load', function () {

                $('.selectpicker').selectpicker({
                    "width":230,
                    'multiple':"true",
                    'selectedText': 'cat'
                });

                // $('.selectpicker').selectpicker('hide');
            });*/
    var userAgent=window.navigator.userAgent,
        rMsie=/(msie\s|trident.*rv:)([\w.]+)/,
        rFirefox=/(firefox)\/([\w.]+)/,
        rOpera=/(opera).+version\/([\w.]+)/,
        rChrome=/(chrome)\/([\w.]+)/,
        rSafari=/version\/([\w.]+).*(safari)/;

    function uaMatch(ua)
    {

        var match=rMsie.exec(ua);
        if(match != null)
        {
            return {browser:"IE",version:match[2] || "0"};
        }
        var match=rFirefox.exec(ua);
        if(match != null)
        {
            return {browser:match[1] || "",version:match[2] || "0"};
        }
        var match=rOpera.exec(ua);
        if(match != null)
        {
            return {browser:match[1] || "",version:match[2] || "0"};
        }
        var match=rChrome.exec(ua);
        if(match != null)
        {
            return {browser:match[1] || "",version:match[2] || "0"};
        }
        var match=rSafari.exec(ua);
        if(match != null)
        {
            return {browser:match[2] || "",version:match[1] || "0"};
        }
        if(match != null)
        {
            return {browser:"",version:"0"};
        }
        alert(match);
    }
    function init()
    {
        var browser="";
        var version="";
        var browserMatch=uaMatch(userAgent.toLowerCase());
        if(browserMatch.browser)
        {
            browser=browserMatch.browser;
            version=browserMatch.version;
            if(browser=="IE"&&version<10){
                $("#llqbbcwModel").modal("show");
            }
        }
        //alert(browser+"  "+version);
    }
</script>
<script type="text/javascript">

        $("#edit").click(function(){
            var userName = $("#userName").val();
            var newPassWord = $("#newPassWord").val();
            var oldPassWord = $("#oldPassWord").val();
            var rePassWord = $("#rePassWord").val();
            if (newPassWord != rePassWord){
                $("#msg").html("两次输入的密码不一致");
            }else {
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/userPasswordUpdate",
                    type:"POST",
                    data:{"userName":userName,"newPassWord":newPassWord,"oldPassWord":oldPassWord},
                    dataType:"json",
                    success:function(data){
                        if (data.success){
                            alert(data.msg);
                            window.location.href="${pageContext.request.contextPath}/login"
                        }else {
                            var msg = data.msg;
                            $('#msg').html(msg);
                        }
                    }
                });
            }
        });
</script>
</body>
</html>