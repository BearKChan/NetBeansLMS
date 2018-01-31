<%-- 
    Document   : clerk_management
    Created on : 2018-1-18, 9:10:51
    Author     : Acer
--%>

<%@page import="com.niit.login.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="wap-font-scale" content="no" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title> management page</title>
        <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/site_global.css?4052507572" />
        <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/pages.css" id="pagesheet" />

        <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/few_pages.css" />
        <link rel="icon" href="rcms/www/t_logo.ico" type="image/x-icon" />


        <link href="bootstrap4/css/bootstrap.min.css" rel="stylesheet">
        <script src="bootstrap4/jquery-3.2.1.min.js"></script>


    </head>

    <body>
        <jsp:include flush="true" page="user_box_1.jsp"></jsp:include>




        <div class="channel-title user-title">

            <form>

                <i class="c-icon ui1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i>
                <label class="ut1">图书馆
                    <span class="text-blue">管理</span>
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
            <div class="row no-gutter">
                <div class="col-70 text-r">
                    <input type="button" class="btn btn-primary" value="添加书" style="width:400px;"onclick="location.href = 'add_book.jsp'"></input>
                </div>
                <div class="col-20"></div>
            </div>
            <div class="row no-gutter">
                <div class="col-30 text-r"></div>
                <div class="col-70"></div>
            </div>
            <div class="row no-gutter">
                <div class="col-70 text-r">
                    <input type="button" class="btn btn-primary" value="管理书籍" style="width:400px;" onclick="location.href = 'clerk_search_book.jsp'"></input>
                </div>
                <div class="col-20"></div>
            </div>
            <div class="row no-gutter">
                <div class="col-30 text-r"></div>
                <div class="col-70"></div>
            </div>
            <div class="row no-gutter">
                <div class="col-70 text-r">
                    <input type="button" class="btn btn-primary" value="罚款列表" style="width:400px;" onclick="location.href = '/NetBeansLMS/FineListServlet'"></input>
                </div>
                <div class="col-20"></div>
            </div>

        <%
       User u=(User) request.getSession().getAttribute("user");
       int user_role=u.getUser_role();
       if(user_role==3){
        %>
            
            
            <div class="row no-gutter">
                <div class="col-30 text-r"></div>
                <div class="col-70"></div>
            </div>
            <div class="row no-gutter">
                <div class="col-70 text-r">
                    <input type="button" class="btn btn-primary" value="修改规则" style="width:400px;" onclick="location.href = 'rule_change.jsp'"></input>
                </div>
                <div class="col-20"></div>
            </div>

        <%}%>    
            
            
            
            
            <div class="row no-gutter">
                <div class="col-30 text-r"></div>
                <div class="col-70"></div>
            </div>
            <div class="row no-gutter">
                <div class="col-25 text-r"> </div>
                <div class="col-75"></div>
            </div>
        </div>

        <!-- 个人资料end -->

    </div>
</div>
</div>

</div>
            <jsp:include flush="true" page="footer.jsp"></jsp:include>

</body>

</html>
