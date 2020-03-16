<%--
因更新课程页面过大，无法编译，特将其分割成两个页面
这是更新页面的中间的一部分内容
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="form-group">
    <label class="col-sm-4 control-label">单双周</label>
    <div class="col-sm-4">
        <form:select class="form-control" path="oddEven">
            <form:option value="全周">全周</form:option>
            <form:option value="单周">单周</form:option>
            <form:option value="双周">双周</form:option>
        </form:select>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-4 control-label">授课时间</label>
    <div class="col-sm-4">
        <form:select class="form-control" path="courseDate">
            <form:option value="星期一">星期一</form:option>
            <form:option value="星期二">星期二</form:option>
            <form:option value="星期三">星期三</form:option>
            <form:option value="星期四">星期四</form:option>
            <form:option value="星期五">星期五</form:option>
            <form:option value="星期六">星期六</form:option>
            <form:option value="星期七">星期日</form:option>
        </form:select>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-4 control-label">课程开始节数</label>
    <div class="col-sm-4">
        <form:select class="form-control" path="courseNode">
            <form:option value="1">1</form:option>
            <form:option value="2">2</form:option>
            <form:option value="3">3</form:option>
            <form:option value="4">4</form:option>
            <form:option value="5">5</form:option>
            <form:option value="6">6</form:option>
            <form:option value="7">7</form:option>
            <form:option value="8">8</form:option>
            <form:option value="9">9</form:option>
            <form:option value="10">10</form:option>
            <form:option value="11">11</form:option>
        </form:select>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-4 control-label">课程节数</label>
    <div class="col-sm-4">
        <form:select class="form-control" path="courseNum">
            <form:option value="1">1</form:option>
            <form:option value="2">2</form:option>
            <form:option value="3">3</form:option>
            <form:option value="4">4</form:option>
            <form:option value="6">6</form:option>
            <form:option value="8">8</form:option>
        </form:select>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-4 control-label">起始周</label>
    <div class="col-sm-4">
        <form:select class="form-control" path="startWeek">
            <form:option value="1">1</form:option>
            <form:option value="2">2</form:option>
            <form:option value="3">3</form:option>
            <form:option value="4">4</form:option>
            <form:option value="5">5</form:option>
            <form:option value="6">6</form:option>
            <form:option value="7">7</form:option>
            <form:option value="8">8</form:option>
            <form:option value="9">9</form:option>
            <form:option value="10">10</form:option>
            <form:option value="11">11</form:option>
            <form:option value="12">12</form:option>
            <form:option value="13">13</form:option>
            <form:option value="14">14</form:option>
            <form:option value="15">15</form:option>
            <form:option value="16">16</form:option>
            <form:option value="17">17</form:option>
            <form:option value="18">18</form:option>
        </form:select>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-4 control-label">结束周</label>
    <div class="col-sm-4">
        <form:select class="form-control" path="endWeek">
            <form:option value="1">1</form:option>
            <form:option value="2">2</form:option>
            <form:option value="3">3</form:option>
            <form:option value="4">4</form:option>
            <form:option value="5">5</form:option>
            <form:option value="6">6</form:option>
            <form:option value="7">7</form:option>
            <form:option value="8">8</form:option>
            <form:option value="9">9</form:option>
            <form:option value="10">10</form:option>
            <form:option value="11">11</form:option>
            <form:option value="12">12</form:option>
            <form:option value="13">13</form:option>
            <form:option value="14">14</form:option>
            <form:option value="15">15</form:option>
            <form:option value="16">16</form:option>
            <form:option value="17">17</form:option>
            <form:option value="18">18</form:option>
        </form:select>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-4 control-label">年级</label>
    <div class="col-sm-4">
        <form:select class="form-control" path="grade">
            <form:option value="14">14</form:option>
            <form:option value="15">15</form:option>
            <form:option value="16">16</form:option>
            <form:option value="17">17</form:option>
            <form:option value="18">18</form:option>
            <form:option value="19">19</form:option>
            <form:option value="20">20</form:option>
            <form:option value="21">21</form:option>
            <form:option value="22">22</form:option>
            <form:option value="23">23</form:option>
            <form:option value="24">24</form:option>
            <form:option value="25">25</form:option>
        </form:select>
    </div>
</div>