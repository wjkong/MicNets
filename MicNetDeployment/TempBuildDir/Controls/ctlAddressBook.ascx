<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlAddressBook.ascx.cs" Inherits="MicNets.Web.Controls.ctlAddressBook" %>
<div class="row" style="text-align:right">
    <asp:RadioButtonList ID="radlAction" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="radlAction_SelectedIndexChanged">
            <asp:ListItem Selected="True" Value="LIST">Maintain Contact List</asp:ListItem>
            <asp:ListItem Value="NEW">Add New Contact</asp:ListItem>
        </asp:RadioButtonList> 
</div>
    
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <asp:MultiView ID="mvwContact" runat="server">
            <asp:View ID="vwAddNewContact" runat="server">
              <div class="row" align=right>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/RequiredField2.jpg" Height="15px" Width="15px" />&nbsp;Mandatory Field
           </div>
<TABLE cellSpacing=5 cellPadding=5 border=0><TBODY><TR><TD>
    First Name:
</TD><TD><asp:Image ID="Image1" runat="server" ImageUrl="~/Image/RequiredField2.jpg" Height="15px" Width="15px" />&nbsp;<asp:TextBox id="txtNewFirstName" runat="server" CssClass="TextBox" MaxLength="35" Width="200px"></asp:TextBox> </TD><TD><asp:RequiredFieldValidator id="vldrFirstName" runat="server" ControlToValidate="txtNewFirstName" ErrorMessage="Required"></asp:RequiredFieldValidator></TD></TR><TR><TD>
    Last Name:
</TD><TD><asp:Image ID="Image2" runat="server" ImageUrl="~/Image/RequiredField2.jpg" Height="15px" Width="15px" />&nbsp;<asp:TextBox id="txtNewLastName" runat="server" CssClass="TextBox" MaxLength="35" Width="200px"></asp:TextBox> </TD><TD><asp:RequiredFieldValidator id="vldrLastName" runat="server" ControlToValidate="txtNewLastName" ErrorMessage="Required"></asp:RequiredFieldValidator>&nbsp;</TD></TR><TR><TD>
    Phone:
