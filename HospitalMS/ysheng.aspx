<%@ Page language="c#" Inherits="医院管理系统.ysheng" CodeFile="ysheng.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ysheng</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table3" height="0" cellSpacing="1" cellPadding="1" width="75%" align="center"
				border="0">
				<TR>
					<TD align="center"><FONT face="宋体" size="7">
							<asp:Image id="Image2" runat="server" Height="80px" Width="702px" ImageUrl="img/3.jpg"></asp:Image></FONT></TD>
				</TR>
				<TR>
					<TD><asp:datagrid id=DataGrid1 runat="server" Width="100%" AutoGenerateColumns="False" DataMember="Table" DataKeyField="ids" DataSource="<%# dsa1 %>" Height="0px" BackColor="White" HorizontalAlign="Center" Font-Size="Smaller" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AllowPaging="True" DESIGNTIMEDRAGDROP="497" onselectedindexchanged="DataGrid1_SelectedIndexChanged">
							<SelectedItemStyle Font-Bold="True" ForeColor="Firebrick" BackColor="Linen"></SelectedItemStyle>
							<ItemStyle ForeColor="#333333" BackColor="White"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#336666"></HeaderStyle>
							<FooterStyle ForeColor="#333333" BackColor="White"></FooterStyle>
							<Columns>
								<asp:TemplateColumn HeaderText="照片">
									<ItemTemplate>
										<asp:Image id=Image1 runat="server" Width="81px" ImageUrl='<%# "show.aspx?ImageID="+DataBinder.Eval(Container,"DataItem.ids") %>' Height="101px">
										</asp:Image>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="ids" SortExpression="ids" HeaderText="个人编号"></asp:BoundColumn>
								<asp:BoundColumn DataField="姓名" SortExpression="姓名" HeaderText="姓名"></asp:BoundColumn>
								<asp:BoundColumn DataField="性别" SortExpression="性别" HeaderText="性别"></asp:BoundColumn>
								<asp:BoundColumn DataField="出生年月" SortExpression="出生年月" HeaderText="出生年月"></asp:BoundColumn>
								<asp:BoundColumn DataField="籍贯" SortExpression="籍贯" HeaderText="籍贯"></asp:BoundColumn>
								<asp:BoundColumn DataField="电话" SortExpression="电话" HeaderText="电话"></asp:BoundColumn>
								<asp:BoundColumn DataField="家庭地址" SortExpression="家庭地址" HeaderText="家庭地址"></asp:BoundColumn>
								<asp:BoundColumn DataField="职务" SortExpression="职务" HeaderText="职务"></asp:BoundColumn>
								<asp:ButtonColumn Text="选择" CommandName="Select"></asp:ButtonColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#336666" Mode="NumericPages"></PagerStyle>
						</asp:datagrid></TD>
				</TR>
				<TR>
					<TD align="center" style="HEIGHT: 26px"><FONT face="宋体">
							<asp:button id="Button8" runat="server" Width="60px" Text="返回主页" onclick="Button8_Click"></asp:button><asp:button id="Button2" runat="server" Text="增加" Width="60px" onclick="Button2_Click"></asp:button>
							<asp:button id="Button5" runat="server" Width="62px" Text="查找" onclick="Button5_Click"></asp:button>
							<asp:button id="Button6" runat="server" Width="62px" Text="修改" onclick="Button6_Click"></asp:button>
							<asp:Button id="Button3" runat="server" Width="56px" Text="删除" onclick="Button3_Click"></asp:Button>
							<asp:HyperLink id="HyperLink1" runat="server" Font-Bold="True" ForeColor="Black" NavigateUrl="zhuce.aspx">注册</asp:HyperLink></FONT></TD>
				</TR>
				<TR>
					<TD><FONT face="宋体"><asp:panel id="Panel1" Width="100.21%" Height="48px" Visible="False" Runat="server"><FONT face="宋体">
									<TABLE id="Table2" style="WIDTH: 699px; HEIGHT: 34px" cellSpacing="1" cellPadding="1" width="699"
										align="center" border="1">
										<TR>
											<TD align="center"><FONT face="宋体">
													<asp:label id="Label1" runat="server" BorderColor="Red" Font-Size="Larger" BackColor="#FFC0FF"
														ForeColor="#C000C0" Font-Bold="True">查找</asp:label><FONT size="2">个人编号</FONT>&nbsp;
													<asp:textbox id="TextBox1" runat="server" Width="105px"></asp:textbox><FONT size="2">姓名</FONT>
													<asp:TextBox id="TextBox2" runat="server" Width="103px"></asp:TextBox>
													<asp:Button id="Button1" runat="server" Text="确定" onclick="Button1_Click"></asp:Button><STRONG></STRONG></FONT></TD>
										</TR>
									</TABLE>
								</FONT>
							</asp:panel></FONT></TD>
				</TR>
				<TR>
					<TD><asp:panel id="Panel2" Width="75%" Visible="False" Runat="server"><FONT face="宋体">
								<TABLE id="Table1" style="WIDTH: 702px; HEIGHT: 387px" cellSpacing="1" cellPadding="1"
									width="702" align="center" border="1">
									<TR>
										<TD colSpan="3"><FONT face="宋体"></FONT></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px">姓名：</TD>
										<TD style="WIDTH: 376px" colSpan="2">
											<asp:textbox id="tname" runat="server"></asp:textbox>
											<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="姓名不能为空" ControlToValidate="tname">*</asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px; HEIGHT: 23px">性别：</TD>
										<TD style="WIDTH: 376px; HEIGHT: 23px" colSpan="2">
											<asp:radiobuttonlist id="r1" runat="server" Width="136px" RepeatDirection="Horizontal">
												<asp:ListItem Value="男">男</asp:ListItem>
												<asp:ListItem Value="女">女</asp:ListItem>
											</asp:radiobuttonlist>
											<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="性别没选" ControlToValidate="r1">*</asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px">出生年月：</TD>
										<TD style="WIDTH: 376px" colSpan="2">
											<asp:dropdownlist id="d1" runat="server">
												<asp:ListItem Value="1956">1956</asp:ListItem>
												<asp:ListItem Value="1957">1957</asp:ListItem>
												<asp:ListItem Value="1958">1958</asp:ListItem>
												<asp:ListItem Value="1959">1959</asp:ListItem>
												<asp:ListItem Value="1960">1960</asp:ListItem>
												<asp:ListItem Value="1961">1961</asp:ListItem>
												<asp:ListItem Value="1962">1962</asp:ListItem>
												<asp:ListItem Value="1963">1963</asp:ListItem>
												<asp:ListItem Value="1964">1964</asp:ListItem>
												<asp:ListItem Value="1965">1965</asp:ListItem>
												<asp:ListItem Value="1966">1966</asp:ListItem>
												<asp:ListItem Value="1967">1967</asp:ListItem>
												<asp:ListItem Value="1968">1968</asp:ListItem>
												<asp:ListItem Value="1969">1969</asp:ListItem>
												<asp:ListItem Value="1970">1970</asp:ListItem>
												<asp:ListItem Value="1971">1971</asp:ListItem>
												<asp:ListItem Value="1972">1972</asp:ListItem>
												<asp:ListItem Value="1973">1973</asp:ListItem>
												<asp:ListItem Value="1974">1974</asp:ListItem>
												<asp:ListItem Value="1975">1975</asp:ListItem>
												<asp:ListItem Value="1976">1976</asp:ListItem>
												<asp:ListItem Value="1977">1977</asp:ListItem>
												<asp:ListItem Value="1978">1978</asp:ListItem>
												<asp:ListItem Value="1979">1979</asp:ListItem>
												<asp:ListItem Value="1980">1980</asp:ListItem>
												<asp:ListItem Value="1981">1981</asp:ListItem>
												<asp:ListItem Value="1982">1982</asp:ListItem>
												<asp:ListItem Value="1983">1983</asp:ListItem>
												<asp:ListItem Value="1984">1984</asp:ListItem>
												<asp:ListItem Value="1985">1985</asp:ListItem>
												<asp:ListItem Value="1986">1986</asp:ListItem>
												<asp:ListItem Value="1987">1987</asp:ListItem>
												<asp:ListItem Value="1988">1988</asp:ListItem>
												<asp:ListItem Value="1999">1999</asp:ListItem>
												<asp:ListItem Value="1990">1990</asp:ListItem>
												<asp:ListItem Value="1991">1991</asp:ListItem>
												<asp:ListItem Value="1992">1992</asp:ListItem>
												<asp:ListItem Value="1993">1993</asp:ListItem>
												<asp:ListItem Value="1994">1994</asp:ListItem>
												<asp:ListItem Value="1995">1995</asp:ListItem>
												<asp:ListItem Value="1996">1996</asp:ListItem>
												<asp:ListItem Value="1997">1997</asp:ListItem>
												<asp:ListItem Value="1998">1998</asp:ListItem>
												<asp:ListItem Value="1999">1999</asp:ListItem>
												<asp:ListItem Value="2000">2000</asp:ListItem>
												<asp:ListItem Value="2001">2001</asp:ListItem>
												<asp:ListItem Value="2002">2002</asp:ListItem>
												<asp:ListItem Value="2003">2003</asp:ListItem>
												<asp:ListItem Value="2004">2004</asp:ListItem>
												<asp:ListItem Value="2005">2005</asp:ListItem>
												<asp:ListItem Value="2006">2006</asp:ListItem>
												<asp:ListItem Value="2007">2007</asp:ListItem>
												<asp:ListItem Value="2008">2008</asp:ListItem>
												<asp:ListItem Value="2009">2009</asp:ListItem>
												<asp:ListItem Value="2010">2010</asp:ListItem>
											</asp:dropdownlist>年
											<asp:dropdownlist id="d2" runat="server">
												<asp:ListItem Value="1">1</asp:ListItem>
												<asp:ListItem Value="2">2</asp:ListItem>
												<asp:ListItem Value="3">3</asp:ListItem>
												<asp:ListItem Value="4">4</asp:ListItem>
												<asp:ListItem Value="5">5</asp:ListItem>
												<asp:ListItem Value="6">6</asp:ListItem>
												<asp:ListItem Value="7">7</asp:ListItem>
												<asp:ListItem Value="8">8</asp:ListItem>
												<asp:ListItem Value="9">9</asp:ListItem>
												<asp:ListItem Value="10">10</asp:ListItem>
												<asp:ListItem Value="11">11</asp:ListItem>
												<asp:ListItem Value="12">12</asp:ListItem>
											</asp:dropdownlist>月</TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px">籍贯：</TD>
										<TD style="WIDTH: 376px" colSpan="2">
											<asp:textbox id="tjg" runat="server"></asp:textbox>
											<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ErrorMessage="没填籍贯" ControlToValidate="tjg">*</asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px">种族：</TD>
										<TD style="WIDTH: 376px" colSpan="2">
											<asp:textbox id="tzz" runat="server"></asp:textbox>
											<asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" ErrorMessage="种族不能为空" ControlToValidate="tzz">*</asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px; HEIGHT: 20px">政治面貌：</TD>
										<TD style="WIDTH: 376px; HEIGHT: 20px" colSpan="2">
											<asp:dropdownlist id="d3" runat="server" Width="112px" ForeColor="Red">
												<asp:ListItem Value="团员">团员</asp:ListItem>
												<asp:ListItem Value="预备党员">预备党员</asp:ListItem>
												<asp:ListItem Value="党员">党员</asp:ListItem>
											</asp:dropdownlist>
											<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" ErrorMessage="政治面貌没选" ControlToValidate="d3">*</asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px">学历：</TD>
										<TD colSpan="2">
											<asp:dropdownlist id="d4" runat="server" Width="112px" ForeColor="Red">
												<asp:ListItem Value="大专">大专</asp:ListItem>
												<asp:ListItem Value="本科">本科</asp:ListItem>
												<asp:ListItem Value="学士学位">学士学位</asp:ListItem>
												<asp:ListItem Value="硕士">硕士</asp:ListItem>
												<asp:ListItem Value="研究生">研究生</asp:ListItem>
											</asp:dropdownlist>
											<asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server" ErrorMessage="学历没选" ControlToValidate="d4">*</asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px">职务：</TD>
										<TD colSpan="2">
											<asp:DropDownList id="d6" runat="server" Width="112px" BackColor="White" ForeColor="Red">
												<asp:ListItem Value="医生">医生</asp:ListItem>
												<asp:ListItem Value="护士">护士</asp:ListItem>
												<asp:ListItem Value="">医生管理</asp:ListItem>
											</asp:DropDownList>
											<asp:RequiredFieldValidator id="RequiredFieldValidator8" runat="server" Width="64px" ErrorMessage="职务不能为空" ControlToValidate="d6">*</asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px; HEIGHT: 14px">电话：</TD>
										<TD style="HEIGHT: 14px" colSpan="2">
											<asp:textbox id="tdh" runat="server"></asp:textbox>
											<asp:RequiredFieldValidator id="RequiredFieldValidator9" runat="server" ErrorMessage="电话不能为空" ControlToValidate="tdh">*</asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px">EMAIL:</TD>
										<TD colSpan="2">
											<asp:textbox id="tem" runat="server"></asp:textbox>
											<asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ErrorMessage="邮箱的格式不正确" ControlToValidate="tem"
												ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px">家庭地址：</TD>
										<TD colSpan="2">
											<asp:textbox id="tdz" runat="server"></asp:textbox>
											<asp:RequiredFieldValidator id="RequiredFieldValidator11" runat="server" ErrorMessage="地址不能为空" ControlToValidate="tdz">*</asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 116px">照片选择</TD>
										<TD colSpan="2"><INPUT id="File1" style="WIDTH: 320px; HEIGHT: 22px" type="file" size="34" name="File1"
												runat="server"></TD>
									</TR>
									<TR>
										<TD align="center" colSpan="3">
											<asp:Button id="Button7" runat="server" Text="提交" onclick="Button7_Click"></asp:Button>
											<asp:Button id="Submit" runat="server" onclick="Submit_Click"></asp:Button>&nbsp;&nbsp;&nbsp;
											<asp:button id="Button4" runat="server" Text="取消" 
                            onclick="Button4_Click"></asp:button></TD>
									</TR>
								</TABLE>
							</FONT>
						</asp:panel></TD>
				</TR>
				<TR>
					<TD></TD>
				</TR>
				<TR>
					<TD></TD>
				</TR>
			</TABLE>
			<FONT face="宋体" size="7"></FONT>
			<asp:ValidationSummary id="ValidationSummary1" style="Z-INDEX: 101; LEFT: 880px; POSITION: absolute; TOP: 1160px"
				runat="server" ShowMessageBox="True" ShowSummary="False" Width="65px"></asp:ValidationSummary></form>
	</body>
</HTML>
