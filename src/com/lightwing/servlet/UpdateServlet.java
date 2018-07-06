package com.lightwing.servlet;

import com.lightwing.domain.Student;
import com.lightwing.service.StudentService;
import com.lightwing.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        try {
            // 1.获取客户端提交上来的数据
            int sid = Integer.parseInt(request.getParameter("sid"));
            String sname = request.getParameter("sname"); // sname:zhangsan
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            String birthday = request.getParameter("birthday"); // 1989-10-18
            String info = request.getParameter("info");
            String[] h = request.getParameterValues("hobby");
            String hobby = Arrays.toString(h);
            hobby = hobby.substring(1, hobby.length() - 1);

            // 2.添加到数据库
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
            Student student = new Student(sid, sname, gender, phone, hobby, info, date);

            // 3. 更新数据库数据
            StudentService service = new StudentServiceImpl();
            service.update(student);

            // 4. 跳转界面
            request.getRequestDispatcher("StudentListServlet").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
