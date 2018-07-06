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
</head>
<body>
<form action="SearchStudentServlet" method="post">
    <table border="0" width="100%">
        <tr>
            <td colspan="8">
                Search By Name: <input type="text" name="sname"/>
                &nbsp;
                Search By Gender: <select name="sgender">
                <option value="">--Select--
                <option value="Male">Male
                <option value="Female">Female
            </select>
                &nbsp;&nbsp;&nbsp;
                <input type="submit" value="Search">
                &nbsp;&nbsp;&nbsp;
                <a href="add.jsp">Add</a>
            </td>
        </tr>

        <tr align="center">
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
                    <a href="EditServlet?sid=${ stu.sid }">Edit</a>
                    <a href="#"
                       onclick="doDelete(${ stu.sid})">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
