<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinkAdmin.aspx.cs" Inherits="MicNets.Web.Blog.Member.Admin.LinkAdmin" title="Untitled Page"  MasterPageFile="~/Blog/Blog.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
 <fieldset>
        <legend>        
            <asp:Label ID="lblSubTitle" runat="server" Text="Link Admin" CssClass="title"></asp:Label>
        </legend>
        <div class="content">
 
    
<table cellpadding="0" cellspacing="0" width=980>
    <tr>
        <td colspan=3>Catagory: <asp:DropDownList
                ID="ddlCata" runat="server" CssClass="TextBox" Width="80px" AutoPostBack="True" OnSelectedIndexChanged="ddlCata_SelectedIndexChanged">
                <asp:ListItem Value="0">Admin</asp:ListItem>
                <asp:ListItem Value="1">Blog</asp:ListItem>
                <asp:ListItem Value="2">Sales</asp:ListItem>
            </asp:DropDownList>
            &nbsp;</td>
    </tr>
    <tr>
        <td align=left colspan=2>
            <asp:RadioButtonList ID="radlAction" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="radlAction_SelectedIndexChanged" RepeatLayout=Flow>
                <asp:ListItem Value="0">Edit Existing Link</asp:ListItem>
                <asp:ListItem Selected="True" Value="1">Add New Link</asp:ListItem>
                <asp:ListItem Value="2">Adjust Link Sequence</asp:ListItem>
            </asp:RadioButtonList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCatalogue" runat="server" Text="Link Catalogue:"></asp:Label>
        <asp:DropDownList ID="ddlCatalogue" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCatalogue_SelectedIndexChanged" CssClass="TextBox">
        </asp:DropDownList>
            <asp:CheckBox ID="chkExternalLink" runat="server" Checked="True" Text="External Link" AutoPostBack="True" OnCheckedChanged="chkExternalLink_CheckedChanged" /></td>
    </tr>
     <tr>
        <td colspan=3>
            <br />
        </td>
    </tr>
    <tr><td colspan=3>
        <asp:MultiView ID="mvwLink" runat="server" ActiveViewIndex=0>
            
            <asp:View ID="vwEditLink" runat="server">
                <asp:GridView ID="dgLink" runat="server" AutoGenerateColumns="False" DataKeyNames="linkID" OnRowEditing="dgLink_RowEditing" OnRowUpdating="dgLink_RowUpdating" Width=800px OnRowCancelingEdit="dgLink_RowCancelingEdit" OnRowDeleting="dgLink_RowDeleting" CellPadding="5" BorderColor="White" BorderStyle="Solid">
                    <AlternatingRowStyle BorderStyle="None" BackColor="#EEEEEE"></AlternatingRowStyle>
					<RowStyle BackColor="#F7F7F7"></RowStyle>
					<HeaderStyle Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BorderStyle="None"
						BackColor="#00498F"></HeaderStyle>                
                    <Columns>
                        <asp:TemplateField HeaderText="URL">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtURL" runat="server" Text='<%# Bind("url") %>' Width=350px></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("url") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ENGLISH TEXT ">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtText" runat="server" Text='<%# Bind("text") %>' Width=180px></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("text") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                </asp:View>
            <asp:View ID="vwAddLink" runat="server">
                <table cellpadding=3 cellspacing=3>
                     <tr>
                        <td>URL:
                        </td>
                         <td><font color=red>*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtURL" runat="server" Width="250px" MaxLength="90" CssClass="TextBox"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                ID="vldrURL" runat="server" ErrorMessage="Required" ControlToValidate="txtURL" Display="Dynamic" EnableClientScript="False" ></asp:RequiredFieldValidator>
                        </td>
                         <td><asp:Button ID="btnAdd" runat="server" Text="  Add  " OnClick="btnAdd_Click" CssClass="BlueButton"  /></td>
                    </tr>
                    <tr>
                        <td>Text in English:
                        </td>
                        <td><font color=red>*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtText" runat="server" Width="250px" MaxLength="35" CssClass="TextBox"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                ID="vldrText" runat="server" ErrorMessage="Required" ControlToValidate="txtText" Display="Dynamic" EnableClientScript="False"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            </td>
                    </tr>
                     <tr>
                        <td>Text in Chinese:
                        </td>
                        <td><font color=red></font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTextCh" runat="server" Width="250px" MaxLength="35" CssClass="TextBox"></asp:TextBox>&nbsp;
                        </td>
                        <td>
                            </td>
                    </tr>
                    
                </table>
                </asp:View>
            <asp:View ID="vwAdjustLink" runat="server">
                <table>
                    <tr>
                        <td valign=top><asp:ListBox ID="lstLink" runat="server" Width="300px" Height="200px" CssClass="TextBox"></asp:ListBox><br /><br />
                            <asp:Button ID="btnSave" runat="server" Text=" Update " OnClick="btnSave_Click" CssClass="BlueButton"    />
                        </td>
                        <td valign="middle" style="width: 63px">
                            <asp:Panel ID="Panel1" runat="server" Height="180px" Width="60px">
                                <asp:ImageButton ID="btnTop" runat="server" OnClick="btnTop_Click" 
                                    CausesValidation="False" ImageUrl="~/Image/NavigationBar/m_top.gif" />
                                <asp:ImageButton ID="btnUp" runat="server"  OnClick="btnUp_Click" 
                                    CausesValidation="False" ImageUrl="~/Image/NavigationBar/m_up.gif"  />
                                <asp:ImageButton ID="btnDown" runat="server" OnClick="btnDown_Click" 
                                    CausesValidation="False" ImageUrl="~/Image/NavigationBar/m_dwon.gif"  />
                                <asp:ImageButton ID="btnBottom" runat="server" OnClick="btnBottom_Click" 
                                    CausesValidation="False" ImageUrl="~/Image/NavigationBar/m_bottom.gif" /></asp:Panel>
                            &nbsp;</td>
                    </tr>
                </table>
               </asp:View>
        </asp:MultiView></td></tr>
    <tr height=100%><td colspan=3>
        </td></tr>
</table>
           
        </div>
</fieldset>  
</asp:Content>

