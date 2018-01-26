/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.login;

import com.niit.utils.JDBCUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Bear
 */
public class LoginDao {

    public User findUserByEmail(String user_email) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql
        String sql = "select * from user where user_email=?";

        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.获得参数
            ps.setString(1, user_email);
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
    
        public User findUserByPhone(String user_phone) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql
        String sql = "select * from user where user_phone=?";

        java.sql.PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.获得参数
            ps.setString(1, user_phone);
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
}
