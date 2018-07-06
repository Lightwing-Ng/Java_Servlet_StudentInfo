<%--
  Created by IntelliJ IDEA.
  User: lightwingng
  Date: 2018/7/7
  Time: 01:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Adding A New Student</title>
</head>
<body>
<h3>Adding A New Student</h3>
<form method="post" action="AddServlet">
    <table border="0" width="100%">
        <tr>
            <td>Name</td>
            <td>
                <input type="text" name="sname">
            </td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>
                <input type="radio" name="gender" value="Male">Male
                <input type="radio" name="gender" value="Female">Female
            </td>
        </tr>
        <tr>
            <td>Phone</td>
            <td><input type="text" name="phone"></td>
        </tr>
        <tr>
            <td>Birthday</td>
            <td><input type="text" name="birthday"></td>
        </tr>
        <tr>
            <td>Hobby</td>
            <td>
                <input type="checkbox" name="hobby" value="Swimming">Swimming
                <input type="checkbox" name="hobby" value="Basket Ball">Basket Ball
                <input type="checkbox" name="hobby" value="Foot Ball">Foot Ball
                <input type="checkbox" name="hobby" value="Reading">Reading
                <input type="checkbox" name="hobby" value="Composing">Composing
            </td>
        </tr>
        <tr>
            <td>Info</td>
            <td>
                <textarea name="info" rows="3" cols="20"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Add">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
