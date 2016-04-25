<%@ Page language="c#" Inherits="医院管理系统.nanzhao" CodeFile="nanzhao.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>nanzhao</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<TABLE id="Table1" align="center" cellSpacing="1" cellPadding="1" width="80%" border="0">
					<TR>
						<TD style="HEIGHT: 60px" align="center" background="img/9.jpg" bgColor="#ffcc66"><FONT face="华文彩云" color="#663366" size="7"><STRONG>疑难病况显示</STRONG></FONT>&nbsp;</TD>
					</TR>
					<TR>
						<TD>
							<asp:datagrid id=DataGrid1 runat="server" Width="100%" AllowPaging="True" DataSource="<%# nan1 %>" DataKeyField="挂号号码" DataMember="Table" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3" onselectedindexchanged="DataGrid1_SelectedIndexChanged">
								<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#669999"></SelectedItemStyle>
								<ItemStyle ForeColor="#000066"></ItemStyle>
								<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699"></HeaderStyle>
								<FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
								<Columns>
									<asp:BoundColumn DataField="挂号号码" HeaderText="挂号号码"></asp:BoundColumn>
									<asp:BoundColumn DataField="姓名" HeaderText="姓名"></asp:BoundColumn>
									<asp:BoundColumn DataField="性别" HeaderText="性别"></asp:BoundColumn>
									<asp:BoundColumn DataField="年龄" HeaderText="年龄"></asp:BoundColumn>
									<asp:BoundColumn DataField="疑难病况" HeaderText="疑难病况"></asp:BoundColumn>
									<asp:BoundColumn DataField="过敏药物" SortExpression="过敏药物" HeaderText="过敏药物"></asp:BoundColumn>
									<asp:BoundColumn DataField="医师" HeaderText="医师"></asp:BoundColumn>
									<asp:BoundColumn DataField="上传日期" HeaderText="上传日期"></asp:BoundColumn>
									<asp:ButtonColumn Text="选择" CommandName="Select"></asp:ButtonColumn>
								</Columns>
								<PagerStyle HorizontalAlign="Center" ForeColor="#000066" BackColor="White" Mode="NumericPages"></PagerStyle>
							</asp:datagrid></TD>
					</TR>
					<TR>
						<TD align="center">&nbsp; 挂号号码
							<asp:textbox id="TextBox1" runat="server" Width="120px"></asp:textbox>
							<asp:button id="Button1" runat="server" Text="查找" onclick="Button1_Click"></asp:button>
							<asp:button id="Button2" runat="server" Text="详细信息" onclick="Button2_Click"></asp:button>
							<asp:Button id="Button3" runat="server" Text="返回" onclick="Button3_Click"></asp:Button></TD>
					</TR>
					<TR>
						<TD>&nbsp;
							<asp:panel id="p1" Width="749px" Visible="False" Runat="server">
								<TABLE id="Table2" style="WIDTH: 657px; HEIGHT: 506px" height="0" cellSpacing="1" cellPadding="1"
									width="657" align="center" border="1">
									<TR>
										<TD style="HEIGHT: 1px" align="center" colSpan="2">
											<asp:Label id="Label14" runat="server" Width="236px" ForeColor="Red"></asp:Label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px; HEIGHT: 7px">挂号号码：</TD>
										<TD style="HEIGHT: 7px">
											<asp:label id="Label1" runat="server" Width="272px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px; HEIGHT: 3px">姓名：</TD>
										<TD style="HEIGHT: 3px">
											<asp:label id="Label2" runat="server" Width="248px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px; HEIGHT: 10px">年龄：</TD>
										<TD style="HEIGHT: 10px">
											<asp:label id="Label3" runat="server" Width="304px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px; HEIGHT: 4px">性别：</TD>
										<TD style="HEIGHT: 4px">
											<asp:label id="Label4" runat="server" Width="288px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px; HEIGHT: 100px">疑难病况：</TD>
										<TD style="HEIGHT: 100px">
											<asp:label id="Label5" runat="server" Width="520px" Height="206px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px; HEIGHT: 138px">过敏药物：</TD>
										<TD style="HEIGHT: 138px">
											<asp:label id="Label6" runat="server" Width="552px" Height="174px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px; HEIGHT: 2px">医师：</TD>
										<TD style="HEIGHT: 2px">
											<asp:label id="Label7" runat="server" Width="184px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px; HEIGHT: 34px">日期：</TD>
										<TD style="HEIGHT: 34px">
											<asp:label id="Label8" runat="server" Width="448px"></asp:label></TD>
									</TR>
								</TABLE>
							</asp:panel></TD>
					</TR>
					<TR>
						<TD>&nbsp;
						</TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
