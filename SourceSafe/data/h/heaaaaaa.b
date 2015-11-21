<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactMe.aspx.cs" Inherits="MicNets.Web.Blog.ContactMe"  title="Contact Me by Email" %>
<%@ Register Src="../Controls/ctlEmailer.ascx" TagName="ctlEmailer" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
      <div class="row">
          <uc1:ctlEmailer ID="CtlEmailer1" runat="server" />
      </div>
</fieldset>    
</asp:Content>
