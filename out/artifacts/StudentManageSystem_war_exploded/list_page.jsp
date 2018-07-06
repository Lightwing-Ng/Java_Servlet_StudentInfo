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
        function doDelete(sid) {
            var flag = confirm("Delete?");
            if (flag)
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

        <c:forEach items="${ pageBean.list }" var="stu">
            <tr align="center">
                <td>${ stu.sid }</td>
                <td>${ stu.sname }</td>
                <td>${ stu.gender }</td>
                <td>${ stu.phone }</td>
                <td>${ stu.birthday }</td>
                <td>${ stu.hobby }</td>
                <td>${ stu.info }</td>
                <td><a href="EditServlet?sid=${ stu.sid }">Update</a>
                    <a href="#" onclick="doDelete(${stu.sid})">Delete</a>
                </td>
            </tr>
        </c:forEach>

        <tr>
            <td colspan="8">
                No ${ pageBean.currentPage } / ${ pageBean.totalPage }
                &nbsp;&nbsp;
                Each Page: ${ pageBean.pageSize }Item &nbsp;&nbsp;&nbsp;
                Total: ${ pageBean.totalSize } &nbsp;&nbsp;&nbsp;
                <c:if test="${ pageBean.currentPage !=1 }">
                    <a href="StudentListPageServlet?currentPage=1">Home</a>
                    | <a
                        href="StudentListPageServlet?currentPage=${ pageBean.currentPage-1 }">Previous
                </a>
                </c:if>
                <c:forEach begin="1" end="${ pageBean.totalPage }" var="i">
                    <c:if test="${ pageBean.currentPage == i }">
                        ${i }
                    </c:if>
                    <c:if test="${ pageBean.currentPage != i }">
                        <a href="StudentListPageServlet?currentPage=${ i }">${ i }</a>
                    </c:if>

                </c:forEach>
                <c:if test="${ pageBean.currentPage !=pageBean.totalPage }">
                    <a href="StudentListPageServlet?currentPage=${ pageBean.currentPage + 1 }">Next
                    </a> |
                    <a href="StudentListPageServlet?currentPage=${ pageBean.totalPage }">Last</a>
                </c:if>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
