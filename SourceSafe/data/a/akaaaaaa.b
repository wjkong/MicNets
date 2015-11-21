<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlMyAccount.ascx.cs" Inherits="MicNets.Web.Controls.ctlMyAccount" %>
<fieldset>
    <legend>
        <asp:Label ID="Label1" runat="server" Text="Account Information" CssClass="legend"></asp:Label>
    </legend>
<asp:Panel ID="pnlInfo" runat="server" DefaultButton="btnUpdateInfo">
<table align="left" cellpadding="5" cellspacing="5">
    <tr>
        <td>
            <asp:Label ID="lblUserName" runat="server" Text="User Name:" AssociatedControlID="txtUserName"></asp:Label>
        </td>
        <td>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/RequiredField2.jpg" Height="15px" Width="15px" />
            &nbsp;<asp:TextBox ID="txtUserName" runat="server" ToolTip="Enter your user name here" ReadOnly="True" ValidationGroup="vgpInfo" BackColor="#E0E0E0"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="vldrUserName" runat="server" ControlToValidate="txtUserName" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgpInfo">Required</asp:RequiredFieldValidator>         
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail"></asp:Label>
        </td>
        <td>
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Image/RequiredField2.jpg" Height="15px" Width="15px" />
            &nbsp;<asp:TextBox ID="txtEmail" runat="server" AutoCompleteType="Email" TabIndex="4" ToolTip="Enter your email here" ValidationGroup="vgpInfo"></asp:TextBox>
        </td>
        <td>
            <asp:RegularExpressionValidator
                ID="vldeEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic"
                SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vgpInfo">Invalid 
            email address</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgpInfo">Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblFirstName" runat="server" Text="First Name:" AssociatedControlID="txtFirstName"></asp:Label>
        </td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFirstName" runat="server" TabIndex="6" ToolTip="Enter your first name here"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblLastName" runat="server" Text="Last Name:" AssociatedControlID="txtLastName"></asp:Label>
        </td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtLastName" runat="server" TabIndex="8" ToolTip="Enter your last name here"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            <asp:Button ID="btnUpdateInfo" runat="server" Text="Update" TabIndex="10" CssClass="button" ValidationGroup="vgpInfo" OnClick="btnUpdateInfo_Click" ToolTip="Update your profile" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>

</asp:Panel>
</fieldset>
<br />
<fieldset>
    <legend>
        <asp:Label ID="Label2" runat="server" Text="Password Update" CssClass="legend"></asp:Label>
    </legend>
<asp:Panel ID="pnlPasswordChange" runat="server" DefaultButton="btnUpdatePwd">
<table align="left" cellpadding="5" cellspacing="5">
    <tr>
        <td>
            <asp:Label ID="lblCurrentPassword" runat="server" Text="Current Password:" AssociatedControlID="txtCurrentPassword"></asp:Label>
        </td>
        <td>
            <asp:Image ID="Image5" runat="server" ImageUrl="~/Image/RequiredField2.jpg" Height="15px" Width="15px" />&nbsp;<asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" ToolTip="Enter your password here" TabIndex="12" ValidationGroup="vgpPwd"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCurrentPassword" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgpPwd">Required</asp:RequiredFieldValidator>         
            <asp:CustomValidator ID="vldxPassword" runat="server" ControlToValidate="txtCurrentPassword"
                Display="Dynamic" EnableClientScript="False" ErrorMessage="Current password is incorrect"
                OnServerValidate="vldxPassword_ServerValidate" SetFocusOnError="True" ValidationGroup="vgpPwd"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblPassword" runat="server" Text="New Password:" AssociatedControlID="txtPassword"></asp:Label>
        </td>
        <td>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Image/RequiredField2.jpg" Height="15px" Width="15px" />&nbsp;<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ToolTip="Enter your password here" TabIndex="13" ValidationGroup="vgpPwd"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="vldrPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgpPwd">Required</asp:RequiredFieldValidator>         
            <asp:CompareValidator ID="vldcNewPwd" runat="server" ControlToCompare="txtCurrentPassword"
                ControlToValidate="txtPassword" CssClass="Validator" Display="Dynamic" ErrorMessage="Must not match the current password"
                Operator="NotEqual" SetFocusOnError="True" ValidationGroup="vgpPwd"></asp:CompareValidator>
            <asp:CustomValidator ID="vldxNewPwd" runat="server" ControlToValidate="txtPassword"
                Display="Dynamic" EnableClientScript="False" ErrorMessage="Must be at least 6 characters"
                OnServerValidate="vldxNewPwd_ServerValidate" SetFocusOnError="True" ValidationGroup="vgpPwd"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblPwdAgain" runat="server" Text="Re-enter New Password:" AssociatedControlID="txtPasswordAgain"></asp:Label>
        </td>
        <td>
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/RequiredField2.jpg" Height="15px" Width="15px" />&nbsp;<asp:TextBox ID="txtPasswordAgain" runat="server" TextMode="Password" ToolTip="Re-enter your password here again" TabIndex="14"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="vldrPasswordAgain" runat="server" ControlToValidate="txtPasswordAgain" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgpPwd">Required</asp:RequiredFieldValidator><asp:CompareValidator
                ID="vldcPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordAgain"
                Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgpPwd">Must match the new password</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            <asp:Button ID="btnUpdatePwd" runat="server" Text="Update" TabIndex="16" CssClass="button" ValidationGroup="vgpPwd" OnClick="btnUpdatePwd_Click" ToolTip="Update your password"/>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Panel>
</fieldset>
<asp:HiddenField ID="hidCustID" runat="server" />






