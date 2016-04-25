<%@ Page language="c#" Inherits="医院管理系统.webmenu" CodeFile="webmenu.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>webmenu</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">

        <link rel="stylesheet" type="text/css" href="css/public.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/public.js"></script>
	</HEAD>
	<body>
 <!-- 头部 -->
	<div class="head">
		<div class="headL">
			<img class="headLogo" src="img/headLogo.png" />
		</div>
		<div class="headR">
			<p class="p1">
				欢迎，
				<?php echo cookie('name')?>
			</p>
			<p class="p2">
				<a href="#" class="resetPWD">重置密码</a>&nbsp;&nbsp;<a
					href="{:U('Admin/Index/exit')}" class="goOut">退出</a>
			</p>
		</div>
		<!-- onclick="{if(confirm(&quot;确定退出吗&quot;)){return true;}return false;}" -->
	</div>

	<div class="closeOut">
		<div class="coDiv">
			<p class="p1">
				<span>X</span>
			</p>
			<p class="p2">确定退出当前用户？</p>
			<P class="p3">
				<a class="ok yes" href="#">确定</a><a class="ok no" href="#">取消</a>
			</p>
		</div>
	</div>


		<form id="Form1" method="post" runat="server">
			<FONT face="宋体" color="#ff6633">
				<TABLE id="Table1" align="center" width="70%" cellSpacing="1" cellPadding="1" border="0">
					<tr>
						<td align="center">
							<asp:Image id="Image1" runat="server" Width="643px" Height="80px" ImageUrl="img/12.jpg"></asp:Image></td>
					</tr>
					<TR>
						<TD style="COLOR: #ff6633"><FONT size="4">注： </FONT><FONT size="2">请根据你的用户权限进入相应的页面</FONT></TD>
					</TR>
					<TR>
						<TD align="center">
							<asp:hyperlink id="HyperLink1" runat="server" NavigateUrl="guahao.aspx" 
                                ForeColor="Purple" Enabled="False" ToolTip="您不是挂号窗口，没有权限访问">挂号</asp:hyperlink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:hyperlink id="HyperLink4" runat="server" NavigateUrl="jiuzhen.aspx" 
                                ForeColor="Purple" Enabled="False" ToolTip="您不是医生，没有权限访问">就诊</asp:hyperlink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:hyperlink 
                                id="HyperLink3" runat="server" NavigateUrl="bedid.aspx" ForeColor="Purple" 
                                Enabled="False" ToolTip="您不是护士站，没有权限访问">住院管理</asp:hyperlink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:hyperlink 
                                id="HyperLink2" runat="server" NavigateUrl="ysheng.aspx" ForeColor="Purple" 
                                Enabled="False" ToolTip="您不是管理员，没有权限管理医生资料">医生管理</asp:hyperlink></TD>
					</TR>
					<TR>
						<TD align="center">
							<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="300" border="1" style="WIDTH: 300px; HEIGHT: 106px">
								<TR>
									<TD align="center"><FONT color="#ff0000" size="4"><STRONG>密码修改</STRONG></FONT></TD>
								</TR>
								<TR>
									<TD align="center">
										<asp:Label id="Label2" runat="server" Height="8px" Width="70px" ForeColor="Black">用 户 名</asp:Label>：
										<asp:Label id="Label1" runat="server" Width="126px" ForeColor="Red"></asp:Label></TD>
								</TR>
								<TR>
									<TD align="center">
										<asp:Label id="Label3" runat="server" Height="8px" Width="70px" ForeColor="Black">新    密     码</asp:Label>：&nbsp;&nbsp;
										<asp:TextBox id="tpwd" runat="server" Height="24" Width="102" TextMode="Password"></asp:TextBox></TD>
								</TR>
								<TR>
									<TD align="center">&nbsp; 确定密码：&nbsp; &nbsp;
										<asp:TextBox id="tpwd1" runat="server" Height="24px" Width="102px" TextMode="Password"></asp:TextBox>
										<asp:CompareValidator id="CompareValidator1" runat="server" ErrorMessage="密码不一致" ControlToValidate="tpwd1"
											ControlToCompare="tpwd">*</asp:CompareValidator></TD>
								</TR>
								<TR>
									<TD align="center">
										<asp:Button id="Button1" runat="server" Text="修改" onclick="Button1_Click"></asp:Button>&nbsp;
										<asp:Button id="Button2" runat="server" Text="取消"></asp:Button></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD align="center"><FONT size="5">系统简介</FONT></TD>
					</TR>
					<TR>
						<TD>
							<P>&nbsp;<FONT size="2">&nbsp;&nbsp; 
									在医院应用电子计算机的主要目的是开发医院信息资源，提高医疗护理水平，实现医院科学化管理。但医院管理信息系统不直接产生经济效益，而主要在于提高决策系统的准确性，提高医务、行政办公室及辅助业务科室的工作效率和管理水平。因此，医院管理信息系统的任务是进行医务、行政办公室及辅助业务科室的信息处理。是一个以辅助决策为目标的医院管理信息系统。</FONT></P>
							<P><FONT size="2">一：系统的功能</FONT></P>
							<P><FONT size="2">&nbsp;&nbsp;&nbsp; 1:本系统包括病人挂号；并可以进行查询。</FONT></P>
							<P><FONT size="2">&nbsp;&nbsp;&nbsp;&nbsp;2：医生信息插入，删除，修改等相关的操作。</FONT></P>
							<P><FONT size="2">&nbsp;&nbsp;&nbsp;&nbsp;3：病人住院管理及查询。</FONT></P>
							<P><FONT size="2">&nbsp;&nbsp;&nbsp; 4：无纸化就诊和病况查询。</FONT></P>
							<P><FONT size="2">二：系统的特点：</FONT></P>
							<P><FONT size="2">&nbsp;&nbsp;&nbsp; 1：在你没有权限的时候，你就不能进入页面。每个人有每个人的责任。</FONT></P>
						</TD>
					</TR>
				</TABLE>
				<asp:ValidationSummary id="ValidationSummary1" style="Z-INDEX: 101; LEFT: 848px; POSITION: absolute; TOP: 344px"
					runat="server" ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
			</FONT>
		</form>
	</body>
</HTML>
