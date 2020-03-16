
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<link href="${pageContext.request.contextPath }/resources/css/select2.min.css" rel="stylesheet"/>

<script src="${pageContext.request.contextPath }/resources/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>

<div class="main">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-14">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改课程信息</h5>
                    </div>
                    <div class="ibox-content">
                        <form:form id="courseForm" commandName="course" class="form-horizontal">

                            <form:hidden path="id" />

                            <div class="form-group">
                                <label class="col-sm-4 control-label">课程编号</label>
                                <div class="col-sm-4">
                                    <form:input class="form-control" path="courseCode" onkeyup="queryCourse(this)"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">课程名称</label>
                                <div class="col-sm-4">
                                    <form:input class="form-control" path="courseName" id="courseName"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">授课教室</label>
                                <div class="col-sm-4">
                                    <form:input class="form-control" path="courseRoom" id="courseRoom"/>
                                </div>
                            </div>

                            <jsp:include page="courseInclude.jsp" flush="true" />

                            <div class="form-group">
                                <label class="col-sm-4 control-label">专业</label>
                                <div class="col-sm-4">
                                    <form:select class="form-control" path="major" id="major">
                                        <form:options items="${course.majorDicSet}" itemValue="majorName" itemLabel="majorName" />
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">班级</label>
                                <div class="col-sm-4">
                                    <form:select class="form-control" path="classes">
                                        <form:option value="1">1班</form:option>
                                        <form:option value="2">2班</form:option>
                                        <form:option value="3">1班和2班</form:option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">授课教师</label>
                                <div class="col-sm-6">
                                    <form:select class="dropdown-submenu col-sm-4"
                                                 onchange="showTeachers(this)" id="department" path="departmentId">
                                        <form:option value="" selected="selected">请选择</form:option>
                                        <form:options items="${course.departments}" itemValue="id" itemLabel="departmentName"/>
                                    </form:select>

                                    <form:select class="dropdown-submenu col-sm-4" path="teacherId" id="teacherName">
                                        <form:option value="" selected="selected">请选择</form:option>
                                        <form:options items="${course.teachers}" itemValue="id" itemLabel="nickName" />
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">学期</label>
                                <div class="col-sm-6">
                                    <form:select class="dropdown-submenu col-sm-4" path="semesterYear" id="semester">
                                        <form:option value="" selected="selected">请选择</form:option>
                                        <form:options items="${course.semesters}" itemValue="semesterInfo" itemLabel="semesterInfo" />
                                    </form:select>

                                    <form:select class="dropdown-submenu col-sm-4" path="semesterNum" id="semesterDetail">
                                        <form:option value="1" selected="selected">第一学期</form:option>
                                        <form:option value="2" >第二学期</form:option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4">
                                    <button class="btn btn-primary" type="submit" id="submit">修改课程</button>
                                </div>
                            </div>

                        </form:form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery.validate.min.js"></script>
<script>
    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }


    $(document).ready(function () {

        //初始化selecet2插件
        $("#major").select2();
        $("#teacherName").select2();
        $("#department").select2();
        $("#semester").select2();
        $("#semesterDetail").select2();

        //表单的校验
        $("#courseForm").validate({

            rules: {
                courseCode: {
                    required: true
                },
                courseName: {
                    required: true
                },
                courseRoom: {
                    checkOption: true
                },
                teacherId: {
                    checkOption: true
                },
                semesterYear: {
                    checkOption: true
                }
            }
        });

        $.validator.addMethod("checkOption",function(value) {
            if (value === "请选择" || value == "")
                return false;
            else
                return true;
        },"必填");

        //修改默认提示信息
        $.extend($.validator.messages, {
            required: "必填"
        })
    });

    //根据编号去查询课程名称
    function queryCourse(obj) {
        var code = obj.value;
        $.ajax({
            url: "${pageContext.request.contextPath}/course/queryCourseByCode?code=" + code,
            success: function (data) {
                var $name = $("#courseName");
                if (data !== ""){
                    $name.prop("value", data);
                    $name.prop("readonly", "readonly");
                } else {
                    $name.prop("value", "");
                    $name.removeAttrs("readonly")
                }
            }
        })
    }


    //手动添加课程表单提交
    $("#submit").click(function(){
        $("#courseForm").ajaxForm({
            type:"post",
            url: "${pageContext.request.contextPath}/course/updateCourse",
            success: function(data){
                alert(data);
                location.reload();
            },
            error: function () {
                alert("修改课表失败，请重试");
            }
        });
    });

    //查询某个学院的所有的老师
    function showTeachers(obj) {
        $("#teacherName option").remove();
        $("#teacherName").append($("<option>请选择</option>"));

        var id = obj.value;

        $.ajax({
            url: "${pageContext.request.contextPath}/user/findUserByDepartmentId?id=" + id,
            success:  function(data) {
                var teacher = JSON.parse(data);
                var $option = "";

                for(var i = 0; i < teacher.length; i++){
                    $option += "<option value='" + teacher[i].id + "'>" /*+ teacher[i].code + "  "*/ + teacher[i].nickName + "</option>"
                }

                $("#teacherName").append($($option));
            }
        });

    }

</script>