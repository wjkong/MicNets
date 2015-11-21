<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="web-server-control-regular-Expression-Validator.aspx.cs" Inherits="MicNets.Web.Blog.Topics.web_server_control_regularExpressionValidator" title="Web Server Control RegularExpressionValidator" MasterPageFile="~/Blog/Topics/Topic.Master" %>
<%@ MasterType VirtualPath="~/Blog/Topics/Topic.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="topicContent" Runat="Server">
<div class="row">
    <p>
    RegularExpressionValidator is one of most useful validation controls which automatically provides both client-side and server-side validation. It is simple and straigforward to be invoded. All what you need it to supply an appropriated regular expression. And the web server control will hanlde both client-side and server-side validations for you. As long as you are familiar with the way to construct a regular expression, you will be able to validate lots of inputs by using RegularExpressionValidator. For instance, Email, URL, Phone #, Postal Code, SIN, Strong Password and etc...
    </p>
</div>
<div class="row">
    Web Server Control: <span class="highLight">RegularExpressionValidator</span><br />
    NameSpace: <span class="highLight">System.Web.UI.WebControls</span>
</div>
<div class="row">
    <br />
    <table cellpadding="5" cellspacing="5" border="0">
        <tr>
                  <td valign=top>
                <table cellpadding="5" cellspacing="5" border="1" width="350px">
                     <tr>
                        <td colspan=2>
                            <span class="highLight">Metacharacters for Matching Type of Characters</span>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Character Class</strong>
                        </td>
                        <td><strong>Description</strong>
                        </td>
                    </tr>
                  
                    <tr>
                        <td>.
                        </td>
                        <td>Matches any character except \n
                        </td>
                    </tr>
                    <tr>
                        <td>[aeiou]
                        </td>
                        <td>Matches any single character specified in the set
                        </td>
                    </tr>
                    <tr>
                        <td>[^aeiou]
                        </td>
                        <td>Matches any character not specified in the set
                        </td>
                    </tr>
                    <tr>
                        <td>[3-7a-dA-D]
                        </td>
                        <td>Matches any character specified in the specified ranges
                        </td>
                    </tr>
                    <tr>
                        <td>\w
                        </td>
                        <td>Matches any word character; that is, any alphanumeric character or the underscore.
                        </td>
                    </tr>
                      <tr>
                        <td>\W
                        </td>
                        <td>Matches any nonword character
                        </td>
                    </tr>
                    <tr>
                        <td>\s
                        </td>
                        <td>Matches any whitespace (space, tab, form feed, newline, carriage return, or vertical feed).
                        </td>
                    </tr>
                    <tr>
                        <td>\S
                        </td>
                        <td>Matched any nonwhitespace character
                        </td>
                    </tr>
                     <tr>
                        <td>\d
                        </td>
                        <td>Matches any decimal character
                        </td>
                    </tr>
                    <tr>
                        <td>\D
                        </td>
                        <td>Matched any nondecimal character
                        </td>
                    </tr>
                    
                </table>
            </td>
            <td valign="top">
                <table cellpadding="5" cellspacing="5" border="1" width="300px">
                    <tr>
                        <td colspan=2>
                            <span class="highLight">Metacharacters for Matching Single Characters</span>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Character Escapes</strong>
                        </td>
                        <td><strong>Description</strong>
                        </td>
                    </tr>
                    <tr>
                        <td>Ordinary characters 
                        </td>
                        <td>Characters other than .$^{[(|)*+?\
                        </td>
                    </tr>
                    <tr>
                        <td>\b
                        </td>
                        <td>Matches a backspace
                        </td>
                    </tr>
                    <tr>
                        <td>\t
                        </td>
                        <td>Matches a tab
                        </td>
                    </tr>
                    <tr>
                        <td>\r
                        </td>
                        <td>Matches a carriage return
                        </td>
                    </tr>
                    <tr>
                        <td>\v
                        </td>
                        <td>Matches a vertical tab
                        </td>
                    </tr>
                      <tr>
                        <td>\n
                        </td>
                        <td>Matches a newline
                        </td>
                    </tr>
                    <tr>
                        <td>\f
                        </td>
                        <td>Matches a form feed
                        </td>
                    </tr>
                      <tr>
                        <td>\
                        </td>
                        <td>If followd by a special character (one of .$^{[(|)*+?\), this character escape matches that character leteral.
                        </td>
                    </tr>
                </table>
            </td>
      
                  <td valign="top">
                <table cellpadding="5" cellspacing="5" border="1" width="200px">
                    <tr>
                        <td colspan=2>
                           <span class="highLight">Quantifiers</span>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Quantifier</strong>
                        </td>
                        <td><strong>Description</strong>
                        </td>
                    </tr>
                    <tr>
                        <td>*
                        </td>
                        <td>Zero or more matches
                        </td>
                    </tr>
                    <tr>
                        <td>+
                        </td>
                        <td>One or more matches
                        </td>
                    </tr>
                    <tr>
                        <td>?
                        </td>
                        <td>Zero or one matches
                        </td>
                    </tr>
                    <tr>
                        <td>{N}
                        </td>
                        <td>N matches
                        </td>
                    </tr>
                    <tr>
                        <td>{N,}
                        </td>
                        <td>N or more matched
                        </td>
                    </tr>
                      <tr>
                        <td>{N,M}
                        </td>
                        <td>Between N and M matches (inclusive)
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div class="row">
 <p>
     <span style="color:Red">Demo #1:</span> Validate Canadian Postal Code:&nbsp;<span class="highLight">[a-zA-Z]\d[a-zA-Z]\s?\d[a-zA-Z]\d"</span><br />
     <br />
      <div style="padding-left:40px">
          <asp:Label ID="lblCananaPostalCode" runat="server" Text="Canadian Postal Code:" AssociatedControlID="txtCananaPostalCode"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="txtCananaPostalCode"
              runat="server" MaxLength="7"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator ID="vldeCananaPostalCode" runat="server" ErrorMessage="Invalid format" ControlToValidate="txtCananaPostalCode" Display="Dynamic" ValidationExpression="[a-zA-Z]\d[a-zA-Z]\s?\d[a-zA-Z]\d" ToolTip="Must be in format of A9A 9A9 or A9A9A9 (case non-sensitive)"></asp:RegularExpressionValidator>
      </div>  
</p>
 <p>
     <span style="color:Red">Demo #2:</span> Validate USA Zip Code:&nbsp;<span class="highLight">\d{5}(-\d{4})?</span><br />
     <br />
      <div style="padding-left:40px">
          <asp:Label ID="lblUSAZipCode" runat="server" Text="USA Zip Code:" AssociatedControlID="txtUSAZipCode"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="txtUSAZipCode"
              runat="server" MaxLength="10"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator ID="vldeUSAZipCode" runat="server" ErrorMessage="Invalid format" ControlToValidate="txtUSAZipCode" Display="Dynamic" ValidationExpression="\d{5}(-\d{4})?" ToolTip="Must be in format of 12345 or 12345-1234"></asp:RegularExpressionValidator>
      </div>  
</p>
 <p>
     <span style="color:Red">Demo #4:</span> Validate Internet Email Address:&nbsp;<span class="highLight">\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*</span><br />
     <br />
      <div style="padding-left:40px">
          <asp:Label ID="lblEmail" runat="server" Text="Internet Email Address:" AssociatedControlID="txtEmail"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="txtEmail"
              runat="server"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator ID="vldeEmail" runat="server" ErrorMessage="Invalid format" ControlToValidate="txtEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ToolTip="Must be in format of valid email address like Michael@micnets.com"></asp:RegularExpressionValidator>
      </div>  
</p>
<p>
     <span style="color:Red">Demo #5:</span> Validate Internet URL:&nbsp;<span class="highLight">([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?</span><br />
     <br />
      <div style="padding-left:40px">
          <asp:Label ID="lblURL" runat="server" Text="Internet URL:" AssociatedControlID="txtURL"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="txtURL"
              runat="server"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator ID="vldeURL" runat="server" ErrorMessage="Invalid format" ControlToValidate="txtURL" Display="Dynamic" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?" ToolTip="Must be in format of valid Internet URL like www.google.com"></asp:RegularExpressionValidator>
      </div>  
</p>
<p>
     <span style="color:Red">Demo #6:</span> Validate North America Phone Number:&nbsp;<span class="highLight">\d{3}-?\d{3}-?\d{4}</span><br />
     <br />
      <div style="padding-left:40px">
          <asp:Label ID="lblPhone" runat="server" Text="North America Phone Number:" AssociatedControlID="txtPhone"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="txtPhone"
              runat="server" MaxLength=12></asp:TextBox>&nbsp;<asp:RegularExpressionValidator ID="vldePhone" runat="server" ErrorMessage="Invalid format" ControlToValidate="txtPhone" Display="Dynamic" ValidationExpression="\d{3}-?\d{3}-?\d{4}" ToolTip="Must be in format of 999-999-9999 or 1234567890"></asp:RegularExpressionValidator>
      </div>  
</p>
<p>
     <span style="color:Red">Demo #7:</span> Validate USA Social Security Number:&nbsp;<span class="highLight">\d{3}-?\d{2}-?\d{4}</span><br />
     <br />
      <div style="padding-left:40px">
          <asp:Label ID="lblSSN" runat="server" Text="USA Social Security Number:" AssociatedControlID="txtSSN"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="txtSSN"
              runat="server" MaxLength=11></asp:TextBox>&nbsp;<asp:RegularExpressionValidator ID="vldeSSN" runat="server" ErrorMessage="Invalid format" ControlToValidate="txtSSN" Display="Dynamic" ValidationExpression="\d{3}-?\d{2}-?\d{4}" ToolTip="Must be in format of 999-99-9999 or 123456789"></asp:RegularExpressionValidator>
      </div>  
</p>
<p>
     <span style="color:Red">Demo #8:</span> Validate Canadian Social Insurance Number:&nbsp;<span class="highLight">\d{3}-?\d{3}-?\d{3}</span><br />
     <br />
      <div style="padding-left:40px">
          <asp:Label ID="lblSIN" runat="server" Text="Canadian Social Insurance Number:" AssociatedControlID="txtSIN"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="txtSIN"
              runat="server" MaxLength=11></asp:TextBox>&nbsp;<asp:RegularExpressionValidator ID="vldeSIN" runat="server" ErrorMessage="Invalid format" ControlToValidate="txtSIN" Display="Dynamic" ValidationExpression="\d{3}-?\d{3}-?\d{3}" ToolTip="Must be in format of 999-999-999 or 123456789"></asp:RegularExpressionValidator>
      </div>  
</p>

</div>
</asp:Content>


