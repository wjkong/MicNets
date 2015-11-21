<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="MicNets.Web.Blog.Album" title="Michael's Photo Gallery" MasterPageFile="~/Blog/Blog.Master" meta:resourcekey="PageResource1"%>
<%@ Register Src="../Controls/ctlAlbum.ascx" TagName="ctlAlbum" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
    <legend>
        <h1 Class="title"><asp:Localize runat="server" meta:resourcekey="LocalizeResource1" 
                Text="Photo Album"></asp:Localize></h1>
    </legend>
     <div class="row">
          <uc1:ctlAlbum ID="CtlAlbum1" runat="server" />
      </div>
</fieldset>
</asp:Content>
