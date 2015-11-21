<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tips.aspx.cs" Inherits="MicNets.Web.Blog.Tips" %>
<%@ Register Src="../Controls/ctlComment.ascx" TagName="ctlComment" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
    <legend>
        <h1 Class="title">ASP.Net C# Tips</h1>
    </legend>
    <div class="row">
        <uc2:ctlComment ID="CtlComment1" runat="server" />
        &nbsp;</div>
</fieldset>
</asp:Content>

