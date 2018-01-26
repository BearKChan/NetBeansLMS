/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.manger;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Acer
 */
@WebServlet(name = "RulesChangeServlet", urlPatterns = {"/RulesChangeServlet"})
public class RulesChangeServlet extends HttpServlet {
    
    MangerService ms=new MangerService();

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
            request.setCharacterEncoding("UTF-8");
            Rules r1=(Rules)request.getSession().getAttribute("rules");
            //1封装参数
            Rules r=new Rules();
            r.setRule_id(1);
            r.setDay_fine(Double.valueOf(request.getParameter("day_fine")));
            r.setDelay_amount(Integer.valueOf(request.getParameter("delay_amount")));
            r.setLimint_month(Integer.valueOf(request.getParameter("limint_month")));
            r.setMin_number(Integer.valueOf(request.getParameter("min_number")));
            if(request.getParameter("role").equals("teacher"))
            {
                r.setTeacher_amount(Integer.valueOf(request.getParameter("amount")));
                r.setStudent_amount(-1);
            }
            if(request.getParameter("role").equals("student"))
            {
               r.setStudent_amount(Integer.valueOf(request.getParameter("amount")));
               r.setTeacher_amount(-1);
            }

            Rules rules=ms.Update(r);
            //3修改成功，将保存到Session中进行存储
            request.getSession().setAttribute("rules", rules);
            //4.
            // response.sendRedirect(request.getContextPath()+"/UserInfoServlet");
            request.getRequestDispatcher("/home.jsp").forward(request, response);
            
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
