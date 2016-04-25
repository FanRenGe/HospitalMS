<%@ Page language="c#" Inherits="医院管理系统.jzhenzhao" CodeFile="jzhenzhao.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>jzhenzhao</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="80%" align="center" border="0">
					<TR>
						<TD align="center" style="HEIGHT: 60px" bgColor="#ffcc66" background="img/9.jpg">
							<asp:Image id="Image1" runat="server" Width="495px" Height="72px" ImageUrl="img/5.jpg"></asp:Image>&nbsp;</TD>
					</TR>
					<TR>
						<TD><asp:datagrid id=DataGrid1 runat="server" AllowPaging="True" DataSource="<%# jzzhao1 %>" DataKeyField="挂号号码" DataMember="Table" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3" Width="100%" onselectedindexchanged="DataGrid1_SelectedIndexChanged">
								<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#669999"></SelectedItemStyle>
								<ItemStyle ForeColor="#000066"></ItemStyle>
								<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699"></HeaderStyle>
								<FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
								<Columns>
									<asp:BoundColumn DataField="挂号号码" HeaderText="挂号号码"></asp:BoundColumn>
									<asp:BoundColumn DataField="姓名" HeaderText="姓名"></asp:BoundColumn>
									<asp:BoundColumn DataField="年龄" HeaderText="年龄"></asp:BoundColumn>
									<asp:BoundColumn DataField="性别" HeaderText="性别"></asp:BoundColumn>
									<asp:BoundColumn DataField="住院" SortExpression="住院" HeaderText="住院"></asp:BoundColumn>
									<asp:BoundColumn DataField="医师" HeaderText="医师"></asp:BoundColumn>
									<asp:BoundColumn DataField="日期" HeaderText="日期"></asp:BoundColumn>
									<asp:ButtonColumn Text="选择" CommandName="Select"></asp:ButtonColumn>
								</Columns>
								<PagerStyle HorizontalAlign="Center" ForeColor="#000066" BackColor="White" Mode="NumericPages"></PagerStyle>
							</asp:datagrid></TD>
					</TR>
					<TR>
						<TD align="center">&nbsp; 挂号号码
							<asp:textbox id="TextBox1" runat="server" Width="120px"></asp:textbox><asp:button id="Button1" runat="server" Text="查找" onclick="Button1_Click"></asp:button><asp:button id="Button2" runat="server" Text="详细信息" onclick="Button2_Click"></asp:button>
							<asp:Button id="Button3" runat="server" Text="返回" onclick="Button3_Click"></asp:Button></TD>
					</TR>
					<TR>
						<TD>&nbsp;
							<asp:panel id="p1" Width="749px" Visible="False" Runat="server">
								<TABLE id="Table2" style="WIDTH: 657px; HEIGHT: 1077px" height="0" cellSpacing="1" cellPadding="1"
									width="657" align="center" border="1">
									<TR>
										<TD align="center" colSpan="2">
											<asp:Label id="Label14" runat="server" Width="236px" ForeColor="Red"></asp:Label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px">挂号号码：</TD>
										<TD>
											<asp:label id="Label1" runat="server" Width="272px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px">姓名：</TD>
										<TD>
											<asp:label id="Label2" runat="server" Width="248px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px">年龄：</TD>
										<TD>
											<asp:label id="Label3" runat="server" Width="304px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px">性别：</TD>
										<TD>
											<asp:label id="Label4" runat="server" Width="288px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px">住院：</TD>
										<TD>
											<asp:label id="Label5" runat="server" Width="256px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px">手术：</TD>
										<TD>
											<asp:label id="Label6" runat="server" Width="288px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px">实验：</TD>
										<TD>
											<asp:label id="Label7" runat="server" Width="216px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px; HEIGHT: 40px">诊断病况：</TD>
										<TD style="HEIGHT: 40px">
											<asp:label id="Label8" runat="server" Height="206px" Width="520px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px">所开药方：</TD>
										<TD>
											<asp:label id="Label9" runat="server" Height="214px" Width="552px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px">调剂：</TD>
										<TD>
											<asp:label id="Label10" runat="server" Height="165px" Width="528px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px">复核：</TD>
										<TD>
											<asp:label id="Label11" runat="server" Height="148px" Width="528px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px">医师：</TD>
										<TD>
											<asp:label id="Label12" runat="server" Width="184px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px; HEIGHT: 34px">日期：</TD>
										<TD style="HEIGHT: 34px">
											<asp:label id="Label13" runat="server" Width="448px"></asp:label></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px"></TD>
										<TD></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px"></TD>
										<TD></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 103px"></TD>
										<TD></TD>
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
