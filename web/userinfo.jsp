<%-- 
    Document   : userinfo
    Created on : 2018-1-17, 9:26:33
    Author     : Acer
    Decription : The User Information show page.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.niit.login.User" %>
<%                        User user = (User) request.getSession().getAttribute("user");
    if (user == null) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);//#######登陆界面
    }%>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="wap-font-scale" content="no" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>个人空间</title>
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

                <div class="channel-tools">
                    <div class="nav-lv3">
                        <ul id="navlv3" class="row">
                            <li>
                                <p>&ensp;&ensp;</p>
                            </li>
                            <li>
                                <a href="user_change_password.jsp" style="font-size:20px">修改密码</a>
                            </li>
                            <li>
                                <p>&ensp;&ensp;</p>
                            </li>
                            <li>
                                <a href="user_info_change.jsp" style="font-size:20px">修改资料</a>
                            </li>
                            <li>
                                <p>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </form>

        </div>



        <!-- 栏目标题end -->

        <!-- 个人资料 -->
        <div class="userinfobox">
            <div class="row no-gutter">
                <div class="col-25 text-r"></div>
                <div class="col-75"></div>
            </div>
            <div class="row no-gutter">
                <div class="col-40 text-r">姓名：</div>
                <div class="col-60">${sessionScope.user.user_name}</div>
            </div>
            <div class="row no-gutter">
                <div class="col-40 text-r">用户权限：</div>
                <div class="col-60">
                    <%

                        int role = user.getUser_role();
                        String roleString = "";
                        if (role == 0) {
                            roleString = "学生";
                        } else if (role == 1) {
                            roleString = "老师";
                        } else if (role == 2) {
                            roleString = "职员";
                        } else if (role == 3) {
                            roleString = "管理员";
                        }
                    %>
                    <%=roleString%>
                </div>
            </div>
            <div class="row no-gutter">
                <div class="col-40 text-r">性别：</div>
                <div class="col-60">
                    <%
                        String gender1 = "";
                        String genderString = user.getUser_gender();
                        if (genderString.equals("female")) {
                            gender1 = "女";
                        } else if (genderString.equals("male")) {
                            gender1 = "男";
                        }
                    %>
                    <%=gender1%>
                </div>
            </div>
            <div class="row no-gutter">
                <div class="col-40 text-r">出生日期：</div>
                <div class="col-60">${sessionScope.user.user_birth}</div>
            </div>
            <div class="row no-gutter">
                <div class="col-40 text-r">邮箱： </div>
                <div class="col-60">${sessionScope.user.user_email}</div>
            </div>
            <div class="row no-gutter">
                <div class="col-40 text-r">手机号码： </div>
                <div class="col-60">${sessionScope.user.user_phone}</div>
            </div>
            <div class="row no-gutter">
                <div class="col-40 text-r">地址： </div>
                <div class="col-60">${sessionScope.user.user_address}</div>
            </div>
            <div class="row no-gutter">
                <div class="col-25 text-r"> </div>
                <div class="col-75"></div>
            </div>


            <div class="row ">
                <div class="col-10 text-r"></div>
                <div class="col-90">借书信息：</div>
            </div>

            <table class="table table-sm">
                <thead>
                    <tr>
                        <th scope="col">NO</th>
                        <th scope="col">书名</th>
                        <th scope="col">借书日期</th>
                        <th scope="col">截至日期</th>
                        <th scope="col">罚款金额</th>
                    </tr>
                </thead>
                <tbody id="records">

                </tbody>
            </table>
        </div>

        <!-- 个人资料end -->

    </div>
</div>
</div>

</div>
<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1/jquery-3.2.1.min.js"></script>
<script>
            $(window).ready(function () {

                var table = document.getElementById("records");
                //获得所有商品的数组
                var json1 =${requestScope.json};
                var ListArray = eval(json1);
                //遍历数组,将借阅添加到页面中的列表中
                for (var i = 0; i < ListArray.length; ) {
                    //创建tr对象
                    var tr = document.createElement("tr");
                    //取出一个商品
                    var record1 = ListArray[i++];
                    //创建td对象
                    var td = document.createElement("td");
                    td.innerHTML = i + 1;
                    //将td添加到tr中
                    tr.appendChild(td);
                    var td = document.createElement("td");
                    td.innerHTML = record1["book_name"];
                    tr.appendChild(td);
                    var td = document.createElement("td");
                    td.innerHTML = record1["borrow_time"];
                    tr.appendChild(td);
                    var td = document.createElement("td");
                    td.innerHTML = record1["deadline_time"];
                    tr.appendChild(td);
                    var td = document.createElement("td");
                    td.innerHTML = record1["fine_money"];
                    tr.appendChild(td);
                    //tr添加到表格中
                    table.appendChild(tr);
                }


            });

</script>
            <jsp:include flush="true" page="footer.jsp"></jsp:include>

</body>

</html>