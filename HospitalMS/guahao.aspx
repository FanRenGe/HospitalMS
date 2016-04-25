<%@ Page language="c#" Inherits="医院管理系统.wubi" CodeFile="guahao.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>wubi</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体" id="FONT1">
				<TABLE id="Table3" width="544" height="0" align="center" cellSpacing="1" cellPadding="1"
					border="0">
					<TBODY>
						<TR>
							<TD>
								<TABLE id="Table1" width="598" cellSpacing="1" cellPadding="1" align="center" bgColor="#ffffff"
									border="1" style="WIDTH: 598px">
									<TR>
										<TD style="HEIGHT: 40px" align="center" colSpan="2">
											<asp:Image id="Image1" runat="server" Width="603px" Height="80px" ImageUrl="img/8.jpg"></asp:Image></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 74px; HEIGHT: 21px" align="left">姓名：</TD>
										<TD style="HEIGHT: 21px">
											<asp:textbox id="tname" runat="server" Width="152px"></asp:textbox>
											<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ErrorMessage="姓名不能为空" ControlToValidate="tname">*</asp:requiredfieldvalidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 74px; HEIGHT: 18px" align="left">年龄：</TD>
										<TD style="HEIGHT: 18px">
											<asp:textbox id="tage" runat="server" Width="96px"></asp:textbox>
											<asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="年龄不能为空" ControlToValidate="tage">*</asp:requiredfieldvalidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 74px; HEIGHT: 36px" align="left">性别：</TD>
										<TD style="HEIGHT: 36px">
											<asp:radiobuttonlist id="r11" runat="server" RepeatDirection="Horizontal" Width="72px">
												<asp:ListItem Value="男">男</asp:ListItem>
												<asp:ListItem Value="女">女</asp:ListItem>
											</asp:radiobuttonlist>
											<asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" ErrorMessage="性别不能为空" ControlToValidate="r11">*</asp:requiredfieldvalidator></TD>
									</TR>
									<tr>
										<td style="WIDTH: 74px" align="left">类型:</td>
										<td>
											<asp:DropDownList id="DropDownList1" runat="server" Width="72px">
												<asp:ListItem Value="普通">普通</asp:ListItem>
												<asp:ListItem Value="专家">专家</asp:ListItem>
												<asp:ListItem Value="急诊">急诊</asp:ListItem>
												<asp:ListItem Value="专科">专科</asp:ListItem>
											</asp:DropDownList></td>
									</tr>
									<TR>
										<TD style="WIDTH: 74px; HEIGHT: 16px" align="left">
											费用：</TD>
										<TD style="HEIGHT: 16px">
											<asp:radiobuttonlist id="r2" runat="server" Width="120px" RepeatDirection="Horizontal" Height="8px">
												<asp:ListItem Value="自费">自费</asp:ListItem>
												<asp:ListItem Value="公费">公费</asp:ListItem>
											</asp:radiobuttonlist>
											<asp:requiredfieldvalidator id="RequiredFieldValidator4" runat="server" ErrorMessage="费用不能为空" ControlToValidate="r2">*</asp:requiredfieldvalidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 74px; HEIGHT: 10px" align="left">
											病历：</TD>
										<TD style="HEIGHT: 10px">
											<asp:radiobuttonlist id="r3" runat="server" Width="176px" RepeatDirection="Horizontal" Height="12px">
												<asp:ListItem Value="要病历">要病历</asp:ListItem>
												<asp:ListItem Value="不要病历">不要病历</asp:ListItem>
											</asp:radiobuttonlist>
											<asp:requiredfieldvalidator id="RequiredFieldValidator5" runat="server" ErrorMessage="病历不能为空" ControlToValidate="r3">*</asp:requiredfieldvalidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 74px" align="left">地址：</TD>
										<TD>
											<asp:textbox id="tadd" runat="server" Width="280px"></asp:textbox>
											<asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" ErrorMessage="地址不能为空" ControlToValidate="tadd">*</asp:requiredfieldvalidator></TD>
									</TR>
									<TR>
										<TD align="center" colSpan="2">
											<asp:button id="Button1" runat="server" Width="42px" Text="挂号" onclick="Button1_Click"></asp:button>&nbsp;
											<asp:button id="Button3" runat="server" Width="59px" Text="获得号码" onclick="Button3_Click"></asp:button>
											<asp:HyperLink id="HyperLink2" runat="server" NavigateUrl="index.aspx" Font-Bold="True" ForeColor="Black">返回主页</asp:HyperLink>&nbsp;
											<asp:HyperLink id="HyperLink1" runat="server" ForeColor="Black" Font-Bold="True" NavigateUrl="guahaocz.aspx">查找</asp:HyperLink></TD>
									</TR>
									<TR>
										<TD align="right" colSpan="2"><FONT color="#ff0033" size="2">备注：挂号在两天内有效。</FONT></TD>
									</TR>
								</TABLE>
							</TD>
						</TR>
						<tr>
							<td></td>
						</tr>
						<TR>
							<TD><FONT face="宋体"><FONT face="宋体">
										<asp:panel id="pl" Visible="False" Runat="server">
											<FONT face="宋体"><FONT face="宋体"><FONT face="宋体"><FONT face="宋体">
															<TABLE id="Table2" cellSpacing="1" cellPadding="1" align="center" bgColor="#ffffff" border="0">
																<TR>
																	<TD>姓名：</TD>
																	<TD>
																		<asp:textbox id="tname1" runat="server" Width="120px"></asp:textbox></TD>
																</TR>
																<TR>
																	<TD colSpan="2" height="0">
																		<asp:DataGrid id=DataGrid1 runat="server" Height="0px" Width="604px" Visible="False" AutoGenerateColumns="False" DataMember="Table" DataKeyField="挂号号码" DataSource="<%# ds1 %>" GridLines="Horizontal" CellPadding="4" BackColor="White" BorderStyle="Double" BorderColor="#336666">
																			<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#339966"></SelectedItemStyle>
																			<ItemStyle ForeColor="#333333" BackColor="White"></ItemStyle>
																			<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#336666"></HeaderStyle>
																			<FooterStyle ForeColor="#333333" BackColor="White"></FooterStyle>
																			<Columns>
																				<asp:BoundColumn DataField="挂号号码" SortExpression="挂号号码" HeaderText="挂号号码"></asp:BoundColumn>
																				<asp:BoundColumn DataField="姓名" SortExpression="姓名" HeaderText="姓名"></asp:BoundColumn>
																				<asp:BoundColumn DataField="性别" SortExpression="性别" HeaderText="性别"></asp:BoundColumn>
																				<asp:BoundColumn DataField="类型" SortExpression="类型" HeaderText="类型"></asp:BoundColumn>
																				<asp:BoundColumn DataField="地址" SortExpression="地址" HeaderText="地址"></asp:BoundColumn>
																				<asp:BoundColumn DataField="日期" SortExpression="日期" HeaderText="日期"></asp:BoundColumn>
																			</Columns>
																			<PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#336666" Mode="NumericPages"></PagerStyle>
																		</asp:DataGrid></TD>
																</TR>
															</TABLE>
														</FONT></FONT></FONT></FONT>
										</asp:panel></FONT></FONT></TD>
						</TR>
					</TBODY>
				</TABLE>
				<asp:validationsummary id="ValidationSummary1" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 8px"
					runat="server" ShowSummary="False" ShowMessageBox="True"></asp:validationsummary></FONT></form>
	</body>
</HTML>
