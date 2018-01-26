/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author BearKChan
 */
public class LoginServlet extends HttpServlet {

    private LoginService ls = new LoginService();

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
            //2.设置“记住我”功能
            RememberUtils.remember(request, response);
            //3.封装参数
            User u = new User();
            u.setUser_email(request.getParameter("name"));
            u.setUser_pwd(request.getParameter("password"));
            // 4.检验输入
            Map<String, String> errors = CheckUtils.CheckUser(u);
            if (errors.size() > 0) {
                //有错误，保存异常到request中，并且转发到登录页面
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("/login.jsp").forward(request, response);//#######登陆界面
                return;
            }

            //  5.进行登陆
            User user = null;
            try {

                //5.1调用service登录
                user = ls.login(u);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("loginfail", e.getMessage());
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }
            //6.登陆成功，将user保存到Session中进行存储
            request.getSession().setAttribute("user", user);
            //7.登陆成功跳转到相应界面
//            out.print("<script> alert(\"登录成功!\"); window.location.href='/NetBeansLMS/home.jsp';</script>");
            if (user.getUser_role() == 2) {
                request.getRequestDispatcher("/clerk_management.jsp").forward(request, response);

            } else {
                request.getRequestDispatcher("/home.jsp").forward(request, response);
            }
//            response.getWriter().print("<script> alert(\"登录成功!\"); </script>");
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
