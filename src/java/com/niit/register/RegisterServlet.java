/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.register;

import com.niit.login.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bear
 */
public class RegisterServlet extends HttpServlet {

    RegisterService registerService = new RegisterService();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //1.记得先加上这行代码
            request.setCharacterEncoding("UTF-8");
            //2 封装参数到User对象
            User u = new User();
            u.setUser_name(request.getParameter("username"));
            u.setUser_pwd(request.getParameter("userpwd"));
            u.setUser_birth(request.getParameter("userbirth"));
            u.setUser_gender(request.getParameter("usergender"));
            u.setUser_phone(request.getParameter("userphone"));
            u.setUser_email(request.getParameter("useremail"));
            u.setUser_role(Integer.parseInt(request.getParameter("userrole")));
            u.setUser_address(request.getParameter("useraddress"));
            u.setUser_state(0);
            
            //设置注册用户的默认路径
            SimpleDateFormat format=new SimpleDateFormat("/yyyy/MM/dd/");
            String datepath = format.format(new Date());
            //拼接完整路径
            String wholepath="/Images/User_Images"+datepath;
            String storePath =request.getSession().getServletContext().getRealPath("")+wholepath;
            File directory = new  File(storePath);
            if(!directory.exists())
            {
                directory.mkdirs();
            }
            String fileName=UUID.randomUUID().toString();
            u.setUser_img(wholepath+fileName);
            
            //3 调用Service保存
            try {
                registerService.register(u);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                return;
            }
            //4 根据结果,跳转到对应页面
            out.print("<script> alert(\"注册成功，请登录!\"); window.location.href='/NetBeansLMS/login.jsp';</script>");
//            response.getWriter().print("<script> alert(\"注册成功!\"); </script>");
//            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
