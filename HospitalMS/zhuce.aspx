<%@ Page Language="c#" Inherits="ҽԺ����ϵͳ.zhuce" CodeFile="zhuce.aspx.cs" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>zhuce</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <font face="����">
        <asp:ValidationSummary ID="ValidationSummary1" Style="z-index: 101; left: 48px; position: absolute;
            top: 248px" runat="server" ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
        <table id="Table2" align="center" width="552" cellspacing="1" cellpadding="1" border="0"
            style="width: 552px; height: 320px">
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" Width="542px" Height="88px" ImageUrl="img/10.jpg">
                    </asp:Image>
                </td>
            </tr>
            <tr>
                <td height="0">
                    <table id="Table1" width="100%" height="0" bordercolor="#330033" cellspacing="1"
                        cellpadding="1" align="center" bgcolor="#ffffff" border="1">
                        <tr>
                            <td style="width: 105px; height: 29px" align="right">
                                �� �� ����
                            </td>
                            <td style="height: 29px">
                                <asp:TextBox ID="tname" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Height="14px"
                                    Width="8px" ErrorMessage="�û�������Ϊ��" ControlToValidate="tname">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105px; height: 29px" align="right">
                                ��&nbsp;&nbsp; &nbsp;����
                            </td>
                            <td style="height: 29px">
                                <asp:TextBox ID="tname1" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" Height="14px"
                                    Width="8px" ErrorMessage="�û�������Ϊ��" ControlToValidate="tname1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105px" align="right">
                                ��&nbsp; &nbsp; �룺
                            </td>
                            <td>
                                <asp:TextBox ID="tpwd" runat="server" Width="200px" OnTextChanged="Tpwd_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Height="14px"
                                    Width="8px" ErrorMessage="���벻��Ϊ��" ControlToValidate="tpwd">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105px" align="right">
                                ȷ�����룺
                            </td>
                            <td>
                                <asp:TextBox ID="pass" runat="server" Width="200px" 
                                    ontextchanged="pass_TextChanged"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="������������벻ͬ"
                                    ControlToValidate="pass" ControlToCompare="tpwd">*</asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105px; height: 16px" align="right">
                                Ȩ&nbsp;&nbsp;&nbsp; �ޣ�
                            </td>
                            <td style="height: 16px">
                                <asp:DropDownList ID="d1" runat="server" Height="24px" Width="128px">
                                    <asp:ListItem Value="�Һ�">�Һ�</asp:ListItem>
                                    <asp:ListItem Value="����">����</asp:ListItem>
                                    <asp:ListItem Value="��λ����">��λ����</asp:ListItem>
                                    <asp:ListItem>ҽ������</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Height="14px"
                                    Width="8px" ErrorMessage="�Ʊ���Ϊ��" ControlToValidate="d1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105px; height: 15px" align="right">
                                ��&nbsp; &nbsp; ��
                            </td>
                            <td style="height: 15px">
                                <asp:DropDownList ID="d2" runat="server" Height="24px" Width="56px">
                                    <asp:ListItem Value="��">��</asp:ListItem>
                                    <asp:ListItem Value="Ů">Ů</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Height="14px"
                                    Width="8px" ErrorMessage="�Ա���Ϊ��" ControlToValidate="d2">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105px" align="right">
                                ��&nbsp;&nbsp; &nbsp;ַ��
                            </td>
                            <td>
                                <asp:TextBox ID="tadd" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Height="14px"
                                    Width="8px" ErrorMessage="��ַ����Ϊ��" ControlToValidate="tadd">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105px" align="right">
                                ��&nbsp; &nbsp; ����
                            </td>
                            <td>
                                <asp:TextBox ID="tphone" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Height="14px"
                                    Width="8px" ErrorMessage="�绰����Ϊ��" ControlToValidate="tphone">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="Button1" runat="server" Width="42px" Text="ע��" OnClick="Button1_Click"
                                    Style="height: 26px"></asp:Button>&nbsp;&nbsp;
                                <asp:Button ID="Button2" runat="server" Width="40px" Text="ȡ��" OnClick="Button2_Click">
                                </asp:Button>&nbsp;&nbsp;
                                <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Black" Font-Bold="True"
                                    NavigateUrl="mimagai.aspx">�����޸�</asp:HyperLink>&nbsp;
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="ysheng.aspx" Font-Bold="True"
                                    ForeColor="Black">ҽ������</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </font>
    </form>
</body>
</html>
