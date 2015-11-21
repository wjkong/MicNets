<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlGallery.ascx.cs" Inherits="MicNets.Web.Controls.ctlGallery" %>
<table cellpadding="0" cellspacing="0" border=0 width=100%>
      <tr style="padding-bottom:2px">
        <td align=left valign=top>
            <span style="padding-right:100px"><asp:Label ID="lblDatePicTaken" 
                runat="server" Font-Size="10pt" ToolTip="The date of picture taken" 
                EnableViewState="False" meta:resourcekey="lblDatePicTakenResource1">Picture 
            taken on: </asp:Label></span>
             <asp:ImageButton ID="btnRestore" runat="server" OnClick="btnRestore_Click" CausesValidation="False" ImageUrl="~/Image/NavigationBar/m_index.gif" ToolTip="Return to Gallery View"   EnableViewState="False" 
                meta:resourcekey="btnRestoreResource1"/>&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:ImageButton ID="btnFirst" runat="server" OnClick="btnFirst_Click" CausesValidation="False" ToolTip="First Page" EnableViewState="False"
                meta:resourcekey="btnFirstResource1" ImageUrl="~/Image/NavigationBar/m_first.gif"/>&nbsp;&nbsp;
            <asp:ImageButton ID="btnPrev" runat="server"  
                OnClick="btnPrev_Click" CausesValidation="False" 
                  Text="3"   
                ToolTip="Previous Page" EnableViewState="False" 
                meta:resourcekey="btnPrevResource1"  
                ImageUrl="~/Image/NavigationBar/m_prev.gif"/>&nbsp;&nbsp;
            <asp:ImageButton ID="btnNext" runat="server"  OnClick="btnNext_Click" CausesValidation="False" ToolTip="Next Page" 
                EnableViewState="False" meta:resourcekey="btnNextResource1" 
                 ImageUrl="~/Image/NavigationBar/m_next.gif"/>&nbsp;&nbsp;
            <asp:ImageButton ID="btnLast" runat="server"  
                OnClick="btnLast_Click" CausesValidation="False" 
                   
                ToolTip="Last Page" EnableViewState="False" 
                meta:resourcekey="btnLastResource1" PostBackUrl="NavigateButton" 
                 ImageUrl="~/Image/NavigationBar/m_last.gif"/> &nbsp; &nbsp;    
            <asp:Label ID="lblPageIndex" runat="server" Font-Size="10pt" ForeColor="Red" 
                ToolTip="Page index" EnableViewState="False" 
                meta:resourcekey="lblPageIndexResource1"></asp:Label>
            <span style="padding-left:100px"><asp:Label ID="lblAge" runat="server" 
                Font-Size="10pt" EnableViewState="False" meta:resourcekey="lblAgeResource1"></asp:Label></span>
        </td>
    </tr>
    <tr>
	    <td align=left>
            <asp:ScriptManager runat="server" id="kk">
            </asp:ScriptManager>
            <asp:UpdatePanel runat="server" id=pnlImage>
                <contenttemplate>
<ajaxToolkit:RoundedCornersExtender id="RoundedCornersExtender1" runat="server" Radius="20" 
                        TargetControlID="Panel1" Enabled="True"></ajaxToolkit:RoundedCornersExtender>&nbsp; 
                    <asp:Panel id="Panel1" runat="server" Width="880px" BackColor="Silver" 
                        HorizontalAlign="Center" meta:resourcekey="Panel1Resource1">
                        <asp:Image id="imgPhoto" runat="server" EnableViewState="False" 
                            meta:resourcekey="imgPhotoResource1"></asp:Image></asp:Panel> 
</contenttemplate>
            </asp:UpdatePanel>&nbsp;
         
            </td>
	</tr>
  <tr >
        <td align=left style="height: 30px">
            <span style="padding-right:100px"><asp:Label ID="lblDatePicTaken2" 
                runat="server" Font-Size="10pt" ToolTip="The date of picture taken" 
                EnableViewState="False" meta:resourcekey="lblDatePicTaken2Resource1"></asp:Label></span>
                  <asp:ImageButton ID="btnRestore2" runat="server" OnClick="btnRestore_Click" CausesValidation="False" ImageUrl="~/Image/NavigationBar/m_index.gif" ToolTip="Return to Gallery View"   EnableViewState="False" 
                meta:resourcekey="btnRestoreResource1"/>&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:ImageButton ID="btnFirst2" runat="server"  
                OnClick="btnFirst_Click" CausesValidation="False" 
               
                ToolTip="First Page" EnableViewState="False" 
                meta:resourcekey="btnFirst2Resource1"  
                ImageUrl="~/Image/NavigationBar/m_first.gif"/>&nbsp;&nbsp;
            <asp:ImageButton ID="btnPre2" runat="server"  
                OnClick="btnPrev_Click" CausesValidation="False" 
                                ToolTip="Previous Page" EnableViewState="False" 
                meta:resourcekey="btnPre2Resource1"  
                ImageUrl="~/Image/NavigationBar/m_prev.gif"/>&nbsp;&nbsp;
            <asp:ImageButton ID="btnNext2" runat="server"  
                OnClick="btnNext_Click" CausesValidation="False" 
                 ToolTip="Next Page" 
                EnableViewState="False" meta:resourcekey="btnNext2Resource1" 
                 ImageUrl="~/Image/NavigationBar/m_next.gif"/>&nbsp;&nbsp;
            <asp:ImageButton ID="btnLast2" runat="server"  
                OnClick="btnLast_Click" CausesValidation="False" 
                  
                ToolTip="Last Page" EnableViewState="False" 
                meta:resourcekey="btnLast2Resource1"  
                ImageUrl="~/Image/NavigationBar/m_last.gif"/> &nbsp; &nbsp;  
            <asp:Label ID="lblPageIndex2" runat="server" Font-Size="10pt" ForeColor="Red" 
                ToolTip="Page index" EnableViewState="False" 
                meta:resourcekey="lblPageIndex2Resource1"></asp:Label><span style="padding-left:100px">
            <asp:Label ID="lblAge2" runat="server" Font-Size="10pt" EnableViewState="False" 
                meta:resourcekey="lblAge2Resource1"></asp:Label></span>
         </td>
    </tr>
</table>
   <asp:HiddenField ID="hidPageIndex" runat="server" />
    <asp:HiddenField ID="hidMaxPageIndex" runat="server" />

