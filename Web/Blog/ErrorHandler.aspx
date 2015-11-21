<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorHandler.aspx.cs" Inherits="MicNets.Web.Blog.ErrorHandler" title="Custom Error Handler with User Friendly Message" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
    <fieldset>
        <legend> 
            <h1 Class="title">Error Notification</h1>      
        </legend>
        <div class="content">
            <TABLE width="100%" align="center">
					<TR>
						<TD align="center">
                            <p><asp:Label ID="lblMessage" runat="server" Text="An unexpected error occured!" Font-Size="XX-Large"></asp:Label></p>
							We have been notified and will correct the cause of the error very 
							shortly.
							<P>Click the "<B>Cancel</B>" button to return to your previous page, wait a moment 
								and retry while the problem is being corrected.
								<BR>
								If the problem persists, please re-visit my blog later.</P>
						</TD>
					</TR>
					<TR>
					    <br />
						<TD align="center"><INPUT style="WIDTH: 74px" onclick="window.history.go(-1);" type="button" value="Cancel"></TD>
					</TR>
				</TABLE>
        </div>
    </fieldset>
</asp:Content>

