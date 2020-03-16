<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-41
  Date: 2018/4/18
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main">
    <input id="showPersonTask" type="hidden"/>
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <p>
                            院系：<select id="department" name="department" class="myInput">
                            <option value="" selected="selected" class="myInput">请选择院系</option>
                        </select>
                            编号：<input type="text" name="userCode" class="myInput" id="userCode"/>
                            用户名称关键字：<input id="keyName" type="text" name="name" class="myInput"/>
                            <button class="btn btn-success" type="button" id="fnClickSearch" onclick=selectUser()><i
                                    class="fa fa-search"></i> <span class="bold">查询</span></button>
                            <button class="btn btn-warning" type="button" id="fnClickClear"><i class="fa fa-circle-o"></i> <span class="bold">置空</span></button>

                        </p>
                        <p>

                        </p>
                        <table class="table table-striped table-bordered table-hover "
                               id="editable">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll" onchange="ckeckAll(this)"/></th>
                                <th width="100">编号</th>
                                <th width="100">姓名</th>
                                <th width="100">所在院系</th>
                                <th width="100">手机号码</th>
                                <th width="100">邮箱地址</th>
                                <th width="100">角色</th>
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
<%--模态框窗口--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:800px; height:500px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    请设置任务量
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="setTask"
                >
                    <%--获取当前督导员的编号放到隐藏域--%>
                    <input type="hidden" name="supervisionCode" id="supervisionCode">
                    <div class="form-group">
                        <label for="courseTimes" class="col-sm-2 control-label">任务量</label>
                        <div class="col-sm-9">
                            <input type="text" id="courseTimes" name="courseTimes" class="form-control well"
                                   placeholder="设置任务量"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="startYear" class="col-sm-2 control-label">开始年份</label>
                        <div class="col-sm-9">
                            <input type="text" id="startYear" name="startYear" readonly="readonly" class="form-control
                                   well,form-control input-sm"
                                   placeholder="开始年份"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="endYear" class="col-sm-2 control-label">结束年份</label>
                        <div class="col-sm-9">
                            <input type="text" id="endYear" name="endYear" readonly="readonly"
                                   class="form-control well,form-control input-sm"
                                   placeholder="结束年份"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="semesterNum" class="col-sm-2 control-label">第几学期</label>
                        <div class="col-sm-9">
                            <input type="text" name="semesterNum" id="semesterNum" class="form-control well,"
                                   placeholder="第几学期"/>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="submitTask()">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--显示选中督导员任务详情--%>
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:1000px; height:500px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    当前督导员任务量
                </h4>
            </div>
            <div class="modal-body">
                <div class="main">
                    <div class="wrapper wrapper-content  animated fadeInRight">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="ibox float-e-margins">
                                    <div class="ibox-content">
                                        <p>

                                        </p>
                                        <p>

                                        </p>
                                        <table class="table table-striped table-bordered table-hover "
                                               id="editable1" width="100%" >
                                            <thead>
                                            <tr>
                                                <th><input type="checkbox" id="checkAll1" onchange="ckeckAll(this)"/>
                                                </th>
                                                <th width="100">当前督导员</th>
                                                <th width="100">任务量</th>
                                                <th width="100">完成数量</th>
                                                <th width="100">开始年份</th>
                                                <th width="100">结束年份</th>
                                                <th width="100">学期</th>
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
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
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
            "sAjaxSource": "${pageContext.request.contextPath}/task/showSupervision",//给服务器发请求的url
            "fnServerParams": function (aoData) {//向服务器传额外的参数
//                //判断是不是查询所有督导员的
//                aoData.push({"name": "roleCode", "value": "2"});
                aoData.push({"name": "userCode", "value": $("#userCode").val()});
                aoData.push({"name": "department", "value": $("#department").val()});
                aoData.push({"name": "name", "value": $("#keyName").val()});
//                aoData.push( { "name": "searchState", "value": $("#searchState").val() });
            },
            "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
                {
                    "mData": function (obj) { //mData 表示发请求时候本列的列名，返回的数据中相同下标名字的数据会填充到这一列
                        return '<input type="checkbox" id="checkUserId" name="checkUserId" value="' + obj.userCode + '" >';
                    }, "sWidth": "20px"
                },
                {"mData": "userCode"},
                {"mData": "nickName"},
                {"mData": "departmentName"},
                {"mData": "phoneNumber"},
                {"mData": "email"},
                {"mData": "roleName"},
                {
                    "mData": function (obj) {
                        var code = obj.userCode;
                        var operate =
                            '<a class="btn btn-primary" href="javascript:void(0)" onclick=createModal(' + code + ')><i class="fa fa-edit">设置任务量</i></a> | ' + '&nbsp;&nbsp;';
                        operate +=
                            '<a class="btn btn-primary" href="javascript:void(0)" onclick=showTask(' + code + ') ><i class="fa fa-edit">任务详情</i></a>' + '&nbsp;&nbsp;';
                        return operate;
                    }
                }
            ],
            "columnDefs": [ //设置每列的相对宽度
                {"orderable": false, "targets": [0, 6]},
                {"width": "5%", "targets": 0},
                {"width": "10%", "targets": 1},
                {"width": "10%", "targets": 2},
                {"width": "15%", "targets": 3},
                {"width": "12%", "targets": 4},
                {"width": "15%", "targets": 5},
                {"width": "15%", "targets": 6},
                {"width": "18%", "targets": 7},
                {
                    'targets': [ 0, 2, 3, 4,5,6,7],    //除第1列外，都默认不排序
                    'orderable': false
                }
            ],
            "order": [[1, "desc"]] //从第几列开始 按何种方式排序
        });


    });

    $('#fnClickSearch').click(function () {
        oTable.draw();
    });
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

    $.ajax({
        url: "${pageContext.request.contextPath}/department/findAllDepartment",
        type:"GET",
        success: function (data) {
            var department = JSON.parse(data);
            var $option = "";
            for(var i = 0; i < department.length; i++){
                $option += "<option value='" + department[i].id + "'>" + department[i].name + "</option>";
            }

            $("#department").append($($option));
        },
        error:function (msg) {
            alert("出错了");
        }
    });

    <%--创建模态框--%>
    function createModal(code) {
        $("#myModal").modal('show');
        $("#supervisionCode").val(code);

    };
    //关闭模态框
    //    function closeMyModal() {
    //    $("#myModal2").modal('hide');
    //    };

    //    创建任务详情任务框
    function showTask(code) {
        $("#showPersonTask").val(code);
        $("#myModal2").modal('show');
        var oTable;
        oTable = $('#editable1').DataTable({
            retrieve: true,
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
            "bProcessing": true,//开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好
            "bServerSide": true,//开启服务器模式，使用服务器端处理配置datatable。
                                // 开启此模式后，你对datatables的每个操作 每页显示多少条记录、下一页、上一页、排序（表头）、搜索，这些都会传给服务器相应的值。
            "bFilter": true,//过滤功能
            "iDisplayLength": 10,//每页显示行数
            "bLengthChange": true,//改变每页显示行数
            "sAjaxSource": "${pageContext.request.contextPath}/task/showTask",//给服务器发请求的url
            "fnServerParams": function (aoData) {//向服务器传额外的参数
                aoData.push({"name": "code", "value": $("#showPersonTask").val()});
//                aoData.push( { "name": "searchState", "value": $("#searchState").val() });
            },
            "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
                {
                    "mData": function (obj) { //mData 表示发请求时候本列的列名，返回的数据中相同下标名字的数据会填充到这一列
                        return '<input type="checkbox" id="checkTaskId" name="checkTaskId" value="' + obj.id + '" >';
                    }, "sWidth": "20px"
                },
                {"mData": "nickName"},
                {"mData": "courseTimes"},
                {"mData": "finishTimes"},
                {"mData": "startYear"},
                {"mData": "endYear"},
                {"mData": "semesterNum"},
                {
                    "mData": function (obj) {
                        var operate =
                            '<a class="btn btn-primary" href="#" onclick="deletTask(' + "'" + obj.id + "'" +
                            ')"><i class="fa fa-edit">删除任务</i></a>' + '&nbsp;&nbsp;';
                        return operate;
                    }
                }
            ],
            "columnDefs": [ //设置每列的相对宽度
                {"orderable": false, "targets": [0, 6]},
                {"width": "5%", "targets": 0},
                {"width": "10%", "targets": 1},
                {"width": "10%", "targets": 2},
                {"width": "15%", "targets": 3},
                {"width": "15%", "targets": 4},
                {"width": "15%", "targets": 5},
                {"width": "15%", "targets": 6},
                {"width": "15%", "targets": 7},
                {
                    'targets': [ 1, 2, 3, 4,5,6,7],    //除第1列外，都默认不排序

                }
            ],
            "order": [[1, "desc"]] //从第几列开始 按何种方式排序
        });


    };

    //提交模态框中的表单
    function submitTask() {
//        异步提交表单
        var a = $("#setTask").serialize();
        $.ajax({
            url: "${pageContext.request.contextPath}/task/saveTask",//提交地址
            data: a,//将表单数据序列化
            type: "POST",
            dataType: "json",
            success: function (result) {

            }
        });
        $("#myModal").modal('hide');
    }

<%--关闭模态框执行的方法一定先清空原数据--%>

    $(function () {
        $('#myModal2').on('hide.bs.modal', function () {
            var datatable = $("#editable1").dataTable();
            datatable.fnClearTable();    //清空数据
            datatable.fnDestroy();         //销毁datatable
        })

    });

<%--点击查询按钮dataTables刷新--%>
    function selectUser() {
        $("#editable").ajax.reload();
    }
<%--点击删除按钮出发的事件--%>
    function deletTask(id) {
        $.get("${pageContext.request.contextPath}/task/deletTask", {"id": id});
        $("#myModal2").modal("hide");
    }

    $('#fnClickClear').click( function () {
        $("#department").val("");
        $("#userCode").val("");
        $("#keyName").val("");
        oTable.draw();
    } );
</script>

