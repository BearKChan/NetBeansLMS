/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.register;

import com.niit.login.User;
import com.niit.utils.JDBCUtils;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Bear
 */
public class RegisterDao {

    public void save(User u) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql     
        String sql = "insert into user(user_name,user_role,user_phone,user_pwd,user_email,user_gender,user_address,user_birth,user_state,user_img) values( ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
        java.sql.PreparedStatement ps = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.填写参数
            ps.setString(1, u.getUser_name());
            ps.setInt(2, u.getUser_role());
            ps.setString(3, u.getUser_phone());
            ps.setString(4, u.getUser_pwd());
            ps.setString(5, u.getUser_email());
            ps.setString(6, u.getUser_gender());
            ps.setString(7, u.getUser_address());
            ps.setString(8, u.getUser_birth());
            ps.setInt(9, u.getUser_state());
            ps.setString(10, u.getUser_img());
            //5.执行sql
            int result = ps.executeUpdate();
            if (result != 1) {
                throw new RuntimeException("用户注册失败！");
            }
            //6.关闭资源
            JDBCUtils.close(conn, ps, null);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("数据库连接失败！");
        }

    }
}
