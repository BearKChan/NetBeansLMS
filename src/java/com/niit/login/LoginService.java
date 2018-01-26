/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.login;

/**
 *
 * @author Bear
 */
class LoginService {

    LoginDao ld = new LoginDao();

    public User login(User u) {
        //1.校验用户名是否存在
        User user = ld.findUserByEmail(u.getUser_email());
        if (user == null || !user.getUser_pwd().equals(u.getUser_pwd())) {
            //说明密码不正确
            throw new RuntimeException("用户名错误或密码不正确！");
        }
        //2.登录成功，返回user对象
        return user;
    }
}
