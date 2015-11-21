<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAddressBook.aspx.cs" Inherits="MicNets.Web.Blog.Member.MyAddressBook" title="My Contact Address Book"%>
<%@ Register Src="../../Controls/ctlAddressBook.ascx" TagName="ctlAddressBook" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
     <fieldset>
        <legend>        
            <asp:Label ID="lblSubTitle" runat="server" Text="My Address Book" CssClass="title"></asp:Label>
        </legend>
        <div class="content">
            <uc1:ctlAddressBook ID="CtlAddressBook1" runat="server" />
        </div>
    </fieldset>  
</asp:Content>