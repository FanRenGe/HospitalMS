<%@ Page language="c#" Inherits="医院管理系统.bedid" CodeFile="bedid.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>bedid</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT id="FONT1" face="宋体">
				<asp:validationsummary id="ValidationSummary1" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 80px"
					runat="server" ShowSummary="False" ShowMessageBox="True"></asp:validationsummary>
				<TABLE id="Table2" height="0" cellSpacing="1" cellPadding="1" width="70%" align="center"
					border="1">
					<TR>
						<TD align="center" colSpan="2" height="0"><FONT face="宋体"><asp:panel id="p1" Width="376px" Runat="server" Height="262px" Visible="False"><FONT face="宋体">
										<TABLE id="Table1" style="WIDTH: 355px; HEIGHT: 619px" cellSpacing="1" cellPadding="1"
											width="355" align="center" border="0">
											<TR>
												<TD align="center" colSpan="2">
													<asp:Image id="Image1" runat="server" Height="80px" Width="372px" ImageUrl="img/11.jpg"></asp:Image></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 143px; HEIGHT: 4px">床号：</TD>
												<TD style="HEIGHT: 4px">
													<asp:TextBox id="tch" runat="server" Width="200px"></asp:TextBox>
													<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="tch" ErrorMessage="床号不能为空">*</asp:RequiredFieldValidator></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 143px; HEIGHT: 4px">挂号号码：</TD>
												<TD style="HEIGHT: 4px">
													<asp:TextBox id="tnum" runat="server" Width="200px"></asp:TextBox>
													<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="tnum" ErrorMessage="挂号号码不能为空">*</asp:RequiredFieldValidator></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 143px">姓名：</TD>
												<TD>
													<asp:TextBox id="tname" runat="server" Width="200px"></asp:TextBox>
													<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ControlToValidate="tname" ErrorMessage="姓名不能为空">*</asp:RequiredFieldValidator></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 143px; HEIGHT: 6px">年龄：</TD>
												<TD style="HEIGHT: 6px">
													<asp:TextBox id="tage" runat="server" Width="200px"></asp:TextBox>
													<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ControlToValidate="tage" ErrorMessage="年龄不能为空">*</asp:RequiredFieldValidator></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 143px; HEIGHT: 16px">性别：</TD>
												<TD style="HEIGHT: 16px">
													<asp:RadioButtonList id="r1" runat="server" Width="104px" RepeatDirection="Horizontal">
														<asp:ListItem Value="男">男</asp:ListItem>
														<asp:ListItem Value="女">女</asp:ListItem>
													</asp:RadioButtonList>
													<asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" ControlToValidate="r1" ErrorMessage="性别你能为空">*</asp:RequiredFieldValidator></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 143px; HEIGHT: 4px">级别：</TD>
												<TD style="HEIGHT: 4px">
													<asp:DropDownList id="d1" runat="server" Width="72px">
														<asp:ListItem Value="一般">一般</asp:ListItem>
														<asp:ListItem Value="中等">中等</asp:ListItem>
														<asp:ListItem Value="高级">高级</asp:ListItem>
													</asp:DropDownList></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 143px; HEIGHT: 1px">负责人：</TD>
												<TD style="HEIGHT: 1px">
													<asp:DropDownList id=d2 runat="server" Width="88px" DataTextField="姓名" DataMember="Table" DataSource="<%# zhuyuan1 %>">
													</asp:DropDownList></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 143px; HEIGHT: 4px">进出实况：</TD>
												<TD style="HEIGHT: 4px">
													<asp:DropDownList id="d3" runat="server" Width="72px">
														<asp:ListItem Value="进院">进院</asp:ListItem>
														<asp:ListItem Value="出院">出院</asp:ListItem>
													</asp:DropDownList></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 5px" align="center" bgColor="#f2eaee" colSpan="2">&nbsp;
													<asp:Button id="Button1" runat="server" Text="提交" onclick="Button1_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<asp:Button id="Button2" runat="server" Text="出院" onclick="Button2_Click"></asp:Button></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 6px" colSpan="2">挂号号码：
													<asp:TextBox id="TextBox1" runat="server" Width="120px"></asp:TextBox>
													<asp:Button id="Button3" runat="server" Text="查找" onclick="Button3_Click"></asp:Button></TD>
											</TR>
											<TR>
												<TD align="left" colSpan="2">
													<asp:DataGrid id=DataGrid2 runat="server" Visible="False" Height="0" Width="368px" DataMember="Table" DataSource="<%# sda31 %>" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" BackColor="White" CellPadding="4" GridLines="Horizontal" DataKeyField="挂号号码" AutoGenerateColumns="False" AllowPaging="True" ShowFooter="True" PageSize="5" onselectedindexchanged="DataGrid2_SelectedIndexChanged_1">
														<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#339966"></SelectedItemStyle>
														<ItemStyle ForeColor="#333333" BackColor="White"></ItemStyle>
														<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#336666"></HeaderStyle>
														<FooterStyle ForeColor="#333333" BackColor="White"></FooterStyle>
														<Columns>
															<asp:BoundColumn DataField="挂号号码" SortExpression="挂号号码" HeaderText="挂号号码"></asp:BoundColumn>
															<asp:BoundColumn DataField="床号" SortExpression="床号" HeaderText="床号"></asp:BoundColumn>
															<asp:BoundColumn DataField="姓名" SortExpression="姓名" HeaderText="姓名"></asp:BoundColumn>
															<asp:BoundColumn DataField="年龄" SortExpression="年龄" HeaderText="年龄"></asp:BoundColumn>
															<asp:BoundColumn DataField="进出实况" SortExpression="进出实况" HeaderText="进出实况"></asp:BoundColumn>
															<asp:ButtonColumn Text="选择" CommandName="Select"></asp:ButtonColumn>
														</Columns>
														<PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#336666" Mode="NumericPages"></PagerStyle>
													</asp:DataGrid></TD>
											</TR>
										</TABLE>
									</FONT>
								</asp:panel></FONT></TD>
					</TR>
					<tr>
						<td align="center">
							<asp:Image id="Image2" runat="server" Height="80px" Width="647px" ImageUrl="img/11.jpg"></asp:Image></td>
					</tr>
					<TR>
						<TD style="HEIGHT: 6px" align="center" colSpan="2">
							<asp:button id="Button5" runat="server" Text="返回主页" onclick="Button5_Click"></asp:button>&nbsp;<asp:button id="Button4" runat="server" Text="住院" onclick="Button4_Click"></asp:button>&nbsp; 
							&nbsp;&nbsp;
							<asp:hyperlink id="HyperLink2" runat="server" ForeColor="IndianRed" Font-Bold="True" NavigateUrl="bedhos.aspx">新建床位</asp:hyperlink>&nbsp;&nbsp;&nbsp;
							<asp:hyperlink id="HyperLink1" runat="server" Width="48px" ForeColor="IndianRed" Font-Bold="True"
								NavigateUrl="bedzhao.aspx">查找</asp:hyperlink></TD>
					</TR>
					<tr>
						<td><asp:datagrid id=DataGrid1 runat="server" DataMember="Table" DataSource="<%# zhu1 %>" BorderColor="#C0C000" BorderStyle="None" BorderWidth="3px" BackColor="#FFE0C0" CellPadding="4" GridLines="Horizontal" DataKeyField="床号" AutoGenerateColumns="False" AllowPaging="True" width="100%" onselectedindexchanged="DataGrid1_SelectedIndexChanged">
								<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#339966"></SelectedItemStyle>
								<ItemStyle ForeColor="#333333" BackColor="White"></ItemStyle>
								<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#336666"></HeaderStyle>
								<FooterStyle ForeColor="#333333" BackColor="White"></FooterStyle>
								<Columns>
									<asp:BoundColumn DataField="床号" SortExpression="床号" HeaderText="床号"></asp:BoundColumn>
									<asp:BoundColumn DataField="栋号" SortExpression="栋号" HeaderText="栋号"></asp:BoundColumn>
									<asp:BoundColumn DataField="进出实况" SortExpression="进出实况" HeaderText="进出实况"></asp:BoundColumn>
									<asp:ButtonColumn Text="选择" CommandName="Select"></asp:ButtonColumn>
								</Columns>
								<PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#336666" Mode="NumericPages"></PagerStyle>
							</asp:datagrid></td>
					</tr>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
