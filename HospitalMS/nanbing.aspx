<%@ Page language="c#" Inherits="医院管理系统.nanbing" CodeFile="nanbing.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>nanbing</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table4" style="Z-INDEX: 101; LEFT: 128px; POSITION: absolute; TOP: 8px" height="0"
				cellSpacing="1" cellPadding="1" width="736" align="center" border="0">
				<TR>
					<TD align="center" bgColor="mintcream"><FONT face="华文彩云" color="#006699" size="7"><STRONG>疑难病况</STRONG></FONT></TD>
				</TR>
				<TR>
					<TD align="center">
						<TABLE id="Table3" cellSpacing="0" cellPadding="0" width="744" border="0">
							<TR>
								<TD align="center"><STRONG>挂号号码：
										<asp:textbox id="tnum" runat="server"></asp:textbox><asp:button id="Button1" runat="server" Width="63px" Text="查找" onclick="Button1_Click"></asp:button></STRONG></TD>
							</TR>
							<TR>
								<TD align="center"><asp:datagrid id=DataGrid1 runat="server" Width="739px" CellPadding="3" BackColor="White" BorderWidth="1px" BorderStyle="None" BorderColor="#CCCCCC" DataSource="<%# dss1 %>" DataKeyField="挂号号码" DataMember="Table" AutoGenerateColumns="False" AllowPaging="True" onselectedindexchanged="DataGrid1_SelectedIndexChanged">
										<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#669999"></SelectedItemStyle>
										<ItemStyle ForeColor="#000066"></ItemStyle>
										<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#006699"></HeaderStyle>
										<FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
										<Columns>
											<asp:BoundColumn DataField="挂号号码" SortExpression="挂号号码" HeaderText="挂号号码"></asp:BoundColumn>
											<asp:BoundColumn DataField="姓名" SortExpression="姓名" HeaderText="姓名"></asp:BoundColumn>
											<asp:BoundColumn DataField="年龄" SortExpression="年龄" HeaderText="年龄"></asp:BoundColumn>
											<asp:BoundColumn DataField="性别" SortExpression="性别" HeaderText="性别"></asp:BoundColumn>
											<asp:ButtonColumn Text="选择" CommandName="Select"></asp:ButtonColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="#000066" BackColor="White" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<TR>
					<TD><asp:panel id="p1" Width="768px" Runat="server">
							<TABLE id="Table5" style="WIDTH: 651px; HEIGHT: 440px" cellSpacing="1" cellPadding="1"
								width="651" align="center" bgColor="#ffffff" border="1">
								<TR>
									<TD style="WIDTH: 126px; HEIGHT: 99px">病人简单信息：</TD>
									<TD style="HEIGHT: 99px">
										<TABLE id="Table2" height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="WIDTH: 87px">挂号号码：</TD>
												<TD>
													<asp:TextBox id="tnumber" runat="server" Width="256px"></asp:TextBox></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 87px">姓&nbsp;&nbsp;&nbsp; 名：</TD>
												<TD>
													<asp:TextBox id="tname" runat="server" Width="256px"></asp:TextBox></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 87px">性&nbsp;&nbsp;&nbsp; 别：</TD>
												<TD>
													<asp:TextBox id="tsex" runat="server" Width="256px"></asp:TextBox></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 87px">年&nbsp;&nbsp;&nbsp; 龄：</TD>
												<TD>
													<asp:TextBox id="tage" runat="server" Width="256px"></asp:TextBox></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD style="WIDTH: 126px; HEIGHT: 184px"><FONT face="宋体">疑难病况:</FONT></TD>
									<TD style="HEIGHT: 184px">
										<P>
											<asp:textbox id="tbk" runat="server" Height="204px" Width="502px" TextMode="MultiLine"></asp:textbox><FONT face="宋体"></FONT></P>
									</TD>
								</TR>
								<TR>
									<TD style="WIDTH: 126px; HEIGHT: 184px"><FONT face="宋体">过敏药物:</FONT></TD>
									<TD style="HEIGHT: 184px">
										<P>
											<asp:textbox id="tgm" runat="server" Height="170px" Width="502px" TextMode="MultiLine"></asp:textbox><FONT face="宋体"></FONT></P>
									</TD>
								</TR>
								<TR>
									<TD style="HEIGHT: 21px" align="right" colSpan="2"><STRONG><FONT color="#ff0033">检查医师：</FONT></STRONG>
										<asp:dropdownlist id=d2 runat="server" Height="25px" Width="104px" DataSource="<%# ds31 %>" DataMember="Table" DataTextField="姓名" onselectedindexchanged="d2_SelectedIndexChanged">
										</asp:dropdownlist></TD>
								</TR>
								<TR>
									<TD align="center" colSpan="2">&nbsp;
										<asp:Button id="Button2" runat="server" Height="22px" Width="56px" Text="确定" onclick="Button2_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<asp:Button id="Button4" runat="server" Height="22px" Width="52px" Text="返回" onclick="Button4_Click"></asp:Button></TD>
								</TR>
							</TABLE>
						</asp:panel></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
