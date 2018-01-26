/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.manger;

import com.niit.utils.JDBCUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MangerDao {

    Book findBookByID(int book_id) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql
        String sql = "select * from book where book_id=?";
        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        Book b = null;
        try {
            ps = conn.prepareStatement(sql);
            //4.获得参数
            ps.setInt(1, book_id);
            //5.执行查询
            rs = ps.executeQuery();
            //6.处理查询结果返回集,将rs集合中的数据封装到User中去。
            if (rs.next()) {
                b = new Book();
                b.setBook_id(rs.getInt("book_id"));
                b.setBook_name(rs.getString("book_name"));
                b.setBook_ISBN(rs.getString("book_ISBN"));
                b.setState(rs.getInt("book_state"));
                b.setOutput_date(rs.getString("book_date"));
                b.setAuthor(rs.getString("book_author"));
                b.setCategory(rs.getString("book_category"));
                b.setPrice(rs.getString("book_price"));
                b.setImg(rs.getString("book_img"));
                b.setIntroduction(rs.getString("book_introduction"));
                b.setPublisher(rs.getString("book_publisher"));
            }
            return b;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("查询Book失败");
        } finally {
            //7.关闭资源,返回User
            JDBCUtils.close(conn, ps, rs);

        }
    }

    Rules findRulesByID(int rule_id) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql
        String sql = "select * from rules where rule_id=?";

        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        Rules r = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.获得参数
            ps.setInt(1, rule_id);
            //5.执行查询
            rs = ps.executeQuery();
            //6.处理查询结果返回集,将rs集合中的数据封装到User中去。
            if (rs.next()) {
                r = new Rules();
                r.setRule_id(rs.getInt("rule_id"));
                r.setDay_fine(rs.getDouble("day_fine"));
                r.setLimint_month(rs.getInt("limint_month"));
                r.setStudent_amount(rs.getInt("student_amount"));
                r.setTeacher_amount(rs.getInt("teacher_amount"));
                r.setDelay_amount(rs.getInt("delay_amount"));
                r.setMin_number(rs.getInt("min_number"));
            }
            return r;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("查询Rules失败");
        } finally {
            //7.关闭资源,返回User
            JDBCUtils.close(conn, ps, rs);

        }
    }

    ISBN findISBNByID(int isbn_id) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql
        String sql = "select * from isbn_book where isbn_id=?";

        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        ISBN i = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.获得参数
            ps.setInt(1, isbn_id);
            //5.执行查询
            rs = ps.executeQuery();

            //6.处理查询结果返回集,将rs集合中的数据封装到User中去。
            if (rs.next()) {
                i = new ISBN();
                i.setIsbn_id(rs.getInt("isbn_id"));
                i.setIsbn(rs.getString("book_ISBN"));
                i.setBook_name(rs.getString("book_name"));
                i.setBook_amount(rs.getInt("book_amounts"));
                i.setBook_remains(rs.getInt("book_remains"));
                i.setBook_times(rs.getInt("book_times"));

            }
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("查询ISBN失败");
        } finally {
            //7.关闭资源,返回User
            JDBCUtils.close(conn, ps, rs);

        }
    }

    Borrow findBorrowByID(int borrow_id) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql
        String sql = "select * from borrow where borrow_id=?";

        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        Borrow b = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.获得参数
            ps.setInt(1, borrow_id);
            //5.执行查询
            rs = ps.executeQuery();

            //6.处理查询结果返回集,将rs集合中的数据封装到User中去。
            if (rs.next()) {
                b = new Borrow();
                b.setBorrow_id(rs.getInt("borrow_id"));
                b.setBook_id(rs.getInt("book_id"));
                b.setUser_id(rs.getInt("uer_id"));
                b.setBorrow_date(rs.getString("borrow_time"));
                b.setDeadline_time(rs.getString("deadline_time"));
                b.setDeadline(rs.getInt("deadline"));
                b.setBorrow_state(rs.getInt("borrow_state"));
            }
            return b;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("查询Borrow失败");
        } finally {
            //7.关闭资源,返回User
            JDBCUtils.close(conn, ps, rs);

        }
    }

    ISBN ReturnUpdateISBN(String book_name) {
        //1.获得连接
        System.out.println("===========ReturnUpdateISBN=============");
        Connection conn = JDBCUtils.getConnection();
        String sql_first = "select book_remains,isbn_id from isbn_book where book_name=?";
        String sql_second = "UPDATE isbn_book SET book_remains=?  where book_name=?";
        int remains, isbn_id;
        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        ISBN isbns = null;
        try {
            System.out.println("===========ReturnUpdateISBN try1=============");
            ps = conn.prepareStatement(sql_first);
            ps.setString(1, book_name);

            rs = ps.executeQuery();
            if (rs.next()) {
                remains = rs.getInt("book_remains");
                isbn_id = rs.getInt("isbn_id");
                System.out.println(remains);
                ++remains;
                System.out.println("===========ReturnUpdateISBN try2=============");
                ps = conn.prepareStatement(sql_second);
                ps.setInt(1, remains);
                ps.setString(2, book_name);
                int executeUpdate = ps.executeUpdate();

                System.out.println("===========ReturnUpdateISBN try3=============");
                isbns = findISBNByID(isbn_id);

            }
            return isbns;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("还书修改ISBN表失败");
        } finally {
            JDBCUtils.close(conn, ps, rs);

        }
    }

    //参数user_id
    Borrow ReturnUpdateBorrow(int id) {
        System.out.println("===========ReturnUpdateBorrow=============");
        Connection conn = JDBCUtils.getConnection();
        String sql1 = "select borrow_id from borrow where book_id=?";
        int borrow_id;
        String sql = "UPDATE borrow SET borrow_state=?  where book_id=?";
        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        Borrow borrows = null;
        try {
            ps = conn.prepareStatement(sql1);
            ps.setInt(1, id);

            rs = ps.executeQuery();
            if (rs.next()) {
                borrow_id = rs.getInt("borrow_id");
                System.out.println("===========ReturnUpdateBorrow try1=============");
                ps = conn.prepareStatement(sql);
                ps.setInt(1, 1);
                ps.setInt(2, id);

                int executeUpdate = ps.executeUpdate();
                borrows = findBorrowByID(borrow_id);
            }
            return borrows;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("还书修改Borrow表失败");
        } finally {
            JDBCUtils.close(conn, ps, rs);

        }

    }

    Book ReturnUpdateBook(int id) {
        //1.获得连接
        System.out.println("===========ReturnUpdateBook=============");
        Connection conn = JDBCUtils.getConnection();
        String sql = "UPDATE book SET book_state=?  where book_id=?";
        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        Book books = null;
        try {
            System.out.println("===========ReturnUpdateBook try1=============");
            ps = conn.prepareStatement(sql);
            ps.setInt(1, 0);
            ps.setInt(2, id);

            int executeUpdate = ps.executeUpdate();

            books = findBookByID(id);
            System.out.println("===========ReturnUpdateBook try2=============");
            return books;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("还书修改book表失败");
        } finally {
            //7.关闭资源,返回User
            JDBCUtils.close(conn, ps, rs);

        }
    }

    Book BorrowUpdateBook(int id) {
        //1.获得连接
        System.out.println("===========BorrowUpdateBook=============");
        Connection conn = JDBCUtils.getConnection();
        String sql = "UPDATE book SET book_state=?  where book_id=?";
        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        Book books = null;
        try {
            System.out.println("===========ReturnUpdateBook try1=============");
            ps = conn.prepareStatement(sql);
            ps.setInt(1, 1);
            ps.setInt(2, id);

            int executeUpdate = ps.executeUpdate();

            books = findBookByID(id);
            System.out.println("===========ReturnUpdateBook try2=============");
            return books;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("借书修改book表失败");
        } finally {
            //7.关闭资源,返回User
            JDBCUtils.close(conn, ps, rs);

        }
    }

    Rules updateRules(Rules r) {

        System.out.println("=======updateRules=========");
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql
//        String sql = "UPDATE user SET user_name=?,user_birth=?,user_gender=?,user_phone=? ,user_email=?,user_address=?,user_img=? where user_id=?";  
        String sql_teacher = "UPDATE rules SET day_fine=?,limint_month=?,teacher_amount=? ,delay_amount=?,min_number=?  where rule_id=?";
        String sql_student = "UPDATE rules SET day_fine=?,limint_month=?,student_amount=?,delay_amount=?,min_number=?  where rule_id=?";
        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        Rules rules = null;
        //3.准备PreparedStatement对象
        try {

            System.out.println("=======try=========");
            if (r.getTeacher_amount() == -1) {
                ps = conn.prepareStatement(sql_student);
                //4.获得参数
                ps.setDouble(1, r.getDay_fine());
                ps.setInt(2, r.getLimint_month());
                ps.setInt(3, r.getStudent_amount());
                ps.setInt(4, r.getDelay_amount());
                ps.setInt(5, r.getMin_number());
                ps.setInt(6, r.getRule_id());
            }
            if (r.getStudent_amount() == -1) {
                System.out.println("=======try_teacher1=========");
                ps = conn.prepareStatement(sql_teacher);
                //4.获得参数
                ps.setDouble(1, r.getDay_fine());
                ps.setInt(2, r.getLimint_month());
                ps.setInt(3, r.getTeacher_amount());
                ps.setInt(4, r.getDelay_amount());
                ps.setInt(5, r.getMin_number());
                ps.setInt(6, r.getRule_id());
                System.out.println("=======try_teacher2=========");
            }

            //5.执行修改
            System.out.println("=======try3=========");
            int executeUpdate = ps.executeUpdate();

            //修改结束后获取修改之后的user
            System.out.println("=======try4=========");
            rules = findRulesByID(r.getRule_id());
            System.out.println("=======try5=========");
            return rules;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("修改规则失败");
        } finally {
            //7.关闭资源,返回User
            JDBCUtils.close(conn, ps, rs);

        }
    }
}
