<%-- 
    Document   : home
    Created on : 2018-1-15, 15:39:37
    Author     : BearKChan
--%>
<%@page import="java.util.ArrayList"%><%@page import="com.niit.user.ISBN"%>

<%
    ArrayList<ISBN> list = (ArrayList<ISBN>) request.getSession().getAttribute("ISBN");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Home Library</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/home.css">
    </head>

    <body>
        <div style="position:absolute;z-index:-1;width:100%;height:100%;">
            <img src="assets/images/0.jpg" width="100%" height="100%" />
        </div>
        <jsp:include flush="true" page="header.jsp"></jsp:include>



            <div class="container">
                <div class="row ">
                    <div class="col-md-2"></div>

                    <div class="col-md-8 search" style="margin-top: 50px">
                        <form action="/NetBeansLMS/UserSearchServlet" method="GET">
                            <P class="introduction">NIIT图书馆欢迎您</P>
                            <div class="form_group">
                                <!-- 下拉菜单 -->
                                <!-- <div class="btn-group">
                                    <button type="button" class="btn  dropdown-toggle drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                        style="min-width: 100%">
                                        标题
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li>
                                            <a href="#">标题</a>
                                        </li>
                                        <li>
                                            <a href="#">ISBN</a>
                                        </li>
                                        <li>
                                            <a href="#">分类</a>
                                        </li>
                                        <li>
                                            <a href="#">作者</a>
                                        </li>
                                    </ul>
                                </div> -->
                                <select class="btn  dropdown-toggle " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="select">
                                    <option>标题</option>
                                    <option>ISBN</option>
                                    <option>分类</option>
                                </select>
                                <!-- 下拉菜单end -->
                                <span class="split"></span>
                                <input type="text" class=" keybord" name="keyword">
                            </div>
                            <input type="submit" class="btn btn-info searchbutton" value="搜索">
                        </form>

                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="row">
                    <div class="clo-md-2"></div>
                    <div class="clo-md-8" style="overflow: scroll">
                        <table class="table table-sm">
                            <thead>
                                <tr>
                                    <th>ISBN</th>
                                    <th>书名</th>
                                    <th>分类</th>
                                    <th>总数量</th>
                                    <th>剩余数量</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% for (ISBN b : list) {
                            %>
                            <tr>
                                <td><%=b.getBook_ISBN()%></td>
                                <td><%=b.getBook_name()%></td>
                                <td><%=b.getBook_category()%></td>
                                <td><%=b.getBook_amounts()%></td>
                                <td><%=b.getBook_remains()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                        </tbody>
                    </table>


                </div>
                <div class="clo-md-2"></div>
            </div>
        </div>


    </div>

    <div class=" page_copy">
        <p>
            版权所有©NIIT图书馆
        </p>
    </div>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1/jquery-3.2.1.min.js"></script>
</body>

</html>