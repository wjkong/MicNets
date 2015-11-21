<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlAlbum.ascx.cs" Inherits="MicNets.Web.Controls.ctlAlbum" %>
<table cellpadding="0" cellspacing="0" border=0 width=970px>
     <tr style="padding-bottom:5px" >
        <td align=center>
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
         <asp:Label ID="lblPageIndex" runat="server" Font-Size="12px" ForeColor=Red 
                EnableViewState="False" meta:resourcekey="lblPageIndexResource1"></asp:Label></td>
    </tr>
	<tr>
	    <td>
             <asp:DataList ID="dlPhoto" runat="server" BorderColor="White" RepeatColumns="3" 
                 RepeatDirection="Horizontal" Width="815px" DataKeyField="rankID" 
                 meta:resourcekey="dlPhotoResource1">
                <ItemTemplate>
                    <asp:ImageButton ID="btnPhoto" runat="server" EnableViewState="False" 
                        ImageUrl='<%# Eval("photoName") %>' OnClick=btnPhoto_Click 
                        meta:resourcekey="btnPhotoResource1"  />
                    <br />
                    <asp:Localize ID="Localize1" runat="server" 
                        meta:resourcekey="Localize1Resource1" Text="Date:"></asp:Localize>
                     <asp:Label ID="lblTimeTaken" runat="server" EnableViewState="False" 
                        Text='<%# Eval("timeTaken") %>' meta:resourcekey="lblTimeTakenResource1"></asp:Label>
                    &nbsp;
                    <asp:Localize ID="Localize2" runat="server" 
                        meta:resourcekey="Localize2Resource1" Text="Age:"></asp:Localize> <asp:Label ID="lblYear" runat="server" EnableViewState="False" 
                        Text='<%# Eval("year") %>' meta:resourcekey="lblYearResource1"></asp:Label> yr. 
                    <asp:Label ID="lblMonth" runat="server" EnableViewState="False" 
                        Text='<%# Eval("month") %>' meta:resourcekey="lblMonthResource1"></asp:Label> mon.
                    <br /><br />
                </ItemTemplate>
                <ItemStyle HorizontalAlign =Center VerticalAlign=Top />
            </asp:DataList>
  
        </td>
        <td rowspan="3" style="padding-left:5px" valign="top">
       
        </td>
	</tr>
    <tr >
        <td align=center>
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
         <asp:Label ID="lblPageIndex2" runat="server" Font-Size="12px" ForeColor=Red 
                EnableViewState="False" meta:resourcekey="lblPageIndex2Resource1"></asp:Label></td>
    </tr>
</table>    
    <asp:HiddenField ID="hidPageIndex" runat="server" />
    <asp:HiddenField ID="hidMaxPageIndex" runat="server" />

