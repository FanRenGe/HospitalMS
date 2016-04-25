<%@ Page language="c#" Inherits="医院管理系统.jiuzhen" CodeFile="jiuzhen.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>jiuzhen</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT class="sd2" face="宋体">
				<TABLE id="Table4" height="0" cellSpacing="1" cellPadding="1" width="736" align="center"
					border="0">
					<TR>
						<TD align="center"><asp:image id="Image1" runat="server" Height="72px" Width="768px" ImageUrl="img/4.jpg"></asp:image></TD>
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
								<TABLE id="Table1" style="WIDTH: 651px; HEIGHT: 876px" cellSpacing="1" cellPadding="1"
									width="651" align="center" bgColor="#ffffff" border="1">
									<TR>
										<TD style="WIDTH: 126px">病人简单信息：</TD>
										<TD>
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
										<TD style="WIDTH: 126px; HEIGHT: 38px">是否住院：</TD>
										<TD style="HEIGHT: 38px">
											<asp:radiobuttonlist id="r1" runat="server" Width="136px" Height="8px" BorderStyle="None" CellPadding="0"
												RepeatDirection="Horizontal" CellSpacing="0">
												<asp:ListItem Value="住院">住院</asp:ListItem>
												<asp:ListItem Value="不住院">不住院</asp:ListItem>
											</asp:radiobuttonlist></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 126px; HEIGHT: 18px">是否手术：</TD>
										<TD style="HEIGHT: 18px">
											<asp:radiobuttonlist id="r2" runat="server" Width="208px" Height="24px" RepeatDirection="Horizontal">
												<asp:ListItem Value="需要手术">需要手术</asp:ListItem>
												<asp:ListItem Value="不需要手术">不需要手术</asp:ListItem>
											</asp:radiobuttonlist></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 126px">是否做化验：</TD>
										<TD>
											<asp:dropdownlist id="d1" runat="server" Width="80px" Height="32px" ForeColor="Red">
												<asp:ListItem Value="不需要">不需要</asp:ListItem>
												<asp:ListItem Value="纤维内窥镜实验">纤维内窥镜实验</asp:ListItem>
												<asp:ListItem Value="CT图">CT图</asp:ListItem>
												<asp:ListItem Value="B超">B超</asp:ListItem>
												<asp:ListItem Value="验血">验血</asp:ListItem>
												<asp:ListItem Value="两对半实验">两对半实验</asp:ListItem>
												<asp:ListItem Value="放射实验">放射实验</asp:ListItem>
												<asp:ListItem Value="脑电图">脑电图</asp:ListItem>
											</asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 126px">诊断病况：</TD>
										<TD>
											<asp:textbox id="tbk" runat="server" Width="504px" Height="190px" TextMode="MultiLine" DESIGNTIMEDRAGDROP="70"></asp:textbox></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 126px">所开的药方：</TD>
										<TD>
											<P>
												<asp:textbox id="tyf" runat="server" Width="502px" Height="204px" TextMode="MultiLine"></asp:textbox></P>
											<P><STRONG>调剂：</STRONG>
												<asp:textbox id="ttj" runat="server" Width="472px" TextMode="MultiLine"></asp:textbox></P>
											<P><STRONG>复核：</STRONG>
												<asp:textbox id="tfh" runat="server" Width="472px" TextMode="MultiLine"></asp:textbox></P>
										</TD>
									</TR>
									<TR>
										<TD style="IGHT: 12px" align="left" colSpan="2"></TD>
									</TR>
									<TR>
										<TD align="right" colSpan="2"><STRONG><FONT color="#ff0033">检查医师：</FONT></STRONG>
											<asp:dropdownlist id=d2 runat="server" Width="104px" Height="25px" DataMember="Table" DataSource="<%# ds31 %>" DataTextField="姓名" onselectedindexchanged="d2_SelectedIndexChanged">
											</asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD align="right" colSpan="2"></TD>
									</TR>
									<TR>
										<TD align="center" colSpan="2">&nbsp;
											<asp:Button id="Button2" runat="server" Width="56px" Height="22px" Text="确定" onclick="Button2_Click"></asp:Button>
											<asp:Button id="Button5" runat="server" Width="83px" Height="22px" Text="疑难病历上传" onclick="Button5_Click"></asp:Button>
											<asp:Button id="Button6" runat="server" Width="83px" Height="22px" Text="查看疑难病历" onclick="Button6_Click"></asp:Button>
											<asp:Button id="Button3" runat="server" Width="56px" Height="22px" Text="查找" onclick="Button3_Click"></asp:Button>
											<asp:Button id="Button4" runat="server" Width="60px" Height="22px" Text="返回主页" onclick="Button4_Click"></asp:Button></TD>
									</TR>
								</TABLE>
							</asp:panel></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
