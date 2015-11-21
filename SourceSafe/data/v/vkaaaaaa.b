<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlVideoClips.ascx.cs" Inherits="MicNets.Web.Controls.ctlVideoClips" %>
<%@ Register Src="ctlVideoViewer.ascx" TagName="ctlVideoViewer" TagPrefix="uc1" %>
  <table cellpadding=5 cellspacing=5>
       <tr>
            <td valign=top width=430px>
                &nbsp;<uc1:ctlVideoViewer ID="VideoViewer1" runat="server" />
            </td>
            <td valign=top>
                <asp:GridView ID="gvVideoList" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="youTubeID" CellPadding="5" CellSpacing="1" Width="100%" 
                    AllowPaging="True" OnPageIndexChanging="gvVideoList_PageIndexChanging"  
                    OnRowDataBound="gvVideoList_RowDataBound" PageSize="6">
                    
                    <AlternatingRowStyle BorderStyle="None" BackColor="#EEEEEE"></AlternatingRowStyle>
									<RowStyle BackColor="#F7F7F7"></RowStyle>
									<HeaderStyle Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BorderStyle="None"
										BackColor="#00498F"></HeaderStyle>
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="btniThumbnail" OnClick="btnPlay_Click" ToolTip="Click to Play this video"  runat="server" EnableViewState="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Time Taken" DataField="timeTaken" />
                        <asp:BoundField HeaderText="Location" DataField="locationTaken" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnPlay" runat="server" Font-Names="Webdings"
                Font-Size="12pt"  Width=50px Text="4" ToolTip="Play Video" OnClick="btnPlay_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="videoID" Visible="False" />
                        
                       
                    
                    </Columns>
                    <PagerStyle CssClass="Pager" />
                </asp:GridView>
            </td>
        </tr>
    </table>
