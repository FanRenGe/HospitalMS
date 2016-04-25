<%@ Page language="c#" Inherits="医院管理系统.bedzhao" CodeFile="bedzhao.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>bedzhao</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<TABLE id="Table1" align="center" width="70%" height="0" cellSpacing="1" cellPadding="1"
					border="0">
					<TR>
						<TD align="center" style="HEIGHT: 27px">
							<asp:Image id="Image1" runat="server" Width="637px" Height="80px" ImageUrl="img/6.jpg"></asp:Image></TD>
					</TR>
					<TR>
						<TD align="center">
							挂号号码：
							<asp:TextBox id="tnum" runat="server" Width="100px"></asp:TextBox>姓名:
							<asp:TextBox id="tname" runat="server" Width="91px"></asp:TextBox>进出实况：
							<asp:DropDownList id="d1" runat="server" Width="51px" onselectedindexchanged="button1_Click">
								<asp:ListItem Value="进院">进院</asp:ListItem>
								<asp:ListItem Value="出院">出院</asp:ListItem>
							</asp:DropDownList>
							<asp:Button id="button1" runat="server" Text="查找" onclick="button1_Click"></asp:Button>
							<asp:Button id="Button3" runat="server" Text="删除" onclick="Button3_Click"></asp:Button>
							<asp:Button id="Button2" runat="server" Text="返回" onclick="Button2_Click"></asp:Button></TD>
					</TR>
					<TR>
						<TD>
							<asp:DataGrid id="DataGrid1" Width ="100%" runat="server" BorderColor="White" BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3" GridLines="Horizontal" DataSource="<%# allpepole1 %>" DataKeyField="床号" DataMember="Table" AutoGenerateColumns="False" PageSize="20" AllowPaging="True">
								<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
								<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
								<ItemStyle ForeColor="Black" BackColor="AntiqueWhite"></ItemStyle>
								<HeaderStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="Teal"></HeaderStyle>
								<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
								<Columns>
									<asp:BoundColumn DataField="挂号号码" HeaderText="挂号号码"></asp:BoundColumn>
									<asp:BoundColumn DataField="床号" HeaderText="床号"></asp:BoundColumn>
									<asp:BoundColumn DataField="姓名" HeaderText="姓名"></asp:BoundColumn>
									<asp:BoundColumn DataField="性别" HeaderText="性别"></asp:BoundColumn>
									<asp:BoundColumn DataField="年龄" HeaderText="年龄"></asp:BoundColumn>
									<asp:BoundColumn DataField="级别" HeaderText="级别"></asp:BoundColumn>
									<asp:BoundColumn DataField="进出实况" SortExpression="进出实况" HeaderText="进出实况"></asp:BoundColumn>
									<asp:ButtonColumn Text="选择" HeaderText="删除操作" CommandName="Select"></asp:ButtonColumn>
								</Columns>
								<PagerStyle HorizontalAlign="Center" ForeColor="#4A3C8C" BackColor="MistyRose" Mode="NumericPages"></PagerStyle>
							</asp:DataGrid></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
