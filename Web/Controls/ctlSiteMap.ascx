<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlSiteMap.ascx.cs" Inherits="MicNets.Web.Controls.ctlSiteMap" %>
<%@ Register Src="ctlToolBar.ascx" TagName="ctlToolBar" TagPrefix="uc1" %>
<fieldset>
    <legend>
        <h1 Class="title">
            <asp:Localize ID="Localize1" runat="server" 
                meta:resourcekey="Localize1Resource1" Text="Site Map"></asp:Localize></h1>
    </legend>
    <div style="line-height:1.5">
         <div class="row" align=right runat=server id="FunctionBar">
            <uc1:ctlToolBar ID="CtlToolBar1" runat="server" />
        </div>
        <div class="row" id="printingArea">
             <asp:DataList ID="dlSiteMap" runat="server" CellPadding="8" OnItemDataBound="dlSiteMap_ItemDataBound"
                RepeatColumns="3" RepeatDirection="Horizontal" CssClass="SiteMap" 
                 EnableViewState="False" meta:resourcekey="dlSiteMapResource1">
                <ItemTemplate>
                    <asp:TreeView ID="tvLink" runat="server" EnableViewState="False" 
                        meta:resourcekey="tvLinkResource1">
                    </asp:TreeView>
                </ItemTemplate>
                <ItemStyle VerticalAlign="Top" Width="200px" />
            </asp:DataList>
        </div>
    </div>
</fieldset>

