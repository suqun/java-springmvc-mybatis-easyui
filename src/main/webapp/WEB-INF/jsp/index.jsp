<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="snipe.pageModel.base.SessionInfo" %>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>SME</title>
    <jsp:include page="inc.jsp"/>
    <script type="text/javascript" charset="utf-8">
        $(function () {
            if (null != '${sessionInfo}') {
                location.replace('${pageContext.request.contextPath}/baseController/layout/main');
            } else {
                location.replace('${pageContext.request.contextPath}/baseController/login');
            }
        })
    </script>
</head>
<body>
</body>
</html>