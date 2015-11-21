<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PermissionAdmin.aspx.cs" Inherits="MicNets.Web.Blog.Member.Admin.PermissionAdmin" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
        <legend>        
            <asp:Label ID="lblSubTitle" runat="server" Text="Permission Admin" CssClass="title"></asp:Label>
        </legend>
        <div class="content">
        <table cellpadding="0" cellspacing="0">
         <tr>
            <td colspan=3 style="height: 13px">
                &nbsp;</td>
        </tr>
        <tr><td colspan=3>
            &nbsp;</td>
        </tr>
        <tr>
            <td colspan=2>
                Catagory:
                <asp:DropDownList ID="ddlCata" runat="server" CssClass="TextBox" Width="80px" AutoPostBack="True" OnSelectedIndexChanged="ddlCata_SelectedIndexChanged">
                    <asp:ListItem Value="0">Admin</asp:ListItem>
                    <asp:ListItem Value="1">Blog</asp:ListItem>
                    <asp:ListItem Value="2">Sales</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="lblRole" runat="server" Text="Access Role:"></asp:Label>&nbsp;<asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged" CssClass="TextBox">           </asp:DropDownList>&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="vldrRole" runat="server" ControlToValidate="ddlRole" 
                    ErrorMessage="Requires" EnableClientScript="False"></asp:RequiredFieldValidator></td>
            <td align=right>
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" CssClass="BlueButton" onmouseout="this.setAttribute('className', 'BlueButton')" onmouseover="this.setAttribute('className', 'RedButton')"></asp:Button></td>
                
        </tr>
        <tr><td colspan=3>
            &nbsp;</td>
        </tr>
        <tr>
            <td colspan=3>
                <asp:DataList ID="dlSubLink" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%" DataKeyField="linkID">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkTopLink" runat="server" Text=<%# ((System.Data.DataRowView)Container.DataItem)["text"] %> AutoPostBack="True" Enabled="False" OnCheckedChanged="chkTopLink_CheckedChanged" CssClass="UpperCase"/><br />
                        <asp:CheckBoxList ID="chklSubLink" runat="server" DataSource='<%# GetSubLinks((int)((System.Data.DataRowView)Container.DataItem)["linkID"]) %>' DataTextField="text" DataValueField="linkID" Enabled="False" CssClass="defaultCheckBox">
                        </asp:CheckBoxList>
                    </ItemTemplate>
                    <ItemStyle VerticalAlign="Top" Width="180px"/>
                </asp:DataList></td>
        </tr>
        <tr height=100%><td colspan=3>
            </td></tr>
    </table>
    
        
        </div>
</fieldset>
</asp:Content>


