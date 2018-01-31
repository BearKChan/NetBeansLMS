<%-- 
    Document   : register
    Created on : 2018-1-15, 15:44:11
    Author     : Bear
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <link rel="stylesheet" href="assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="assets/css/register.css">
            <title>Register</title>
        </head>

        <body>
            <div style="position:absolute;z-index:-1;width:100%;height:100%;">
                <img src="assets/images/0.jpg" width="100%" height="100%" />
            </div>
            <jsp:include flush="true" page="header.jsp"></jsp:include>

            <div class="reg_page">
                <div class="reg_box">
                    <div class="content">
                        <div class="logo">
                            NIIT图书馆
                        </div>
                        <div class="reg_form">
                            <div class="reg_form_title">
                                <h3> 用户注册</h3>
                            </div>
                            <form method="post" action="/NetBeansLMS/RegisterServlet">
                                <div class="reg_form_detail clearfix">
                                    <!-- 登录表单 -->
                                    <div class="left_side ">
                                        <!-- 输入组 -->
                                        <div class="input-group1">
                                            <label class="input-label col-md-4">
                                                <span class="red">*</span>姓名</label>
                                            <div class="input_div col-md-8">
                                                <input type="text" maxlength="10" name="username" id="username" class="_input" placeholder="姓名" required>
                                                <label class="error" style="display: none">必填</label>
                                            </div>
                                        </div>
                                        <div class="input-group1">
                                            <label class="input-label col-md-4">
                                                <span class="red">*</span>密码</label>
                                            <div class="input_div col-md-8">
                                                <input type="password" name="userpwd" class="_input" placeholder="密码" id="userpwd" required>
                                                <label class="error" style="display: none">必填</label>
                                            </div>
                                        </div>
                                        <div class="input-group1">
                                            <label class="input-label col-md-4">
                                                <span class="red">*</span>确认密码</label>
                                            <div class="input_div col-md-8">
                                                <input type="password" class="_input" name="userconfimpwd" placeholder="确认密码" id="userconfimpwd" required>
                                                <label class="error" style="display: none" id="passwordconfim_error">必填</label>
                                            </div>
                                        </div>

                                        <div class="input-group1">
                                            <label class="input-label col-md-4">
                                                <span class="red">*</span>出生日期</label>
                                            <div class="input_div col-md-8">
                                                <input type="date" class="date _input" name="userbirth" required>
                                                <label class="error" style="display: none">必填</label>
                                            </div>
                                        </div>
                                        <div class="input-group1">
                                            <label class="input-label col-md-4">
                                                <span class="red">*</span>性别</label>
                                            <div class="radio_group1 col-md-8">
                                                <div class="input-radio-group" style="margin-left: -15px;">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="usergender" value="male" checked> 男
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="usergender" value="female"> 女
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="right_side">

                                        <div class="input-group1">
                                            <label class="input-label col-md-4">
                                                <span class="red">*</span>手机号码</label>
                                            <div class="input_div col-md-8">
                                                <input type="text"  name="userphone" class="_input" placeholder="手机号码" required>
                                                <label class="error" style="display: none" id="error_account">${requestScope.error}</label>
                                            </div>
                                        </div>
                                        <div class="input-group1">
                                            <label class="input-label col-md-4">
                                                <span class="red">*</span>电子邮箱</label>
                                            <div class="input_div col-md-8">
                                                <input type="text"  name="useremail" class="_input" placeholder="邮箱格式如：abc@abc.com" pattern="^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$"
                                                    required>
                                                <label class="error" style="display: none">必填</label>
                                            </div>
                                        </div>
                                        <div class="input-group1">
                                            <label class="input-label col-md-4">
                                                <span class="red">*</span>身份</label>
                                            <div class=" col-md-8 radio_group1">
                                                <div class="input-radio-group" style="margin-left: -15px;">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="userrole" value="0" checked> 学生
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="userrole" value="1"> 老师
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="input-group1">
                                            <label class="input-label col-md-4">
                                                <span class="red">*</span>地址</label>
                                            <div class="input_div col-md-8">
                                                <input type="text" maxlength="10" name="useraddress" class="_input" placeholder="地址" required>
                                                <label class="error" style="display: none">必填</label>
                                            </div>
                                        </div>

                                        <div class="input-group1">
                                            <label class="input-label col-md-4">
                                                <span class="red"></span>&nbsp;</label>
                                            <div class="col-md-8 input_div  radio textright">
                                                <p>已有账号?
                                                    <a href="login.jsp" title="登录到我的空间" class="login_link">登录到我的空间</a>
                                                </p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <input type="submit" class="sub_btn2" value="注册" style="cursor:pointer;" id="registerbutton">




                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1/jquery-3.2.1.min.js"></script>
            <script>
                $(document).ready(function () {
                    if ($("#error_account").text()!=="") {
                        $("#error_account").show();
                    } else {
                        $("#error_account").hide();

                    }
                });
                // 这里需要使用click方法，而不能使用submit方法，虽然我也不知道为什么。
                $("#registerbutton").click(function () {
                    if ($("#userpwd").val() !== $("#userconfimpwd").val()) {
                        $("#passwordconfim_error").show();
                        // 修改span的内容使用text（）方法。
                        $("#passwordconfim_error").text("密码确认错误！请重新输入");
                        // return false可以使submit停止提交
                        return false;
                    } else {
                        $("#passwordconfim_error").hide();

                    }
                    //判断出生日期是否大于现在的日期
                });
            </script>
                        <jsp:include flush="true" page="footer.jsp"></jsp:include>

        </body>

        </html>