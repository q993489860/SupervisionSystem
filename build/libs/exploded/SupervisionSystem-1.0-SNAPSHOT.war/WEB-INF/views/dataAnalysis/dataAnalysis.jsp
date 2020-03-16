<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-41
  Date: 2018/4/25
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--同一教师模态框窗口--%>
<div class="modal fade" id="myTeacherModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myTeacherModalLabel">
                    图表分析
                </h4>
            </div>
            <div class="modal-body">
                教师姓名: <input type="text" id="teacherName" name="teacherName" class="myInput"
            />
                <button class="btn btn-success" type="button" id="myTeacherButton" onclick=findTeacher()><i
                        class="fa fa-search"></i> <span class="bold">查询</span></button>
                <div id="teacherChart"></div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--听课记录模态框窗口--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:1200px; height:900px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    图表分析
                </h4>
            </div>
            <div class="modal-body">
                <form id="analysisData">
                    <label for="myDe" class="col-sm-2 control-label">选择院系</label>
                    <%--创建下拉选项选择院系--%>
                    <select id="myDe" name="de" class="form-control"></select>
                    <div class="form-group">
                        <label for="startYear" class="col-sm-2 control-label">开始年份</label>
                        <div class="col-sm-9">
                            <input type="text" id="startYear" name="startYear" readonly="readonly" class="form-control"
                                   placeholder="开始年份"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="endYear" class="col-sm-2 control-label">结束年份</label>
                        <div class="col-sm-9">
                            <input type="text" id="endYear" name="endYear" readonly="readonly"
                                   class="form-control"
                                   placeholder="结束年份"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="semesterNum" class="col-sm-2 control-label">学期</label>
                        <div class="col-sm-9">
                            <input type="text" name="semesterNum" id="semesterNum" class="form-control"
                                   placeholder="学期"/>
                        </div>
                    </div>
                    <button class="btn btn-success" type="button" id="myButton" onclick=selectComment()><i
                            class="fa fa-search"></i> <span class="bold">查询</span></button>
                    <%--<option value="" selected="selected" class="myInput">请选择院系</option>--%>
                </form>
                <%--生成折线图所用到的div这个是所有的教师用到的折线图--%>
                <div id="myChart"></div>
                <%--是某个院系所用到的折线图--%>
                <div id="deMyChart"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--数据表格所在的div--%>
