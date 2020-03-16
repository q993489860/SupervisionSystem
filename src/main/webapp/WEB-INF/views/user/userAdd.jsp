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
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<div class="main">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">

                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>从excel表导入用户信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal"
                              enctype="multipart/form-data" id="file_form">

                            <div class="form-group">
                                <label class="col-sm-4 control-label">请上传用户的excel文件</label>
                                <div class="col-sm-4">
                                    <input type="file" style="border: none"  name="excel_file" id="file"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4">
                                    <button class="btn btn-primary" type="button" id="submit_file">添加用户</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>手动添加用户信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form:form class="form-horizontal" commandName="user" method="post"
                                   action="${pageContext.request.contextPath }/user/saveOrUpdateUser?type=add" id="userForm">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">编号<font style="color: red">*</font> </label>
                                <div class="col-sm-4">
                                    <form:input path="userCode" id="userCode" class="form-control checkUserCodeExist" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">姓名<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:input path="nickName" id="nickName" class="form-control" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">性别<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:select path="genner" id="genner" class="form-control gennerRequierd">
                                        <form:option value="0">请选择</form:option>
                                        <form:option value="1">男</form:option>
                                        <form:option value="2">女</form:option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">生日<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <div id="form_datetime_TimeAsString" class="input-group date form_datetime" data-date-format="yyyy-mm-dd"
                                    >
                                        <form:input class="form-control" id="birthdayTime" name="birthdayTime" size="16"
                                                    type="text" value="" path="birthdayTime" />
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">手机号码<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:input path="phoneNumber" id="phoneNumber" class="form-control checkMobilePhoneExist" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">QQ<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:input path="qq" id="qq" class="form-control" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">邮箱地址<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:input path="email" id="email" class="form-control" onblur="this.value=this.value.trim()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">职称<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:select path="academicTitle" id="academicTitle" class="form-control academicTitleRequierd">
                                        <form:option value="0">请选择</form:option>
                                        <form:option value="1">助教</form:option>
                                        <form:option value="2">讲师</form:option>
                                        <form:option value="3">副教授</form:option>
                                        <form:option value="4">教授</form:option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">角色<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:select path="roleIDs"  class="form-control" multiple="none">
                                        <form:option value="">请选择</form:option>
                                        <form:options items="${roles}" itemValue="id" itemLabel="roleName"/>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">院系<font style="color: red">*</font></label>
                                <div class="col-sm-4">
                                    <form:select path="department.id" id="departmentName" class="form-control departmentRequierd">
                                        <form:option value="">请选择</form:option>
                                        <form:options items="${departments}" itemValue="id" itemLabel="departmentName"/>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">备注</label>
                                <div class="col-sm-4">
                                    <form:textarea path="remark" id="remark" class="form-control" onblur="this.value=this.value.trim()"></form:textarea>
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4">
                                    <button class="btn btn-primary" type="submit">保存</button>
                                    <a class="btn btn-white" href="${pageContext.request.contextPath }/user/userManage">返回</a>
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
        //手机号码验证
        jQuery.validator.addMethod("Mobile", function(value, element) {
            var length = value.length;
            var mobile = /^1\d{10}$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请正确填写您的手机号码");

        // 手机号码验证
        jQuery.validator.addMethod("checkMobilePhoneExist", function(value, element) {
            var length = value.length;
            var isExist = checkMobilePhoneExist();
            return this.optional(element) || isExist;
        }, "该手机号码已注册");

        function checkMobilePhoneExist() {

            var flag;
            $.ajax({
                url: "${pageContext.request.contextPath}/user/checkMobilePhoneExist?tel="+$("#phoneNumber").val(),
                type: "GET",
                dataType: "json",
                async:false,
                cache: false,
                contentType: "application/json",
                success: function (data) {
                    if (!data.success) {
                        //alert(data.msg);
                        flag= false;
                    } else {
                        flag= true;
                    }
                },
                error: function (msg) {
                    //alert("出错了！");
                }
            });
            return flag;
        }

        //教师编号验证
        jQuery.validator.addMethod("checkUserCodeExist", function(value, element) {
            var length = value.length;
            var isExist = checkUserCodeExist();
            return this.optional(element) || isExist;
        }, "该编号已经注册");

        function checkUserCodeExist() {
            var flag;
//            alert("id:"+$("#id").val());
            $.ajax({
                url: "${pageContext.request.contextPath}/user/checkUserCodeExist?userCode="+$("#userCode").val(),
                type: "GET",
                dataType: "json",
                async:false,
                cache: false,
                contentType: "application/json",
                success: function (data) {
                    if (!data.success) {
                        //alert(data.msg);
                        flag = false;
                    } else {
                        flag = true;
                    }
                },
                error: function (msg) {
                    //alert("出错了！");
                }
            });
            return flag;
        }

        //院系验证
        jQuery.validator.addMethod("departmentRequierd",function (value,element) {
            if (value != ""){
                return true;
            }
        },"必填")
        //性别验证
//        jQuery.validator.addMethod("gennerRequierd",function (value,element) {
//            if (value != 0){
//                return true;
//            }
//        },"必填")
        //职称验证
        jQuery.validator.addMethod("academicTitleRequierd",function (value,element) {
            if (value != 0){
                return true;
            }
        },"必填")
        $("#userForm").validate({
            rules: {
                userCode: {
                    required: true,
                    maxlength: 50,
                    digits:true
                },
                nickName: {
                    required: true,
                    maxlength: 20
                },
//                birthdayTime:{
//                    required:true
//                },
//                qq:{
//                    required: true,
//                },
                email: {
                    email:true,
//                    required:true
                },
                roleIDs:{
                    required:true
                }
            },
            messages: {
                userCode: {
                    required: "必填",
                    maxlength: "不得超过50位",
                    digits:"编号格式不正确"
                },
                nickName: {
                    required: "必填",
                    maxlength: "不得超过20位"
                },
//                birthdayTime:{
//                    required:"必填"
//                },
//                qq:{
//                    required:"必填"
//                },
                email:{
                    email:"Email格式不正确"
//                    required:"必填"
                },
                roleIDs:{
                    required:"必填"
                }
            }
        });

        $('#form_datetime_TimeAsString').datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd ',
            todayBtn:  1,
            todayHighlight: true,
            minView:"month",
            autoclose: 1
        });
    });

    //检查文件是否为空
    function checkFile() {
        var file = $("#file").val();
        if (file.length > 1 && file != ''){
            return true;
        } else {
            alert("文件不能为空");
            return false;
        }
    }

    //上传文件表单提交
    $("#submit_file").click(function(){
        if (!checkFile())
            return;
        $("#file_form").ajaxSubmit({
            type:"post",
            url: "${pageContext.request.contextPath}/user/addUserByFile" ,
            success: function(data){
                alert(data);
            }
        });
    });
</script>

