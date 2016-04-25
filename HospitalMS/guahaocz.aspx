<%@ Page language="c#" Inherits="医院管理系统.guahaocz" CodeFile="guahaocz.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>guahaocz</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<TABLE id="Table1" align="center" cellSpacing="1" cellPadding="1" width="698" border="0"
					style="WIDTH: 698px; HEIGHT: 66px">
					<TR>
						<TD align="center">
							<asp:Image id="Image1" runat="server" Width="719px" Height="72px" ImageUrl="img/7.jpg"></asp:Image></TD>
					</TR>
					<TR>
						<TD align="center">挂号号码
							<asp:TextBox id="tnum" runat="server" Width="120px"></asp:TextBox>姓名
							<asp:TextBox id="tname" runat="server" Width="112px"></asp:TextBox>
							<asp:Button id="Button1" runat="server" Text="查询" onclick="Button1_Click"></asp:Button>
							<asp:Button id="Button3" runat="server" Text="删除" onclick="Button3_Click"></asp:Button>
							<asp:Button id="Button2" runat="server" Width="39px" Text="返回" onclick="Button2_Click"></asp:Button></TD>
					</TR>
					<TR>
						<TD align="center">
							<asp:DataGrid id="DataGrid1" Width="721px" runat="server" BorderColor="#336666" BorderStyle="Double"
								BorderWidth="3px" BackColor="White" CellPadding="4" GridLines="Horizontal" DataSource="<%# guacz1 %>" DataKeyField="挂号号码" DataMember="Table" AutoGenerateColumns="False" AllowPaging="True">
								<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#339966"></SelectedItemStyle>
								<ItemStyle ForeColor="#333333" BackColor="White"></ItemStyle>
								<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#336666"></HeaderStyle>
								<FooterStyle ForeColor="#333333" BackColor="White"></FooterStyle>
								<Columns>
									<asp:BoundColumn DataField="挂号号码" HeaderText="挂号号码"></asp:BoundColumn>
									<asp:BoundColumn DataField="姓名" HeaderText="姓名"></asp:BoundColumn>
									<asp:BoundColumn DataField="年龄" HeaderText="年龄"></asp:BoundColumn>
									<asp:BoundColumn DataField="性别" HeaderText="性别"></asp:BoundColumn>
									<asp:BoundColumn DataField="类型" HeaderText="类型"></asp:BoundColumn>
									<asp:BoundColumn DataField="挂号费用" HeaderText="挂号费用"></asp:BoundColumn>
									<asp:BoundColumn DataField="病历" HeaderText="病历"></asp:BoundColumn>
									<asp:BoundColumn DataField="地址" HeaderText="地址"></asp:BoundColumn>
									<asp:BoundColumn DataField="日期" HeaderText="日期"></asp:BoundColumn>
									<asp:ButtonColumn Text="选择" HeaderText="删除操作" CommandName="Select"></asp:ButtonColumn>
								</Columns>
								<PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#336666" Mode="NumericPages"></PagerStyle>
							</asp:DataGrid></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