<div class="main">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <p>
                            院系：<select id="department" name="department" class="myInput">
                            <option value="" selected="selected" class="myInput">请选择院系</option>
                        </select>
                            课程名称：<input type="text" name="courseName" class="myInput" id="courseName"/>
                            用户名称关键字：<input id="keyName" type="text" name="name" class="myInput"/>
                            <button class="btn btn-success" type="button" id="fnClickSearch"><i
                                    class="fa fa-search"></i> <span class="bold">查询</span></button>
                            <button class="btn btn-warning" type="button" id="fnClickClear">
                                <i class="fa fa-circle-o"></i> <span class="bold">置空</span></button>
                        </p>
                        <p>
                            <button class="btn btn-info " type="button" id="export" onclick=myExportData()><i
                                    class="fa fa-cloud-download"></i>导出全部汇总评价数据
                            </button>
                            <button class="btn btn-info" type="button" onclick="createChart()"><i
                                    class="fa fa-plus-square-o"></i>&nbsp;听课记录折线图
                            </button>
                            <button class="btn btn-info" type="button" onclick="createTeacherChart()"><i
                                    class="fa fa-plus-square-o"></i>&nbsp;同一教师评分图
                            </button>
                        </p>
                        <table class="table table-striped table-bordered table-hover "
                               id="editable">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll" onchange="ckeckAll(this)"/></th>
                                <th width="100">评分</th>
                                <th width="100">开始年份</th>
                                <th width="100">结束年份</th>
                                <th width="100">学期</th>
                                <th width="100">院系</th>
                                <th width="100">应到人数</th>
                                <th width="100">实到人数</th>
                                <th width="100">教师名称</th>
                                <th width="100">课程名称</th>
                                <%--<th width="100">操作</th>--%>
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
<%--数据表格加载数据--%>
<script type="text/javascript">
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
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": ""
            },
            "bAutoWidth": true, //自动宽度
            "bProcessing": true,//开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好
            "bServerSide": true,//开启服务器模式，使用服务器端处理配置datatable。
                                // 开启此模式后，你对datatables的每个操作 每页显示多少条记录、下一页、上一页、排序（表头）、搜索，这些都会传给服务器相应的值。
            "bFilter": true,//过滤功能
            "iDisplayLength": 10,//每页显示行数
            "bLengthChange": true,//改变每页显示行数
            "sAjaxSource": "${pageContext.request.contextPath}/analysis/showComment",//给服务器发请求的url
            "fnServerParams": function (aoData) {//向服务器传额外的参数
                aoData.push({"name": "courseName", "value": $("#courseName").val()});
                aoData.push({"name": "department", "value": $("#department").val()});
                aoData.push({"name": "name", "value": $("#keyName").val()});
            },
            "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
                {
                    "mData": function (obj) { //mData 表示发请求时候本列的列名，返回的数据中相同下标名字的数据会填充到这一列
                        return '<input type="checkbox" id="checkUserId" name="checkUserId" value="' + obj.id + '" >';
                    }, "sWidth": "20px"
                },
                {"mData": "score"},
                {"mData": "startYear"},
                {"mData": "endYear"},
                {"mData": "semesterNum"},
                {"mData": "departmentName"},
                {"mData": "totalCount"},
                {"mData": "presentCount"},
                {"mData": "teacherName"},
                {"mData": "courseName"},
                <%--{ "mData": function(obj){--%>
                <%--var operate = '<a class="btn btn-primary" href="${pageContext.request.contextPath}/user/viewUser?id='+obj.id+'"><i class="fa fa-edit">修改</i></a> | ' +'&nbsp;&nbsp;';--%>
                <%--operate += '<a class="btn btn-primary" href="#" onclick="resetUserPassword('+"'"+obj.id+"'"+')"><i class="fa fa-edit">重置密码</i></a>' +'&nbsp;&nbsp;';--%>
                <%--return operate;--%>
                <%--}}--%>
            ],
            "columnDefs": [ //设置每列的相对宽度
//                { "orderable": false, "targets": [0,6] },
//                { "width": "5%", "targets": 0 },
//                { "width": "10%", "targets": 1 },
//                { "width": "10%", "targets": 2 },
//                { "width": "15%", "targets": 3 },
//                { "width": "15%", "targets": 4 },
//                { "width": "15%", "targets": 5 },
//                { "width": "15%", "targets": 6 },
//                { "width": "15%", "targets": 7 }
                {
                    'targets': [ 0, 2, 3, 4,5,6,7,8,9],    //除第1列外，都默认不排序
                    'orderable': false
                }
            ],
            "order": [[1, "desc"]] //从第几列开始 按何种方式排序
        });

    });

    $('#fnClickSearch').click(function () {
        oTable.draw();
    });

    $('#fnClickClear').click(function () {
        $("#searchUserInfo").val("");
        $("#searchState").val("");
        oTable.draw();
    });

    function ckeckAll(obj) {
        var $checked = $(obj).prop("checked");
        $("td input[type='checkbox']").each(function () {
            $(this).prop("checked", $checked);
        });
        $(obj).prop("checked", $checked);
    }

</script>
<%--生成下拉选项的js--%>
<script type="text/javascript">
    $.get("${pageContext.request.contextPath }/department/findAllDepartment", function (data) {
        var department = JSON.parse(data);
        for (var i = 0; i < department.length; i++) {
            var id = department[i].id;
            var name = department[i].name;
            var opt = "<option value='" + id + "'>" + name + "</option>";
            $("#department").append(opt);
        }
    });
</script>
<%--点击查询按钮触发的事件--%>
<script type="text/javascript">
    function selectUser() {
        $("#editable").ajax.reload();
    }
</script>
<%--点击导出按钮触发的事件${pageContext.request.contextPath}/analysis/download--%>
<script type="text/javascript">
    function myExportData() {
        window.location.href = "${pageContext.request.contextPath}/analysis/download"
    }
