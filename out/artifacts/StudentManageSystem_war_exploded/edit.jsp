<%--
  Created by IntelliJ IDEA.
  User: lightwingng
  Date: 2018/7/7
  Time: 01:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Updating Student's Information</title>
</head>
<body>
<h3>更新学生页面</h3>
<form method="post" action="UpdateServlet">
    <input type="hidden" name="sid" value="${ stu.sid }">
    <table border="0" width="100%">
        <tr>
            <td>Name</td>
            <td><input type="text" name="sname" value="${ stu.sname }"></td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>
                <input type="radio" name="gender" value="Male"
                       <c:if test="${ stu.gender == 'Male' }">checked</c:if>>Male
                <input type="radio" name="gender" value="Female"
                       <c:if test="${ stu.gender == 'Female' }">checked</c:if>>Female
            </td>
        </tr>
        <tr>
            <td>Phone</td>
            <td>
                <input type="text" name="phone" value="${ stu.phone }">
            </td>
        </tr>
        <tr>
            <td>Birthday</td>
            <td>
                <input type="text" name="birthday" value="${ stu.birthday }">
            </td>
        </tr>
        <tr>
            <td>Hobby</td>
            <td>
                <input type="checkbox" name="hobby" value="Swimming"
                       <c:if test="${ fn:contains(stu.hobby,'Swimming') }">checked</c:if>>Swimming
                <input type="checkbox" name="hobby" value="Basket Ball"
                       <c:if test="${ fn:contains(stu.hobby,'Basket Ball') }">checked</c:if>>Basket Ball
                <input type="checkbox" name="hobby" value="Foot Ball"
                       <c:if test="${ fn:contains(stu.hobby,'Foot Ball') }">checked</c:if>>Foot Ball
                <input type="checkbox" name="hobby" value="Reading"
                       <c:if test="${ fn:contains(stu.hobby,'Reading') }">checked</c:if>>Reading
                <input type="checkbox" name="hobby" value="Composing"
                       <c:if test="${ fn:contains(stu.hobby,'Composing') }">checked</c:if>>Composing
            </td>
        </tr>
        <tr>
            <td>简介</td>
            <td>
                <textarea name="info" rows="3" cols="20">
                    ${ stu.info }
                </textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Update"></td>
        </tr>
    </table>
</form>
</body>
</html>
