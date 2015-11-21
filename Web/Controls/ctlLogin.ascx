<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlLogin.ascx.cs" Inherits="MicNets.Web.Controls.ctlLogin" %>
<div style="line-height:1.5">
    <div class="row">
       <asp:Label ID="lblUserName" runat="server" Text="UserName:" 
            AssociatedControlID="txtUsername" meta:resourcekey="lblUserNameResource1"></asp:Label>
    </div>
    <div class="row">
        <asp:TextBox ID="txtUsername" runat="server" MaxLength="8" 
            CssClass="textBox" TabIndex="2" ToolTip="Enter here your user name" 
            meta:resourcekey="txtUsernameResource1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="vldrUsername" runat="server" 
            ControlToValidate="txtUsername" Display="Dynamic" SetFocusOnError="True" 
            ValidationGroup="vgpLogin" meta:resourcekey="vldrUsernameResource1">Required</asp:RequiredFieldValidator>
    </div>
    <div class="row">
         <asp:Label ID="lblPassword" runat="server" Text="Password:" 
             AssociatedControlID="txtPassword" meta:resourcekey="lblPasswordResource1"></asp:Label>
    </div>
     <div class="row">
        <asp:TextBox ID="txtPassword" runat="server" MaxLength="10" 
             CssClass="textBox" TabIndex="4" TextMode="Password" 
             ToolTip="Enter here your password (case sensitive)" 
             meta:resourcekey="txtPasswordResource1"></asp:TextBox>
         <asp:RequiredFieldValidator ID="vldrPassword" runat="server" 
             ControlToValidate="txtPassword" Display="Dynamic" SetFocusOnError="True" 
             ValidationGroup="vgpLogin" meta:resourcekey="vldrPasswordResource1">Required</asp:RequiredFieldValidator>
    </div>
    <div class="row">
        <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember me" 
            ToolTip="Tick this box to make you easy for next login" 
            meta:resourcekey="chkRememberMeResource1" />
    </div>
    <div class="row" style="padding-left:75px; padding-top:8px; padding-bottom:5px">
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button" 
            OnClick="btnLogin_Click" ToolTip="login to Michael's blog" 
            ValidationGroup="vgpLogin" meta:resourcekey="btnLoginResource1" />
    </div>
    <div class="row">
         <asp:HyperLink ID="hypRegister" runat="server" ToolTip="Register a new member" 
             meta:resourcekey="hypRegisterResource1">Register</asp:HyperLink>
    </div>
    <div class="row">
        <asp:HyperLink ID="hypForgotPassword" runat="server" 
            ToolTip="Recover your password" meta:resourcekey="hypForgotPasswordResource1">Forgot Password?</asp:HyperLink></div>
</div>

