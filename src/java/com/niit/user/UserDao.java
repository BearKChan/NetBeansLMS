/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.user;

import com.niit.login.User;
import com.niit.utils.JDBCUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Bear
 */
public class UserDao {

    List<Borrow_View> getAllBorrow_ViewByUser_ID(int user_id) {
        List<Borrow_View> list = new ArrayList<Borrow_View>();

        //1 获得连接
        Connection conn = JDBCUtils.getConnection();
        //2 sql语句
        String sql = "select * from borrow_view where user_id=?  ";
        //3 创建PrepareStatement
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            //4 执行sql
            rs = ps.executeQuery();
            //5 遍历结果集
            while (rs.next()) {
                //将结果集中的数据封装到Product对象中	
                Borrow_View b = new Borrow_View();
                b.setBook_id(rs.getInt("book_id"));
                b.setBook_name(rs.getString("book_name"));
                b.setBorrow_time(rs.getDate("borrow_time").toString());
                b.setDeadline_time(rs.getDate("deadline_time").toString());
                b.setFine_money(rs.getInt("fine_money"));
                b.setUser_id(rs.getInt("user_id"));
                list.add(b);
            }
            //7 返回产品集合
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("查询用户借阅记录数据失败!");
        } finally {
            //6 关闭资源
            JDBCUtils.close(conn, ps, rs);
        }
    }

    User updateUserInfo(User u) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql
//        String sql = "UPDATE user SET user_name=?,user_birth=?,user_gender=?,user_phone=? ,user_email=?,user_address=?,user_img=? where user_id=?";  
        String sql = "UPDATE user SET user_name=?,user_birth=?,user_gender=?,user_phone=? ,user_email=?,user_address=? ,user_img=? where user_id=?";

        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.获得参数
            ps.setString(1, u.getUser_name());
            ps.setString(2, u.getUser_birth());
            ps.setString(3, u.getUser_gender());
            ps.setString(4, u.getUser_phone());
//            ps.setDouble(4, Double.parseDouble(u.getContact_no()));
            ps.setString(5, u.getUser_email());
            ps.setString(6, u.getUser_address());

            ps.setString(7, u.getUser_img());
            ps.setInt(8, u.getUser_id());

            //5.执行修改
            int executeUpdate = ps.executeUpdate();

            //修改结束后获取修改之后的user
            user = findUserByID(u.getUser_id());
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("修改用户信息失败");
        } finally {
            //7.关闭资源,返回User
            JDBCUtils.close(conn, ps, rs);

        }
    }

    private User findUserByID(int user_id) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql
        String sql = "select * from user where user_id=?";

        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.获得参数
            ps.setInt(1, user_id);
            //5.执行查询
            rs = ps.executeQuery();
            //6.处理查询结果返回集,将rs集合中的数据封装到User中去。
            if (rs.next()) {
                u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setUser_name(rs.getString("user_name"));
                u.setUser_address(rs.getString("user_address"));
                u.setUser_birth(rs.getDate("user_birth").toString());
                u.setUser_email(rs.getString("user_email"));
                u.setUser_phone(rs.getString("user_phone"));
                u.setUser_gender(rs.getString("user_gender"));
                u.setUser_img(rs.getString("user_img"));
                u.setUser_pwd(rs.getString("user_pwd"));
                u.setUser_state(rs.getInt("user_state"));
                u.setUser_role(rs.getInt("user_role"));
            }
            return u;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("查询用户失败");
        } finally {
            //7.关闭资源,返回User
            JDBCUtils.close(conn, ps, rs);

        }
    }

    User updateUserPsd(User u) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql
        String sql = "UPDATE user SET user_pwd=? where user_id=?";

        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.获得参数
            ps.setInt(2, u.getUser_id());
            ps.setString(1, u.getUser_pwd());

            //5.执行修改
            int executeUpdate = ps.executeUpdate();

            user = findUserByID(u.getUser_id());
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("修改用户密码失败");
        } finally {
            //7.关闭资源,返回User
            JDBCUtils.close(conn, ps, rs);

        }
    }

    ArrayList<ISBN> GetBooksForUser(String select, String keyword) {
        ArrayList bookList = new ArrayList();
        String typeString = "";
        if (select.equals("标题")) {
            typeString = "book_name";
        } else if (select.equals("分类")) {
            typeString = "book_category";
        } else if (select.equals("ISBN")) {
            typeString = "book_ISBN";
        }
        // 1.获得连接
        Connection conn = JDBCUtils.getConnection();
        // 2.准备sql
        String sql = "select * from ISBN_Book where " + typeString + " LIKE '%" + keyword + "%'"; //Good
        java.sql.Statement stmt = null;
        try {
            stmt = conn.createStatement();
            // 5.执行 SQL
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                //不能写在外面
                ISBN book = new ISBN();
                book.setIsbn_id(rs.getInt("isbn_id"));
                book.setBook_ISBN(rs.getString("book_ISBN"));
                book.setBook_name(rs.getString("book_name"));
                book.setBook_category(rs.getString("book_category"));
                book.setBook_amounts(rs.getString("book_amounts"));
                book.setBook_remains(rs.getString("book_remains"));
                book.setBook_times(rs.getString("book_times"));
                // book.setTimes(rs.getString("dob"));
                bookList.add(book);
                // System.out.println("This guy SQLed by Email:
                // "+user.toString());
            }
            // 6.关闭资源
            JDBCUtils.close(conn, stmt, rs);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to connect the DB, or SQL wrong!");
        }
        return bookList;
    }

}
