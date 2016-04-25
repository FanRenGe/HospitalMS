<%@ Page language="c#" Inherits="医院管理系统.bedhos" CodeFile="bedhos.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>bedhos</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body background="img/xsmb996.gif">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<TABLE id="Table2" style="Z-INDEX: 101; LEFT: 256px; WIDTH: 440px; POSITION: absolute; TOP: 88px; HEIGHT: 200px"
					cellSpacing="1" cellPadding="1" width="440" border="0">
					<TR>
						<TD align="center">
							<TABLE id="Table1" style="WIDTH: 362px; HEIGHT: 179px" borderColor="darksalmon" cellSpacing="0"
								cellPadding="0" width="362" align="center" border="0">
								<TBODY>
									<TR>
										<TD align="center" colSpan="2">
											<asp:Image id="Image1" runat="server" Height="64px" Width="351px" ImageUrl="img/2.jpg"></asp:Image></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 110px" align="right">栋号：</TD>
										<TD>
											<asp:TextBox id="Thid" runat="server" Height="24px" Width="168px"></asp:TextBox></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 110px" align="right">层数：</TD>
										<TD>
											<asp:TextBox id="Tcs" runat="server" Height="24px" Width="168px"></asp:TextBox></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 110px" align="right">层间数：</TD>
										<TD>
											<asp:TextBox id="Tcjs" runat="server" Height="24px" Width="168px" 
                                                ontextchanged="Tcjs_TextChanged"></asp:TextBox></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 110px" align="right">间床数：</TD>
										<TD>
											<asp:TextBox id="Tjcs" runat="server" Height="24px" Width="168px"></asp:TextBox></TD>
									</TR>
									<TR>
										<TD align="center" colSpan="2">
											<asp:Button id="Button1" runat="server" Width="40px" Text="确定" onclick="Button1_Click"></asp:Button>&nbsp;&nbsp;&nbsp; 
											&nbsp;
											<asp:Button id="Button2" runat="server" Width="40px" Text="返回" onclick="Button2_Click"></asp:Button></TD>
									</TR>
					</TR>
				</TABLE>
				</TD></TR></TBODY></TABLE> </FONT>
		</form>
	</body>
</HTML>
