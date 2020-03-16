<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-7
  Date: 2018/4/20
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="ibox-content-titles clear">
                            <div class="ibox-content-titles-left" style="float: left">
                                <label> 课程信息：</label>
                                <input id="searchCourseInfo" class="myInput" placeholder="请输入课程名称、授课老师" />
                                <%--角色：&lt;%&ndash;<input id="searchState" />&ndash;%&gt;<label id="searchCourseDate">角色：</label>--%>
                                <button class="btn btn-success" type="button" id="fnClickSearch"><i class="fa fa-search"></i> <span class="bold">查询</span></button>
                                <button class="btn btn-warning" type="button" id="fnClickClear"><i class="fa fa-circle-o"></i> <span class="bold">置空</span></button>
                            </div>
                            <div class="ibox-content-titles-right" style="float: right">
                                <label style="font-size: 15px">本学期任务量：<a id="taskNum"></a></label>
                                <label style="margin-left: 30px;font-size: 15px">已完成任务量：<a id="finishedNum"></a></label>
                            </div>


                        </div>
                        <table class="table table-striped table-bordered table-hover "
                               id="editable">
                            <thead>
                            <tr>
                                <%--<th><input type="checkbox" id="checkAll" onchange="ckeckAll(this)" /></th>--%>
                                <th width="100">课程名称</th>
                                <th width="100">授课时间</th>
                                <th width="100">授课教室</th>
                                <th width="100">听课日期</th>
                                <th width="100">节数</th>
                                <th width="100">周数</th>
                                <th width="100">授课教师</th>
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
            "sAjaxSource": "${pageContext.request.contextPath}/course/coursePage/paging",//给服务器发请求的url
            "fnServerParams": function ( aoData ) {//向服务器传额外的参数
                aoData.push( { "name": "sid", "value": "1" } );
                aoData.push( { "name": "searchCourseInfo", "value": $("#searchCourseInfo").val() });
//                aoData.push( { "name": "searchCourseDate", "value": $("#searchCourseDate").val() });
            },
            "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
//                { "mData": function(obj){ //mData 表示发请求时候本列的列名，返回的数据中相同下标名字的数据会填充到这一列
//                    return '<input type="checkbox" id="checkCourseId" name="checkCourseId" value="'+obj.id+'" >';
//                },"sWidth": "20px"},
                { "mData": "courseName" },
                { "mData": "courseDate" },
                { "mData": "courseRoom" },
                { "mData": "courseTime" },
                { "mData": "courseNode" },
                { "mData": "courseWeek" },
                { "mData": "courseTeacher" },
                { "mData": "courseClass"},
                { "mData": function(obj){
                    return'<a class="btn btn-primary" href="#" onclick="attendCourse('+"'"+obj.id+"'"+')"><i class="fa fa-edit">听课</i></a>';
                }}
            ],
            "columnDefs": [ //设置每列的相对宽度
                { "orderable": false, "targets": [0,7] },
                { "width": "15%", "targets": 0 },
                { "width": "10%", "targets": 1 },
                { "width": "10%", "targets": 2 },
                { "width": "10%", "targets": 3 },
                { "width": "8%", "targets": 4 },
                { "width": "8%", "targets": 5 },
                { "width": "10%", "targets": 6 },
                { "width": "17%", "targets": 7 },
                { "width": "12%", "targets": 8 }
            ],
            "order": [[ 1, "desc" ]] //从第几列开始 按何种方式排序
        } );
        //查找任务量
        $.ajax({
            url:"${pageContext.request.contextPath}/task/findTaskByUserId",
            type:"GET",
            dataType:"json",
            contentType: "application/json",
            success:function (data) {
                if (data.obj != null){
                    var taskNum = data.obj.courseTimes;
                    var finishedNum = data.obj.finishTimes;
                    $("#taskNum").html(taskNum);
                    $("#finishedNum").html(finishedNum);
                }else {
                    $("#taskNum").html("暂无");
                    $("#finishedNum").html("暂无");
                }

            }
        })
    });

    $('#fnClickSearch').click( function () {
        oTable.draw();
    } );

    $('#fnClickClear').click( function () {
        $("#searchCourseInfo").val("");
        $("#searchCourseDate").val("");
        oTable.draw();
    } );

    function ckeckAll(obj){
        var $checked=$(obj).prop("checked");
        $("td input[type='checkbox']").each(function(){
            $(this).prop("checked",$checked);
        });
        $(obj).prop("checked",$checked);
    }
   function attendCourse(id) {

       $.ajax({
          url:"${pageContext.request.contextPath}/courseRecord/createCourseRecord?id="+id,
          type:"GET",
          dataType:"json",
          success:function (r) {
              if (r.success){
                  addCourseComment(id);
              }
          }
       });

       function addCourseComment() {
           $.ajax({
               url:"${pageContext.request.contextPath}/courseComment/createCourseComment?id="+id,
               type:"GET",
               dataType:"json",
               success:function (r) {
                   if (r.success){
                       alert("听课任务已建立,请立刻完成听课记录");
                       oTable.draw();
                   }else {
                       alert(r.msg);
                       oTable.draw();
                   }
               }
           });
       }
   }

</script>

