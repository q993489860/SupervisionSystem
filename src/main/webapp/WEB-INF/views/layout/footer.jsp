<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="row myFooter">
    <div class="col-lg-12">
        <div class="footer">
            <div class="pull-right" id="show">
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        distime();
    })

    function distime(){
        var time = new Date( ); //获得当前时间
        var year = time.getFullYear( );
        $('#show').html("巢湖学院 © 2002-"+year);

    }
</script>