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
                        <h5>新增用户信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form:form class="form-horizontal" commandName="courseComment" method="post"
                                   action="${pageContext.request.contextPath }/courseComment/saveCourseComment" id="courseCommentForm">
                            <form:hidden path="id"></form:hidden>
                            <%--<div class="form-group">--%>
                                <%--<label class="col-sm-4 control-label">课程名称<font style="color: red">*</font> </label>--%>
                                <%--<div class="col-sm-4">--%>
                                    <%--<form:input path="code" id="code" class="form-control" onblur="this.value=this.value.trim()" />--%>
                                <%--</div>--%>
                            <%--</div>--%>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">应到人数<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:input path="totalCount" id="totalCount" class="form-control" onblur="this.value=this.value.trim()"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">实到人数<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:input path="presentCount" id="presentCount" class="form-control" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">评分<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:input path="score" id="score" class="form-control" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">评价<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:textarea path="comment" id="comment" class="form-control" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">意见<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:textarea path="proposal" id="proposal" class="form-control" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">备注</label>
                                <div class="col-sm-4">
                                    <form:textarea path="remark" id="remark" class="form-control" onblur="this.value=this.value.trim()"></form:textarea>
                                </div>
                            </div>

                            <div class="hr-line-da0shed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4">
                                    <button class="btn btn-primary" type="submit">保存</button>
                                    <a class="btn btn-white" href="${pageContext.request.contextPath }/courseComment/writeCourseComment">返回</a>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
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
                },
            }
        });
    });
</script>

