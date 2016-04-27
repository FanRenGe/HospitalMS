<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gonggaoadd.aspx.cs" Inherits="gonggaoadd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/css.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="pageAll">
            <div class="pageTop">
                <div class="page">
                    <img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
                        href="#">资讯管理</a>&nbsp;-</span>&nbsp;
                    <asp:Label runat="server" ID="Label1" Text="添加"></asp:Label>公告
                </div>
            </div>
            <div class="page">
                <!-- 会员注册页面样式 -->
                <div class="banneradd bor">
                    <div class="baTopNo">
                        <span>
                            <asp:Label runat="server" ID="Label2" Text="添加"></asp:Label>公告</span>
                    </div>
                    <div class="baBody">
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;标题：
                            <asp:TextBox runat="server" ID="txtTitle" CssClass="input3"></asp:TextBox>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;摘要：
                            <asp:TextBox runat="server" ID="txtSummary" CssClass="input3"></asp:TextBox>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;内容：
                            <asp:TextBox runat="server" ID="txtContent" TextMode="MultiLine" CssClass="input3"></asp:TextBox>
                        </div>
                        <div class="bbD">
                            <p class="bbDP">
                                <asp:Button runat="server" ID="btnSave" Text="提交" CssClass="btn_ok btn_yes" OnClick="btnSave_OnClick" />
                                <asp:Button runat="server" ID="btnCannl" Text="取消" CssClass="btn_ok btn_no" OnClick="btnCannl_OnClick" />
                            </p>
                        </div>
                    </div>
                </div>

                <!-- 会员注册页面样式end -->
            </div>
        </div>
    </form>
</body>
</html>
