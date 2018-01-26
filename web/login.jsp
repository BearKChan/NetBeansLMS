<%-- 
    Document   : Login
    Created on : 2018-1-15, 15:30:41
    Author     : BearKChan
    Description: The home file of Home of the Library Management System.
--%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Map"%>


<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String password = "";
    String name = "";
    String checked = "";
    Cookie[] cookies = request.getCookies();        //取出cookie对象组  
    for (int i = 0; cookies != null && i < cookies.length; i++) {
        Cookie cookie = cookies[i];       //  取出其中的一个对象，含有name ,value  
        if (cookie != null && "name".equals(cookie.getName())) {      //获取第一个cookie对象的name  
//            name = URLDecoder.decode(cookie.getValue(), "UTF-8");//进行解码  
            name = cookie.getValue();
            checked = "checked";
        }
        if (cookie != null && "password".equals(cookie.getName())) {
            password = cookie.getValue();
        }
    }


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/login.css">

    </head>

    <body>

        <div style="position:absolute;z-index:-1;width:100%;height:100%;">
            <img src="assets/images/0.jpg" width="100%" height="100%" />
        </div>
        <jsp:include flush="true" page="header.jsp"></jsp:include>


        <div class="container">
            <div class="row">
                <div class="login_page">
                    <div class="login_box_m">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <div class="content">
                                    <div class="logo">
                                        NIIT 图书馆
                                    </div>
                                </div>
                                <div class="login_form">
                                    <div class="login_form_title">
                                        <h3>用户登陆</h3>
                                    </div>
                                    <form method="post" action="/NetBeansLMS/LoginServlet">
                                        <div class="login_form_detail">
                                            <!-- 登陆表单 -->
                                            <div class="left_side">
                                                <div class="input_div">
                                                    <i class="_icon i-user"></i>
                                                    <!-- 用户名 -->
                                                    <input type="text" placeholder="邮箱" id="useremail" name="name" value="<%=name%>">
                                                    <label id="useremailinfo-error" class="error" for="useremail">
                                                        <span id="useremailinfo">${requestScope.errors.email}${requestScope.loginfail}</span>
                                                    </label>
                                                </div>
                                                <!-- 密码 -->
                                                <div class="input_div pwd">
                                                    <i class="_icon i-pwd"></i>
                                                    <input type="password" placeholder="密码" id="userpwd" name="password" value="<%=password%>">
                                                    <label id="userpasswordinfo-error" class="error" for="userpwd">
                                                        <span id="userpwdinfo">${requestScope.errors.password}</span>
                                                    </label>
                                                </div>
                                                <label class="remeber-me">
                                                    <input type="checkbox"  name="remember" value="yes" <%=checked%>> 记住我
                                                </label>
                                                <!-- 登录 -->
                                                <input type="submit" class="sub_btn" value="登陆">
                                            </div>
                                            <!-- 链接部分 -->
                                            <div class="right_side">
                                                <!-- 没有账号？ -->
                                                <div class="div1">
                                                    <div class="login_form_title2">
                                                        <h4>没有账号？？</h4>
                                                    </div>
                                                </div>
                                                <div class="div2">
                                                    <a class="reg-link guest-reg" href="register.jsp">立即注册</a>
                                                </div>




                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-copy">
                        <p>
                            版权所有©NIIT图书馆
                        </p>
                    </div>
                </div>

            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1/jquery-3.2.1.min.js"></script>
        <script>
            $(document).ready(function () {
                if ($("#useremailinfo").text() === "") {
                    $("#useremailinfo-error").css('display', 'none');

                } else {
                    $("#useremailinfo-error").css('display', 'block');

                }

                if ($("#userpwdinfo").text() === "") {
                    $("#userpasswordinfo-error").css('display', 'none');

                } else {
                    $("#userpasswordinfo-error").css('display', 'block');

                }

            });
        </script>
    </body>

</html>