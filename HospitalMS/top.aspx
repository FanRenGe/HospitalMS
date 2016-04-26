<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="top" %>

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
        <!-- 头部 -->
        <div class="head">
            <div class="headL">
                <img class="headLogo" src="./img/headLogo.png" />
            </div>
            <div class="headR">
                <p class="p1">
                    欢迎，<%= Session["usename"]%>
                </p>
                <p class="p2">
                     <a href="./password.aspx" target="main" class="resetPWD">修改密码</a>&nbsp;&nbsp;
                    <asp:LinkButton ID="LBQuit" runat="server" Font-Bold="True" ForeColor="White" OnClick="LBQuit_Click"
                        OnClientClick='return confirm("你确定退出系统吗？") '>退出</asp:LinkButton>
                </p>
            </div>

        </div>

    </form>
</body>
</html>
