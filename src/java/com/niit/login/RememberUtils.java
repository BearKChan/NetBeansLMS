/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.login;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author BearKChan
 */
public class RememberUtils {
        public static void remember(HttpServletRequest request,HttpServletResponse response){  
        String name = request.getParameter("name");                    //获取用户名  
        String password = request.getParameter("password");        //获取密码  
        String remember = request.getParameter("remember");     //获取是否打钩  
//        String codeName="";  
//        try {  
//            codeName = URLEncoder.encode(name, "UTF-8");      //对输入的中文进行编码，防止乱码出现  
//        } catch (UnsupportedEncodingException e) {  
//            e.printStackTrace();  
//        }  
        Cookie nameCookie = new Cookie("name", name);   
        Cookie passwordCookie = new Cookie("password", password);   
        nameCookie.setPath(request.getContextPath()+"/");      //设置Cookie的有效路径  
        passwordCookie.setPath(request.getContextPath()+"/");//设置Cookie的有效路径  
        if(remember != null && "yes".equals(remember)){            //有记住我，就设置cookie的保存时间  
            nameCookie.setMaxAge(7*24*60*60);  
            passwordCookie.setMaxAge(7*24*60*60);  
        }else{                                                                                 //没有记住我，设置cookie的时间为0  
            nameCookie.setMaxAge(0);  
            passwordCookie.setMaxAge(0);  
        }  
        response.addCookie(nameCookie);  //nameCookie
        response.addCookie(passwordCookie);  //passwordCookie
    }  
    
}
