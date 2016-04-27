﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gonggaochakan.aspx.cs" Inherits="gonggaochakan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                        href="#">资讯管理</a>&nbsp;-</span>&nbsp; 公告查看
                </div>
            </div>

            <div class="page">
                <!-- user页面样式 -->
                <div class="connoisseur">
                   
                    <!-- user 表格 显示 -->
                    <div class="conShow">
                        <table border="1" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="60px" class="tdColor tdC">序号</td>
                                <td width="200px" class="tdColor">标题</td>
                                <td width="400px" class="tdColor">摘要</td>
                                <td width="630px" class="tdColor">内容</td>
                                <td width="190px" class="tdColor">添加时间</td>
                                
                            </tr>

                            <asp:Repeater runat="server" ID="repGongGao" >
                                <ItemTemplate>
                                    <tr height="40px">
                                        <td><%# Eval("ID") %></td>
                                        <td><%# Eval("Title") %></td>
                                        <td><%# Eval("Summary") %></td>
                                        <td><%# Eval("Content") %></td>
                                        <td><%# Eval("CreateTime") %></td>
                                        
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </table>
                        <%--<div class="paging">此处是分页</div>--%>
                    </div>
                    <!-- user 表格 显示 end-->
                </div>
                <!-- user页面样式end -->
            </div>

        </div>
    </form>
</body>
</html>
