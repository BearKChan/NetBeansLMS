<%-- 
    Document   : user_change_password
    Created on : 2018-1-18, 7:58:03
    Author     : Acer
--%>


<%@page import="com.niit.login.User"%>
<%    User user = (User) request.getSession().getAttribute("user");
    if (user == null) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);//#######登陆界面
    }%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="wap-font-scale" content="no" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>user change password page</title>
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
            <div class="userinfobox">
                <div class="row no-gutter">
                    <div class="col-25 text-r"></div>
                    <div class="col-75"></div>
                </div>
                <form method="POST" action="/NetBeansLMS/UserChangePasswordServlet">
                    <div class="row no-gutter">
                        <div class="col-40 text-r">原密码：</div>
                        <div class="col-60">
                            <input type="password" class="form-control" style="width:400px" placeholder="请输入原密码" name="old_password" id="old_password"
                                   required>
                            <div style="text-align: right">
                                <span id="password_olderror" style="color:red;display: none">密码输入错误，请重新输入</span>
                            </div>
                        </div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-40 text-r">新密码：</div>
                        <div class="col-60">
                            <input type="password" class="form-control" style="width:400px" placeholder="请输入新密码" name="new_password" id="new_password"
                                   required>
                        </div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-40 text-r">确认新密码：</div>
                        <div class="col-60">
                            <input type="password" class="form-control" style="width:400px" placeholder="重复新密码" name="new_confirmpassword" id="new_confirmpassword"
                                   required>
                            <div style="text-align: right">
                                <span id="helpConfirmPW" style="color:red;display: none">密码不一致，请重新输入</span>
                            </div>
                        </div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-25 text-r"> </div>
                        <div class="col-75"></div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-40 text-r">
                            <a>
                                <input type="submit" id="passwordchangbutton" class="btn btn-primary" style="width:100px;" value="修改">
                            </a>
                        </div>
                        <div class="col-20"></div>
                        <div class="col-40">
                            <a href="/NetBeansLMS/UserInfoServlet">
                                <button type="button" class="btn btn-primary" style="width:100px;">取消</button>
                            </a>
                        </div>
                    </div>
                </form>
                <div class="row no-gutter">
                    <div class="col-25 text-r"> </div>
                    <div class="col-75"></div>
                </div>
            </div>

            <!-- 个人资料end -->
            <script>
                $("#passwordchangbutton").click(function () {
                    var old_pwd1 = "${sessionScope.user.user_pwd}";
                    if (old_pwd1 !== $("#old_password").val()) {
                        $("#password_olderror").show();
                        return false;
                    } else {
                        $("#password_olderror").hide();
                        if ($("#new_password").val() !== $("#new_confirmpassword").val()) {
                            $("#helpConfirmPW").show();
                            return false;
                        } else {
                            $("#helpConfirmPW").hide();
                            alert("密码修改成功");

                        }
                    }

                });
        </script>
                    <jsp:include flush="true" page="footer.jsp"></jsp:include>


</html>