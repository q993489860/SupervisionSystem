<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main">
    <%--保存课程评论id的值--%>
    <input type="hidden" value="" id="courseCommentID"/>

    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <p>
                            记录信息：<input id="searchRecordInfo" class="myInput"/>
                            <button class="btn btn-success" type="button" id="fnClickSearch"><i
                                    class="fa fa-search"></i> <span class="bold">查询</span></button>
                            <button class="btn btn-warning" type="button" id="fnClickClear"><i
                                    class="fa fa-circle-o"></i> <span class="bold">置空</span></button>
                        </p>
                        <%--<p>--%>
                            <%--<button class="btn btn-danger" type="button" id="fnClickDelRows" onclick="fnClickDelete()">--%>
                                <%--<i class="fa fa-trash"></i>--%>
                                <%--<span class="bold">删除</span></button>--%>

                        <%--</p>--%>
                        <table class="table table-striped table-bordered table-hover "
                               id="editable">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll" name="checkAll" onchange="checkAll(this)"/>
                                </th>
                                <th width="100">创建时间</th>
                                <th width="100">督导专家名</th>
                                <th width="100">授课教师</th>
                                <th width="100">教授课程</th>
                                <th width="100">应到人数</th>
                                <th width="100">实到人数</th>
                                <th width="100">评分</th>
                                <th width="100">状态</th>
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

