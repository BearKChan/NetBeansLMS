<%-- 
    Document   : header
    Created on : 2018-1-17, 16:31:39
    Author     : Bear
    Description: The login navgarion bar for pages.
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="com.niit.login.User" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" href="assets/css/bootstrap.min.css">
                <link rel="stylesheet" href="assets/css/home.css">
            </head>

            <body>
                <%
            User sessionUser = (User) request.getSession().getAttribute("user");
            if (sessionUser != null) {

        %>
                    <!-- 导航栏 -->
                    <nav class="navbar  navbar-inverse navbar-static-top mynavbar ">
                        <div class="container">
                            <div class=" navbar-header ">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                                    aria-controls="navbar">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="#">NIIT LIBRARY</a>
                            </div>
                            <!-- 用户登陆成功-->
                            <div class="navbar-collapse  navbar-left mynav-fontsize  " id="userinfo_nav">
                                <span  class="welcome_span">欢迎您:</span>
                        
                                <a class="btn btn-success" style="margin-left: 10px;margin-top: 5px;" href="/NetBeansLMS/UserInfoServlet">
                                    ${sessionScope.user.user_name}
                                </a>
                                <a class="btn btn-primary" style="margin-left: 5px;margin-top: 5px;" href="/NetBeansLMS/LogoutServlet">退出</a>
                            </div>
                            <!-- 用户登陆结束 -->
                            <!-- 导航栏标签开始 -->
                            <div id="navbar" class="navbar-collapse collapse navbar-right">
                                <ul class="nav navbar-nav mynav-fontsize">
                                    <li class="active">
                                        <a href="home.jsp">首页</a>
                                    </li>
                                    <li>
                                        <a href="about_us.jsp">关于我们</a>
                                    </li>
                                    <li>
                                        <a href="contact_us.jsp">联系我们</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- 导航栏标签结束 -->
                        </div>
                    </nav>


                    <%} else {

        %>

                        <!-- 导航栏 -->
                        <nav class="navbar  navbar-inverse navbar-static-top mynavbar ">
                            <div class="container">
                                <div class=" navbar-header ">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                                        aria-controls="navbar">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                    <a class="navbar-brand" href="#">NIIT LIBRARY</a>
                                </div>
                                <!-- 登陆注册按钮开始 -->
                                <div class="navbar-collapse collapse navbar-left mynav-fontsize">
                                    <a class="btn btn-success" style="margin-left: 10px;margin-top: 5px;" href="login.jsp">登陆</a>
                                    <a class="btn btn-primary" style="margin-left: 5px;margin-top: 5px;" href="register.jsp ">注册</a>
                </div>
                <!-- 登陆注册按钮结束 -->
                <!-- 导航栏标签开始 -->
                <div id="navbar " class="navbar-collapse collapse navbar-right ">
                    <ul class="nav navbar-nav mynav-fontsize ">
                        <li class="active ">
                            <a href="# ">首页</a>
                        </li>
                        <li>
                            <a href="#about ">关于我们</a>
                        </li>
                        <li>
                            <a href="#contact ">联系我们</a>
                        </li>
                    </ul>
                </div>
                <!-- 导航栏标签结束 -->
            </div>
        </nav>
        <!-- 导航栏end-->

        <%}%>

        <!-- 导航栏end-->
    </body>
</html>