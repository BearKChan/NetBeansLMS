<%-- 
    Document   : add_book
    Created on : 2018-1-18, 9:19:37
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="wap-font-scale" content="no" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>add books page</title>
        <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/site_global.css?4052507572" />
        <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/pages.css" id="pagesheet" />

        <link rel="stylesheet" type="text/css" href="rcms/www/lasttemp/css/few_pages.css" />
        <link rel="icon" href="rcms/www/t_logo.ico" type="image/x-icon" />


        <link href="bootstrap4/css/bootstrap.min.css" rel="stylesheet">
        <script src="jquery-3.2.1.min.js"></script>
        <script src="bootstrap.min.js"></script>



    </head>

    <body>
        <!--        <script>
                    $("#nav-lv1").click(function (e) {
                        e.preventDefault();
                        $(this).tab("show");
                    })
                </script>-->
        <jsp:include flush="true" page="user_box_1.jsp"></jsp:include>



        <div class="channel-title user-title">

            <form>

                <i class="c-icon ui1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i>
                <label class="ut1">书本
                    <span class="text-blue">资料</span>
                </label>
            </form>

        </div>



        <!-- 栏目标题end -->

        <!-- 个人资料 -->
        <form method="POST" action="/NetBeansLMS/AddBookServlet" enctype="multipart/form-data">
            <div class="userinfobox">
                <div class="row no-gutter">
                    <div class="col-25 text-r"></div>
                    <div class="col-75"></div>
                </div>
                <div class="row no-gutter">
                    <div class="col-30 text-r">书本图片：</div>
                    <div class="form-group">
                        <div class="col-70">
                            <input type="file" style="width:400px" class="form-control" name="book_img" required>
                        </div>
                    </div>
                </div>
                <div class="row no-gutter">
                    <div class="col-30 text-r">书本名：</div>
                    <div class="col-70">
                        <input type="text" class="form-control" style="width:400px" placeholder="请输入书本的名称" name="book_name" required>
                    </div>
                </div>
                <div class="row no-gutter">
                    <div class="col-30 text-r">ISBN：</div>
                    <div class="col-70">
                        <input type="text" class="form-control" style="width:400px" placeholder="请输入书本的ISBN" name="book_isbn" required>
                    </div>
                </div>
                <div class="row no-gutter">
                    <div class="col-30 text-r">出版时间：</div>
                    <div class="col-70">
                        <input type="date" class="form-control" style="width:400px" placeholder="请输入书本的出版时间" name="book_date" required>
                    </div>
                </div>
                <div class="row no-gutter">
                    <div class="col-30 text-r">作者：</div>
                    <div class="col-70">
                        <input type="text" class="form-control" style="width:400px" placeholder="请输入书本的作者" name="book_author" required>
                    </div>
                </div>
                <div class="row no-gutter">
                    <div class="col-30 text-r">书本分类： </div>
                    <div class=" col-70">
                        <select class="form-control" data-ng-value="请输入书本的分类" style="width:400px" name="book_category" required>
                            <option>文学类</option>
                            <option>计算机类</option>
                            <option>会计类</option>
                            <option>其他</option>
                        </select>
                    </div>
                </div>
                <div class="row no-gutter">
                    <div class="col-30 text-r">单价： </div>
                    <div class="col-70">
                        <input type="text" class="form-control" style="width:400px" placeholder="请输入书本的单价" name="book_price" required>
                    </div>
                </div>
                <div class="row no-gutter">
                    <div class="col-30 text-r">出版社： </div>
                    <div class="col-70">
                        <input type="text" class="form-control" style="width:400px" placeholder="请输入书本的出版社" name="book_publisher" required>
                    </div>
                </div>

                <div class="row no-gutter">
                    <div class="col-30 text-r">书本简介： </div>
                    <div class="col-70">
                        <textarea  name="book_introduction" id="" cols="30" rows="3" style="width:400px" placeholder="请输入书本的简介" required></textarea>
                    </div>
                </div>


                <div class="row no-gutter">
                    <div class="col-40 text-r">
                        <input type="submit" class="btn btn-primary" style="width:100px;"value="添加">
                    </div>
                    <div class="col-20"></div>
                    <div class="col-40">
                        <button type="button" class="btn btn-primary" style="width:100px;">Cancel</button>
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