</TD><TD>
    &nbsp; &nbsp;&nbsp;
    <asp:TextBox id="txtPhone" runat="server" CssClass="TextBox" Width="200px"></asp:TextBox>&nbsp;<ajaxToolkit:MaskedEditExtender id="makPhone" runat="server" MessageValidatorTip="true" Mask="\(999\)999\-9999" TargetControlID="txtPhone" ClearMaskOnLostFocus="false">
                                          </ajaxToolkit:MaskedEditExtender> &nbsp;&nbsp;</TD><TD><asp:CheckBox id="chkPhoneChina" runat="server" AutoPostBack="True" Text="China" Font-Bold="False" Font-Italic="False" OnCheckedChanged="chkPhoneChina_CheckedChanged"></asp:CheckBox></TD></TR><TR><TD>Cell Phone: </TD><TD>
                                              &nbsp; &nbsp;&nbsp;
                                              <asp:TextBox id="txtCell" runat="server" CssClass="TextBox" Width="200px"></asp:TextBox> <ajaxToolkit:MaskedEditExtender id="makCell" runat="server" MessageValidatorTip="true" Mask="\(999\)999\-9999" TargetControlID="txtCell" ClearMaskOnLostFocus="false">
                                          </ajaxToolkit:MaskedEditExtender> </TD><TD></TD></TR><TR><TD>
                                              Email:<strong> </strong>
                                          </TD><TD>
                                              &nbsp; &nbsp;&nbsp;
                                              <asp:TextBox id="txtNewEmail" runat="server" CssClass="TextBox" MaxLength="50" Width="200px"></asp:TextBox> </TD><TD><asp:RegularExpressionValidator id="vldeEmail" runat="server" ControlToValidate="txtNewEmail" ErrorMessage="Invalid email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></TD></TR><TR><TD></TD><TD></TD><TD></TD></TR><TR><TD align=right colSpan=3><asp:Button id="btnAdd" onmouseover="this.setAttribute('className', 'RedButton')" onmouseout="this.setAttribute('className', 'BlueButton')" onclick="btnAdd_Click" runat="server" CssClass="BlueButton" Text=" Add "></asp:Button>&nbsp;&nbsp; <asp:Button id="btnClear" onmouseover="this.setAttribute('className', 'RedButton')" onmouseout="this.setAttribute('className', 'BlueButton')" onclick="btnClear_Click" runat="server" CssClass="BlueButton" Text="Reset" CausesValidation="False"></asp:Button> </TD></TR></TBODY></TABLE>

         
                
            </asp:View>
            <asp:View ID="vwMaintainContact" runat="server">
    <table>
         <tr>
            <td>
                <table cellpadding=5 cellspacing=5 border=0>
                    <tr>
                        <td nowrap style="height: 44px">First Name:
                        </td>
                         <td style="height: 44px">
                             <asp:TextBox ID="txtFirstName" runat="server" CssClass="TextBox"></asp:TextBox>
                        </td>
                         <td nowrap style="height: 44px">Last Name:
                        </td>
                         <td style="height: 44px"><asp:TextBox ID="txtLastName" runat="server" CssClass="TextBox"></asp:TextBox>
                        </td>
                          <td style="height: 44px">Email:
                        </td>
                         <td style="height: 44px"><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox"></asp:TextBox>
                        </td>
                        <td align=right style="width: 100%; height: 44px;">
                            <asp:Button ID="btnSearch" runat="server" CssClass="BlueButton" onmouseout="this.setAttribute('className', 'BlueButton')" onmouseover="this.setAttribute('className', 'RedButton')" Text="Search" OnClick="btnSearch_Click" />&nbsp;
                            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click"  CssClass="BlueButton" onmouseout="this.setAttribute('className', 'BlueButton')" onmouseover="this.setAttribute('className', 'RedButton')"/>
                        </td>
                    </tr>
                </table>
                </td>
        </tr>
        <tr>
            <td nowrap="noWrap">
                   <asp:RadioButtonList ID="radlSearchBy" runat="server" RepeatColumns="2" RepeatLayout="Flow" CssClass="TextBox">
            <asp:ListItem Value="FIRSTNAME" Selected="True">First Name</asp:ListItem>
            <asp:ListItem Value="LASTNAME">Last Name</asp:ListItem>
        </asp:RadioButtonList>&nbsp;&nbsp;
        <asp:PlaceHolder id=phdAlphaBar runat="server" EnableViewState="False"></asp:PlaceHolder>
 
            </td>
        </tr>
        <tr>
            <td>
                 <asp:DataGrid ID="dgContact" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" CellPadding="5" DataKeyField="contactID" PageSize="30" BorderColor="White"	BorderStyle="Solid" BackColor="White" OnItemDataBound="dgContact_ItemDataBound" OnCancelCommand="dgContact_CancelCommand" OnEditCommand="dgContact_EditCommand" OnSortCommand="dgContact_SortCommand" OnUpdateCommand="dgContact_UpdateCommand" OnPageIndexChanged="dgContact_PageIndexChanged" OnItemCreated="dgContact_ItemCreated">
            <AlternatingItemStyle BorderStyle="None" BackColor="#EEEEEE"></AlternatingItemStyle>
									<ItemStyle BackColor="#F7F7F7"></ItemStyle>
									<HeaderStyle Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White" BorderStyle="None"
										BackColor="#00498F"></HeaderStyle>
            <Columns>
                <asp:TemplateColumn HeaderText="First Name" SortExpression="firstName">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("firstName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("firstName") %>' Width=100></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator><br />
                    </EditItemTemplate>
                    <HeaderStyle Width="108px" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Last Name" SortExpression="lastName">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("lastName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("lastName") %>' Width=100></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLastName"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <HeaderStyle Width="108px" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Phone" SortExpression="phone">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("phone") %>' ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <ajaxToolkit:MaskedEditExtender ID="makPhone" runat="server" TargetControlID=txtPhone ClearMaskOnLostFocus="false" Mask="\(999\)999\-9999">
                        </ajaxToolkit:MaskedEditExtender>
                        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("phone") %>' Width=140px></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle Width="148px" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Cell Phone" SortExpression="cellPhone">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("cellPhone") %>' ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <ajaxToolkit:MaskedEditExtender ID="makCellPhone" runat="server" TargetControlID=txtCellPhone ClearMaskOnLostFocus="false" Mask="\(999\)999\-9999">
                        </ajaxToolkit:MaskedEditExtender>
                        <asp:TextBox ID="txtCellPhone" runat="server" Text='<%# Bind("cellPhone") %>' Width=100></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle Width="108px" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="China" SortExpression="isChina">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkChinaReadOnly" runat="server" Enabled="False" Checked='<%# Bind("isChina") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkChina" runat="server" Checked='<%# Bind("isChina") %>'/>
                    </EditItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Email" SortExpression="email">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>' Width=200></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid email format" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <HeaderStyle Width="208px" />
                </asp:TemplateColumn>
                <asp:EditCommandColumn CancelText="Cancel" EditText="Edit" UpdateText="Update">
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                        Font-Underline="False" HorizontalAlign="Center"  />
                    <HeaderStyle Width="50px" />
                </asp:EditCommandColumn>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" OnClientClick="return confirmation()" Text="Delete" OnClick="btnDelete_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
            <PagerStyle Mode="NumericPages" CssClass="Pager" />
        </asp:DataGrid>
            </td>
        </tr>
    </table>    
      </asp:View>
        </asp:MultiView>
        <input id="hidSortExpression" runat="server" type="hidden" /><input id="hidSortDirection"
            runat="server" type="hidden" /><INPUT id="hidPopupMeg" type=hidden runat="server" />
 