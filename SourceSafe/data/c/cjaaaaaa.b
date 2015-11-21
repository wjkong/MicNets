<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlComment.ascx.cs" Inherits="MicNets.Web.Controls.ctlComment" %>
<%@ Register Assembly="MicNets.TextArea" Namespace="MicNets.Controls" TagPrefix="Mic" %>

<style type="text/css">
    .ratingStar
     {
        font-size: 0pt;
        width: 13px;
        height: 12px;
        margin: 0px;
        padding: 0px;
        cursor: pointer;
        display: block;
        background-repeat: no-repeat;
        background-image: url(../../Image/FilledStar.jpg)
    }

    .filledRatingStar {
        background-image: url(../../Image/FilledStar.jpg)
    }

    .emptyRatingStar {
        background-image: url(../../Image/EmptyStar.jpg);
    }

    .savedRatingStar {
        background-image: url(../../Image/SavedStar.jpg);
    }
</style>
<asp:Panel ID="Panel1" runat="server" Height="100%" Width="800px" 
    DefaultButton="btnAddComment" meta:resourcekey="Panel1Resource1">
    <div class="row"> 
        <asp:DataGrid id="dgComment" runat="server" ShowHeader="False" 
            AutoGenerateColumns="False" BackColor="White" BorderStyle="Solid" 
            BorderColor="White" CellPadding="5" CellSpacing="5" GridLines="None" 
            OnPageIndexChanged="dgComment_PageIndexChanged" AllowPaging="True" Width=100% 
            OnItemDataBound="dgComment_ItemDataBound" meta:resourcekey="dgCommentResource1">
            <AlternatingItemStyle BorderStyle="None" BackColor="#EEEEEE"></AlternatingItemStyle>
                    <Columns>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <div class="row">
                                    <span>
                                    <asp:Label ID="lblNum" runat="server" EnableViewState="False" ForeColor="Red" 
                                        meta:resourcekey="lblNumResource1"></asp:Label>
                                    <asp:Label ID="lblDatePublished" runat="server" EnableViewState="False" 
                                        Font-Size="10px" ForeColor="#676767" 
                                        meta:resourcekey="lblDatePublishedResource1" Text='<%# Eval("timeCreated") %>'></asp:Label>
                                    </span><span style="float:right">
                                    <asp:Button ID="btnUpdate" runat="server" meta:resourcekey="btnUpdateResource1" 
                                        Text="Update" Visible="False" />
                                    <asp:Button ID="btnDelete" runat="server" meta:resourcekey="btnDeleteResource1" 
                                        Text="Delete" Visible="False" />
                                    </span>
                                </div>
                                <asp:Literal ID="litContent" runat="server" EnableViewState="False" 
                                    Text='<%# Eval("content") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateColumn>
            </Columns>
                    <ItemStyle BackColor="#F7F7F7"></ItemStyle>
            <PagerStyle Mode="NumericPages" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center"  />
        </asp:DataGrid>
    </div>
    <div class="row" style="text-align:right; padding-right:5px; padding-left:5px">
        <table style="padding-left:5px">
            <tr>
                <td colspan=2 align=left>
                    <asp:Label ID="lblRatTopic" runat="server" 
                        Text="Rate: " AssociatedControlID="ratTopic" Font-Bold="True" 
                        meta:resourcekey="lblRatTopicResource1"></asp:Label>
                </td>
                <td>
                      <ajaxToolkit:Rating ID="ratTopic" runat="server" CurrentRating="3"
                        MaxRating="5"
                        StarCssClass="ratingStar"
                        WaitingStarCssClass="savedRatingStar"
                        FilledStarCssClass="filledRatingStar"
                        EmptyStarCssClass="emptyRatingStar" >
                     </ajaxToolkit:Rating>
                </td>
            </tr>
            <tr>
                <td align=left style="width: 150px"><asp:Label ID="lblCustName" runat="server" 
                        Text="Name: " AssociatedControlID="txtCustName" Font-Bold="True" 
                        meta:resourcekey="lblCustNameResource1"></asp:Label>
                    </td>
                <td style="width: 3px">
                    <asp:Image ID="Image3" runat="server" Height="15px" ImageUrl="~/Image/RequiredField2.jpg"
                        Width="15px" meta:resourcekey="Image3Resource1" /></td>
                <td align=left>
                    &nbsp;<asp:TextBox ID="txtCustName" runat="server" MaxLength="50" Width="200px" 
                        meta:resourcekey="txtCustNameResource1" ToolTip="Enter your name here."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="vldrCustName" runat="server" 
                        ErrorMessage="Required" ControlToValidate="txtCustName" SetFocusOnError="True" 
                        ValidationGroup="PostComment" Display="Dynamic" 
                        meta:resourcekey="vldrCustNameResource1"></asp:RequiredFieldValidator></td>
                <td align="right"> 
                    <asp:Button ID="btnAddComment" runat="server" 
                        Text="Post Comment" OnClick="btnAddComment_Click" ValidationGroup="PostComment" 
                        meta:resourcekey="btnAddCommentResource1" TabIndex="2" 
                        ToolTip="Click here to post your comment." />
                </td>
            </tr>
            <tr>
                <td align=left>
                    <asp:Label ID="lblVerificationCode" runat="server" 
                        Text="Verification: " Font-Bold="True" 
                        meta:resourcekey="lblVerificationCodeResource1" AssociatedControlID="txtVerificationCode"></asp:Label>
                </td>
                 <td style="width: 3px">
                    <asp:Image ID="Image1" runat="server" Height="15px" ImageUrl="~/Image/RequiredField2.jpg"
                        Width="15px" meta:resourcekey="Image3Resource1" /></td>
                <td align=left>
                    <table>
                        <tr>
                            <td><asp:TextBox ID="txtVerificationCode" runat="server" Width="200" MaxLength="4" ToolTip="Please enter verification code here"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVerificationCode"
                                    ErrorMessage="Required" SetFocusOnError="True" 
                                    ValidationGroup="PostComment" Display=Static 
                                    meta:resourcekey="vldrCommentResource1"></asp:RequiredFieldValidator>
                            </td>
                            <td valign=top>
                                <asp:Image ID="imgVerificationCode" runat=server />
                                <asp:Button ID=btnResetVerificationCode runat=server Text="Reset" 
                                        onclick="btnResetVerificationCode_Click"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr valign=top>
                <td valign=top align=left style="width:250px"> <asp:Label ID="Label1" 
                        runat="server" Text="Comment: " AssociatedControlID="txtComment" 
                        Font-Bold="True" meta:resourcekey="Label1Resource1"></asp:Label><br />
                    <asp:RequiredFieldValidator ID="vldrComment" runat="server" ControlToValidate="txtComment"
                        ErrorMessage="Required" SetFocusOnError="True" 
                        ValidationGroup="PostComment" Display="Dynamic" 
                        meta:resourcekey="vldrCommentResource1"></asp:RequiredFieldValidator><br />
                    <asp:Localize ID="Localize1" runat="server" 
                        meta:resourcekey="Localize1Resource1" Text="Max
                    500 Chars"></asp:Localize>
                    &nbsp;&nbsp;<br />
                    </td>
                        
                <td style="width: 3px">
                    <asp:Image ID="Image2" runat="server" Height="15px" ImageUrl="~/Image/RequiredField2.jpg"
                        Width="15px" meta:resourcekey="Image2Resource1" /></td>
                <td colspan=2 valign="top">
                    &nbsp;<Mic:TextArea ID="txtComment" runat="server" Height="100px" 
                        MaxLength="500" TextMode="MultiLine" CssClass="textArea"
                        Width="650px" EnableViewState="False" 
                        meta:resourcekey="txtCommentResource1" TabIndex="1" 
                        ToolTip="Enter your comment here with a maximum 500  characters."></Mic:TextArea></td>
            </tr>
        </table>
    </div>
</asp:Panel>