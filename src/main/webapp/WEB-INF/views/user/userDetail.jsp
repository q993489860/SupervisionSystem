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
<link href="${pageContext.request.contextPath }/resources/datetimepicker/bootstrap-datetimepicker.min.css"
      rel="stylesheet" media="screen">
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
                        <form:form class="form-horizontal" commandName="user" method="post" id="userForm">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">编号<font style="color: red">*</font> </label>
                                <div class="col-sm-4">
                                    <form:input path="userCode" id="userCode" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">姓名<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:input path="nickName" id="nickName" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-4 control-label">性别<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:input path="genner" id="genner" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-4 control-label">生日<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <div id="form_datetime_TimeAsString" class="input-group date form_datetime" data-date-format="yyyy-mm-dd"
                                    >
                                        <form:input class="form-control" id="birthdayTime" name="birthdayTime" size="16" disabled="true"
                                                    type="text" value="" path="birthdayTime" />
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">手机号码<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:input path="phoneNumber" id="phoneNumber" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">QQ<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:input path="qq" id="qq" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">邮箱地址</label>
                                <div class="col-sm-4">
                                    <form:input path="email" id="email" class="form-control" disabled="true" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">职称</label>
                                <div class="col-sm-4">
                                    <form:input path="academicTitle" id="academicTitle" disabled="true" class="form-control" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">角色</label>
                                <div class="col-sm-4">
                                    <form:input path="roles[0].roleName"  id="roleName" disabled="true" class="form-control" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-4 control-label">院系</label>
                                <div class="col-sm-4">
                                    <form:input path="department.departmentName" id="departmentName" disabled="true" class="form-control" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">备注</label>
                                <div class="col-sm-4">
                                    <form:textarea path="remark" id="remark" class="form-control" disabled="true" onblur="this.value=this.value.trim()"/>
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4">
                                    <a class="btn btn-primary" href="${pageContext.request.contextPath }/user/userManage">返回</a>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/resources/datetimepicker/bootstrap.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/resources/datetimepicker/bootstrap-datetimepicker.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/resources/datetimepicker/bootstrap-datetimepicker.zh-CN.js"
        charset="UTF-8"></script>
<script>
        $(document).ready(function(){
            if ($("#genner").val()==1){
                $("#genner").val("男");
            }else if($("#genner").val()==2){
                $("#genner").val("女");
            }else {
                $("#genner").val("");
            }
            var academicVal = $("#academicTitle").val();
            if (academicVal == 1){
                $("#academicTitle").val("助教");
            }else if (academicVal == 2){
                $("#academicTitle").val("讲师");
            }else if (academicVal == 3){
                $("#academicTitle").val("副教授");
            }else if (academicVal == 4){
                $("#academicTitle").val("教授");
            }else {
                $("#academicTitle").val("");
            }
        });
</script>


