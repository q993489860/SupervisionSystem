<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-7
  Date: 2018/5/26
  Time: 19:28
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
    <title>选择课程</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mobile/css/main.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mobile/css/dcalendar.picker.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mobile/css/datatables.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mobile/css/responsive.bootstrap.css"/>
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
<div class="query">
    <div class="container-fluid">
        <div class="row">
            <!--top,back-->
            <div class="top-back">
                <i class="glyphicon glyphicon-chevron-left" id="fnReturn"></i>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <!--主体-->
                <div class="content">
                    <!--content-top-->
                    <div class="zzsc-container">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12 col-xs-12 formbox">
                                        <button class="time-btn btn btn-default" id="toggle-btn" type="button">
                                            关键字
                                            <i class="glyphicon glyphicon-tag"></i>
                                        </button>
                                        <button class="search-btn btn btn-default pull-right" id="search-toggle" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    <div class="time-box" id="time-box">
                                        <!--关键字-->
                                        <div class="key">
                                            <input class="key-input" id="searchCourseInfo" type="text" name=""  placeholder="关键字" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--content-table-->
                    <div class="table-container clearfix text-center">
                        <div class="bs-example" data-example-id="bordered-table">
                            <table class="table table-striped table-bordered table-hover "
                                   id="editable">
                                <thead>
                                <tr>
                                    <th width="100">课程名称</th>
                                    <th width="100">授课地点</th>
                                    <th width="100">节数</th>
                                    <th width="100">授课老师</th>
                                    <th width="100">授课时间</th>
                                    <th width="100">授课班级</th>
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
            <!--footer-->
            <%--<div class="footer">--%>

            <%--</div>--%>
        </div>
    </div>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/resources/mobile/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/mobile/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/mobile/js/dcalendar.picker.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/mobile/js/mian.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/mobile/js/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/mobile/js/dataTables.responsive.js" type="text/javascript"></script>
<script type="text/javascript">
    $('#mydatepicker').dcalendarpicker();
    $('#mydatepicker2').dcalendarpicker({
        format: 'yyyy-mm-dd'
    });
    $('#mycalendar').dcalendar();

    var oTable;
    $(document).ready(function() {
        oTable = $('#editable').DataTable( {
            searching:false,
            responsive:true,
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
            "bProcessing": true,//开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好
            "bServerSide": true,//开启服务器模式，使用服务器端处理配置datatable。
                                // 开启此模式后，你对datatables的每个操作 每页显示多少条记录、下一页、上一页、排序（表头）、搜索，这些都会传给服务器相应的值。
            "bFilter": true,//过滤功能
            "iDisplayLength": 10,//每页显示行数
            "bLengthChange": false,//不显示每页显示行数
            "bInfo":false,//不显示页脚信息
            "sAjaxSource": "${pageContext.request.contextPath}/mobile/course/coursePage/paging",//给服务器发请求的url
            "fnServerParams": function ( aoData ) {//向服务器传额外的参数
                aoData.push( { "name": "sid", "value": "1" } );
                aoData.push( { "name": "searchCourseInfo", "value": $("#searchCourseInfo").val() });
//                aoData.push( { "name": "searchCourseDate", "value": $("#searchCourseDate").val() });
            },
            "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
//                { "mData": function(obj){ //mData 表示发请求时候本列的列名，返回的数据中相同下标名字的数据会填充到这一列
//                    return '<input type="checkbox" id="checkUserId" name="checkUserId" value="'+obj.id+'" >';
//                },"sWidth": "20px"},
                { "mData": "courseName" },
                { "mData": "courseRoom" },
                { "mData": "courseNode" },
                { "mData": "courseTeacher" },
                { "mData": "courseDate" },
                { "mData": "classes"},
                { "mData": function(obj){
                    return'<a class="btn btn-primary" href="#" onclick="attendCourse('+"'"+obj.id+"'"+')"><i class="fa fa-edit">听课</i></a>';
                }}
            ],
            "columnDefs": [ //设置每列的相对宽度
                { "orderable": false, "targets": [0,6] },
                { "width": "20%", "targets": 0 },
                { "width": "10%", "targets": 1 },
                { "width": "5%", "targets": 2 },
                { "width": "15%", "targets": 3 },
                { "width": "10%", "targets": 4 },
                { "width": "20%", "targets": 5 },
                { "width": "20%", "targets": 6 },
            ],
            "order": [[ 0, "desc" ]] //从第几列开始 按何种方式排序
        } );
    });

    function attendCourse(id) {

        $.ajax({
            url:"${pageContext.request.contextPath}/mobile/courseRecord/createCourseRecord?id="+id,
            type:"GET",
            dataType:"json",
            success:function (data) {
                if (data.success){
                    addCourseComment(id);
                }
            }
        });

        function addCourseComment() {
            $.ajax({
                url:"${pageContext.request.contextPath}/mobile/courseComment/createCourseComment?id="+id,
                type:"GET",
                dataType:"json",
                success:function (data) {
                    if (data.success){
                        redirectCommentView();
                    }else {
                        var id = data.obj;
                        window.location.href="${pageContext.request.contextPath}/mobile/courseComment/addCommentView?id="+id;
                    }
                }
            });
        }
        function redirectCommentView() {
            $.ajax({
                url:"${pageContext.request.contextPath}/mobile/courseComment/findByTime",
                dataType:"json",
                success:function (data) {
                    if (data.success){
                        var id = data.code;
                        window.location.href="${pageContext.request.contextPath}/mobile/courseComment/addCommentView?id="+id;
                    }else {
                        alert("请先完成上个听课记录");
                    }
                }
            })
        }
    }

    $("#fnReturn").click(function () {
        window.location.href="${pageContext.request.contextPath}/mobile/login";
    })
</script>
