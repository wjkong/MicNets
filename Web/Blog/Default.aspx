<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MicNets.Web.Blog.Default" title="Home Page ASPNET C# SQL Server JavaScript" meta:resourcekey="PageResource1" MasterPageFile="~/Blog/Blog.Master" %>
<%@ Register Src="../Controls/ctlLogin.ascx" TagName="ctlLogin" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<table style="width:100%; height:100%">
    <tr>
        <td>
            <table>
                <tr>
                    <td>
                          <fieldset>
                            <legend>
                                <asp:Label ID="lblLogin" runat="server" Text="Member Login" CssClass="legend" 
                                    ToolTip="Member user login section" meta:resourcekey="lblLoginResource1"></asp:Label>  
                            </legend>
                            <uc2:ctlLogin ID="CtlLogin1" runat="server" />
                    
                        </fieldset>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <fieldset>
                            <legend>
                                <asp:Label ID="Label1" runat="server" Text="Search My Blog" CssClass="legend" 
                                    ToolTip="Search articles or tips inside my blog " 
                                    meta:resourcekey="Label1Resource1"></asp:Label>   
                            </legend>
                            <div class="row">
                                 <asp:TextBox ID="txtQuery" runat="server" ValidationGroup="Search" 
                                     Width="174px" meta:resourcekey="txtQueryResource1"></asp:TextBox>
                            </div>
                            <div class="row" style="text-align:right">
                                <asp:RequiredFieldValidator ID="vldSearch" runat="server" ControlToValidate="txtQuery"
                                ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="vgpSearch" 
                                    meta:resourcekey="vldSearchResource1"></asp:RequiredFieldValidator>
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" 
                                    Text="Search" ValidationGroup="vgpSearch" 
                                    ToolTip="Click here to search in my blog" 
                                    meta:resourcekey="btnSearchResource1" />&nbsp;&nbsp;&nbsp;
                            </div>
                        </fieldset>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Calendar ID="calHome" runat="server" ToolTip="My Canlendar" BackColor="White" 
                                BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                                Width="200px" meta:resourcekey="calHomeResource1">
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    
                    <td style="height:100%">
                        &nbsp;
                    </td>
                    
                </tr>
            </table>
        </td> 
   
           <td>
             <asp:ScriptManager runat="server" id="jjj">
                </asp:ScriptManager>
                <asp:UpdatePanel runat="server" id="hhh">
                    <contenttemplate>
                        <ajaxToolkit:TabContainer id="TabContainer1" runat="server" OnActiveTabChanged="TabContainer1_ActiveTabChanged" ActiveTabIndex="0">
                            <ajaxToolkit:TabPanel ID="TabMyArtical" HeaderText="My .NET Artical" runat="server">
                                <ContentTemplate>
                                      <asp:DataGrid id="dgMyArtical" runat="server" ShowHeader="False" AutoGenerateColumns="False" BackColor="White" BorderStyle="Solid" BorderColor="White" PageSize="8" CellPadding="5" CellSpacing="5" GridLines="None" AllowPaging="True" OnItemDataBound="dgMyArtical_ItemDataBound" OnPageIndexChanged="dgMyArtical_PageIndexChanged">
                                        <AlternatingItemStyle BorderStyle="None" BackColor="#EEEEEE"></AlternatingItemStyle>
				                                <ItemStyle BackColor="#F7F7F7"></ItemStyle>
                                        <PagerStyle Mode="NumericPages"  />
                                        <Columns>
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNum" runat="server" ForeColor="Red"></asp:Label>
                                                    <asp:HyperLink ID="hypTitle" runat="server" NavigateUrl='<%# Eval("pageName") %>' Text='<%# Eval("title") %>' CssClass="topicTitle"></asp:HyperLink><div align="right"><asp:Label ID="lblDatePublished" runat="server" Font-Size="10px" ForeColor="#676767" Text='<%# Eval("timeUpdated") %>'></asp:Label></div>
                                                    <asp:Literal ID="litDescription" runat="server" Text='<%# Eval("description") %>'></asp:Literal>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                </ContentTemplate>                       
                            </ajaxToolkit:TabPanel>
                          
                        </ajaxToolkit:TabContainer> 
                    </contenttemplate>
                </asp:UpdatePanel>
        </td>
    </tr>
</table>
</asp:Content>

