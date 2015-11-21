<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlRegister.ascx.cs" Inherits="MicNets.Web.Controls.ctlRegister" %>
<asp:Panel ID="pnlRegister" runat="server" DefaultButton="btnRegister" 
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
                ToolTip="Enter your email here" meta:resourcekey="txtEmailResource1" 
                ValidationGroup="Registration"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="vldrEmail" runat="server" 
                ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="True" 
                meta:resourcekey="RequiredFieldValidator1Resource1" 
                ValidationGroup="Registration"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator
                ID="vldeEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic"
                SetFocusOnError="True" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                meta:resourcekey="vldeEmailResource1" ValidationGroup="Registration"></asp:RegularExpressionValidator>
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
                ToolTip="Enter your user name here" 
                meta:resourcekey="txtUserNameResource1" ValidationGroup="Registration"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="vldrUserName" runat="server" 
                ControlToValidate="txtUserName" Display="Dynamic" SetFocusOnError="True" 
                meta:resourcekey="vldrUserNameResource1" ValidationGroup="Registration"></asp:RequiredFieldValidator>         
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblPassword" runat="server" Text="Password:" 
                AssociatedControlID="txtPassword" meta:resourcekey="lblPasswordResource1"></asp:Label>
        </td>
        <td>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Image/RequiredField2.jpg" 
                Height="15px" Width="15px" meta:resourcekey="Image2Resource1" />&nbsp;<asp:TextBox 
                ID="txtPassword" runat="server" TextMode="Password" 
                ToolTip="Enter your password here" TabIndex="6" 
                meta:resourcekey="txtPasswordResource1" ValidationGroup="Registration"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="vldrPassword" runat="server" 
                ControlToValidate="txtPassword" Display="Dynamic" SetFocusOnError="True" 
                meta:resourcekey="vldrPasswordResource1" ValidationGroup="Registration"></asp:RequiredFieldValidator>         
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblPwdAgain" runat="server" Text="Re-enter Password:" 
                AssociatedControlID="txtPasswordAgain" meta:resourcekey="lblPwdAgainResource1"></asp:Label>
        </td>
        <td>
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/RequiredField2.jpg" 
                Height="15px" Width="15px" meta:resourcekey="Image3Resource1" />&nbsp;<asp:TextBox 
                ID="txtPasswordAgain" runat="server" TextMode="Password" 
                ToolTip="Re-enter your password here again" TabIndex="8" 
                meta:resourcekey="txtPasswordAgainResource1" 
                ValidationGroup="Registration"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="vldrPasswordAgain" runat="server" 
                ControlToValidate="txtPasswordAgain" Display="Dynamic" SetFocusOnError="True" 
                meta:resourcekey="vldrPasswordAgainResource1" 
                ValidationGroup="Registration"></asp:RequiredFieldValidator>
            <asp:CompareValidator
                ID="vldcPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordAgain"
                Display="Dynamic" SetFocusOnError="True" 
                meta:resourcekey="vldcPasswordResource1" ValidationGroup="Registration"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblFirstName" runat="server" Text="First Name:" 
                AssociatedControlID="txtFirstName" meta:resourcekey="lblFirstNameResource1"></asp:Label>
        </td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFirstName" runat="server" TabIndex="10" 
                ToolTip="Enter your first name here" 
                meta:resourcekey="txtFirstNameResource1" ValidationGroup="Registration"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblLastName" runat="server" Text="Last Name:" 
                AssociatedControlID="txtLastName" meta:resourcekey="lblLastNameResource1"></asp:Label>
        </td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtLastName" runat="server" TabIndex="12" 
                ToolTip="Enter your last name here" 
                meta:resourcekey="txtLastNameResource1" ValidationGroup="Registration"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" align="right">
            <asp:Button ID="btnRegister" runat="server" Text="Register" TabIndex="14" 
                CssClass="button" OnClick="btnRegister_Click" ToolTip="Click here to register" 
                meta:resourcekey="btnRegisterResource1" ValidationGroup="Registration"/>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Panel>


