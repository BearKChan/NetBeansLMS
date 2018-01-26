/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.register;

import com.niit.login.LoginDao;
import com.niit.login.User;

/**
 *
 * @author Bear
 */
public class RegisterService {

    LoginDao ld = new LoginDao();
    RegisterDao rd = new RegisterDao();

    public void register(User u) {
        //1.校验邮箱不重复
        User user1 = ld.findUserByEmail(u.getUser_email());
        if (user1 != null) {
            //说明邮箱已经存在了
            throw new RuntimeException("邮箱已经注册");
        }
        User user2 = ld.findUserByPhone(u.getUser_phone());
        if (user2 != null) {
            //说明邮箱已经存在了
            throw new RuntimeException("手机号已经注册");
        }
        //2.调用dao，执行保存操作
        rd.save(u);
    }
}
