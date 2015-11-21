<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tools.aspx.cs" Inherits="MicNets.Web.Blog.Tools" title="Useful Tools" MasterPageFile="~/Blog/Blog.Master" meta:resourcekey="PageResource1"%>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
    <legend>
        <h1 Class="title">
            <asp:Localize ID="Localize1" runat="server" 
                meta:resourcekey="Localize1Resource1" Text="Tools"></asp:Localize></h1>
    </legend>
    <div style="line-height:2">
        <div class="row">
            <img src="../Image/listItem.jpg" alt="listItem" />&nbsp;<asp:HyperLink 
                ID="HyperLink4" runat="server" NavigateUrl="~/Blog/Currency-Convertor.aspx" 
                meta:resourcekey="HyperLink4Resource1" Text="Currency Convertor"></asp:HyperLink>
        </div>
        <div class="row">
            <img src="../Image/listItem.jpg" alt="listItem"/>&nbsp;<asp:HyperLink 
                ID="HyperLink8" runat="server" 
                NavigateUrl="~/Blog/universal-metric-convertor.aspx" 
                meta:resourcekey="HyperLink8Resource1" Text="Metric Convertor"></asp:HyperLink>
        </div>
        <div class="row">
            <img src="../Image/listItem.jpg" alt="listItem"/>&nbsp;<asp:HyperLink 
                ID="HyperLink1" runat="server" NavigateUrl="~/Blog/Mortgage-Calculator.aspx" 
                meta:resourcekey="HyperLink1Resource1" Text="Mortgage Calculator"></asp:HyperLink>
        </div>
         <div class="row">
            <img src="../Image/listItem.jpg" alt="listItem"/>&nbsp;<asp:HyperLink 
                 ID="HyperLink2" runat="server" NavigateUrl="~/Blog/Translator.aspx" 
                 meta:resourcekey="HyperLink2Resource1" Text="Universal Translator"></asp:HyperLink>
        </div>
         <div class="row">
            <img src="../Image/listItem.jpg" alt="listItem"/>&nbsp;<asp:HyperLink 
                 ID="HyperLink3" runat="server" NavigateUrl="~/Blog/Google-Map.aspx" 
                 meta:resourcekey="HyperLink3Resource1" Text="Google Map"></asp:HyperLink>
        </div>
          <div class="row">
            <img src="../Image/listItem.jpg" alt="listItem"/>&nbsp;<asp:HyperLink 
                  ID="HyperLink6" runat="server" NavigateUrl="~/Blog/Weather-Forecast.aspx" 
                  meta:resourcekey="HyperLink6Resource1" Text="Weather Forecast"></asp:HyperLink>
        </div>
        <div class="row">
            <img src="../Image/listItem.jpg" alt="listItem"/>&nbsp;<asp:HyperLink 
                ID="HyperLink5" runat="server" NavigateUrl="~/Blog/Links.aspx" 
                meta:resourcekey="HyperLink5Resource1" Text="Social Links"></asp:HyperLink>
        </div>
    </div>
</fieldset>
</asp:Content>
