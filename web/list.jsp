<%--
  Created by IntelliJ IDEA.
  User: lightwingng
  Date: 2018/7/7
  Time: 01:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student List</title>
    <script type="text/javascript">
        var flag = confirm("Delete?");
        if (flag) {
            location.href = "DeleteServlet?sid=" + sid;
        }
    </script>
    <link href="static/css/main.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
</head>
<body>
<div>
    <form action="SearchStudentServlet" method="post">
        <table border="0" class="table table-striped table-condensed">
            <tr align="center">
                <td colspan="2">Search By Name:</td>
                <td><input type="text" name="sname"/></td>
                <td colspan="2">Search By Gender:</td>
                <td>
                    <select name="sgender">
                        <option value="">Select
                        <option value="Male">Male
                        <option value="Female">Female
                    </select>
                </td>
                <td>
                    <input type="submit" value="Search" class="Option">
                </td>
                <td>
                    <input type="button" onclick='location.href=("add.jsp")' value="Add Students"
                           class="Option"/>
                </td>
            </tr>
            <tr align="center" style="font-weight: bold">
                <td>ID</td>
                <td>Name</td>
                <td>Gender</td>
                <td>Phone</td>
                <td>Birthday</td>
                <td>Hobby</td>
                <td>Info</td>
                <td>Option</td>
            </tr>
            <c:forEach items="${ list }" var="stu">
                <tr align="center">
                    <td>${ stu.sid }</td>
                    <td>${ stu.sname }</td>
                    <td>${ stu.gender }</td>
                    <td>${ stu.phone }</td>
                    <td>${ stu.birthday }</td>
                    <td>${ stu.hobby }</td>
                    <td>${ stu.info }</td>
                    <td>
                        <input type="button"
                               onclick='location.href=("EditServlet?sid=${ stu.sid }")'
                               value="Edit" class="Option Edit"/>
                        &nbsp;
                        <input type="button" onclick='location.href=("doDelete(${ stu.sid })")'
                               value="Delete" class="Option Delete"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>
</body>
</html>
