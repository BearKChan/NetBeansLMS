/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.clerk;

import com.niit.user.ISBN;
import com.niit.utils.JDBCUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Bear
 */
public class ClerkDao {

    void addBook(Book book) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql     
        String sql = "insert into book(book_ISBN,book_name,book_date,book_author,book_category,book_price,book_img,book_introduction,book_publisher ) values (?,?,?,?,?,?,?,?,?)";
        java.sql.PreparedStatement ps = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.填写参数
            ps.setString(1, book.getBook_ISBN());
            ps.setString(2, book.getBook_name());
            ps.setString(3, book.getBook_date());
            ps.setString(4, book.getBook_author());
            ps.setString(5, book.getBook_category());
            ps.setString(6, book.getBook_price());
            ps.setString(7, book.getBook_img());
            ps.setString(8, book.getBook_introduction());
            ps.setString(9, book.getBook_publisher());
            //5.执行sql
            int result = ps.executeUpdate();
            if (result != 1) {
                throw new RuntimeException("书本添加失败！");
            }
            //6.关闭资源
            JDBCUtils.close(conn, ps, null);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("数据库连接失败！");
        }
    }

    ArrayList<Fine> getAllFIneList() {
        ArrayList<Fine> fine_list = new ArrayList<>();
        // 1.获得连接
        Connection conn = JDBCUtils.getConnection();
        String sql = "select * from fine";
        java.sql.Statement stmt = null;
        try {
            stmt = conn.createStatement();
            // 5.执行 SQL
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Fine fine = new Fine();
                fine.setFine_id(rs.getInt("fine_id"));
                fine.setBook_id(rs.getInt("book_id"));
                fine.setDeadline_time(rs.getString("deadline_time"));
                fine.setFine_money(rs.getDouble("fine_money"));
                fine.setSingle_fine(rs.getDouble("single_fine"));
                fine.setUser_id(rs.getInt("user_id"));
                fine_list.add(fine);
            }
            // 6.关闭资源
            JDBCUtils.close(conn, stmt, rs);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to connect the DB, or SQL wrong!");
        }
        return fine_list;
    }

    void returnFine(int fine_id) {
        try {
            // 1.获得连接
            Connection conn = JDBCUtils.getConnection();
            String sql = "delete from fine where fine_id=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, fine_id);
            pst.executeUpdate();
            // 6.关闭资源
            pst.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void findUser_IDInFine(int user_id
    ) {
        // 1.获得连接
        Connection conn = JDBCUtils.getConnection();
        String sql = "select * from fine where user_id=?";
        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            // 5.执行 SQL
            rs = ps.executeQuery();
            if (!rs.next()) {
                changeUserState(true, user_id);
            }

            // 6.关闭资源
            JDBCUtils.close(conn, ps, rs);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to connect the DB, or SQL wrong!");
        }
    }

    private void changeUserState(boolean b, int user_id) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql
        String sql = "UPDATE user SET user_state=? where user_id=?";

        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;

        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.获得参数
            if (b) {
                ps.setInt(1, 0);
            } else {
                ps.setInt(1, 1);

            }
            ps.setInt(2, user_id);

            //5.执行修改
            int executeUpdate = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("修改用户信息失败");
        } finally {
            //7.关闭资源,返回User
            JDBCUtils.close(conn, ps, rs);

        }
    }

}
