<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="google-map.aspx.cs" Inherits="MicNets.Web.Blog.GoogleMap" title="Google Map Search Figure out Your Location" MasterPageFile="~/Blog/Blog.Master" Theme="Blog" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>
<%@ Register Src="../Controls/ctlToolBar.ascx" TagName="ctlToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    <Services>
        <asp:ServiceReference Path="~/WebService/AjaxWS.asmx" />
    </Services>
</asp:ScriptManager>
<script type="text/javascript" language="javascript">
    function GetProvinceByCountry()
    {
        var prefix = "ctl00_content_";
        
        var countryID = document.getElementById(prefix + "ddlCountry");
     
        MicNets.Web.WebService.AjaxWS.GetProvinces(countryID.value, SucceededCallback);
    }
    
    function SucceededCallback(result)
    {
        var prefix = "ctl00_content_";
        
        var provinceList = document.getElementById(prefix + "ddlProvince");

         // *** Clear the list first
        for (x = provinceList.options.length-1; x > -1; x--) 
        {
            provinceList.remove(0);
        }
        
         var arrProvince = result.split(';');
        
         for (i = 0; i < arrProvince.length; i++)
         {
            var province = arrProvince[i].split(',');
            var option = document.createElement("option");
            option.value = province[0];
            option.text = province[1];
            
            if (window.navigator.appName.toLowerCase().indexOf("microsoft") > -1) 
                provinceList.add(option);  
            else
                provinceList.add(option, null);          
         }
    }
</script>
<fieldset>
    <legend>
        <h1 Class="title"><asp:Localize ID="Localize1" runat="server" 
                meta:resourcekey="Localize1Resource1" Text="Google Map"></asp:Localize></h1> 
    </legend>
        <div class="row" >
            <div style="float:left; width:600; padding-right:20px" id="printingArea">
                <cc1:GMap ID="ctlGoogleMap" runat="server" Height="450px" Width="600px" 
                    GZoom="14" EnableViewState="False" enableContinuousZoom="True" 
                    enableDoubleClickZoom="True" enableDragging="True" 
                    enableGKeyboardHandler="False" enableGoogleBar="False" 
                    enableGTrafficOverlay="False" enableHookMouseWheelToZoom="False" 
                    enableScrollWheelZoom="False" enableServerEvents="False" GMap_Height="450" 
                    GMap_Width="600" mapType="Normal" meta:resourcekey="ctlGoogleMapResource1" 
                    Version="2.x" />
            </div>
            <div style="float:left;">
                 <div class="row" align="right" runat="server" id="FunctionBar">
                        <uc1:ctlToolBar ID="CtlToolBar1" runat="server" />
                  </div>
                  <br />
                <fieldset style="padding:10px">
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearchByKeyword" 
                        meta:resourcekey="Panel1Resource1">
                        <table cellpadding=5 cellspacing=5>
                            <tr>
                                <td><asp:Label ID="lblKeyword" runat="server" Text="Street:" 
                                     AssociatedControlID="txtKeyword" meta:resourcekey="lblKeywordResource1"></asp:Label>
                                </td>
                                <td> <asp:TextBox ID="txtKeyword" runat="server"
                                    ToolTip="Enter the full street name here" 
                                    meta:resourcekey="txtKeywordResource1"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td><asp:Label ID="lblCity" runat="server" Text="City:" AssociatedControlID="txtCity" 
                                   meta:resourcekey="lblCityResource1"></asp:Label>
                                </td>
                                <td> <asp:TextBox ID="txtCity" runat="server" 
                                    ToolTip="Enter the city here" meta:resourcekey="txtCityResource1"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td><asp:Label ID="lblProvince" runat="server" Text="Prov/State:" 
                                     AssociatedControlID="ddlProvince" meta:resourcekey="lblProvinceResource1"></asp:Label>
                                </td>
                                <td><asp:DropDownList ID="ddlProvince" runat="server" 
                                    ToolTip="Select a province or state from the list" 
                                    meta:resourcekey="ddlProvinceResource1">
                                </asp:DropDownList>
                                </td>
                            </tr>
                             <tr>
                                <td> <asp:Label ID="lblCountry" runat="server" Text="Country:" 
                                     AssociatedControlID="ddlCountry" meta:resourcekey="lblCountryResource1"></asp:Label>
                                </td>
                                <td><asp:DropDownList ID="ddlCountry" runat="server" ToolTip="Select a country from the list" 
                                      meta:resourcekey="ddlCountryResource1" onchange="javascript:GetProvinceByCountry()">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                             <tr>
                                <td colspan=2 style="text-align:right"> <asp:Button ID="btnSearchByKeyword" 
                                        runat="server" Text=" Search " 
                                   
                                    ToolTip="Click here to search the address" 
                                    meta:resourcekey="btnSearchByKeywordResource1" 
                                        onclick="btnSearchByKeyword_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </fieldset>
            </div>
      </div>
   
</fieldset>
</asp:Content>
