<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-7
  Date: 2018/5/26
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="author" content="hanming,summer">
    <title>登录</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mobile/css/main.css" />
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<!--login-->
<div class="login">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <!--header,title-->
                <div class="login-title page-header text-center">
                    <h1>督导系统</h1>
                </div>

                <!--form-->
                <form method="post" action="${pageContext.request.contextPath }/mobile/index" id="loginForm">
                    <!--input-->
                    <!--username-->
                    <div class="input-group">
								<span class="input-group-addon" >
									<i class="glyphicon glyphicon-user"></i>
								</span>
                        <input type="text" class="form-control" name="username" placeholder="用户名" aria-describedby="sizing-addon2">
                    </div>
                    <!--password-->
                    <div class="input-group">
								<span class="input-group-addon" >
									<i class="glyphicon glyphicon-lock"></i>
								</span>
                        <input type="password" class="form-control" name="password" placeholder="密码" aria-describedby="sizing-addon2">
                    </div>
                    <p ><a  style="color:#FF0C05">${msg}</a></p>
                    <!--select，three options-->
                    <%--<div class="radio-usertype text-center">--%>
                        <%--<label class="radio-inline">--%>
                            <%--<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 一般教师--%>
                        <%--</label>--%>
                        <%--<label class="radio-inline">--%>
                            <%--<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 督导员--%>
                        <%--</label>--%>
                        <%--<label class="radio-inline">--%>
                            <%--<input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 管理员--%>
                        <%--</label>--%>
                    <%--</div>--%>
                    <!--login-->
                    <div class="input-group lg-btn-box">
                        <input class="lg-btn btn btn-default" type="submit" value="登录">
                        <!--<button type="button" class="btn btn-primary btn-lg btn-block">登录</button>-->
                    </div>
                </form>

                <!---->
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
