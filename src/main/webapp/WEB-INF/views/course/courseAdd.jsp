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
                        <h5>导入excel文件中的课表信息</h5>
                    </div>
                    <div class="ibox-content">

                        <form class="form-horizontal"
                              enctype="multipart/form-data" id="file_form">

                            <div class="form-group">
                                <label class="col-sm-4 control-label">请上传课表的excel文件</label>
                                <div class="col-sm-4">
                                    <input type="file" style="border: none"  name="excel_file" id="file"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4">
                                    <button class="btn btn-primary" type="button" id="submit_file">添加课程</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="ibox-title">
                        <h5>手动添加课表</h5>
                    </div>
                    <div class="ibox-content">
                        <form id="courseForm" class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-4 control-label">课程编号</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="courseCode" onkeyup="queryCourse(this)"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">课程名称</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="courseName" id="courseName"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">授课教室</label>
                                <div class="col-sm-4">
                                    <input class="form-control" name="courseRoom" id="courseRoom"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">单双周</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="oddEven">
                                        <option value="全周">全周</option>
                                        <option value="单周">单周</option>
                                        <option value="双周">双周</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">授课时间</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="courseDate">
                                        <option value="星期一">星期一</option>
                                        <option value="星期二">星期二</option>
                                        <option value="星期三">星期三</option>
                                        <option value="星期四">星期四</option>
                                        <option value="星期五">星期五</option>
                                        <option value="星期六">星期六</option>
                                        <option value="星期七">星期日</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">课程开始节数</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="courseNode">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">课程节数</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="courseNum">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="6">6</option>
                                        <option value="8">8</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">起始周</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="startWeek">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">结束周</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="endWeek">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">年级</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="grade">
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">专业</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="major" id="major">
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">班级</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="classes">
                                        <option value="1">1班</option>
                                        <option value="2">2班</option>
                                        <option value="3">1班和2班</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">授课教师</label>
                                <div class="col-sm-6">
                                    <select class="dropdown-submenu col-sm-4"
                                            onchange="showTeachers(this)" id="department">
                                        <option value="" selected="selected">请选择</option>
                                    </select>

                                    <select class="dropdown-submenu col-sm-4" name="teacherId" id="teacher_name">
                                        <option value="" selected="selected">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">学期</label>
                                <div class="col-sm-6">
                                    <select class="dropdown-submenu col-sm-4" name="semesterYear" id="semester">
                                    </select>

                                    <select class="dropdown-submenu col-sm-4" name="semesterNum" id="semester_detail">
                                        <option value="1" selected="selected">第一学期</option>
                                        <option value="2" >第二学期</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4">
                                    <button class="btn btn-primary" type="submit" id="submit">添加课程</button>
                                </div>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery.validate.min.js"></script>
<script>
    $(document).ready(function () {

        //初始化selecet2插件
        $("#major").select2();
        $("#teacher_name").select2();
        $("#department").select2();
        $("#semester").select2();
        $("#semester_detail").select2();

        //初始化所有部门
        $.ajax({
            url: "${pageContext.request.contextPath}/department/findAllDepartment",
            success: function (data) {
                var department = JSON.parse(data);
                var $option = "";
                for(var i = 0; i < department.length; i++){
                    $option += "<option value='" + department[i].id + "'>" + department[i].name + "</option>";
                }

                $("#department").append($($option));
            }
        });

        //初始化所有的学年
        $.ajax({
            url: "${pageContext.request.contextPath}/findAllSemester",
            success: function (data) {
                var semester = JSON.parse(data);
                var $option = "";
                for(var i = 0; i < semester.length; i++){
                    $option += "<option value='" + semester[i] + "'>" + semester[i] + "</option>";
                }

                $("#semester").append($($option));
            }
        });

        //初始化所有的专业
        $.ajax({
            url: "${pageContext.request.contextPath}/findAllMajor",
            success: function (data) {
                var major = JSON.parse(data);
                var $option = "";
                for(var i = 0; i < major.length; i++){
                    $option += "<option value='" + major[i].majorName + "'>" + major[i].majorName + "</option>";
                }

                $("#major").append($($option));
            }
        });

        //表单的校验(根据name属性)
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
                }
            }/*,

            errorPlacement: function (error, element) { //指定错误信息位置
                if (element.is('select')) {
                    error.insertAfter(element.parent()); //将错误信息添加当前元素的父结点后面
                } else {
                    error.insertAfter(element);
                }
            }*/

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
            url: "${pageContext.request.contextPath}/course/addCourseByFile" ,
            success: function(data){
                alert(data);
            }
        });
    });

    //手动添加课程表单提交
    $("#submit").click(function(){
        $("#courseForm").ajaxForm({
            type:"post",
            url: "${pageContext.request.contextPath}/course/addCourseManual",
            success: function(data){
                alert(data);
                location.reload();
            },
            error: function () {
                alert("添加课表失败，请重试");
            }
        });
    });

    //查询某个学院的所有的老师
    function showTeachers(obj) {
        $("#teacher_name option").remove();
        $("#teacher_name").append($("<option>请选择</option>"));

        var id = obj.value;

        $.ajax({
            url: "${pageContext.request.contextPath}/user/findUserByDepartmentId?id=" + id,
            success:  function(data) {
                var teacher = JSON.parse(data);
                var $option = "";

                for(var i = 0; i < teacher.length; i++){
                    $option += "<option value='" + teacher[i].id + "'>" + /*teacher[i].code + "  " +*/ teacher[i].nickName + "</option>"
                }

                $("#teacher_name").append($($option));
            }
        });

    }

</script>