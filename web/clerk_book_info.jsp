<%-- 
    Document   : clerk_book_info
    Created on : 2018-1-18, 9:15:30
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="wap-font-scale" content="no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>clerk book information page</title>
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
            <label class="ut1">书本
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
        <div class="row no-gutter">
            <div class="col-30 text-r">书本封面：</div>
            <div class="form-group">
                    <img src="bookimage/傲慢与偏见.jpg" style="width:150px;height:100px" alt="通用的占位符缩略图">
            </div>
        </div>
        <div class="row no-gutter">
            <div class="col-30 text-r">Book ID：</div>
            <div class="col-70">
                ${book_id}
            </div>
        </div>
        <div class="row no-gutter">
            <div class="col-30 text-r">书本名：</div>
            <div class="col-70">${book_name}</div>
        </div>
        <div class="row no-gutter">
            <div class="col-30 text-r">ISBN：</div>
            <div class="col-70">${book_ISBN}</div>
        </div>
        <div class="row no-gutter">
            <div class="col-30 text-r">出版时间：</div>
            <div class="col-70">${output_date}</div>
        </div>
        <div class="row no-gutter">
            <div class="col-30 text-r">作者：</div>
            <div class="col-70">${author}</div>
        </div>
        <div class="row no-gutter">
            <div class="col-30 text-r">书本分类： </div>
            <div class=" col-70">${category}</div>
        </div>
        <div class="row no-gutter">
            <div class="col-30 text-r">单价： </div>
            <div class="col-70">${price}</div>
        </div>
        <div class="row no-gutter">
            <div class="col-30 text-r">出版社： </div>
            <div class="col-70">${publisher}</div>
        </div>
        <div class="row no-gutter">
            <div class="col-30 text-r">书本简介： </div>
            <div class="col-70">${introduction}</div>
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
