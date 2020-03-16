<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${status}${msg}</title>
    <meta charset="UTF-8">

    <link href="${pageContext.request.contextPath}/resources/css/update/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/update/font-awesome/css/font-awesome.css">

    <link href="${pageContext.request.contextPath}/resources/css/update/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/update/style.css" rel="stylesheet">
</head>
<body class="gray-bg">


    <div class="middle-box text-center animated fadeInDown">
        <img class="error-img" style="width: 50%" src="${pageContext.request.contextPath}/resources/images/error.png" alt="">
        <h3 class="font-bold"><br><br>抱歉，页面出现错误<br><br>请确认操作是否正确，或者账号是否过期。</h3>

        <div class="error-desc">
            ${msg}
            <br/>
            <%--<a  class="btn btn-primary m-t" onclick="history.back(-1);">退回</a>--%>
        </div>

    </div>

    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/update/jquery-3.1.1.min.js "></script>
    <script src="${pageContext.request.contextPath}/resources/js/update/bootstrap.min.js"></script>


</body>

</html>
