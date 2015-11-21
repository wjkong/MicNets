<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="MicNets.Web.WebForm2" %>

<%@ Register src="Controls/ctlComment.ascx" tagname="ctlComment" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       
        <uc1:ctlComment ID="ctlComment1" runat="server" />
       
    </div>
    </form>
</body>
</html>
