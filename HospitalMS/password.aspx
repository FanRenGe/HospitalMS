<%@ Page Language="C#" AutoEventWireup="true" CodeFile="password.aspx.cs" Inherits="password" %>

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
        <div>
            <div id="pageAll">
                <div class="pageTop">
                    <div class="page">
                        <img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
                            href="#">信息管理</a>&nbsp;-</span>&nbsp;修改密码
                    </div>
                </div>
                <div class="page">
                    <!-- 会员注册页面样式 -->
                    <div class="banneradd bor">
                        <div class="baTopNo">
                            <span>修改密码</span>
                        </div>
                        <div class="baBody">
                            <div class="bbD">
                                &nbsp;&nbsp;用户名：
                            <asp:TextBox runat="server" ID="txtUserID" CssClass="input3" Enabled="False"></asp:TextBox>
                            </div>
                            <div class="bbD">
                                &nbsp;&nbsp;&nbsp;新密码：
                            <asp:TextBox runat="server" ID="txtPwd" CssClass="input3" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="bbD">
                                确认密码：
                            <asp:TextBox runat="server" ID="txtPwd2" CssClass="input3" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="bbD">
                                <p class="bbDP">
                                    <asp:Button runat="server" ID="btnSave" Text="修改" CssClass="btn_ok btn_yes" OnClick="btnSave_OnClick" />
                                    <asp:Button runat="server" ID="btnCannl" Text="取消" CssClass="btn_ok btn_no" OnClick="btnCannl_OnClick" />
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- 会员注册页面样式end -->
                </div>
            </div>
        </div>
    </form>
</body>
</html>
