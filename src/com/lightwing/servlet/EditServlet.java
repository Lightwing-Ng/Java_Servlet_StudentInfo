package com.lightwing.servlet;

import com.lightwing.domain.Student;
import com.lightwing.service.StudentService;
import com.lightwing.service.impl.StudentServiceImpl;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.sql.SQLException;
import java.io.IOException;

/**
 * 处理单个学生的更新， 查询一个学生的信息，然后跳转到更新页面
 *
 * @author xiaomi
 */
public class EditServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            // 1. 接收id
            int sid = Integer.parseInt(request.getParameter("sid"));

            // 2. 查询学生数据
            StudentService service = new StudentServiceImpl();
            Student stu = service.findStudentById(sid);

            // 3. 显示数据
            // 存数据
            request.setAttribute("stu", stu);
            // 跳转
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
