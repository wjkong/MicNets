<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAdmin.aspx.cs" Inherits="MicNets.Web.Blog.Member.Admin.UserAdmin" title="Untitled Page"%>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
        <legend>        
            <asp:Label ID="lblSubTitle" runat="server" Text="User Admin" CssClass="title"></asp:Label>
        </legend>
        <div class="content">

    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<asp:GridView id="gvUsers" runat="server" CellPadding="5" BorderColor="White" BorderStyle="Solid" ShowFooter="True" OnRowDataBound="gvUsers_RowDataBound" OnRowCancelingEdit="gvUsers_RowCancelingEdit" OnRowDeleting="gvUsers_RowDeleting" OnRowEditing="gvUsers_RowEditing" OnRowUpdating="gvUsers_RowUpdating" AllowSorting="True" AutoGenerateColumns="False" OnSorting="gvUsers_Sorting" DataKeyNames="CustID"><Columns>
<asp:TemplateField SortExpression="username" HeaderText="UserName"><EditItemTemplate>
<asp:TextBox id="txtUserName" runat="server" Text='<%# Bind("username") %>' width="70"></asp:TextBox> 
</EditItemTemplate>
<FooterTemplate>
<asp:TextBox id="txtNewUserName" runat="server" Width="80px"></asp:TextBox> 
</FooterTemplate>
<ItemTemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("username") %>'></asp:Label> 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="Email" HeaderText="Email"><EditItemTemplate>
<asp:TextBox id="txtEmail" runat="server" Text='<%# Bind("Email") %>' Width="160px"></asp:TextBox> 
</EditItemTemplate>
<FooterTemplate>
<asp:TextBox id="txtNewEmail" runat="server" Width="160px"></asp:TextBox> 
</FooterTemplate>
<ItemTemplate>
<asp:Label id="Label6" runat="server" Text='<%# Bind("Email") %>'></asp:Label> 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="Role" HeaderText="Role"><EditItemTemplate>
<asp:DropDownList id="ddlRoles" runat="server" Width="140px"></asp:DropDownList> 
</EditItemTemplate>
<FooterTemplate>
<asp:DropDownList id="ddlNewRoles" runat="server" Width="140px"></asp:DropDownList> 
</FooterTemplate>
<ItemTemplate>
<asp:Label id="lblRole" runat="server" Text='<%# Bind("Role") %>'></asp:Label> 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="lastName" HeaderText="Last Name"><EditItemTemplate>
<asp:TextBox id="txtLastName" runat="server" Text='<%# Bind("lastName") %>' width="50"></asp:TextBox> 
</EditItemTemplate>
<FooterTemplate>
<asp:TextBox id="txtNewLastName" runat="server" Width="80px"></asp:TextBox> 
</FooterTemplate>
<ItemTemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("lastName") %>'></asp:Label> 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="firstName" HeaderText="First Name"><EditItemTemplate>
<asp:TextBox id="txtFirstName" runat="server" Text='<%# Bind("firstName") %>' width="50"></asp:TextBox> 
</EditItemTemplate>
<FooterTemplate>
<asp:TextBox id="txtNewFirstName" runat="server" Width="80px"></asp:TextBox> 
</FooterTemplate>
<ItemTemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("firstName") %>'></asp:Label> 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="dateReg" HeaderText="Date Reg"><EditItemTemplate>
<asp:Label id="Label31" runat="server" Text='<%# Eval("DateReg") %>'></asp:Label> 
</EditItemTemplate>
<ItemTemplate>
<asp:Label id="Label5" runat="server" Text='<%# Bind("DateReg") %>'></asp:Label> 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField ShowHeader="False"><EditItemTemplate>
<asp:LinkButton id="LinkButton1" runat="server" Text="Update" CausesValidation="True" CommandName="Update"></asp:LinkButton>&nbsp;<asp:LinkButton id="btnlCancel" runat="server" Text="Cancel" CausesValidation="False" CommandName="Cancel"></asp:LinkButton> 
</EditItemTemplate>
<FooterTemplate>
<asp:LinkButton id="btnAdd" onclick="btnAdd_Click" runat="server">Add User</asp:LinkButton> 
</FooterTemplate>
<ItemTemplate>
<asp:LinkButton id="LinkButton11" runat="server" Text="Edit" CausesValidation="False" CommandName="Edit"></asp:LinkButton> 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="Delete" ShowHeader="False"><FooterTemplate>
<asp:LinkButton id="btnClear" runat="server" OnClick="btnClear_Click">Clear</asp:LinkButton>
</FooterTemplate>
<ItemTemplate>
<asp:LinkButton id="LinkButton2" runat="server" Text="Delete" CausesValidation="false" CommandName="Delete"></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>
</Columns>

<RowStyle BackColor="#F7F7F7"></RowStyle>

<HeaderStyle BackColor="#00498F" BorderStyle="None" ForeColor="White" Wrap="False" HorizontalAlign="Center" Font-Bold="True"></HeaderStyle>

<AlternatingRowStyle BackColor="#EEEEEE" BorderStyle="None"></AlternatingRowStyle>
</asp:GridView>&nbsp; <asp:HiddenField id="hidSortDirection" runat="server"></asp:HiddenField> <asp:HiddenField id="hidSortExpression" runat="server"></asp:HiddenField> 
</contenttemplate>
    </asp:UpdatePanel>
        </div>
</fieldset>
</asp:Content>
