<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlEmailer.ascx.cs" Inherits="MicNets.Web.Controls.ctlEmailer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<br />
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div style="text-align:right"><asp:Image ID="Image3" runat="server" 
        ImageUrl="~/Image/RequiredField2.jpg" Height="15px" Width="15px" 
        meta:resourcekey="Image3Resource1" />&nbsp;<asp:Localize runat=server 
        meta:resourcekey="LocalizeResource1" Text="Mandatory Field"></asp:Localize></div>
<table cellpadding="5" cellspacing="5">
   	  <tr>
        <td >
            <asp:Label ID="Label2" runat="server" AssociatedControlID="txtFrom" 
                Text="From:" meta:resourcekey="Label2Resource1"></asp:Label>
          </td>
        <td><asp:Image ID="Image1" runat="server" ImageUrl="~/Image/RequiredField2.jpg" 
                Height="15px" Width="15px" meta:resourcekey="Image1Resource1" />
        &nbsp;
            <asp:TextBox ID="txtFrom" runat="server" Width="300px" TabIndex="2" SkinID="na
                meta:resourcekey="txtFromResource1" ToolTip="Enter sender email here"></asp:TextBox>
            <asp:RequiredFieldValidator ID="vldrFrom" runat="server" ControlToValidate="txtFrom"
                Display="Dynamic" ErrorMessage="Required" SetFocusOnError="True" 
                ValidationGroup="EmailSend" meta:resourcekey="vldrFromResource1"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="vldeFrom" runat="server" ControlToValidate="txtFrom" 
                Display="Dynamic" ErrorMessage="Invalid Email Format"
                    SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="EmailSend" meta:resourcekey="vldeFromResource1"></asp:RegularExpressionValidator></td>
            <td align=right>
                <asp:Button ID="btnSend" runat="server"  OnClick="btnSend_Click" 
                    Text="Send" TabIndex="12" 
                    ToolTip="Click here to send an email" ValidationGroup="EmailSend" 
                    meta:resourcekey="btnSendResource1" />&nbsp;</td>
    </tr>
     <tr>
        <td >
            <asp:Label ID="Label3" runat="server" AssociatedControlID="txtTo" 
                 Text="To:" meta:resourcekey="Label3Resource1"></asp:Label>
         </td>
         <td><asp:Image ID="Image2" runat="server" ImageUrl="~/Image/RequiredField2.jpg" 
                 Height="15px" Width="15px" meta:resourcekey="Image2Resource1" />
        &nbsp;
            <asp:TextBox ID="txtTo" runat="server" Width="300px" TabIndex="4" SkinID="na
                 meta:resourcekey="txtToResource1" ToolTip="Enter receiver email here"></asp:TextBox>
            <asp:RequiredFieldValidator ID="vldrTo" runat="server" ControlToValidate="txtTo"
                Display="Dynamic" ErrorMessage="Required" SetFocusOnError="True" 
                 ValidationGroup="EmailSend" meta:resourcekey="vldrToResource1"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator
                    ID="vldeTo" runat="server" ControlToValidate="txtTo" Display="Dynamic" ErrorMessage="Invalid Email Format"
                    SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="EmailSend" meta:resourcekey="vldeToResource1"></asp:RegularExpressionValidator></td>
            <td align=right>
                &nbsp;</td>
    </tr>
     <tr>
        <td >
            <asp:Label ID="Label4" runat="server" AssociatedControlID="txtCC" 
                Text="Cc:" meta:resourcekey="Label4Resource1"></asp:Label>
         </td>
        
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtCC" runat="server" Width="300px" TabIndex="6" SkinID="na
                meta:resourcekey="txtCCResource1" 
                ToolTip="Enter Cc email list here, separating each of them by ; "></asp:TextBox>&nbsp;</td>
            <td align=right>
                &nbsp;</td>
    </tr>
    <tr>
        <td  >
            <asp:Label ID="Label5" runat="server" AssociatedControlID="txtSubject" 
                Text="Subject:" meta:resourcekey="Label5Resource1"></asp:Label>
        </td>
         <td><asp:Image ID="Image4" runat="server" ImageUrl="~/Image/RequiredField2.jpg" 
                 Height="15px" Width="15px" meta:resourcekey="Image4Resource1" />
        &nbsp;
            <asp:TextBox ID="txtSubject" runat="server" Width="300px" TabIndex="8" SkinID="na"
                 meta:resourcekey="txtSubjectResource1" ToolTip="Enter email subject here"></asp:TextBox>
            <asp:RequiredFieldValidator ID="vldrSubject" runat="server" ControlToValidate="txtSubject"
                Display="Dynamic" ErrorMessage="Required" SetFocusOnError="True" 
                 ValidationGroup="EmailSend" meta:resourcekey="vldrSubjectResource1"></asp:RequiredFieldValidator></td>
            <td align=right >
                </td>
    </tr>
    <tr valign=top>
        <td colspan=2>
            <cc1:Editor ID="edtBody" runat="server" Width=600 Height=330 />
        </td>
    </tr>
</table> 

<asp:HiddenField ID="hidUrlSource" runat="server" />
