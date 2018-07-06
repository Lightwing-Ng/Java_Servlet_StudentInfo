package com.lightwing.servlet;


import com.lightwing.domain.Student;
import com.lightwing.service.StudentService;
import com.lightwing.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/*
 * Query all the students' information
 * */
public class StudentListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        try {
            // 1. enquire all the students
            StudentService service = new StudentServiceImpl();
            List<Student> list = service.findAll();

            // 2. store the data to the domains
            request.setAttribute("list", list);

            // 3. jump
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
