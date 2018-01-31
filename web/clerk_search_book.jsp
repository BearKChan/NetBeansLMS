<%-- 
    Document   : clerk_search_book
    Created on : 2018-1-18, 9:08:59
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="wap-font-scale" content="no" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>cleck search book page</title>
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
        <jsp:include flush="true" page="user_box_1.jsp"></jsp:include>



        <div class="channel-title user-title">

            <form>

                <i class="c-icon ui1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i>
                <label class="ut1">书籍
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

            <form method="GET" action="/NetBeansLMS/ManageSearchBookServlet">
                <div class="row no-gutter">
                    <div class="col-25 text-r"></div>
                    <div class="input-group mb-3" style="width:550px">                <select  name="select">
                            <option >标题</option>
                            <option >ISBN</option>
                        </select>  
                        <input type="text" class="form-control" name="keyword" aria-label="Recipient's username" aria-describedby="basic-addon2" >
                        <div class="input-group-append">
                            <input type="submit" class="btn btn-outline-secondary"  value="搜索" style="width:100px;">
                        </div>
                    </div>
                </div>
            </form>
            <div class="row no-gutter">
                <div class="col-30 text-r"></div>
                <div class="col-70"></div>
            </div>
            <div class="row no-gutter">
                <div class="col-30 text-r"></div>
                <div class="col-70"></div>
            </div>
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
            <%--<jsp:include flush="true" page="footer.jsp"></jsp:include>--%>

</body>

</html>
