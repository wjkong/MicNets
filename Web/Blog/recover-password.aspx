﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recover-password.aspx.cs" Inherits="MicNets.Web.Blog.RecoverPassword" title="Password Recovery Registered Member Only" MasterPageFile="~/Blog/Blog.Master" meta:resourcekey="PageResource1" %>
<%@ Register Src="../Controls/ctlRecoverPassword.ascx" TagName="ctlRecoverPassword"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
    <legend>
        <h1 Class="title"><asp:Localize runat="server" meta:resourcekey="LocalizeResource1" 
                Text="Password Recovery"></asp:Localize></h1>
    </legend>
      <div class="row" align=right>
        <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/RequiredField2.jpg" 
              Height="15px" Width="15px" meta:resourcekey="Image3Resource1" />&nbsp;<asp:Localize 
              runat="server" meta:resourcekey="LocalizeResource2" Text="Mandatory Field"></asp:Localize>
    </div>
    <div class="content">
        <uc1:ctlRecoverPassword ID="CtlRecoverPassword1" runat="server" />
    </div>
    
</fieldset>
    
</asp:Content>
