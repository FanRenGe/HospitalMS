<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>医疗管理系统</title>
</head>
<body>


    <%--  <frameset rows="100,*" cols="*" scrolling="No" framespacing="0" frameborder="no" border="0">
         <frame src="top.aspx" name="headmenu" id="topFrame" title="mainFrame"> <!-- 引用头部 -->
            
<!-- 引用左边和主体部分 --> 
             <frameset rows="100*" cols="220,*" scrolling="No"framespacing="0" frameborder="no" border="0">
                  <frame src="left.aspx" name="leftmenu" id="leftFrame" title="mainFrame" >
                  <frame src="main.html" name="main" scrolling="yes" noresize="noresize" id="rightFrame" title="rightFrame">
             </frameset>
    </frameset>--%>

    <frameset rows="50,*" frameborder="no" frameborder="1" framespacing="0">
	<frame src="http://www.baidu.com" noresize="noresize" frameborder="NO" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" target="tops" />
  <frameset cols="184,*"   id="frame">
	<frame src="left.aspx" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="1" scrolling="auto" target="lefts" />
	<frame src="" name="main" marginwidth="0" marginheight="0" frameborder="1" scrolling="auto" target="main" />
  </frameset>
  </frameset>
    
</body>
</html>
