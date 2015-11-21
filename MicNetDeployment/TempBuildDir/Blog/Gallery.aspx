<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="MicNets.Web.Blog.Gallery" title="Michael's Photo Gallery Family Son Wife Fun" meta:resourcekey="PageResource1" MasterPageFile="~/Blog/Blog.Master" %>
<%@ Register Src="../Controls/ctlGallery.ascx" TagName="ctlGallery" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
    <legend>
        <h1 Class="title"><asp:Localize runat="server" meta:resourcekey="LocalizeResource1" 
                Text="Photo Gallery"></asp:Localize></h1> 
    </legend>
      <div class="row">
          <uc1:ctlGallery ID="CtlGallery1" runat="server" />
      </div>
</fieldset>
</asp:Content>
