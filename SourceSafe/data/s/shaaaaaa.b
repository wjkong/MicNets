<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MediaAdmin.aspx.cs" Inherits="MicNets.Web.Blog.Member.Admin.MediaAdmin"  title="Media Admin"%>

<%@ Register Src="../../../Controls/ctlMediaUpload.ascx" TagName="ctlMediaUpload" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
  <fieldset>
        <legend>        
            <asp:Label ID="lblSubTitle" runat="server" Text="Media Admin" CssClass="title"></asp:Label>
        </legend>
      <uc1:ctlMediaUpload ID="CtlMediaUpload1" runat="server" />
</fieldset>  
</asp:Content>
