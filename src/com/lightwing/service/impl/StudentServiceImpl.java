package com.lightwing.service.impl;

import com.lightwing.dao.StudentDao;
import com.lightwing.dao.impl.StudentDaoImpl;
import com.lightwing.domain.PageBean;
import com.lightwing.domain.Student;
import com.lightwing.service.StudentService;

import java.sql.SQLException;
import java.util.List;

/**
 * 这是学生业务实现
 *
 * @author xiaomi
 */
public class StudentServiceImpl implements StudentService {

    @Override
    public List<Student> findAll() throws SQLException {
        StudentDao dao = new StudentDaoImpl();
        return dao.findAll();
    }

    @Override
    public void insert(Student student) throws SQLException {
        StudentDao dao = new StudentDaoImpl();
        dao.insert(student);
    }

    @Override
    public void delete(int sid) throws SQLException {
        StudentDao dao = new StudentDaoImpl();
        dao.delete(sid);
    }

    @Override
    public Student findStudentById(int sid) throws SQLException {
        StudentDao dao = new StudentDaoImpl();
        return dao.findStudentById(sid);
    }

    @Override
    public void update(Student student) throws SQLException {
        StudentDao dao = new StudentDaoImpl();
        dao.update(student);

    }

    @Override
    public List<Student> searchStudent(String sname, String sgender) throws SQLException {
        return new StudentDaoImpl().searchStudent(sname, sgender);
    }

    @Override
    public PageBean findStudentByPage(int currentPage) throws SQLException {

        // 封装分页的该页数据
        PageBean<Student> pageBean = new PageBean<Student>();

        int pageSize = StudentDao.PAGE_SIZE;
        pageBean.setCurrentPage(currentPage); // 设置当前页
        pageBean.setPageSize(pageSize); // 设置每页显示多少记录

        StudentDao dao = new StudentDaoImpl();
        List<Student> list = dao.findStudentByPage(currentPage);
        pageBean.setList(list); // 设置这一页的学生数据

        // 总的记录数，总的页数。
        int count = dao.findCount();
        pageBean.setTotalSize(count); //设置总的记录数
        pageBean.setTotalPage(count % pageSize == 0 ? count / pageSize : (count / pageSize) + 1); //总页数
        return pageBean;
    }

}
