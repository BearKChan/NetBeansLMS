/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.clerk;

import com.niit.login.User;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Bear
 */
public class AddBookServlet extends HttpServlet {

    private ClerkService cs = new ClerkService();

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
            throws ServletException, IOException, FileUploadException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //记得先加上这行代码
            request.setCharacterEncoding("UTF-8");
            Book book = new Book();
            //1封装参数

            //1.创建一个DiskFileItemFactory
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //2.使用工厂创建一个ServletFileUpload
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("utf-8");
            //3.判断当前请求是不是多段式提交
            boolean multipartContent = ServletFileUpload.isMultipartContent(request);
            if (!multipartContent) {
                //3.1如果不是的话就是普通的表单提交
                throw new RuntimeException("不是多段式提交！");
            }
            try {
                //4.解析request对象，获得所有的多段式内容
                List<FileItem> parseRequest = upload.parseRequest(request);
                if (parseRequest != null) {
                    for (FileItem item : parseRequest) {
                        //4.1遍历解析，判断当前上传的是否是普通字段，还是文件上传
                        if (!item.isFormField()) {
                            //4.2如果是文件上传,获取文件的姓名
                            String fNameString = item.getFieldName();
                            InputStream inputStream = item.getInputStream();
                            //5.使用第三方的工具类将文件拷贝到输出流中
                            //设置注册用户的默认路径
                            SimpleDateFormat format = new SimpleDateFormat("/yyyy/MM/dd/");
                            String datepath = format.format(new Date());
                            //拼接完整路径
                            String wholepath = "/Images/Book_Images" + datepath;
                            String storePath = request.getSession().getServletContext().getRealPath("") + wholepath;
                            File directory = new File(storePath);
                            if (!directory.exists()) {
                                directory.mkdirs();
                            }
                            String fileName = UUID.randomUUID().toString();
                            FileOutputStream fos = new FileOutputStream(request.getSession().getServletContext().getRealPath("") + wholepath + fileName);
                            book.setBook_img(wholepath + fileName);
                            //5.使用第三方的工具类将文件拷贝到输出流中
                            IOUtils.copy(inputStream, fos);
                            //6.最后记得new出来的流记得关闭
                        } else {
                            {
                                String fieldName = item.getFieldName();
                                String value = item.getString("utf-8");
                                if (fieldName.equals("book_name")) {
                                    book.setBook_name(value);
                                }
                                if (fieldName.equals("book_isbn")) {
                                    book.setBook_ISBN(value);
                                }
                                if (fieldName.equals("book_date")) {
                                    book.setBook_date(value);
                                }
                                if (fieldName.equals("book_author")) {
                                    book.setBook_author(value);
                                }
                                if (fieldName.equals("book_category")) {
                                    book.setBook_category(value);
                                }
                                if (fieldName.equals("book_price")) {
                                    book.setBook_price(value);
                                }
                                if (fieldName.equals("book_publisher")) {
                                    book.setBook_publisher(value);
                                }
                                if (fieldName.equals("book_introduction")) {
                                    book.setBook_introduction(value);
                                }
                            }
                        }
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
//            u.setUser_name(request.getParameter("username"));
//            u.setUser_birth(request.getParameter("userbirth"));
//            u.setUser_gender(request.getParameter("usergender"));
//            u.setUser_phone(request.getParameter("userphone"));
//            u.setUser_email(request.getParameter("useremail"));
////            u.setUser_role(Integer.parseInt(request.getParameter("userrole")));
//            u.setUser_address(request.getParameter("useraddress"));
//            u.setUser_state(0);
            //2.修改信息
            cs.addBook(book);
            //3.修改成功，将user保存到Session中进行存储

//            request.getSession().setAttribute("user", user);
            //4.跳转到userinfo页面
            request.getRequestDispatcher("/clerk_management.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(AddBookServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(AddBookServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
