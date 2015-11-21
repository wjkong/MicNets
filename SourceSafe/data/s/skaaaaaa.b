<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlTranslator.ascx.cs" Inherits="MicNets.Web.Controls.ctlTranslator" %>
<%@ Register Assembly="MicNets.TextArea" Namespace="MicNets.Controls" TagPrefix="Mic" %>
<script language="javascript" type="text/javascript">
    function GetTranslatedText()
    {
        var prefix = "ctl00_content_Translator1_";
        
        var sourceText = document.getElementById(prefix + "txtSource");
        var sourceLang = document.getElementById(prefix + "ddlLangSource");
        var transLang = document.getElementById(prefix + "ddlLangTrans");

        MicNets.Web.WebService.AjaxWS.GetTranslatedText(sourceText.value, sourceLang.value, transLang.value, SucceededCallback);
    }
    
    function SucceededCallback(result)
    {
        var prefix = "ctl00_content_Translator1_";
        
        var transText = document.getElementById(prefix + "txtTrans");

        transText.innerHTML = result;
    }
</script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
    <Services>
        <asp:ServiceReference Path="~/WebService/AjaxWS.asmx" />
    </Services>
</asp:ScriptManager>
    <asp:UpdateProgress id="UpdateProgress1" runat="server">
        <progresstemplate>
            <asp:Image id="imgLoading" runat="server" ImageUrl="~/Image/loading.gif" 
                meta:resourcekey="Image1Resource1"></asp:Image>
        </progresstemplate>
    </asp:UpdateProgress>

<div class="row">
    <asp:Localize runat=server Text="Translate From" 
        meta:resourcekey="LocalizeResource3"></asp:Localize>
    <asp:DropDownList id="ddlLangSource" runat="server" 
        ToolTip="Select a source language from the list" 
        meta:resourcekey="ddlLangSourceResource1">
        <asp:ListItem Selected="True" 
            Value="en" meta:resourcekey="ListItemResource1" Text="English"></asp:ListItem>
        <asp:ListItem Value="fr" meta:resourcekey="ListItemResource2" Text="French"></asp:ListItem>
        <asp:ListItem Value="zh-CN" meta:resourcekey="ListItemResource3" 
            Text="Simplified Chinese"></asp:ListItem>
        <asp:ListItem Value="zh-TW" meta:resourcekey="ListItemResource4" 
            Text="Traditional Chinese"></asp:ListItem>
        <asp:ListItem Value="de" meta:resourcekey="ListItemResource5" Text="Demark"></asp:ListItem>
        <asp:ListItem Value="pl" meta:resourcekey="ListItemResource6" Text="Portuguee"></asp:ListItem>
        <asp:ListItem Value="es" meta:resourcekey="ListItemResource7" Text="Spanish"></asp:ListItem>
        <asp:ListItem Value="ar" meta:resourcekey="ListItemResource8" Text="Arabic"></asp:ListItem>
        <asp:ListItem Value="ja" meta:resourcekey="ListItemResource9" Text="Janpanese"></asp:ListItem>
        <asp:ListItem Value="ko" meta:resourcekey="ListItemResource10" Text="Korean"></asp:ListItem>
    </asp:DropDownList>&nbsp;
    <asp:Localize ID="Localize1" runat=server Text="To" 
        meta:resourcekey="Localize1Resource1"></asp:Localize>&nbsp;
    <asp:DropDownList id="ddlLangTrans" runat="server" 
        ToolTip="Select a destination language from the list" 
        meta:resourcekey="ddlLangTransResource1">
        <asp:ListItem Value="en" 
            meta:resourcekey="ListItemResource11" Text="English"></asp:ListItem>
        <asp:ListItem Value="fr" meta:resourcekey="ListItemResource12" Text="French"></asp:ListItem>
        <asp:ListItem Selected="True" Value="zh-CN" 
            meta:resourcekey="ListItemResource13" Text="Simplified Chinese"></asp:ListItem>
        <asp:ListItem Value="zh-TW" meta:resourcekey="ListItemResource14" 
            Text="Traditional Chinese"></asp:ListItem>
        <asp:ListItem Value="de" meta:resourcekey="ListItemResource15" Text="Demark"></asp:ListItem>
        <asp:ListItem Value="pl" meta:resourcekey="ListItemResource16" Text="Portuguee"></asp:ListItem>
        <asp:ListItem Value="es" meta:resourcekey="ListItemResource17" Text="Spanish"></asp:ListItem>
        <asp:ListItem Value="ar" meta:resourcekey="ListItemResource18" Text="Arabic"></asp:ListItem>
        <asp:ListItem Value="ja" meta:resourcekey="ListItemResource19" Text="Janpanese"></asp:ListItem>
        <asp:ListItem Value="ko" meta:resourcekey="ListItemResource20" Text="Korean"></asp:ListItem>
     </asp:DropDownList>
     &nbsp;
     <asp:Button id="btnTranslate" runat="server" 
        Text="Translate" ToolTip="Translate now" OnClientClick="javascript:GetTranslatedText(); return false;" 
        meta:resourcekey="btnTranslateResource1"></asp:Button>
   
</div>
<br />
<div class="row"><asp:Image id="imgSourceLang" runat="server" SkinID="RequiredIcon" 
        meta:resourcekey="Image4Resource1"></asp:Image>
    <asp:Localize runat=server Text="Maximum 500 characters" 
        meta:resourcekey="LocalizeResource1"></asp:Localize> 
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSource"
        Display="Dynamic" ErrorMessage="Required" SetFocusOnError="True" 
        meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator> 
</div>
<div class="row">
    <br />
    <Mic:TextArea ID="txtSource" runat="server" Font-Names="Arial" Font-Size="10pt" Height="180px"
        MaxLength="500" ToolTip="Enter the language from here" Width="600px" 
        EnableViewState="False" meta:resourcekey="txtSourceResource1" 
        TextMode="MultiLine"></Mic:TextArea><br />
    </div>
<br />
<div class="row">
<asp:Localize runat=server Text="Translated Text:" 
        meta:resourcekey="LocalizeResource2"></asp:Localize>

</div>
<div class="row">
    <asp:TextBox id="txtTrans" runat="server" Width="600px" SkinID="dd" 
        Height="180px" TextMode="MultiLine" ReadOnly="True" Font-Names="Arial" 
        Font-Size="10pt" ToolTip="Display the translated language" 
        EnableViewState="False" meta:resourcekey="txtTransResource1" 
        BackColor="#CCCCFF"></asp:TextBox>
</div>




