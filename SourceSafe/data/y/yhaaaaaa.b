<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PropertyAdmin.aspx.cs" Inherits="MicNets.Web.Blog.Member.Admin.PropertyAdmin"  title="Upload Property List"%>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
<legend Class="title">Upload List</legend>
<p>
</p>
    <asp:Label ID="lblNotice" runat="server"></asp:Label>
<p>
 <asp:FileUpload ID="filExcel" runat="server" TabIndex="1" 
    ToolTip="Enter the uploaded Excel file here" Width="400px" />
<asp:Button ID="btnUpload" runat="server" onclick="btnUpload_Click" 
    TabIndex="3" Text="Upload" ToolTip="Click to upload the Excel file" />
</p>
</fieldset>
   
</asp:Content>