<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="main">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <p>
                            课程编号：<input id="searchRecordsCode"  class="myInput" />
                            课程名称：<input id="searchRecordsName"  class="myInput" />
                            授课专业：<input id="searchRecordsMajor" name="searchCode" class="myInput" />
                            <button class="btn btn-success" type="button" id="fnClickSearch" onclick="searchRecords()"><i class="fa fa-search"></i> <span class="bold">查询</span></button>
                            <button class="btn btn-warning" type="button" id="fnClickClear"><i class="fa fa-circle-o"></i> <span class="bold">置空</span></button>
                        </p>
                        <table class="table table-striped table-bordered table-hover "
                               id="editable">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll" onchange="ckeckAll(this)" /></th>
                                <th width="100">课程编号</th>
                                <th width="100">课程名称</th>
                                <th width="100">授课时间</th>
                                <th width="100">班级</th>
                                <th width="100">听课时间</th>
                                <th width="100">听课老师人数</th>
                                <th width="100">得分</th>
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
    var oTable;
    $(document).ready(function() {
        oTable = $('#editable').DataTable( {
            searching:false,
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
            "sAjaxSource": "${pageContext.request.contextPath}/courseRecord/fetchRecords"
            ,//给服务器发请求的url
            "fnServerParams": function ( aoData ) {//向服务器传额外的参数
                aoData.push( { "name": "sid", "value": "1" } );
                aoData.push( { "name": "searchRecordsCode", "value": $("#searchRecordsCode").val() });
                aoData.push( { "name": "searchRecordsName", "value": $("#searchRecordsName").val() });
                aoData.push( { "name": "searchRecordsMajor", "value": $("#searchRecordsMajor").val() });

            },

            "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
                { "mData": function(obj){ //mData 表示发请求时候本列的列名，返回的数据中相同下标名字的数据会填充到这一列
                    return '<input type="checkbox" id="checkUserId" name="checkUserId" value="'+obj.id+'" >';
                },"sWidth": "20px"},
                { "mData": "courseCode" },
                { "mData": "courseName" },
                { "mData": "courseDate" },
                { "mData": "classes" },
                { "mData": "recordTime" },
                { "mData": "recordCount" },
                { "mData": "score"},
                { "mData": function(obj){
                    var operate = '<a class="btn btn-primary" href="${pageContext.request.contextPath}/courseComment/commentList?id='+obj.id+'"><i class="fa fa-edit">查看详情</i></a> ' +'&nbsp;&nbsp;';
//                    var operate = '<a class="btn btn-primary" id='+obj.id+' href="javascript: void(0)" onclick="catRecordsById(id)"><i class="fa fa-edit">查看详情</i></a> ' +'&nbsp;&nbsp;';
                    return operate;
                }}
            ],
            "columnDefs": [ //设置每列的相对宽度
                { "orderable": false, "targets": [0,8] },
                { "width": "5%", "targets": 0 },
                { "width": "10%", "targets": 1 },
                { "width": "20%", "targets": 2 },
                { "width": "10%", "targets": 3 },
                { "width": "15%", "targets": 4 },
                { "width": "10%", "targets": 5 },
                { "width": "10%", "targets": 6 },
                { "width": "10%", "targets": 7 },
                { "width": "10%", "targets": 8 },


            ],
            "order": [[ 6, "desc" ]] //从第几列开始 按何种方式排序
        } );
    });


    $('#fnClickClear').click( function () {
        $("#searchRecordsCode").val("");
        $("#searchRecordsName").val("");
        $("#searchRecordsMajor").val("");
        oTable.draw();
    } );
   //搜索点击事件
    function searchRecords() {
        oTable.draw();
    }

    function ckeckAll(obj){
        var $checked=$(obj).prop("checked");
        $("td input[type='checkbox']").each(function(){
            $(this).prop("checked",$checked);
        });
        $(obj).prop("checked",$checked);
    }
    function catRecordsById(id) {
        event.stopPropagation();
        window.location.href = "${pageContext.request.contextPath}/courseComment/commentList/" + id;
    }


</script>
