<%@ Page language="c#" Inherits="医院管理系统.mimagai" CodeFile="mimagai.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>mimagai</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">&nbsp;</FONT>
			<TABLE id="Table2" height="0" cellSpacing="1" cellPadding="1" width="65%" align="center"
				border="0">
				<TR>
					<TD style="HEIGHT: 49px" align="center" bgColor="antiquewhite"><FONT face="华文彩云" color="#cc9933" size="7"><STRONG>医生密码修改</STRONG></FONT></TD>
				</TR>
				<TR>
					<TD><asp:datagrid id=DataGrid1 runat="server" Width="100%" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" BackColor="White" CellPadding="4" GridLines="Horizontal" DataSource="<%# ds11 %>" DataKeyField="useid" DataMember="Table" AutoGenerateColumns="False" AllowPaging="True" onselectedindexchanged="DataGrid1_SelectedIndexChanged">
							<SelectedItemStyle Font-Bold="True" ForeColor="#C04000" BackColor="#E0E0E0"></SelectedItemStyle>
							<ItemStyle ForeColor="#333333" BackColor="White"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="Black"></HeaderStyle>
							<FooterStyle ForeColor="#333333" BackColor="White"></FooterStyle>
							<Columns>
								<asp:BoundColumn DataField="useid" HeaderText="用户名"></asp:BoundColumn>
								<asp:BoundColumn DataField="usename" HeaderText="姓名"></asp:BoundColumn>
								<asp:BoundColumn DataField="sex" HeaderText="性别"></asp:BoundColumn>
								<asp:BoundColumn DataField="addr" HeaderText="地址"></asp:BoundColumn>
								<asp:BoundColumn DataField="phone" HeaderText="电话"></asp:BoundColumn>
								<asp:ButtonColumn Text="选择" HeaderText="选择" CommandName="Select"></asp:ButtonColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Center" ForeColor="Purple" Mode="NumericPages"></PagerStyle>
						</asp:datagrid></TD>
				</TR>
				<TR>
					<TD align="center"><asp:panel id="p1" Width="544px" Runat="server"><FONT face="宋体">
								<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="60%" align="center" border="1">
									<TR>
										<TD align="center"><FONT face="宋体">用 户 名:
												<asp:label id="Label1" runat="server" Width="163px" ForeColor="#C00000" Font-Bold="True"></asp:label></FONT></TD>
									</TR>
									<TR>
										<TD style="HEIGHT: 27px" align="center"><FONT face="宋体">密&nbsp;&nbsp;&nbsp;&nbsp;码:
												<asp:textbox id="tpwd" runat="server" Width="164px" TextMode="Password"></asp:textbox></FONT></TD>
									</TR>
									<TR>
										<TD align="center"><FONT face="宋体">确定密码:
												<asp:textbox id="TextBox3" runat="server" Width="157px" TextMode="Password"></asp:textbox>
												<asp:comparevalidator id="CompareValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="密码不一致"
													ControlToCompare="tpwd">*</asp:comparevalidator></FONT></TD>
									</TR>
									<TR>
										<TD align="center"><FONT face="宋体">权&nbsp;&nbsp;&nbsp; 限:&nbsp;
												<asp:dropdownlist id="d1" runat="server" Width="152px">
													<asp:ListItem Value="挂号">挂号</asp:ListItem>
													<asp:ListItem Value="就诊">就诊</asp:ListItem>
													<asp:ListItem Value="床位分配">床位分配</asp:ListItem>
													<asp:ListItem Value="医生管理">医生管理</asp:ListItem>
												</asp:dropdownlist>
												<asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" ControlToValidate="d1" ErrorMessage="权限没选">*</asp:requiredfieldvalidator></FONT></TD>
									</TR>
									<TR>
										<TD align="center">
											<asp:button id="Button1" runat="server" Text="修改" onclick="Button1_Click"></asp:button><FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;
											</FONT>
											<asp:button id="Button2" runat="server" Text="删除" onclick="Button2_Click"></asp:button></TD>
									</TR>
								</TABLE>
							</FONT>
						</asp:panel></TD>
				</TR>
			</TABLE>
			<asp:validationsummary id="ValidationSummary1" style="Z-INDEX: 101; LEFT: 784px; POSITION: absolute; TOP: 176px"
				runat="server" ShowSummary="False" ShowMessageBox="True"></asp:validationsummary></form>
	</body>
</HTML>
