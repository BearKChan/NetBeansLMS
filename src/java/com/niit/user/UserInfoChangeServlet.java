/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.user;

import com.niit.login.User;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
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
public class UserInfoChangeServlet extends HttpServlet {

    private UserService us = new UserService();

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
            User u = new User();
            User u1 = (User) request.getSession().getAttribute("user");
            u.setUser_id(u1.getUser_id());
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
                            String user_img = u1.getUser_img();
                            File old_file = new File(request.getSession().getServletContext().getRealPath("") + user_img);
                            old_file.delete();
                            FileOutputStream fos = new FileOutputStream(request.getSession().getServletContext().getRealPath("") + user_img);
                            u.setUser_img(u1.getUser_img());
                            //5.使用第三方的工具类将文件拷贝到输出流中
                            IOUtils.copy(inputStream, fos);
                            //6.最后记得new出来的流记得关闭
                        } else {
                            {
                                String fieldName = item.getFieldName();
                                String value = item.getString("utf-8");
                                if (fieldName.equals("username")) {
                                    u.setUser_name(value);
                                }
                                if (fieldName.equals("userbirth")) {
                                    u.setUser_birth(value);
                                }
                                if (fieldName.equals("usergender")) {
                                    u.setUser_gender(value);
                                }
                                if (fieldName.equals("userphone")) {
                                    u.setUser_phone(value);
                                }
                                if (fieldName.equals("useremail")) {
                                    u.setUser_email(value);
                                }
                                if (fieldName.equals("useraddress")) {
                                    u.setUser_address(value);
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
            User user = us.update(u);
            //3.修改成功，将user保存到Session中进行存储

            request.getSession().setAttribute("user", user);
            //4.跳转到userinfo页面
            request.getRequestDispatcher("/UserInfoServlet").forward(request, response);
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
            Logger.getLogger(UserInfoChangeServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UserInfoChangeServlet.class.getName()).log(Level.SEVERE, null, ex);
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
