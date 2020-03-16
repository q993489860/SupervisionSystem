<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-7
  Date: 2018/4/17
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- /section:basics/sidebar -->
<script src="${pageContext.request.contextPath }/resources/js/update/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/update/plugins/validate/jquery.validate.min.js"></script>
<div class="main">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>督导员评价信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form:form class="form-horizontal" commandName="courseComment" method="post" id="commmentForm" >
                            <div class="form-group">
                                <label class="col-sm-4 control-label">课程名称<font style="color: red">*</font> </label>
                                <div class="col-sm-4">
                                    <form:textarea path="courseRecord.course.courseName" id="courseName" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">授课老师<font style="color: red">*</font> </label>
                                <div class="col-sm-4">
                                    <form:textarea path="courseRecord.course.user.nickName" id="nickName" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">应到人数<font style="color: red">*</font> </label>
                                <div class="col-sm-4">
                                    <form:textarea path="totalCount" id="totalCount" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">实到人数<font style="color: red">*</font> </label>
                                <div class="col-sm-4">
                                    <form:textarea path="presentCount" id="presentCount" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">评分<font style="color: red">*</font> </label>
                                <div class="col-sm-4">
                                    <form:textarea path="score" id="score" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">评论<font style="color: red">*</font> </label>
                                <div class="col-sm-4">
                                    <form:textarea path="comment" id="comment" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">意见<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:textarea path="proposal" id="proposal" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4">
                                    <a class="btn btn-primary" id="ret" onclick="forward()" >返回</a>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="type" value="${type}">
<script>
    document.ready(function () {
        if ($("#comment").val() == null){
            $("#comment").val("未填写");
        }
        if ($("#proposal").val() == null){
            $("#proposal").val("未填写");
        }
    });

    function forward() {
        var type = $("#type").val();
        if (type == "teacher"){
            window.location.href="${pageContext.request.contextPath}/courseComment/commentList?id=${courseComment.courseRecord.id}"
        }else {
            window.location.href="${pageContext.request.contextPath }/courseComment/writeCourseComment";
        }
    }
</script>

