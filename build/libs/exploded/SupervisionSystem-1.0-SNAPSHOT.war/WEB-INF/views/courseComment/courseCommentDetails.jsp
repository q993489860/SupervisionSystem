<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="modal fade" id="courseCommentDetails" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true" style="z-index: 1000">
    <div class="modal-dialog" style="width:1200px;height: 1000px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">记录详情</h4>
            </div>

            <div class="modal-body">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="form-horizontal">

                            <input type="hidden" id="commentId"/>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">督导专家名</label>
                                <div class="col-sm-4">
                                    <input class="form-control" disabled="disabled" value="" id="commentTeacherName"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">授课教师</label>
                                <div class="col-sm-4">
                                    <input class="form-control" disabled="disabled" value="" id="teacherName"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">课程</label>
                                <div class="col-sm-4">
                                    <input class="form-control" disabled="disabled" value="" id="courseName"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">应到人数</label>
                                <div class="col-sm-4">
                                    <input class="form-control" disabled="disabled" value="" id="totalCount"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">缺席人数</label>
                                <div class="col-sm-4">
                                    <input class="form-control" disabled="disabled" value="" id="presentCount"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">成绩</label>
                                <div class="col-sm-4">
                                    <input class="form-control" disabled="disabled" value="" id="score"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">评论</label>
                                <div class="col-sm-4">
                                    <textarea class="form-control" disabled="disabled" rows="6" id="comment">

                                    </textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">建议</label>
                                <div class="col-sm-4">
                                    <textarea class="form-control" disabled="disabled" rows="6" id="proposal">

                                    </textarea>
                                </div>
                            </div>

                            <div id="operating">
                                <%--<div class="hr-line-dashed"></div>--%>

                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-4">
                                        <a class="btn btn-primary" href="#" onclick="fnClickPassThisComment()">通过</a>

                                        <a class="btn btn-danger" href="#" onclick="fnClickUnPassThisComment()">不通过</a>

                                    </div>
                                </div>

                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
    </div>
</div>

    <script>
        //通过某一个课堂记录
        function fnClickPassThisComment() {//方法名注意，不能和上一个界面的名字一样
            var ids = [];
            ids.push($("#commentId").val());

            if (confirm("确认通过？")) {
                $.ajax({
                    url: '${pageContext.request.contextPath }/check/updateCheckedState?ids=' + ids + '&state=' + 2,
                    cache: false,
                    success: function (data) {
                        var json = JSON.parse(data);
                        alert(json.msg);
                        location.href = "${pageContext.request.contextPath }/check/uncheckedPage"
                    }
                })
            }
        }

        //不通过某一个课堂记录
        function fnClickUnPassThisComment() {
            var arr = [];
            arr.push($("#commentId").val());
            if (confirm("确认不通过？")) {
                $.ajax({
                    url: '${pageContext.request.contextPath }/check/updateCheckedState?ids=' + arr + '&state=' + 3,
                    cache: false,
                    success: function (data) {
                        var json = JSON.parse(data);
                        alert(json.msg);
                        location.href = "${pageContext.request.contextPath }/check/uncheckedPage"
                    }
                })
            }
        }

    </script>
