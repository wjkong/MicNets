<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlToolBar.ascx.cs" Inherits="MicNets.Web.Controls.ctlToolBar"  %>
<script type="text/javascript">
    function BookmarkPage()
    {
        if (window.sidebar) // Mozilla Firefox Bookmark
        { 
            window.sidebar.addPanel(document.title, location.href, "");
        }    
        else if (window.external)  // IE Favorite
        {
            window.external.AddFavorite(location.href, document.title);
        }
        else if (window.opera && window.print) // Opera Hotlist
        { 
            return true;
        }
    }
        
    function OpenPrintVersion()
    {
        window.print();
//		if (document.getElementById("printingArea"))
//		{
//		    var pp = window.open("","","location=0, scrollbars=1, width=750");
//		    pp.document.writeln('<HTML><HEAD><title>Print Preview</title></HEAD>')
//		    pp.document.writeln('<body MS_POSITIONING="GridLayout" bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" style="font-family: Arial; color: #333333; font-size:10px">');
//		    pp.document.writeln('<div style="text-align:right"><INPUT ID="CLOSE" type="button" value="Close" onclick="window.close();">&nbsp;&nbsp;');
//		    pp.document.writeln('<INPUT ID="PRINT" type="button" value=" Print " onclick="javascript:location.reload(true);window.print();">&nbsp;&nbsp;</div>');
//		    pp.document.writeln(document.getElementById("printingArea").innerHTML);
//		    pp.document.writeln('</body></HTML>');
//		    
//		    /*
//		    setInterval("closePopup()", 1000); 

//            */
//		}
    }
</script>
<div id="printExclusive">
   <asp:Image ID="imgPrint" runat="server" ImageUrl="~/Image/print_icon.gif" 
        BorderWidth=0px Height=15px meta:resourcekey="imgPrintResource1" />&nbsp;
     <asp:LinkButton ID="btnPrint" runat="server" 
        OnClientClick="javascript:OpenPrintVersion();return false;" Text="Print" 
        ToolTip="Click here for a printing version" CssClass="noUnderLine" 
        meta:resourcekey="btnPrintResource1"></asp:LinkButton>
&nbsp;&nbsp;&nbsp;
 <asp:Image ID="imgFavorite" runat="server" ImageUrl="~/Image/favorite.jpg" 
        BorderWidth=0px Height=15px meta:resourcekey="imgFavoriteResource1" />&nbsp;
     <asp:LinkButton ID="btnFavorite" runat="server" 
        OnClientClick="javascript:BookmarkPage();return false;" Text="Bookmark" 
        ToolTip="Click here to add this page into your favorite" CssClass="noUnderLine" 
        meta:resourcekey="btnFavoriteResource1"></asp:LinkButton>
&nbsp;&nbsp;&nbsp;
 <asp:Image ID="imgEmail" runat="server" ImageUrl="~/Image/email_icon.gif" 
        BorderWidth=0px Height=15px meta:resourcekey="imgEmailResource1" />&nbsp;
<asp:HyperLink ID="hypEmail" runat="server" CssClass="noUnderLine" 
        ToolTip="Click here to send me an email" 
        meta:resourcekey="hypEmailResource1" Text="Email"></asp:HyperLink>&nbsp;&nbsp;&nbsp;
         <asp:Image ID="imgRSS" runat="server" ImageUrl="~/Image/rss_button.gif" 
        BorderWidth=0px Height=15px meta:resourcekey="imgRSSResource1" />&nbsp;
<asp:HyperLink ID="hypRSS" runat="server" Target="_blank" CssClass="noUnderLine" 
        ToolTip="Click here to access RSS seed" meta:resourcekey="hypRSSResource1" 
        Text="RSS"></asp:HyperLink>&nbsp;
</div>
