<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MicNets.Web.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="javascript" type="text/javascript">
    function ContributeDataContainer(obj) {
        var objectValue;
        if (obj.type == "checkbox")
            objectValue = obj.status;
        else
            objectValue = obj.value;
            
        MicNets.Web.WebService.AjaxWS.ContributeDataContainer(obj.name, objectValue, SucceededCallback);
    }

    function SucceededCallback(result) {
        for (prop in result) {
            if (IsCalculatedField(prop) == true) {
                document.getElementById("txt" + prop).value = formatDecimalToCurrency(result[prop], 2);
            }
        }
    }

    function KeyPressMoney() {
        if ((event.keyCode < 48 && event.keyCode != 46 && event.keyCode != 8) || (event.keyCode > 57 && event.keyCode != 190))
            event.returnValue = false;
    }

    function IsCalculatedField(field) {
        var myRegExp = new RegExp(field);
        var calculatedFields = document.getElementById("CalculatedFields").value;

        var matchPos = calculatedFields.search(myRegExp);

        if (matchPos != -1)
            return true;
        else
            return false;
    }

    function ConvertToCurrency(obj) {

        obj.value = formatDecimalToCurrency(obj.value, 2);
    }

    function ConvertToDecimal(obj) {
        var n = obj.value.toString();
        if (n.match(/\(/) != null) {
            n = '\x2D' + n;
        }

        n = n.replace(/[^\d\x2D\x2E]/g, '');

        obj.value = n;
    }

    function formatDecimalToCurrency(n, p) {
        n = n.toString();
        var sy = new Array('$', '', '($', ')');
        var neg = (n.match(/\x2D/) != null ? true : false);
        n = n.replace(/[^\d\x2E]/g, '');
        var m = n.match(/(\d*)(\x2E*)(\d*)/);
        var f = m[3];

        if (f.length > p) {
            f = f / Math.pow(10, (f.length - p));
            f = Math.round(f);
            while (f.toString().length < p) {
                f = '0' + f;
            }
        }
        else {
            while (f.toString().length < p) {
                f += '0';
            };
        }
        var w = new Number(m[1]);
        if (f == Math.pow(10, p)) {
            w += 1;
            f = f.toString().substr(1);
        }
        w = w.toString();
        var s = 3;
        var l = w.length - s;
        while (l > 0) {
            w = w.substr(0, l) + '\x2C' + w.substr(l);
            l -= s;
        }
        if (p == 0) {
            m[2] = '';
            f = '';
        }
        else {
            m[2] = '\x2E';
        }

        return (neg ? sy[2] + w + m[2] + f + sy[3] : sy[0] + w + m[2] + f + sy[1]);
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 152px;
        }
        .style3
        {
            width: 152px;
            height: 27px;
        }
        .style4
        {
            height: 27px;
        }
        
        .TextAlignRight
        {
        	text-align:right
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Services>
        <asp:ServiceReference Path="~/WebService/AjaxWS.asmx" />
        </Services>
    </asp:ScriptManager>
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="Label1" runat="server" Text="Purchase Price:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCashPrice" runat="server" onchange="ContributeDataContainer(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label2" runat="server" Text="Down Payment:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDownPayment" runat="server" onchange="ContributeDataContainer(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label8" runat="server" Text="Mortgage Insurance:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMortgageInsurance" runat="server" 
                        onchange="ContributeDataContainer(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label3" runat="server" Text="Sub Total:"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtSubTotal" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label4" runat="server" Text="GST:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtGST" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="chkGSTExempt" runat="server" Text="GSTExempt" onclick="ContributeDataContainer(this)" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label5" runat="server" Text="PST:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPST" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label6" runat="server" Text="Total Amount Financed:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTotalAmountFinanced" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label7" runat="server" Text="Loan Term:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlTerm" runat="server" onchange=ContributeDataContainer(this)>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label9" runat="server" Text="Amortization Period:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlAmortizationPeriod" runat="server" onchange=ContributeDataContainer(this)>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label10" runat="server" Text="Annual Interest Rate:" ></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAPR" runat="server" onchange="ContributeDataContainer(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Monthly Payment:</td>
                <td>
                    <asp:TextBox ID="txtTotalMonthlyPayment" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    
    </form>
</body>
</html>
