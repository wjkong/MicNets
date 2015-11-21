<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlTopicHeader.ascx.cs" Inherits="MicNets.Web.Controls.ctlTopicHeader" %>

<table style="font-size:10px;">
    <tr>
        <td>
            <asp:Localize ID="Localize1" runat="server" 
                meta:resourcekey="Localize1Resource1" Text="Time Created:"></asp:Localize>
        </td>
        <td><asp:Label ID="lblTimeCreated" runat="server" 
                meta:resourcekey="lblTimeCreatedResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td><asp:Localize ID="Localize2" runat="server" 
                meta:resourcekey="Localize2Resource1" Text="Last Updated:"></asp:Localize>
        </td>
        <td><asp:Label ID="lblTimeUpdated" runat="server" 
                meta:resourcekey="lblTimeUpdatedResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td><asp:Localize ID="Localize3" runat="server" 
                meta:resourcekey="Localize3Resource1" Text="Number of View:"></asp:Localize>
        </td>
        <td><asp:Label ID="lblNumView" runat="server" ForeColor="Red" Font-Size="10pt" 
                meta:resourcekey="lblNumViewResource1"></asp:Label>
        </td>
    </tr>
</table>