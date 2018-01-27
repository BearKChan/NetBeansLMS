<%-- 
    Document   : user_box
    Created on : 2018-1-27, 14:43:05
    Author     : Bear
--%>

    <%@page import="com.niit.login.User"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/site_global.css?4052507572" />
                <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/pages.css" id="pagesheet" />

                <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/few_pages.css" />
                <link rel="icon" href="rcms/www/t_logo.ico" type="image/x-icon" />


                <link href="bootstrap4/css/bootstrap.min.css" rel="stylesheet">
                <script src="bootstrap4/jquery-3.2.1.min.js"></script>

                <!-- 读取系统时间 -->
                <SCRIPT language=JavaScript>
                    function tick() {
                        var years, months, days, hours, minutes, seconds;
                        var intYears, intMonths, intDays, intHours, intMinutes, intSeconds;
                        var today;
                        today = new Date(); //系统当前时间
                        intYears = today.getFullYear(); //得到年份,getFullYear()比getYear()更普适
                        intMonths = today.getMonth() + 1; //得到月份，要加1
                        intDays = today.getDate(); //得到日期
                        intHours = today.getHours(); //得到小时 
                        intMinutes = today.getMinutes(); //得到分钟
                        intSeconds = today.getSeconds(); //得到秒钟
                        years = intYears + "年";

                        if (intMonths < 10) {
                            months = "0" + intMonths + "月";
                        } else {
                            months = intMonths + "月";
                        }
                        if (intDays < 10) {
                            days = "0" + intDays + "日 ";
                        } else {
                            days = intDays + "日 ";
                        }
                        if (intHours == 0) {
                            hours = "00:";
                        } else if (intHours < 10) {
                            hours = "0" + intHours + ":";
                        } else {
                            hours = intHours + ":";
                        }
                        if (intMinutes < 10) {
                            minutes = "0" + intMinutes + ":";
                        } else {
                            minutes = intMinutes + ":";
                        }
                        if (intSeconds < 10) {
                            seconds = "0" + intSeconds + " ";
                        } else {
                            seconds = intSeconds + " ";
                        }
                        timeString = years + months + days + hours + minutes + seconds;
                        Clock.innerHTML = timeString;
                        window.setTimeout("tick();", 1000);
                    }
                    window.onload = tick;
                </SCRIPT>
            </head>

            <body>
                <div class="user-box">
                    <div class="channel_nav">
                        <ul id="nav-lv1" class="nav-lv1">

                            <li class="active" style="width: 200px">
                                <a href="home.jsp" title="首页" alt="首页" target="_self">首页</a>
                            </li>
                            <li style="width: 200px">
                                <a href="contact_us.jsp" title="联系我们" alt="联系我们" target="_self">联系我们</a>

                            </li>
                            <li style="width: 200px">
                                <a href="about_us.jsp" title="关于我们" alt="关于我们" target="_self">关于我们</a>

                            </li>
                        </ul>
                        <div id="lv2box" class="nav-lv2">
                            <div class="scrollNav">
                                <a id="n_left" href="javascript:;" class="nav_left">△</a>
                                <div id="navslv2" class="nav-box">
                                    <ul class="nav-menu-scroll">

                                    </ul>

                                </div>
                                <a id="n_right" href="javascript:;" class="nav_right">▽</a>
                            </div>

                        </div>
                        <div class="nav-breadcrumb">
                            <div class="w960">
                                <div class="breadcrumb">
                                    您现在的位置是：
                                    <a href="home.jsp">首页</a> &gt;
                                    <a href="/NetBeansLMS/UserInfoServlet">我的空间</a> &gt;
                                    <span style="color: #38b4e6">管理界面</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-20">
                            <div class="user-head-box">
                                <a style="margin-top: 0px;width: 30px;">
                                    <img class="head_img" id="user_img" src="/NetBeansLMS${sessionScope.user.user_img}" />

                                </a>
                            </div>
                        </div>
                        <div class="col-80">
                            <div class="user-info">
                                <span class="orange">欢迎您:</span>
                                <i class="usericon-user">用户</i>
                                <span>${sessionScope.user.user_name} </span>
                                <a href="/NetBeansLMS/LogoutServlet" id="logout_user" class="urser-logout">[退出]</a>
                                <i class="usericon-msg">消息</i>
                                <a>你有
                                    <span class='orange'>
                                        <span id="countDiv">0</span>
                                    </span> 条未读信息</a>
                                <label class="float-r">
                                    <i class="usericon-call">日期</i>
                                    <span id="Clock"></span>
                                </label>
                            </div>

                            <div class="user-nav">
                                <ul id="usernav" class="user-nav-lv1 clearfix">
                                    <!-- 个人中心 -->
                                    <li id="msps" >
                                        <a href="/NetBeansLMS/UserInfoServlet" >
                                            <i class="usernav-icon icon1"></i> 个人中心

                                        </a>

                                    </li>
                                    <%
                                User u = (User) request.getSession().getAttribute("user");
                                int user_role = u.getUser_role();
                                if (user_role == 2 || user_role == 3) {
                            %>
                                        <li id="msgl" class="cur">
                                            <a href="clerk_management.jsp" >
                                                <i class="usernav-icon icon1"></i> 管理图书馆
                                            </a>
                                        </li>

                                        <%}%>
<!--                                            <script>
                                                function msps() {
                                                    var msps = document.getElementById("msps");
                                                    var msgl = document.getElementById("msgl");
                                                    msps.className = "cur";
                                                    msgl.className = "";
                                                }

                                                function msgl() {
                                                    var msps = document.getElementById("msps");
                                                    var msgl = document.getElementById("msgl");
                                                    msgl.className = "cur";
                                                    msps.className = "";
                                                }
                                            </script>-->
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>

            </body>

            </html>