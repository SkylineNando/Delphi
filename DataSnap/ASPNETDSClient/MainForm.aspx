<%@ Page Language="Oxygene" AutoEventWireup="true" CodeBehind="MainForm.aspx.pas" Inherits="DataSnapdotnetClient.MainForm" %>
<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Delphi Prism XE - DataSnap Client</title>
    <style type="text/css">
        .style1
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: xx-large;
            color: #FFFFFF;
        }
        .style2
        {
        }
        .style3
        {
            font-family: Verdana;
            font-size: medium;
        }
        .style4
        {
            font-family: Verdana;
            font-size: medium;

        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <table class="style2">
            <tr>
                <td valign="top" bgcolor="#ff0000" colspan="2" style="text-align: center">

        <h1 class="style1">
            DataSnap .NET Client - Prism XE2</h1>
                    
                    </td>

            </tr>
            <tr>
                <td valign="top" class="style3" colspan="2" >
                    <h2 class="style3">
                        DataSnap Authentication required to execute the Server Methods</h2>
<asp:Label ID="Label1" runat="server" Text="Username" CssClass="style3"></asp:Label>
                    <span class="style3">&nbsp;&nbsp;
        </span>
        <asp:TextBox ID="tbUsername" runat="server" CssClass="style3">admin</asp:TextBox>
        <br class="style3" />
        <asp:Label ID="Label2" runat="server" Text="Password" CssClass="style3"></asp:Label>
                    <span class="style3">&nbsp;&nbsp;
        </span>
        <asp:TextBox ID="tbPassword" runat="server" CssClass="style3" 
                        ToolTip="User and password to test is admin">admin</asp:TextBox>                    
                    <br />
                    <br />

        <asp:Button ID="btLogin" runat="server" Height="30px" onclick="Button2_Click" 
            Text="Login" Width="112px" />
                    <br class="style3" />
        <asp:Label ID="cvUser" runat="server" ForeColor="Red" CssClass="style3"></asp:Label>
                    
                    <br class="style3" />
                </td>

            </tr>
            <tr>
                <td valign="top" class="style4">
                    <h3 class="style3">
                        Return DbxReader and print as HTML</h3>

                    <asp:Button ID="ButtonParams" runat="server" onclick="ButtonParams_Click" 
                        Text="Execute" />
                    <br class="style3" />

        <br class="style3" />
                    
                </td>

                <td style="font-family: Verdana; font-size: small">

                    <asp:Literal ID="GridPanel" runat="server" ></asp:Literal>
 
                    </td>

            </tr>
            <tr>
                <td valign="top" class="style4">
                    <h3 class="style3">
                        Return DbxReader as SQLDataSource<br />
&nbsp;<asp:Button ID="Button1" runat="server" 
                            Height="32px" onclick="Button1_Click" 
            Text="Execute" Width="111px" />

                    </h3>
                </td>

                <td>

        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                        CellPadding="4" GridLines="None" 
                        ForeColor="#333333" >
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>

                    </td>

            </tr>
            <tr>
                <td valign="top" class="style4">
                    <h3 class="style3">
                        Create new Department sending<br />
                        .NET DataTable to DataSnap</h3>
                    <br />
                    <asp:Button ID="ButtonSend" runat="server" onclick="ButtonSend_Click" 
                        Text="Execute" />
                </td>

                <td>

                    &nbsp;</td>

            </tr>
        </table>
        <br />
        <br />

    </div>
    <br />
        <br />

        <br />
    </form>
</body>
</html>
