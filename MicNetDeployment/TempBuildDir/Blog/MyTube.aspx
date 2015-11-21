<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyTube.aspx.cs" Inherits="MicNets.Web.Blog.MyTube" title="Michael Video Family Son Fun" MasterPageFile="~/Blog/Blog.Master" meta:resourcekey="PageResource1" %>

<%@ Register Src="../Controls/ctlVideoClips.ascx" TagName="ctlVideoClips" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
    <legend>
        <h1 Class="title"><asp:Localize runat="server" meta:resourcekey="LocalizeResource1" 
                Text="Michael's Fun Video"></asp:Localize></h1>
    </legend>
    <div class="row">
        <uc1:ctlVideoClips ID="CtlVideoClips1" runat="server" />
    </div>
</fieldset>
</asp:Content>