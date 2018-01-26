<%-- 
    Document   : user_info_change
    Created on : 2018-1-18, 8:41:38
    Author     : Acer
--%>
    <%@page import="com.niit.login.User"%>
        <%
    User user = (User) request.getSession().getAttribute("user");
    String genderString="";
    if (user == null) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);//#######登陆界面
            }
else{
    genderString = user.getUser_gender();}
%>

            <%@page contentType="text/html" pageEncoding="UTF-8"%>
                <!DOCTYPE html>
                <html lang="zh-CN">

                <head>

                    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
                    <meta name="wap-font-scale" content="no" />
                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                    <title>cleck information change page</title>
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
                                        <span style="color: #38b4e6">个人资料</span>
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
                                        <li id="msps" class="cur">
                                            <a href="javascript:;">
                                                <i class="usernav-icon icon1"></i> 个人中心

                                            </a>
                                        </li>
                                        <!-- 借阅服务 -->
                                        <li id="msjy">
                                            <a href="javascript:;">
                                                <i class="usernav-icon icon2"></i> 借阅服务

                                            </a>
                                        </li>


                                        <li id="msqt">
                                            <a href="javascript:;">
                                                <i class="usernav-icon icon4"></i> 其他
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="channel-title user-title">

                        <form>

                            <i class="c-icon ui1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i>
                            <label class="ut1">个人
                                <span class="text-blue">资料</span>
                            </label>

                        </form>

                    </div>



                    <!-- 栏目标题end -->

                    <!-- 个人资料 -->
                    <form method="POST" action="/NetBeansLMS/UserInfoChangeServlet" enctype="multipart/form-data">
                        <div class="userinfobox">
                            <div class="row no-gutter">
                                <div class="col-25 text-r"></div>
                                <div class="col-75"></div>
                            </div>
                            <div class="row no-gutter">
                                <div class="col-40 text-r">头像：</div>
                                <div class="col-60">
                                    <input type="file" class="form-control" style="width:400px" src="<%=request.getSession().getServletContext().getRealPath("")%>+${sessionScope.user.user_img}" name="user_imgfile">
                                </div>
                            </div>

                            <div class="row no-gutter">
                                <div class="col-40 text-r">姓名：</div>
                                <div class="col-60">
                                    <input type="text" class="form-control" style="width:400px" placeholder="请输入姓名" name="username" value="${sessionScope.user.user_name}"
                                        required>
                                </div>
                            </div>

                            <div class="row no-gutter">
                                <div class="col-40 text-r">出生日期：</div>
                                <div class="col-60">
                                    <input type="date" class="form-control" style="width:400px" name="userbirth" value="${sessionScope.user.user_birth}" required>
                                </div>
                            </div>
                            <div class="row no-gutter">
                                <div class="col-40 text-r">性别：</div>
                                <div>
                                    <label class="radio-inline">
                                        <input type="radio" name="usergender" value="male"  id="maleradio">男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="usergender" value="female" id="femaleradio">女
                                    </label>
                                </div>
                                <script>
                                    var agender = "<%=genderString%>";
                                    if (agender === "male") {
                                        document.getElementById("maleradio").checked = "checked";

                                    } else if (agender === "female") {
                                        document.getElementById("femaleradio").checked = "checked";

                                    }
                                </script>
                            </div>
                            <div class="row no-gutter">
                                <div class="col-40 text-r">邮箱：</div>
                                <div class="col-60">
                                    <input type="text" class="form-control" style="width:400px" placeholder="请输入Email" name="useremail" value="${sessionScope.user.user_email}"
                                        required pattern="^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$">
                                </div>
                            </div>
                            <div class="row no-gutter">
                                <div class="col-40 text-r">手机：</div>
                                <div class="col-60">
                                    <input type="text" class="form-control" style="width:400px" placeholder="请输入手机号码" name="userphone" value="${sessionScope.user.user_phone}"
                                        required>
                                </div>
                            </div>
                            <div class="row no-gutter">
                                <div class="col-40 text-r">地址：</div>
                                <div class="col-60">
                                    <input type="text" class="form-control" style="width:400px" placeholder="请输入地址" name="useraddress" value="${sessionScope.user.user_address}"
                                        required>
                                </div>
                            </div>
                            <div class="row no-gutter">
                                <div class="col-40 text-r">
                                    <button type="submit" class="btn btn-primary" style="width:100px;">修改</button>
                                </div>
                                <div class="col-20"></div>
                                <div class="col-40">
                                    <a href="/NetBeansLMS/UserInfoServlet">
                                        <button type="button" class="btn btn-primary" style="width:100px;">取消</button>
                                    </a>
                                </div>
                            </div>
                            <div class="row no-gutter">
                                <div class="col-25 text-r"> </div>
                                <div class="col-75"></div>
                            </div>
                        </div>
                    </form>

                    <!-- 个人资料end -->

                    </div>
                    </div>
                    </div>

                    </div>

                </body>

                </html>