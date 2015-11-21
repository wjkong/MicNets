<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlMediaUpload.ascx.cs" Inherits="MicNets.Web.Controls.ctlMediaUpload" %>
<asp:ScriptManager runat="server" ID="scriptMan">
</asp:ScriptManager>
<table width="100%">
    <tr>
        <td style="text-align:left">
             <asp:RadioButtonList ID="radlMedia" runat="server" AutoPostBack="True" CellPadding="5" CellSpacing="2" OnSelectedIndexChanged="radlMedia_SelectedIndexChanged" RepeatColumns="3" RepeatDirection="Horizontal" TabIndex="2">
                <asp:ListItem Selected="True">Photo</asp:ListItem>
                <asp:ListItem>Video</asp:ListItem>
                <asp:ListItem>Music</asp:ListItem>
           </asp:RadioButtonList>
        </td>
        <td style="text-align:right">
            <asp:Image ID="Image10" runat="server" ImageUrl="~/Image/RequiredField2.jpg" Height="15px" Width="15px" />&nbsp;Mandatory Field
        </td>
    </tr>
</table>

<asp:MultiView ID="mvwMedia" runat="server" ActiveViewIndex=0>
    <asp:View ID="vwPhoto" runat="server">
         <table cellpadding="5" cellspacing="5" border="0">   
            <tr>
                <td align=left>Date Taken:&nbsp;</td>
                <td>
                    <asp:Image ID="Image4" runat="server" Height="15px" ImageUrl="~/Image/RequiredField2.jpg"
                        Width="15px" />&nbsp;
                   <asp:TextBox ID="txtDatePhotoTaken" runat="server" Width="200px" CssClass="TextBox" TabIndex="4"></asp:TextBox>&nbsp;
                    <asp:Image id="imgCalendarPhoto" ImageUrl="~/Image/calendarIcon.jpg" runat=server ToolTip="Click to bring a Calendar" height="15" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDatePhotoTaken"
                        ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="vgpPhoto"></asp:RequiredFieldValidator>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="imgCalendarPhoto" 
                        TargetControlID="txtDatePhotoTaken" FirstDayOfWeek="Sunday">
                    </ajaxToolkit:CalendarExtender>
                    </td>
            </tr>
            <tr><td>
                Thumbnail File Path:&nbsp;
            </td><td>
                <asp:Image ID="Image2" runat="server" Height="15px" ImageUrl="~/Image/RequiredField2.jpg"
                    Width="15px" />&nbsp;
                <asp:FileUpload ID="filThumbnail" runat="server" Width=374px BorderStyle=NotSet CssClass="TextBox" TabIndex="10" />&nbsp; 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDatePhotoTaken"
                    ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="vgpPhoto"></asp:RequiredFieldValidator>
                <asp:Button ID="btnUploadPhoto" runat="server" CssClass="BlueButton" 
                    onmouseout="this.setAttribute('className', 'BlueButton')" onmouseover="this.setAttribute('className', 'RedButton')"
                    Text="Upload" Width="70px" OnClick="btnUploadPhoto_Click" TabIndex="16" ValidationGroup="vgpPhoto" /></td>
            </tr>
           
       </table>
    </asp:View>
    <asp:View ID="vwVideo" runat="server">
         <table cellpadding="5" cellspacing="5" border="0">
             <tr>
                <td style="height: 16px">
                    Location:</td>
                <td style="height: 16px">
                    <asp:Image ID="Image5" runat="server" Height="15px" ImageUrl="~/Image/RequiredField2.jpg"
                        Width="15px" />&nbsp;
                    <asp:TextBox ID="txtVideoLocation" runat="server" Width="200px" CssClass="TextBox" TabIndex="18"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtVideoLocation"
                        ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="vgpVideo"></asp:RequiredFieldValidator></td>
            </tr>
             <tr>
                <td style="height: 16px">
                    Description:</td>
                <td style="height: 16px">
                    <asp:Image ID="Image6" runat="server" Height="15px" ImageUrl="~/Image/RequiredField2.jpg"
                        Width="15px" />&nbsp;
                    <asp:TextBox ID="txtVideoDescription" runat="server" Width="200px" CssClass="TextBox" TabIndex="20"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtVideoDescription"
                        ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="vgpVideo"></asp:RequiredFieldValidator></td>
            </tr>
             <tr>
                <td style="height: 16px">
                    YouTube Code:</td>
                <td style="height: 16px">
                    <asp:Image ID="Image7" runat="server" Height="15px" ImageUrl="~/Image/RequiredField2.jpg"
                        Width="15px" />&nbsp;
                    <asp:TextBox ID="txtVideoYouTubeCode" runat="server" Width="200px" CssClass="TextBox" TabIndex="22"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtVideoYouTubeCode"
                        ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="vgpVideo"></asp:RequiredFieldValidator></td>
            </tr>
            <tr><td align=left>Date Taken:</td>
                <td>
                    <asp:Image ID="Image8" runat="server" Height="15px" ImageUrl="~/Image/RequiredField2.jpg"
                        Width="15px" />&nbsp;
                   <asp:TextBox ID="txtDateTaken" runat="server" Width="200px" CssClass="TextBox" TabIndex="24"></asp:TextBox>&nbsp;
                   <asp:Image id="imgCalendarVideo" ImageUrl="~/Image/calendarIcon.jpg" runat=server ToolTip="Click to bring a Calendar" height="15" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDateTaken"
                        ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="vgpVideo"></asp:RequiredFieldValidator>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgCalendarVideo" 
                        TargetControlID="txtDateTaken" FirstDayOfWeek="Sunday">
                    </ajaxToolkit:CalendarExtender>
                    </td>
            </tr>
            <tr><td>
                File Path:
            </td><td>
                <asp:Image ID="Image9" runat="server" Height="15px" ImageUrl="~/Image/RequiredField2.jpg"
                    Width="15px" />&nbsp;
                <asp:FileUpload ID="filVideo" runat="server" Width=374px BorderStyle=NotSet CssClass="TextBox" TabIndex="28" />&nbsp; 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="filVideo"
                    ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="vgpVideo"></asp:RequiredFieldValidator>
                <asp:Button ID="btnUploadVideo" runat="server" CssClass="BlueButton" 
                    onmouseout="this.setAttribute('className', 'BlueButton')" onmouseover="this.setAttribute('className', 'RedButton')"
                    Text="Upload" Width="70px" OnClick="btnUploadVideo_Click" TabIndex="30" ValidationGroup="vgpVideo" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.youtube.com/my_videos_upload" Target="_blank" TabIndex="32">Upload Video to YouTube</asp:HyperLink></td>
            </tr>
       </table>
    </asp:View>
    <asp:View ID="vwMusic" runat="server">
    </asp:View>
</asp:MultiView>
   