<jsp:include page="../courseComment/courseCommentDetails.jsp"/>

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
                "sInfoEmpty": "没有数据"
            },
            "bAutoWidth": true, //自动宽度
            "bProcessing": true,//开启读取服务器数据时显示正在加载中……特别d是大数据量的时候，开启此功能比较好
            "bServerSide": true,//开启服务器模式，使用服务器端处理配置datatable。
                                // 开启此模式后，你对datatables的每个操作 每页显示多少条记录、下一页、上一页、排序（表头）、搜索，这些都会传给服务器相应的值。
            "bFilter": true,//过滤功能
            "iDisplayLength": 10,//每页显示行数
            "bLengthChange": true,//改变每页显示行数
            "sAjaxSource": "${pageContext.request.contextPath}/check/checkedManage",//给服务器发请求的url
            "fnServerParams": function (aoData) {//向服务器传额外的参数
                aoData.push({"name": "searchRecordInfo", "value": $("#searchRecordInfo").val()});
                //状态为1，表明这是未审核的课堂记录
                aoData.push({"name": "state", "value": 2});
            },
            "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
                {
                    "mData": function (obj) { //mData 表示发请求时候本列的列名，返回的数据中相同下标名字的数据会填充到这一列
                        return '<input type="checkbox" id="checkCommentId" name="checkCommentId" value="' + obj.id + '" >';
                    }, "sWidth": "20px"
                },
                {"mData": "updateDate"},
                {"mData": "commentTeacherName"},
                {"mData": "teacherName"},
                {"mData": "courseName"},
                {"mData": "totalCount"},
                {"mData": "presentCount"},
                {"mData": "score"},
                {
                    "mData": function (obj) {
                        if (obj.state === 2)
                            return "<font color='green'>审核通过 </font>";
                        else
                            return "<font color='red'>审核未通过 </font>";
                    }
                },
                {
                    "mData": function (obj) {
                        var operate = '<button class="btn btn-info" onclick="fnClickDetails(this);" value="' + obj.id + '"><i class="fa fa-eye">详情</i> </button>';
                        return operate;
                    }
                }
            ],
            "columnDefs": [ //设置每列的相对宽度
                {"orderable": false, "targets": [0, 2, 3, 4, 8, 9]},
                {"width": "5%", "targets": 0},
                {"width": "15%", "targets": 1},
                {"width": "10%", "targets": 2},
                {"width": "10%", "targets": 3},
                {"width": "15%", "targets": 4},
                {"width": "10%", "targets": 5},
                {"width": "10%", "targets": 6},
                {"width": "10%", "targets": 7},
                {"width": "10%", "targets": 8},
                {"width": "5%", "targets": 9}
            ],
            "order": [[1, "asc"]] //从第几列开始 按何种方式排序
        });
    });

    //查看课堂记录详情
    function fnClickDetails(obj) {
        var id = obj.value;
        $("#courseCommentID").attr("value", id);
        $('#courseCommentDetails').modal('show');
    }

    //  绑定模态框展示的方法
    $("#courseCommentDetails").on("show.bs.modal", function (e) {
        //获取课程id的值
        var id = $("#courseCommentID").attr("value");
        //    获得模态框本身
        var modal = $(this);

        $.ajax({
            url: "${pageContext.request.contextPath}/check/findCourseCommentByID",
            type: "POST",
            data: "id=" + id,
            success: function (data) {
                var obj = JSON.parse(data);
                //通过按钮不显示
                modal.find(".modal-body #operating").css("display", "none");
                //填充模态框文本框的值
                modal.find(".modal-body #commentId").val(obj.id);
                modal.find(".modal-body #commentTeacherName").val(obj.commentTeacherName);
                modal.find(".modal-body #teacherName").val(obj.teacherName);
                modal.find(".modal-body #courseName").val(obj.courseName);
                modal.find(".modal-body #totalCount").val(obj.totalCount);
                modal.find(".modal-body #presentCount").val(obj.presentCount);
                modal.find(".modal-body #score").val(obj.score);
                modal.find(".modal-body #comment").val(obj.comment);
                modal.find(".modal-body #proposal").val(obj.proposal);
            }

        });

    });

    //使所勾选的课堂记录通过（界面上方）
    function fnClickPass() {
        var arr = [];
        $("[name=checkCommentId]:checkbox").each(function () {
            if ($(this).prop("checked")) {
                arr.push($(this).val());
            }
        });

        if (arr.length == 0) {
            alert("请选择要通过的课堂记录！")
            return;
        }

        pass(arr);
    }

    //通过某一个课堂记录（界面右边的通过）
    function fnClickPassOne(obj) {
        var arr = [];
        arr.push(obj.value);
        pass(arr);
    }

    //传入要通过的课堂记录 id数组，通过该数组的中每一个id所对应的课堂记录
    function pass(arr) {
        if (confirm("确认通过？")) {
            $.ajax({
                url: '${pageContext.request.contextPath }/check/updateCheckedState?ids=' + arr + '&state=' + 2,
                cache: false,
                success: function (data) {
                    var json = JSON.parse(data);
                    alert(json.msg);
                    $("#checkAll").prop("checked", false);
                    oTable.draw();
                }
            })
        }
    }

    //通过某一条记录
    function fnClickUnPassOne(obj) {
        var arr = [];
        arr.push(obj.value);
        if (confirm("确认不通过？")) {
            $.ajax({
                url: '${pageContext.request.contextPath }/check/updateCheckedState?ids=' + arr + '&state=' + 3,
                cache: false,
                success: function (data) {
                    var json = JSON.parse(data);
                    alert(json.msg);
                    $("#checkAll").prop("checked", false);
                    oTable.draw();
                }
            })
        }
    }

    //删除课程评论
    function fnClickDelete() {
        var arr = [];
        $("[name=checkCommentId]:checkbox").each(function () {
            if ($(this).prop("checked")) {
                arr.push($(this).val());
            }
        });

        if (arr.length == 0) {
            alert("请选择要删除的课堂记录！")
            return;
        }

        if (confirm("确认删除？")) {
            $.ajax({
                url: '${pageContext.request.contextPath }/check/deleteCourseComment?ids=' + arr,
                cache: false,
                success: function (data) {
                    alert(data);
                    $("#checkAll").prop("checked", false);
                    oTable.draw();
                }
            })
        }
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
        $("#searchRecordInfo").val("");

        oTable.draw();
    });

</script>
