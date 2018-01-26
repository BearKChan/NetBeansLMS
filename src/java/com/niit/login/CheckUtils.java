/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.login;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Bear
 */
public class CheckUtils {

    public static Map<String, String> CheckUser(User u) {
        Map<String, String> map = new HashMap<String, String>();
        //如果邮箱为空
        if (u.getUser_email() == null || "".equals(u.getUser_email().trim())) {
            map.put("email", "邮箱不能为空");
        } else {
            // 如果邮箱规则不对
            String regEx1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            Pattern p;
            Matcher m;
            p = Pattern.compile(regEx1);
            m = p.matcher(u.getUser_email());
            if (!m.matches()) {
                map.put("email", "邮箱格式应为：abc@abc.com");
            }
        }
        //如果密码为空
        if (u.getUser_pwd() == null || "".equals(u.getUser_pwd().trim())) {
            map.put("password", "密码不能为空");
        }

        return map;
    }
}
