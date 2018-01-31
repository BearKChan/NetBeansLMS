<%-- 
    Document   : clerk_management
    Created on : 2018-1-18, 9:10:51
    Author     : Acer
--%>

<%@page import="com.niit.manger.MangerDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.niit.manger.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="wap-font-scale" content="no" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>cleck management page</title>
        <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/site_global.css?4052507572" />
        <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/pages.css" id="pagesheet" />

        <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/few_pages.css" />
        <link rel="icon" href="rcms/www/t_logo.ico" type="image/x-icon" />


        <link href="bootstrap4/css/bootstrap.min.css" rel="stylesheet">
        <script src="bootstrap4/jquery-3.2.1.min.js"></script>
        <%
            ArrayList<Book> list = (ArrayList<Book>) request.getSession().getAttribute("book_list");
            MangerDao md = new MangerDao();
        %>

    </head>

    <body>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1/jquery-3.2.1.min.js"></script>
        <jsp:include flush="true" page="user_box_1.jsp"></jsp:include>




            <div class="channel-title user-title">

                <form>

                    <i class="c-icon ui1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i>
                    <label class="ut1">图书馆
                        <span class="text-blue">管理</span>
                    </label>
                </form>

            </div>

            <div class="container">
                <div class="row ">
                    <div class="col-md-2"></div>

                    <div class="col-md-8 search" style="margin-top: 50px">
                        <form method="GET" action="/NetBeansLMS/ManageSearchServlet">
                            <div class="row no-gutter">
                                <div class="col-25 text-r"></div>
                                <div class="input-group mb-3" style="width:550px">
                                    <select name="select">
                                        <option>标题</option>
                                        <option>ISBN</option>
                                    </select>
                                    <input type="text" class="form-control" name="keyword" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <input type="submit" class="btn btn-outline-secondary" value="搜索" style="width:100px;">
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="row" style="overflow: auto">

                    <table class="table table-sm">
                        <thead>
                            <tr>
                                <th>Book ID</th>
                                <th>书名</th>
                                <th>分类</th>
                                <th>状态</th>
                                <th>User ID</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for (Book b : list) {
                        %>
                        <tr>
                            <td>
                                <%=b.getBook_id()%>
                            </td>
                            <td>
                                <%=b.getBook_name()%>
                            </td>
                            <td>
                                <%=b.getCategory()%>
                            </td>
                            <%
                                int state = b.getState();
                                String stateString = "未借出";
                                if (state == 1) {
                                    stateString = "已借出";

                                }
                            %>
                            <td>
                                <%=stateString%>
                            </td>
                            <%
                                int book_id = b.getBook_id();

                                int user_id = md.findBorrowByBookID(book_id);

                                if (user_id == 0) {
                            %>
                    <form method="get" action="/NetBeansLMS/BorrowBookServlet">
                        <td>
                            <input type="text" name="user_id" >
                            <input type="text" name="book_id" hidden value="<%=book_id%>">
                            <input type="text" name="book_name" hidden value="<%=b.getBook_name()%>">
                        </td>
                        <td>
                            <input type="submit" value="借阅">

                        </td>
                        <td>
                            <a href="/NetBeansLMS/OutputBookinfoServlet?book_id=<%=book_id%>">详细信息 </a>

                        </td>
                        <form>
                            <%
                            } else {

                            %>
                            <td>
                                <input type="text" readonly="true" value="<%=user_id%>">
                            </td>
                            <td>
                                <a style="color: red" href="/NetBeansLMS/ReturnBookServlet?book_id=<%=book_id%>&book_name=<%=b.getBook_name()%>">还书 </a>
                            </td>
                            <td>
                                <a href="/NetBeansLMS/OutputBookinfoServlet?book_id=<%=book_id%>">详细信息 </a>

                            </td>
                            </td>
                            <%}%>

                            </tr>
                            <% }%>
                            </tbody>
                            </table>

                            </div>
                            </div>


                            </div>
                            </div>

                            </div>

            <%--<jsp:include flush="true" page="footer.jsp"></jsp:include>--%>

                            </body>

                            </html>