<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left.aspx.cs" Inherits="left" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/public.css" />
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./js/public.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <div class="leftsidebar_box">
                <a href="./main.html" target="main">
                    <div class="line">
                        <img src="./img/coin01.png" />&nbsp;&nbsp;首页
                    </div>
                </a>
                <!-- <dl class="system_log">
			<dt><img class="icon1" src="./img/coin01.png" /><img class="icon2"src="./img/coin02.png" />
				首页<img class="icon3" src="./img/coin19.png" /><img class="icon4" src="./img/coin20.png" /></dt>
		</dl> -->

                <% if (Session["useright"].ToString() == "挂号")
                   { %>
                <dl class="system_log">
                    <dt>
                        <img class="icon1" src="./img/coin03.png" /><img class="icon2" src="./img/coin04.png" />
                        预约挂号<img class="icon3" src="./img/coin19.png" /><img class="icon4" src="./img/coin20.png" />
                    </dt>
                    <dd>
                        <img class="coin11" src="./img/coin111.png" /><img class="coin22" src="./img/coin222.png" />
                        <a class="cks" href="guahao.aspx" target="main">挂号</a>
                        <img class="icon5" src="./img/coin21.png" />
                    </dd>
                </dl>
                <dl class="system_log">
                    <dt>
                        <img class="icon1" src="./img/coin03.png" /><img class="icon2" src="./img/coin04.png" />
                        信息管理<img class="icon3" src="./img/coin19.png" /><img class="icon4" src="./img/coin20.png" />
                    </dt>
                    <dd>
                        <img class="coin11" src="./img/coin111.png" /><img class="coin22" src="./img/coin222.png" />
                        <a class="cks" href="./useredit.aspx" target="main">信息修改</a>
                        <img class="icon5" src="./img/coin21.png" />
                    </dd>
                </dl>
                <dl class="system_log">
                    <dt>
                        <img class="icon1" src="./img/coin03.png" /><img class="icon2" src="./img/coin04.png" />
                        医院资讯<img class="icon3" src="./img/coin19.png" /><img class="icon4" src="./img/coin20.png" />
                    </dt>
                    <dd>
                        <img class="coin11" src="./img/coin111.png" /><img class="coin22"
                            src="./img/coin222.png" /><a class="cks" href="./gonggaochakan.aspx"
                                target="main">查看公告</a><img class="icon5" src="./img/coin21.png" />
                    </dd>
                </dl>
                <%} %>
                <% if (Session["useright"].ToString() != "挂号")
                   { %>
                <dl class="system_log">
                    <dt>
                        <img class="icon1" src="./img/coin03.png" /><img class="icon2" src="./img/coin04.png" />
                        医生就诊<img class="icon3" src="./img/coin19.png" /><img class="icon4" src="./img/coin20.png" />
                    </dt>
                    <dd>
                        <img class="coin11" src="./img/coin111.png" /><img class="coin22" src="./img/coin222.png" />
                        <a class="cks" href="./jiuzhen.aspx" target="main">就诊</a>
                        <img class="icon5" src="./img/coin21.png" />
                    </dd>
                </dl>
                <dl class="system_log">
                    <dt>
                        <img class="icon1" src="./img/coin03.png" /><img class="icon2" src="./img/coin04.png" />
                        住院管理<img class="icon3" src="./img/coin19.png" /><img class="icon4" src="./img/coin20.png" />
                    </dt>
                    <dd>
                        <img class="coin11" src="./img/coin111.png" /><img class="coin22" src="./img/coin222.png" />
                        <a class="cks" href="./bedid.aspx" target="main">病人住院管理</a>
                        <img class="icon5" src="./img/coin21.png" />
                    </dd>
                </dl>
                <dl class="system_log">
                    <dt>
                        <img class="icon1" src="./img/coin03.png" /><img class="icon2" src="./img/coin04.png" />
                        医生管理<img class="icon3" src="./img/coin19.png" /><img class="icon4" src="./img/coin20.png" />
                    </dt>
                    <dd>
                        <img class="coin11" src="./img/coin111.png" /><img class="coin22" src="./img/coin222.png" />
                        <a class="cks" href="./ysheng.aspx" target="main">医生档案</a>
                        <img class="icon5" src="./img/coin21.png" />
                    </dd>
                </dl>
                <dl class="system_log">
                    <dt>
                        <img class="icon1" src="./img/coin03.png" /><img class="icon2" src="./img/coin04.png" />
                        资讯管理<img class="icon3" src="./img/coin19.png" /><img class="icon4" src="./img/coin20.png" />
                    </dt>
                    <dd>
                        <img class="coin11" src="./img/coin111.png" /><img class="coin22" src="./img/coin222.png" />
                        <a class="cks" href="./gonggaoadd.aspx" target="main">添加公告</a>
                        <img class="icon5" src="./img/coin21.png" />
                    </dd>
                    <dd>
                        <img class="coin11" src="./img/coin111.png" /><img class="coin22" src="./img/coin222.png" />
                        <a class="cks" href="./gonggao.aspx" target="main">公告列表</a>
                        <img class="icon5" src="./img/coin21.png" />
                    </dd>
                </dl>
                <%} %>

               

            </div>

        </div>
    </form>
</body>
</html>
