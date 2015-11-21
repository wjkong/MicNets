<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlRecoverPassword.ascx.cs" Inherits="MicNets.Web.Controls.ctlRecoverPassword" %>
<asp:Panel ID="pnlRegister" runat="server" DefaultButton="btnRecover" 
    meta:resourcekey="pnlRegisterResource1">
<table align="left" cellpadding="5" cellspacing="5">
    <tr>
        <td>
            <asp:Label ID="lblEmail" runat="server" Text="Email:" 
                AssociatedControlID="txtEmail" meta:resourcekey="lblEmailResource1"></asp:Label>
        </td>
        <td>
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Image/RequiredField2.jpg" 
                Height="15px" Width="15px" meta:resourcekey="Image4Resource1" />&nbsp;<asp:TextBox 
                ID="txtEmail" runat="server" AutoCompleteType="Email" TabIndex="2" 
                ToolTip="Enter your email here" meta:resourcekey="txtEmailResource1"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="True" 
                meta:resourcekey="RequiredFieldValidator1Resource1">Required</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                ID="vldeEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic"
                SetFocusOnError="True" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                meta:resourcekey="vldeEmailResource1">Invalid email address</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblUserName" runat="server" Text="User Name:" 
                AssociatedControlID="txtUserName" meta:resourcekey="lblUserNameResource1"></asp:Label>
        </td>
        <td>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/RequiredField2.jpg" 
                Height="15px" Width="15px" meta:resourcekey="Image1Resource1" />&nbsp;<asp:TextBox 
                ID="txtUserName" runat="server" TabIndex="4" 
                ToolTip="Enter your user name here" meta:resourcekey="txtUserNameResource1"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="vldrUserName" runat="server" 
                ControlToValidate="txtUserName" Display="Dynamic" SetFocusOnError="True" 
                meta:resourcekey="vldrUserNameResource1">Required</asp:RequiredFieldValidator>         
        </td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            <asp:Button ID="btnRecover" runat="server" Text="Recover Password" 
                TabIndex="10" CssClass="button" OnClick="btnRecover_Click" 
                ToolTip="Click here to recover your password" 
                meta:resourcekey="btnRecoverResource1"/>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Panel>

