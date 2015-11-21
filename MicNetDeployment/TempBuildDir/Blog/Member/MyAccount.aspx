<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="MicNets.Web.Blog.Member.MyAccount" title="My Account"%>

<%@ Register Src="../../Controls/ctlMyAccount.ascx" TagName="ctlMyAccount" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
   <fieldset>
        <legend>        
            <asp:Label ID="lblSubTitle" runat="server" Text="My Account" CssClass="title"></asp:Label>
        </legend>
          <div class="row" align=right>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/RequiredField2.jpg" Height="15px" Width="15px" />&nbsp;Mandatory Field
           </div>
        <div class="content">
            <uc1:ctlMyAccount ID="CtlMyAccount1" runat="server" />
        </div>
    </fieldset>  
</asp:Content>