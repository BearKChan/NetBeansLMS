<%-- 
    Document   : user_info_change
    Created on : 2018-1-18, 8:41:38
    Author     : Acer
--%>
<%@page import="com.niit.login.User"%>
<%
    User user = (User) request.getSession().getAttribute("user");
    String genderString = "";
    if (user == null) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);//#######登陆界面
    } else {
        genderString = user.getUser_gender();
    }
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




    </head>

    <body>
        <jsp:include flush="true" page="user_box.jsp"></jsp:include>



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
            <jsp:include flush="true" page="footer.jsp"></jsp:include>

</body>

</html>