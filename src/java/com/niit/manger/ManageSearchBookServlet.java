/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.manger;

import com.niit.utils.JDBCUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bear
 */
@WebServlet(name = "ManageSearchBookServlet", urlPatterns = {"/ManageSearchBookServlet"})
public class ManageSearchBookServlet extends HttpServlet {

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
        //记得先加上这行代码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String select = request.getParameter("select");
        String keyword = request.getParameter("keyword");

        try (PrintWriter out = response.getWriter()) {
            String typeString = "";
            if (select.equals("标题")) {
                typeString = "book_name";
            } else if (select.equals("ISBN")) {
                typeString = "book_ISBN";
            }
            // 1.获得连接
            Connection conn = JDBCUtils.getConnection();
            // 2.准备sql
            String sql = "select * from book where " + typeString + " LIKE '%" + keyword + "%'"; //Good
            java.sql.Statement stmt = null;
            ArrayList<Book> bookList = new ArrayList<>();
            try {
                stmt = conn.createStatement();
                // 5.执行 SQL
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    //不能写在外面
                    Book book = new Book();
                    book.setAuthor(rs.getString("book_author"));
                    book.setBook_ISBN(rs.getString("book_ISBN"));
                    book.setBook_id(rs.getInt("book_id"));
                    book.setBook_name(rs.getString("book_name"));
                    book.setCategory(rs.getString("book_category"));
                    book.setImg(rs.getString("book_img"));
                    book.setIntroduction(rs.getString("book_introduction"));
                    book.setOutput_date(rs.getString("book_date"));
                    book.setPrice(rs.getString("book_price"));
                    book.setPublisher(rs.getString("book_publisher"));
                    book.setState(rs.getInt("book_state"));

                    bookList.add(book);
                }
                // 6.关闭资源
                JDBCUtils.close(conn, stmt, rs);
            } catch (SQLException e) {
                e.printStackTrace();
//                throw new RuntimeException("Failed to connect the DB, or SQL wrong!");
            }

            if (bookList.isEmpty()) {
//                request.getRequestDispatcher("/search_book_fail.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("book_list", bookList);
                request.getRequestDispatcher("/clerk_search_book_success.jsp").forward(request, response);

            }
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
