﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新用户注册</title>
    <link rel="stylesheet" type="text/css" href="css/css.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="pageAll">
            
            <div class="page">
                <!-- 会员注册页面样式 -->
                <div class="banneradd bor" style="width: 500px">
                    <div class="baTopNo">
                        <span>新用户注册</span>
                    </div>
                    <div class="baBody">
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;用户名：
                            <asp:TextBox runat="server" ID="txtUserID" CssClass="input3"></asp:TextBox>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码：
                            <asp:TextBox runat="server" ID="txtPwd" CssClass="input3" TextMode="Password"></asp:TextBox>
                        </div>
                         <div class="bbD">
                            真实姓名：
                            <asp:TextBox runat="server" ID="txtUserName" CssClass="input3"></asp:TextBox>
                        </div>
                        <div class="bbD">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：
                            <asp:DropDownList runat="server" ID="ddlSex" CssClass="input3">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                         <div class="bbD">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：
                            <asp:TextBox runat="server" ID="txtAddr" CssClass="input3"></asp:TextBox>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：
                            <asp:TextBox runat="server" ID="txtPhone" CssClass="input3"></asp:TextBox>
                        </div>
                        <div class="bbD">
                            <p class="bbDP">
                                
                                <asp:Button runat="server" ID="btnSave" Text="提交" CssClass="btn_ok btn_yes" OnClick="btnSave_OnClick"/>
                                <asp:Button runat="server" ID="btnCannl" Text="取消" CssClass="btn_ok btn_no" OnClick="btnCannl_OnClick"/>
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
