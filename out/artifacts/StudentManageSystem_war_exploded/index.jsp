<%--
  Created by IntelliJ IDEA.
  User: lightwingng
  Date: 2018/7/6
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    <link href="static/css/main.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
</head>
<body>
<div>
    <table>
        <tr>
            <td rowspan="2"><img src="static/img/search.svg" style="width: 200px"></td>
            <td>
                <input type="button" onclick='location.href=("StudentListServlet")'
                       value="Show All the Students" class="Option HomeTitle"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="button"
                       onclick='location.href=("StudentListPageServlet?currentPage=1")'
                       value="Show the Students in Separate" class="Option HomeTitle"/>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
