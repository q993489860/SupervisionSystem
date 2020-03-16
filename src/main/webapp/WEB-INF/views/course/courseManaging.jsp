<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main">

    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">

                        <div style="font-size: 14px; font-family: 微软雅黑,monospace">
                            <label>请选择学期：</label>
                            <select id="semesterYear"
                                    onchange="reDrawTable()">
                                <option value="" selected="selected">请选择</option>
                            </select>

                            <select onchange="reDrawTable()" id="semesterNum">
                                <option value="" selected="selected">请选择</option>
                                <option value="1">第一学期</option>
                                <option value="2">第二学期</option>
                            </select>
                        </div>
                        <br/>

                        <p>
                            课程信息：<input id="searchCourseInfo" class="myInput" placeholder="输入课程编号、课程名、专业"/>
                            <button class="btn btn-success" type="button" id="fnClickSearch"><i
                                    class="fa fa-search"></i> <span class="bold">查询</span></button>
                            <button class="btn btn-warning" type="button" id="fnClickClear"><i
                                    class="fa fa-circle-o"></i> <span class="bold">置空</span></button>
                        </p>
                        <p>
                            <button class="btn btn-danger" type="button" id="fnClickDelRows" onclick="fnClickDeleteMore()">
                                <i class="fa fa-trash"></i>
                                <span class="bold">删除</span></button>
                        </p>

                        <table class="table table-striped table-bordered table-hover "
                               id="editable">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll" name="checkAll" onchange="checkAll(this)"/>
                                </th>
                                <th width="100">课程编号</th>
                                <th width="100">课程名称</th>
                                <th width="100">授课教师</th>
                                <th width="100">授课教室</th>
                                <th width="100">授课时间</th>
                                <th width="100">周数</th>  <%-- 根据状态在后面写上单双周 --%>
                                <th width="100">节数</th>
                                <th width="100">班级</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    //加载数据库中存在的所有学年数据
    $(document).ready(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/findAllSemester",
            success: function (data) {
                var semester = JSON.parse(data);
                var $option = "";
                for(var i = 0; i < semester.length; i++){
                    $option += "<option value=" + semester[i] + ">" + semester[i] + "</option>";
                }

                $("#semesterYear").append($($option));
            }
        });

    });

    //让页面记住用户上次选择的学期（需要浏览器支持localStorage功能）
    window.onload = function () {
        var semesterYear = localStorage.getItem("semesterYear");
        var semesterNum = localStorage.getItem("semesterNum");

        $("#semesterYear option").each(function () {
            var currentYear = $(this).val();
            if(currentYear === semesterYear) {
                $(this).attr("selected", "selected")/*.siblings().removeAttr("selected")*/;
            }
        });

        $("#semesterNum option").each(function () {
            var currentYear = $(this).val();
            if(currentYear === semesterNum) {
                $(this).attr("selected", "selected")/*.siblings().removeAttr("selected")*/;
            }
        });

        oTable.draw();
    };

    //取消全选框的勾选状态
    $(document).ready(function () {
        $("#checkAll").prop("checked", false);
    });

    var oTable;
    $(document).ready(function () {
        oTable = $('#editable').DataTable({
            searching: false,
            "sPaginationType": "simple_numbers",//默认翻页样式设置
            "oLanguage": { //下面是一些汉语翻译
                "sProcessing": "<span style='color:#1c9dd4;'>数据加载中...</span>",
                "sLengthMenu": "每页显示  _MENU_ 条记录",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "抱歉， 没有找到数据",
                "sInfoEmpty": "没有数据"
            },
            "bAutoWidth": true, //自动宽度
            "bProcessing": true,//开启读取服务器数据时显示正在加载中……特别d是大数据量的时候，开启此功能比较好
            "bServerSide": true,//开启服务器模式，使用服务器端处理配置datatable。
                                // 开启此模式后，你对datatables的每个操作 每页显示多少条记录、下一页、上一页、排序（表头）、搜索，这些都会传给服务器相应的值。
            "bFilter": true,//过滤功能
            "iDisplayLength": 10,//每页显示行数
            "bLengthChange": true,//改变每页显示行数
            "sAjaxSource": "${pageContext.request.contextPath}/course/coursePage/paging",//给服务器发请求的url
            "fnServerParams": function (aoData) {//向服务器传额外的参数
                aoData.push({"name": "searchCourseInfo", "value": $("#searchCourseInfo").val()});
                aoData.push({"name": "semesterYear", "value": $("#semesterYear").val()});
                aoData.push({"name": "semesterNum", "value": $("#semesterNum").val()});

            },
            "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
                {
                    "mData": function (obj) { //mData 表示发请求时候本列的列名，返回的数据中相同下标名字的数据会填充到这一列
                        return '<input type="checkbox" id="courseId" name="courseId" value="' + obj.courseId + '" >';
                    }, "sWidth": "20px"
                },
                {"mData": "courseCode"},
                {"mData": "courseName"},
                {"mData": "courseTeacher"},
                {"mData": "courseRoom"},
                {"mData": "courseDate"},
                {"mData": "courseWeek"},
                {"mData": "courseNode"},
                {"mData": "courseClass"},
                {
                    "mData": function (obj) {
                        var operate = '<a class="btn btn-primary" href="${pageContext.request.contextPath}/course/updateCoursePage?id='+obj.courseId+'"><i class="fa fa-edit">修改</i></a> | ' +'&nbsp;&nbsp;';
                        operate += '<button class="btn btn-danger" onclick="fnClickDeleteOne(this);" value="' + obj.courseId + '"><i class="fa fa-trash">删除</i> </button>';
                        return operate;
                    }
                }
            ],
            "columnDefs": [ //设置每列的相对宽度
                {"orderable": false, "targets": [0, 2, 3, 4, 8, 9]},
                {"width": "5%", "targets": 0},
                {"width": "10%", "targets": 1},
                {"width": "10%", "targets": 2},
                {"width": "10%", "targets": 3},
                {"width": "10%", "targets": 4},
                {"width": "8%", "targets": 5},
                {"width": "10%", "targets": 6},
                {"width": "10%", "targets": 7},
                {"width": "15%", "targets": 8},
                {"width": "12%", "targets": 9}
            ],
            "order": [[1, "asc"]] //从第几列开始 按何种方式排序
        });

    });

    //重绘表格
    function reDrawTable() {
        if(localStorageSupport()){
            //存入查看课表的学期信息
            localStorage.setItem("semesterYear", $("#semesterYear").val());
            localStorage.setItem("semesterNum", $("#semesterNum").val())
        }
        oTable.draw();
        $("#checkAll").prop("checked", false);
    }

    //选中本页所有复选框
    function checkAll(obj) {
        var $checked = $(obj).prop("checked");
        $("td input[type='checkbox']").each(function () {
            $(this).prop("checked", $checked);
        });
        $(obj).prop("checked", $checked);
    }

    //根据搜索框的内容，重绘表格
    $('#fnClickSearch').click(function () {
        oTable.draw();
    });

    //清空输入框内容，重绘表格
    $('#fnClickClear').click(function () {
        $("#searchCourseInfo").val("");
        oTable.draw();
    });

    //删除课程记录
    function fnClickDeleteMore() {
        var arr = [];
        $("[name=courseId]:checkbox").each(function () {
            if ($(this).prop("checked")) {
                arr.push($(this).val());
            }
        });

        if (arr.length == 0) {
            alert("请选择要删除的课程！")
            return;
        }

        if (confirm("确认删除？")) {
            $.ajax({
                url: '${pageContext.request.contextPath }/course/deleteCourse?ids=' + arr,
                cache: false,
                success: function (data) {
                    alert(data);
                    $("#checkAll").prop("checked", false);
                    oTable.draw();
                }
            })
        }
    }

    function fnClickDeleteOne(obj) {
        var arr = [];
        arr.push(obj.value);
        if (confirm("确认删除？")) {
            $.ajax({
                url: '${pageContext.request.contextPath }/course/deleteCourse?ids=' + arr,
                cache: false,
                success: function (data) {
                    alert(data);
                    $("#checkAll").prop("checked", false);
                    oTable.draw();
                }
            })
        }
    }

</script>
