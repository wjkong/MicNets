<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="weather-forecast.aspx.cs" Inherits="MicNets.Web.Blog.WeatherForecast" title="Free Local Weather Overcase Forecast Alert" MasterPageFile="~/Blog/Blog.Master" meta:resourcekey="PageResource1" %>
<%@ Register Src="../Controls/ctlToolBar.ascx" TagName="ctlToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
    <legend>
        <h1 Class="title">
            <asp:Localize ID="Localize1" runat="server" 
                meta:resourcekey="Localize1Resource1" Text="Local Weather Forecase"></asp:Localize></h1>
    </legend>
      <div class="row" align=right>
            <uc1:ctlToolBar ID="CtlToolBar1" runat="server" />
      </div>
      <div class="row">&nbsp;&nbsp;&nbsp;&nbsp; 
          <asp:Localize ID="Localize2" runat="server" 
              meta:resourcekey="Localize2Resource1" 
              Text="Choose a City to forecast:"></asp:Localize>
          &nbsp;&nbsp;   
          <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" 
              OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" Width=150px 
              ToolTip="Choose a city from the list" meta:resourcekey="ddlCityResource1">
              <asp:ListItem Selected="True" Value="24" meta:resourcekey="ListItemResource1">Mississauga</asp:ListItem>
              <asp:ListItem Value="143" meta:resourcekey="ListItemResource2">Toronto</asp:ListItem>
              <asp:ListItem Value="118" meta:resourcekey="ListItemResource3">Ottawa</asp:ListItem>
              <asp:ListItem Value="137" meta:resourcekey="ListItemResource4">London</asp:ListItem>
              <asp:ListItem Value="59" meta:resourcekey="ListItemResource5">Richmond Hill</asp:ListItem>
          </asp:DropDownList>
          
      </div>
      <div class="row" id="printingArea">
            <asp:DataGrid id="dgArtical" runat="server" ShowHeader="False" 
                AutoGenerateColumns="False" BackColor="White" BorderStyle="Solid" 
                BorderColor="White" CellPadding="5" CellSpacing="5" GridLines="None" 
                OnItemDataBound="dgArtical_ItemDataBound" DataSourceID="dasWeather" 
                EnableViewState="False" meta:resourcekey="dgArticalResource1">
                <AlternatingItemStyle BorderStyle="None" BackColor="#EEEEEE"></AlternatingItemStyle>
                        <ItemStyle BackColor="#F7F7F7" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="11pt" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
                <Columns>
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <asp:image runat="server" ImageUrl='<%# GetImageUrl((string)XPath("title")) %>' 
                                ID="imgCondition" Width=45px Height="45px" EnableViewState="False" 
                                meta:resourcekey="imgConditionResource1" />
                            <asp:HyperLink ID="hypTitle" runat="server" NavigateUrl='<%# XPath("link") %>' 
                                Text='<%# XPath("title") %>' Target="_blank" EnableViewState="False" 
                                meta:resourcekey="hypTitleResource1"></asp:HyperLink><div align="right">
                                <asp:Label ID="lblDatePublished" runat="server" Font-Size="10px" 
                                    ForeColor="#676767" Text='<%# XPath("pubDate") %>' EnableViewState="False" 
                                    meta:resourcekey="lblDatePublishedResource1"></asp:Label></div>
                            <asp:Literal ID="litDescription" runat="server" 
                                Text='<%# XPath("description") %>' EnableViewState="False"></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>
      </div>
</fieldset>
    <asp:XmlDataSource ID="dasWeather" runat="server" XPath="rss/channel/item"></asp:XmlDataSource>
</asp:Content>


