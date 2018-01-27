<%-- 
    Document   : fine_check
    Created on : 2018-1-18, 8:54:15
    Author     : Acer
--%>

<%@page import="com.niit.clerk.Fine"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Fine> list = (ArrayList<Fine>) request.getSession().getAttribute("fine_list");
%>
<!DOCTYPE html>
<html lang="zh-CN">

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="wap-font-scale" content="no" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>clerk check fine page</title>
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
                <label class="ut1">罚款
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

            <table class="table table-sm">
                <thead>
                    <tr>
                        <th scope="col">NO</th>
                        <th scope="col">书ID</th>
                        <th scope="col">用户ID</th>
                        <th scope="col">应当归还日期</th>
                        <th scope="col">返款金额</th>
                        <th scope="col">每日返款金额</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int i = 0;
                        for (Fine f : list) {
                            i++;
                    %>
                    <tr>
                        <th scope="row">i</th>
                        <td><%=f.getBook_id()%></td>
                        <td><%=f.getUser_id()%></td>
                        <td><%=f.getDeadline_time()%></td>
                        <td><%=f.getFine_money()%></td>
                        <td><%=f.getSingle_fine()%></td>
                        <td>
                            <div class=" text-r">
                                <button type="button" class="btn btn-sm" style="width:100px;" onclick="location.href='/NetBeansLMS/ReturnFineServlet?fine_id=<%=f.getFine_id()%>&user_id=<%=f.getUser_id()%>'">还款</button>
                            </div>
                        </td>
                    </tr>
                    <% }%>

                </tbody>
            </table>
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

</body>

</html>
