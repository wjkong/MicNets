<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Translator.aspx.cs" Inherits="MicNets.Web.Blog.Translator"  title="Free Universal Translator English Simple Tradional Chinese French" MasterPageFile="~/Blog/Blog.Master" meta:resourcekey="PageResource1" %>
<%@ Register Src="../Controls/ctlTranslator.ascx" TagName="ctlTranslator" TagPrefix="uc2" %>
<%@ Register Src="../Controls/ctlToolBar.ascx" TagName="ctlToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<script type="text/javascript" src="../MicNets.js"></script>

<fieldset>
    <legend>
        <h1 Class="title"><asp:Localize ID="Localize1" runat="server" 
                Text="Language Translator" meta:resourcekey="Localize1Resource1"></asp:Localize></h1>
    </legend>
      <table width=100%>
        <tr>
            <td rowspan=2 valign=top id="printingArea">
                <uc2:ctlTranslator ID="Translator1" runat="server" />
            </td>
            <td valign=top id="FunctionBar" align=right>
                <uc1:ctlToolBar ID="CtlToolBar1" runat="server" />
                <br /> 
                <asp:Image ID="Image3" runat="server" SkinID="RequiredIcon" 
                    meta:resourcekey="Image3Resource1" />&nbsp;<asp:Localize
              ID="Localize2" runat="server" Text="Mandatory Field" 
                    meta:resourcekey="Localize2Resource1"></asp:Localize>
            </td>
        </tr>
      </table>
</fieldset>
</asp:Content>