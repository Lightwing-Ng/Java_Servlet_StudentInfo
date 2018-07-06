package com.lightwing.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.lightwing.dao.StudentDao;
import com.lightwing.domain.Student;
import com.lightwing.util.JDBCUtil02;
import com.lightwing.util.TextUtils;

/**
 * 这是StudentDao的实现。 针对前面定义的规范，做出具体的实现。
 *
 * @author Lightwing Ng
 */
public class StudentDaoImpl implements StudentDao {
    /**
     * query all the students
     *
     * @throws SQLException
     */
    @Override
    public List<Student> findAll() throws SQLException {
        QueryRunner runner = new QueryRunner(JDBCUtil02.getDataSource());
        return runner.query(
                "SELECT * FROM stu",
                new BeanListHandler<Student>(Student.class)
        );
    }

    @Override
    public void insert(Student student) throws SQLException {
        QueryRunner runner = new QueryRunner(JDBCUtil02.getDataSource());
        runner.update(
                "INSERT INTO stu VALUES(NULL, ?, ?, ?, ?, ?, ?)",
                student.getSname(),
                student.getGender(),
                student.getPhone(),
                student.getBirthday(),
                student.getHobby(),
                student.getInfo()
        );
    }

    @Override
    public void delete(int sid) throws SQLException {
        QueryRunner runner = new QueryRunner(JDBCUtil02.getDataSource());
        runner.update(
                "DELETE FROM stu WHERE sid=?",
                sid
        );
    }

    @Override
    public Student findStudentById(int sid) throws SQLException {
        QueryRunner runner = new QueryRunner(JDBCUtil02.getDataSource());
        return runner.query(
                "SELECT * FROM stu WHERE sid=?",
                new BeanHandler<Student>(Student.class),
                sid
        );
    }

    @Override
    public void update(Student student) throws SQLException {
        QueryRunner runner = new QueryRunner(JDBCUtil02.getDataSource());
        runner.update(
                "UPDATE stu SET sname=?, gender=?, phone=?, birthday=?, hobby=?, info=? WHERE sid=?",
                student.getSname(),
                student.getGender(),
                student.getPhone(),
                student.getBirthday(),
                student.getHobby(),
                student.getInfo(),
                student.getSid()
        );
    }

    @Override
    public List<Student> searchStudent(String sname, String sgender) throws SQLException {
        System.out.println("现在要执行模糊查询了，收到的name =" + sname + "==genser==" + sgender);
        QueryRunner runner = new QueryRunner(JDBCUtil02.getDataSource());
        String sql = "select * from stu where 1=1 ";
        List<String> list = new ArrayList<String>();

        // 判断有没有姓名， 如果有，就组拼到sql语句里面
        if (!TextUtils.isEmpty(sname)) {
            sql = sql + "  AND sname LIKE ?";
            list.add("%" + sname + "%");
        }
        // 判断有没有性别，有的话，就组拼到sql语句里面。
        if (!TextUtils.isEmpty(sgender)) {
            sql = sql + " AND gender=?";
            list.add(sgender);
        }
        return runner.query(
                sql,
                new BeanListHandler<Student>(Student.class),
                list.toArray()
        );
    }

    @Override
    public List<Student> findStudentByPage(int currentPage) throws SQLException {
        QueryRunner runner = new QueryRunner(JDBCUtil02.getDataSource());
        return runner.query(
                "SELECT * FROM stu LIMIT ? OFFSET ?",
                new BeanListHandler<Student>(Student.class),
                PAGE_SIZE,
                (currentPage - 1) * PAGE_SIZE
        );
    }

    @Override
    public int findCount() throws SQLException {
        QueryRunner runner = new QueryRunner(JDBCUtil02.getDataSource());
        // 用于处理 平均值 、 总的个数。
        Long result = (Long) runner.query(
                "SELECT COUNT(*) FROM stu",
                new ScalarHandler()
        );
        return result.intValue();
    }
}