</script>
<%--点击生成图表触发的事件--%>
<script type="text/javascript">
    function createChart() {
        $("#myModal").modal('show');
        $.get("${pageContext.request.contextPath }/department/findAllDepartment", function (data) {
            $("#myDe").empty();
            $("#myDe").append("<option value='' selected='selected' >请选择院系</option>");
            var department = JSON.parse(data);
            for (var i = 0; i < department.length; i++) {
                var id = department[i].id;
                var name = department[i].name;
                var opt = "<option value='" + id + "'>" + name + "</option>";
                $("#myDe").append(opt);
            }
        });
        //ajax获取数据
        $.post("${pageContext.request.contextPath }/analysis/getAll", $("#analysisData").serialize(), function (data) {
            $('#myChart').highcharts({
                title: {
                    text: '巢湖学院听课记录分数折线图',
                    x: -20 //center
                },
                subtitle: {
                    text: '汇总数据',
                    x: -20
                },
                xAxis: {
                    title: {
                        text: '听课记录'
                    },
                    categories: data.categories
                },
                yAxis: {
                    title: {
                        text: '评分'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true          // 开启数据标签
                        },
                        enableMouseTracking: true // 关闭鼠标跟踪，对应的提示框、点击事件会失效
                    }
                },
                tooltip:{
                    formatter:function(){
                        return '</b> 评分=' + this.y + ', 课程名称='+this.point.courseName + ', 日期='+this.point.date;
                    }
                },
                series: [{
                    name: data.highChartSeries.names,
                    data: data.highChartSeries.data
                }]
                ,
                credits: {
                    enabled: false     //不显示LOGO
                }
            });

        });
    }
</script>
<%--日期控件--%>
<script type="text/javascript">
    $(function () {
        $('#startYear').datetimepicker({
            format: 'yyyy',
            weekStart: 1,
            autoclose: true,
            startView: 4,
            minView: 4,
            forceParse: false,
            language: 'zh-CN'
        });
        $('#endYear').datetimepicker({
            format: 'yyyy',
            weekStart: 1,
            autoclose: true,
            startView: 4,
            minView: 4,
            forceParse: false,
            language: 'zh-CN'
        });
    });
</script>
<%--点击模态框的查询 对应的函数 在此处--%>
<script type="text/javascript">
    function selectComment() {
        $.post("${pageContext.request.contextPath }/analysis/getAll", $("#analysisData").serialize(), function (data) {
            $('#myChart').highcharts({
                title: {
                    text: '巢湖学院听课分数折线图',
                    x: -20 //center
                },
                subtitle: {
                    text: '汇总数据',
                    x: -20
                },
                xAxis: {
                    title: {
                        text: '听课记录'
                    },
                    categories: data.categories
                },
                yAxis: {
                    title: {
                        text: '评分'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: ''
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true          // 开启数据标签
                        },
                        enableMouseTracking: true // 关闭鼠标跟踪，对应的提示框、点击事件会失效
                    }
                },
                tooltip:{
                    formatter:function(){
                        return '</b> 评分=' + this.y + ', 课程名称='+this.point.courseName + ', 日期='+this.point.date;
                    }
                },
                series: [{
                    name: data.highChartSeries.names,
                    data: data.highChartSeries.data
                }]
                ,
                credits: {
                    enabled: false     //不显示LOGO
                }
            });

        });
    }
</script>
<%--同一教师历年评分--%>
<script type="text/javascript">
    function createTeacherChart() {
        $("#myTeacherModal").modal('show');
    }

    function findTeacher() {
        var jQuery = $("#teacherName").val();

        $.get("${pageContext.request.contextPath}/analysis/getTeacher", { "teacherName":jQuery },
            function(data){
                $('#teacherChart').highcharts({
                    title: {
                        text: '同一教师历年听课记录分数折线图',
                        x: -20 //center

                    },

                    subtitle: {
                        text: '汇总数据',
                        x: -20
                    },
                    xAxis: {
                        title: {
                            text: '听课记录'
                        },
                        categories: data.categories
                    },
                    yAxis: {
                        title: {
                            text: '评分'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        valueSuffix: ''
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    plotOptions: {
                        line: {
                            dataLabels: {
                                enabled: true          // 开启数据标签
                            },
                            enableMouseTracking: true // 关闭鼠标跟踪，对应的提示框、点击事件会失效
                        }
                    },
                    tooltip:{
                        formatter:function(){
                            return '</b> 评分=' + this.y + ', 日期='+this.point.date;
                        }
                    },
                    series: [{
                        name: data.highChartSeries.names,
                        data: data.highChartSeries.data
                    }]
                    ,
                    credits: {
                        enabled: false     //不显示LOGO
                    }
                });
            });
    }

    $('#fnClickClear').click( function () {
        $("#department").val("");
        $("#courseName").val("");
        $("#keyName").val("");
        oTable.draw();
    } );
</script>

