package com.lightwing.servlet;

import com.lightwing.domain.Student;
import com.lightwing.service.StudentService;
import com.lightwing.service.impl.StudentServiceImpl;
import com.sun.deploy.net.HttpResponse;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;

/**
 * 用于处理学生的添加请求
 *
 * @author xiaomi
 */
public class AddServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            // 1.获取客户端提交上来的数据
            String sname = request.getParameter("sname"); // sname: zhangsan
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            String birthday = request.getParameter("birthday"); // 1989-10-18
            String info = request.getParameter("info");
            String[] h = request.getParameterValues("hobby");
            String hobby = Arrays.toString(h);
            hobby = hobby.substring(1, hobby.length() - 1);

            // 2.添加到数据库
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
            Student student = new Student(sname, gender, phone, hobby, info, date);
            StudentService service = new StudentServiceImpl();
            service.insert(student);

            // 3.跳转到列表页
            request.getRequestDispatcher("StudentListServlet").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        //
        doGet(request, response);
    }
}
