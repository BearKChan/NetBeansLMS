<%-- 
    Document   : rule_change
    Created on : 2018-1-18, 8:52:59
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="wap-font-scale" content="no" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>rule change page</title>
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
                    <label class="ut1">规则
                        <span class="text-blue">修改</span>
                    </label>

                </form>

            </div>



            <!-- 栏目标题end -->

            <form method="post" action="RulesChangeServlet">
                <!-- 个人资料 -->
                <div class="userinfobox">
                    <div class="row no-gutter">
                        <div class="col-25 text-r"></div>
                        <div class="col-75"></div>
                    </div>

                    <div class="row no-gutter">
                        <div class="col-40 text-r">身份：</div>
                        <div>
                            <label class="radio-inline">
                                <input type="radio" name="role" value="teacher" checked>教师
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="role" value="student">学生
                            </label>
                        </div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-40 text-r">期限：</div>
                        <div class="col-60">
                            <input type="text" class="form-control" name="limint_month" style="width:400px"  placeholder="请输入借书期限">
                        </div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-40 text-r">逾期每日罚款：</div>
                        <div class="col-60">
                            <input type="text" class="form-control" name="day_fine" style="width:400px"  placeholder="请输入逾期每日罚款">
                        </div>
                    </div>

                    <div class="row no-gutter">
                        <div class="col-40 text-r">借书数量：</div>
                        <div class="col-60">
                            <input type="text" class="form-control" name="amount" style="width:400px"  placeholder="请输入借书数量">
                        </div>
                    </div>

                    <div class="row no-gutter">
                        <div class="col-40 text-r">延期时间：</div>
                        <div class="col-60">
                            <input type="text" class="form-control" name="delay_amount" style="width:400px"  placeholder="请输入延期时间">
                        </div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-40 text-r">书目最少数量：</div>
                        <div class="col-60">
                            <input type="text" class="form-control" name="min_number" style="width:400px"  placeholder="请输入书目最少数量">
                        </div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-25 text-r"> </div>
                        <div class="col-75"></div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-40 text-r">
                            <button type="submit" class="btn btn-primary" style="width:100px;">Change</button>
                        </div>
                        <div class="col-20"></div>
                        <div class="col-40">
                            <a href="clerk_management.jsp">
                                <button type="button" class="btn btn-primary" style="width:100px;">取消</button>
                            </a>
                        </div>
                    </div>
                    <div class="row no-gutter">
                        <div class="col-25 text-r"> </div>
                        <div class="col-75"></div>
                    </div>
                </div>

                <!-- 个人资料end -->  
            </form>


        </div>
    </div>
</div>

</div>
<jsp:include flush="true" page="footer.jsp"></jsp:include>

</body>

</html>
