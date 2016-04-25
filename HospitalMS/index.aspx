<%@ Page Language="c#" Inherits="医院管理系统.index" CodeFile="index.aspx.cs" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>index</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <title>医疗管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <link rel="stylesheet" type="text/css" href="css/page.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/public.js"></script>

    <style>
        .btn {
            text-indent: 0.5rem !important;
        }
    </style>
</head>
<body>
    <!-- 登录页面头部 -->
    <div class="logHead">
        <img src="img/logLOGO.png" />
    </div>
    <!-- 登录页面头部结束 -->

    <!-- 登录body -->
    <div class="logDiv">
        <img class="logBanner" src="img/logBanner.png" />
        <div class="logGet">
            <!-- 头部提示信息 -->
            <div class="logD logDtip">
                <p class="p1">登录</p>
                <p class="p2">Welcome</p>
            </div>
            <!-- 输入框 -->
            <form id="Form1" method="post" runat="server">
                <div class="lgD">
                    <img class="img1" src="img/logName.png" />
                    <asp:TextBox ID="Tname" runat="server"></asp:TextBox>
                </div>

                <div class="lgD">
                    <img class="img1" src="img/logPwd.png" />
                    <asp:TextBox ID="Tpwd" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="lgD logD2">
                    <a href="#" onclick="adduser();">新用户注册！</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="logYZM">
                        <asp:DropDownList ID="DDright" runat="server"
                            Width="100%" Height="40px">
                            <asp:ListItem Selected="True">--请选择--</asp:ListItem>
                            <asp:ListItem>挂号</asp:ListItem>
                            <asp:ListItem>就诊</asp:ListItem>
                            <asp:ListItem>床位分配</asp:ListItem>
                            <asp:ListItem>医生管理</asp:ListItem>
                        </asp:DropDownList>
                    </div>


                    <!-- 登录-->
                    <div class="logC">
                        <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click" CssClass="button btn"
                            Width="145px" Height="45px" BackColor=" #ee7700" Border="none" Font-Size="18px" ForeColor="White"></asp:Button>

                        &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="取消" OnClick="Button2_Click" CssClass="btn"
                    Width="145px" Height="45px" BackColor=" #ee7700" Border="none" Font-Size="18px" ForeColor="White"></asp:Button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- 登录body  end -->

    <!-- 登录页面底部 -->
    <div class="logFoot">
        <p class="p1">医疗管理系统</p>
        <p class="p2">软件工程（专升本）3班 徐林莉 学号：5147101309</p>
    </div>
    <!-- 登录页面底部end -->



</body>
</html>
