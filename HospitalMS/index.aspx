<%@ Page Language="c#" Inherits="ҽԺ����ϵͳ.index" CodeFile="index.aspx.cs" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>index</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <title>ҽ�ƹ���ϵͳ</title>
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
    <!-- ��¼ҳ��ͷ�� -->
    <div class="logHead">
        <img src="img/logLOGO.png" />
    </div>
    <!-- ��¼ҳ��ͷ������ -->

    <!-- ��¼body -->
    <div class="logDiv">
        <img class="logBanner" src="img/logBanner.png" />
        <div class="logGet">
            <!-- ͷ����ʾ��Ϣ -->
            <div class="logD logDtip">
                <p class="p1">��¼</p>
                <p class="p2">Welcome</p>
            </div>
            <!-- ����� -->
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
                    <a href="#" onclick="adduser();">���û�ע�ᣡ</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="logYZM">
                        <asp:DropDownList ID="DDright" runat="server"
                            Width="100%" Height="40px">
                            <asp:ListItem Selected="True">--��ѡ��--</asp:ListItem>
                            <asp:ListItem>�Һ�</asp:ListItem>
                            <asp:ListItem>����</asp:ListItem>
                            <asp:ListItem>��λ����</asp:ListItem>
                            <asp:ListItem>ҽ������</asp:ListItem>
                        </asp:DropDownList>
                    </div>


                    <!-- ��¼-->
                    <div class="logC">
                        <asp:Button ID="Button1" runat="server" Text="��¼" OnClick="Button1_Click" CssClass="button btn"
                            Width="145px" Height="45px" BackColor=" #ee7700" Border="none" Font-Size="18px" ForeColor="White"></asp:Button>

                        &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="ȡ��" OnClick="Button2_Click" CssClass="btn"
                    Width="145px" Height="45px" BackColor=" #ee7700" Border="none" Font-Size="18px" ForeColor="White"></asp:Button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- ��¼body  end -->

    <!-- ��¼ҳ��ײ� -->
    <div class="logFoot">
        <p class="p1">ҽ�ƹ���ϵͳ</p>
        <p class="p2">������̣�ר������3�� ������ ѧ�ţ�5147101309</p>
    </div>
    <!-- ��¼ҳ��ײ�end -->



</body>
</html>
