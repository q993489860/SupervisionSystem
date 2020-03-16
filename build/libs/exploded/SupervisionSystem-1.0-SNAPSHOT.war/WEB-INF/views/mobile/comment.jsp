<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-7
  Date: 2018/5/26
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="author" content="hanming,summer">
    <title>听课记录</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mobile/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mobile/css/main.css" />

    <script src="${pageContext.request.contextPath}/resources/mobile/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/mobile/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/resources/js/update/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/update/plugins/validate/jquery.validate.min.js"></script>
    <%--<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js" type="text/javascript"></script>--%>
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
    <style type="text/css">
        body {
            background: none;
        }
    </style>
</head>

<body>
<!--login-->
<div class="comment">
    <div class="container-fluid">
        <div class="row">
            <!--top,back-->
            <div class="top-back">
                <i class="glyphicon glyphicon-chevron-left" id="fnReturn"></i>
                <h1>评价</h1>
            </div>
            <!--comment-content-->
            <div class="col-md-12 col-xs-12">
                <div class="content text-center">
                    <form:form class="form-horizontal" action="${pageContext.request.contextPath}/mobile/courseComment/saveCourseComment"
                          commandName="courseComment"  id="courseCommentForm" method="post">
                        <form:hidden path="id" id="commentId"></form:hidden>
                        <div class="form-group">
                            <label  class="col-sm-2 col-xs-2 control-label">应到人数</label>
                            <div class="col-sm-10 col-xs-10">
                                <form:input path="totalCount" id="totalCount" class="form-control" onblur="this.value=this.value.trim()"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 col-xs-2 control-label">实到人数</label>
                            <div class="col-sm-10 col-xs-10">
                                <form:input path="presentCount" id="presentCount" class="form-control" onblur="this.value=this.value.trim()" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-xs-2 control-label">评分</label>
                            <div class="col-sm-10 col-xs-10">
                                <form:input path="score" id="score" class="form-control" onblur="this.value=this.value.trim()" />
                            </div>
                            <a href="${pageContext.request.contextPath}/mobile/courseComment/promptView?id=${id}"><span class="score-tip label label-info pull-right">提示</span></a>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-xs-2 control-label">评价</label>
                            <div class="col-sm-10 col-xs-10">
                                <form:textarea path="comment" id="comment" class="form-control" onblur="this.value=this.value.trim()" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-xs-2 control-label">意见</label>
                            <div class="col-sm-10 col-xs-10">
                                <form:textarea path="proposal" id="proposal" class="form-control" onblur="this.value=this.value.trim()" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-xs-2 control-label">备注</label>
                            <div class="col-sm-10 col-xs-10">
                                <form:textarea path="remark" id="remark" class="form-control" onblur="this.value=this.value.trim()"/>
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-sm-10 lg-btn-box">
                                <input class="lg-btn btn com-lg-btn btn-default" type="submit" value="保存">
                                <button type="button" id="btn" class="lg-btn btn com-lg-btn btn-default" >提交</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
            <!--footer-->
            <%--<div class="footer">--%>

            <%--</div>--%>
        </div>
    </div>
</div>
<script type="text/javascript">

    $(document).ready(function(){
        $("#courseCommentForm").validate({
            rules: {
                totalCount: {
                    required: true,
                    digits:true
                },
                presentCount: {
                    required: true,
                    digits:true
                },
                score: {
                    required: true,
                    digits:true,
                    range:[0,100]
                },
                comment: {
                    required: true,
                },
                proposal: {
                    required: true,
                }
            },
            messages: {
                totalCount: {
                    required: "必填",
                    digits: "非法字符，必须为数字"
                },
                presentCount: {
                    required: "必填",
                    digits: "非法字符，必须为数字"
                },
                score: {
                    required: "必填",
                    digits: "非法字符，必须为数字",
                    range:"得分必须在0-100之间"
                },
                comment: {
                    required: "必填",
                },
                proposal:{
                    required: "必填",
                }
            }
        });
    });

    $("#btn").click(function () {
        var commentId = $("#commentId").val();
        if (confirm("确认提交?")){
            $.ajax({
                url:"${pageContext.request.contextPath}/mobile/courseComment/submitComment?id="+commentId,
                dataType:"json",
                success:function (data) {
                    if (data.success){
                        alert("提交成功");
                    }
                }
            });
        }
    });

    $("#fnReturn").click(function () {
        window.location.href="${pageContext.request.contextPath}/mobile/course/courseSelect";
    })
</script>
</body>
</html>