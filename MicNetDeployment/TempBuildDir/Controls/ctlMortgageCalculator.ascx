<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlMortgageCalculator.ascx.cs" Inherits="MicNets.Web.Controls.ctlMortgageCalculator" %>
<script type="text/javascript" src="../Scripts/MicNets.js"></script>
<script type="text/javascript">
    function CalculateInsurance()
    {
        var purchasePrice = GetElementValue("txtPrincipal");
        var downPayment = GetElementValue("txtDownPayment");

        if (purchasePrice == "" || isNaN(purchasePrice)) {
            purchasePrice = 0.00;
            GetElement("txtPrincipal").value = purchasePrice;
        }
        else
            GetElement("txtPrincipal").value = Math.round(purchasePrice * 100) / 100;
            
        if (downPayment == "")
            downPayment = 0.00;
        
        var mortgageInsurance = GetElement("txtInsurance");
        
        var premiumRate = GetPremiumRate(purchasePrice, downPayment);
        
        mortgageInsurance.value =  Math.round((purchasePrice - downPayment) * premiumRate * 100) / 100;              
    }
    
    function GetPremiumRate(purchasePrice, downPayment)
    {
        var percentage = downPayment / purchasePrice;
        
        if (percentage > 0.35)
            return 0.00;
        else if (percentage == 0.35)
            return 0.005;
        else if (percentage >= 0.25 && percentage < 0.35)
            return 0.065;
        else if (percentage >= 0.20 && percentage < 0.25)
            return 0.01;
        else if (percentage >= 0.15 && percentage < 0.20)
            return 0.0175;
        else if (percentage >= 0.10 && percentage < 0.15)
            return 0.02;
        else if (percentage >= 0.05 && percentage < 0.10)
            return 0.0295;
        else 
            return 0.031;
    }
    
    function UpdateAPR()
    {
        GetElement("lblInterestRate").innerHTML = GetElementValue("ddlInterestRate");
    }
    
    function UpdateTerm()
    {
        GetElement("lblLoanTerm").innerHTML = GetElementValue("ddlTerm");
    }
    
</script>
<table cellpadding=0 cellspacing=0 border=0 width=700px>
     <tr>
        <td valign=top style="height: 396px">
            <table cellpadding=5 cellspacing=5 border=0>
                <tr>
                    <td align="right">
                        <asp:Label runat=server ID=lblPurchasePrice Text="Purchase Price:" 
                            AssociatedControlID="txtPrincipal" meta:resourcekey="lblPurchasePriceResource1"></asp:Label>
                    </td>
                    <td >
                        $<asp:TextBox ID="txtPrincipal" runat="server" onkeypress="KeyPressMoney()" 
                            MaxLength="10" onblur=CalculateInsurance() TabIndex="2" 
                            ToolTip="Enter the purchase price" SkinID="TextBoxAR" 
                            meta:resourcekey="txtPrincipalResource1"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="vldrPurchasePrice" runat="server" 
                            ControlToValidate="txtPrincipal" Display="None" 
                            ErrorMessage="Purchase Price Required" 
                            meta:resourcekey="vldrPurchasePriceResource1" SetFocusOnError="True" 
                            ValidationGroup="vgpCalculator"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="vldgPurchasePrice" runat="server" 
                            ControlToValidate="txtPrincipal" Display="None" 
                            ErrorMessage="Purchase price must be a number between 0 and 10000000" 
                            MaximumValue="10000000" MinimumValue="0" Type="Double" SetFocusOnError="True" 
                            meta:resourcekey="vldgPurchasePriceResource1" 
                            ValidationGroup="vgpCalculator"></asp:RangeValidator></td>
                </tr>
                 <tr>
                    <td align="right">
                        <asp:Label runat=server ID=lblMortgageInsurance Text="Mortgage Insurance:" 
                            AssociatedControlID="txtInsurance" 
                            meta:resourcekey="lblMortgageInsuranceResource1"></asp:Label>
                    </td>
                    <td >
                        $<asp:TextBox ID="txtInsurance" runat="server" Width="100px" 
                            onkeypress="KeyPressMoney()" ReadOnly="True" 
                            SkinID="TextBoxReadOnly" meta:resourcekey="txtInsuranceResource1"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RangeValidator ID="vldgInsurance" runat="server" 
                            ControlToValidate="txtDownPayment" Display="None" 
                            ErrorMessage="Insurance must be a number between 0 and 100000" 
                            MaximumValue="100000" MinimumValue="0" Type="Double" SetFocusOnError="True" 
                            meta:resourcekey="vldgInsuranceResource1" ValidationGroup="vgpCalculator"></asp:RangeValidator></td>
                </tr>
                <tr>
                    <td align="right">
                        
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="ddlTerm" 
                                Text="Loan Term:" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td >
                        &nbsp;
                        <asp:DropDownList ID="ddlTerm" runat="server" onchange="javascript:UpdateTerm()"
                            TabIndex="10" ToolTip="Choose the loan term" 
                            meta:resourcekey="ddlTermResource1" SkinID="DropDownListShort">
                            <asp:ListItem meta:resourcekey="ListItemResource1">5</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource2">10</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource3">15</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource4">20</asp:ListItem>
                            <asp:ListItem Selected="True" meta:resourcekey="ListItemResource5">25</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource6">30</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource7">35</asp:ListItem>
                           
                        </asp:DropDownList>&nbsp;yrs</td>
                    <td>
                    </td>
                </tr>
                 <tr>
                    <td align="right">
                        <asp:Label ID="Label2" runat="server" AssociatedControlID="ddlInterestRate" 
                            Text="Annual Interest Rate:" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td >
                        &nbsp;
                        <asp:DropDownList ID="ddlInterestRate" runat="server" onchange="javascript:UpdateAPR()" 
                            TabIndex="12" ToolTip="Choose annual interest rate" 
                            meta:resourcekey="ddlInterestRateResource1" SkinID="DropDownListShort">
                             <asp:ListItem meta:resourcekey="ListItemResource8">1.25</asp:ListItem>
                             <asp:ListItem meta:resourcekey="ListItemResource8">1.50</asp:ListItem>
                             <asp:ListItem meta:resourcekey="ListItemResource8">1.75</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource9">2.00</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource10">2.25</asp:ListItem>
                            <asp:ListItem Selected="True" meta:resourcekey="ListItemResource11">2.50</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource12">2.75</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource8">3.00</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource9">3.25</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource10">3.75</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource11">4.00</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource12">4.25</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource13">4.50</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource14">4.75</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource15">5.00</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource16">5.25</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource17">5.50</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource18">5.60</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource19">5.65</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource20">5.70</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource21">5.75</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource22">5.85</asp:ListItem>
                            <asp:ListItem >6.00</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource24">6.25</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource25">6.50</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource26">6.75</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource27">7.00</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource28">7.25</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource29">7.50</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource30">7.75</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource31">8.00</asp:ListItem>
                           
                        </asp:DropDownList>&nbsp;%</td>
                    <td>
                    </td>
                </tr>
                 <tr>
                    <td align="right">
                        <asp:Label ID="Label3" runat="server" AssociatedControlID="txtDownPayment" 
                            Text="Down Payment:" meta:resourcekey="Label3Resource1"></asp:Label>
                       
                    </td>
                    <td >
                        $<asp:TextBox ID="txtDownPayment" runat="server" MaxLength=10 
                            onkeypress="KeyPressMoney()" onblur=CalculateInsurance() TabIndex="14" 
                            ToolTip="Enter down payment here" SkinID="TextBoxAR" 
                            meta:resourcekey="txtDownPaymentResource1"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RangeValidator ID="vldgDownPayment" runat="server" 
                            ControlToValidate="txtDownPayment" Display="None" 
                            ErrorMessage="Down payment must be a number between 0 and 10000000" 
                            MaximumValue="10000000" MinimumValue="0" Type="Double" SetFocusOnError="True" 
                            meta:resourcekey="vldgDownPaymentResource1" 
                            ValidationGroup="vgpCalculator"></asp:RangeValidator>
                        <asp:CompareValidator ID="vldcDownPayment" runat="server" 
                            ControlToCompare="txtPrincipal" ControlToValidate="txtDownPayment" 
                            Display="None" ErrorMessage="Down payment must be less than purchase price" 
                            Operator="LessThan" Type="Double" SetFocusOnError="True" 
                            meta:resourcekey="vldcDownPaymentResource1" 
                            ValidationGroup="vgpCalculator"></asp:CompareValidator></td>
                </tr>
                 <tr>
                    <td align="right">
                        <asp:Label ID="Label4" runat="server" AssociatedControlID="txtPropertyTax" 
                            Text="Property Tax/yr:" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td >
                        $<asp:TextBox ID="txtPropertyTax" runat="server" onkeypress="KeyPressMoney()" 
                            MaxLength="7" TabIndex="16" ToolTip="Enter annual property tax here" 
                            SkinID="TextBoxAR" meta:resourcekey="txtPropertyTaxResource1"></asp:TextBox>
                        </td>
                    <td>
                        <asp:RangeValidator ID="vldgPropertyTax" runat="server" 
                            ControlToValidate="txtPropertyTax" Display="None" 
                            ErrorMessage="Property tax must be a number between 0 and 100000" 
                            MaximumValue="100000" MinimumValue="0" Type="Double" SetFocusOnError="True" 
                            meta:resourcekey="vldgPropertyTaxResource1" 
                            ValidationGroup="vgpCalculator"></asp:RangeValidator></td>
                </tr>
                 <tr>
                    <td nowrap align="right">
                        <asp:Label ID="Label5" runat="server" AssociatedControlID="txtHomeInsurance" 
                            Text="Home Insurance/mon:" meta:resourcekey="Label5Resource1"></asp:Label>
                    </td>
                    <td >
                        $<asp:TextBox ID="txtHomeInsurance" runat="server" MaxLength="7" 
                            TabIndex="18" ToolTip="Enter monthly home content insurance here" 
                            SkinID="TextBoxAR" meta:resourcekey="txtHomeInsuranceResource1"></asp:TextBox>
                        </td>
                    <td>
                        <asp:RangeValidator ID="vldgHomeInsurance" runat="server" 
                            ControlToValidate="txtHomeInsurance" Display="None" 
                            ErrorMessage="Home insurance must be a number between 0 and 10000" 
                            MaximumValue="10000" MinimumValue="0" Type="Double" SetFocusOnError="True" 
                            meta:resourcekey="vldgHomeInsuranceResource1" 
                            ValidationGroup="vgpCalculator"></asp:RangeValidator></td>
                </tr>
                <tr>
                    <td nowrap align="right">
                        <asp:Label ID="Label6" runat="server" AssociatedControlID="txtMaintenance" 
                            Text="Maintenance/mon:" meta:resourcekey="Label6Resource1"></asp:Label>
                    </td>
                    <td >
                        $<asp:TextBox ID="txtMaintenance" runat="server" onkeydown="KeyPressMoney()" 
                            MaxLength="7" TabIndex="20" ToolTip="Enter monthly maintenance/condo fee here" 
                            SkinID="TextBoxAR" meta:resourcekey="txtMaintenanceResource1"></asp:TextBox>
                        </td>
                    <td>
                        </td>
                </tr>
                 <tr>
                    <td align="right">
                        <asp:Label ID="Label7" runat="server" AssociatedControlID="txtHydro" 
                            Text="Hydro/mon:" meta:resourcekey="Label7Resource1"></asp:Label>
                    </td>
                    <td >
                        $<asp:TextBox ID="txtHydro" runat="server" onkeydown="KeyPressMoney()" 
                            MaxLength="6" ToolTip="Enter monthly Hydro cost here" SkinID="TextBoxAR" 
                            TabIndex="22" meta:resourcekey="txtHydroResource1"></asp:TextBox>
                        </td>
                    <td>
                        </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label8" runat="server" AssociatedControlID="txtWater" 
                            Text="Water/mon:" meta:resourcekey="Label8Resource1"></asp:Label>
                    </td>
                    <td >
                        $<asp:TextBox ID="txtWater" runat="server" onkeydown="KeyPressMoney()" 
                            MaxLength="6" ToolTip="Enter monthly water cost" SkinID="TextBoxAR" 
                            TabIndex="24" meta:resourcekey="txtWaterResource1"></asp:TextBox>
                        </td>
                    <td>
                        <asp:RangeValidator ID="RangeValidator3" runat="server" 
                            ControlToValidate="txtWater" Display="None" 
                            ErrorMessage="Water must be a number between 0 and 1000" MaximumValue="1000" 
                            MinimumValue="0" Type="Double" SetFocusOnError="True" 
                            meta:resourcekey="RangeValidator3Resource1" 
                            ValidationGroup="vgpCalculator"></asp:RangeValidator></td>
                </tr>
                <tr>
                    <td nowrap align="right">
                        <asp:Label ID="Label9" runat="server" AssociatedControlID="txtGas" 
                            Text="Gas/mon:" meta:resourcekey="Label9Resource1"></asp:Label>
                    </td>
                    <td >
                        $<asp:TextBox ID="txtGas" runat="server" onkeydown="KeyPressMoney()" 
                            MaxLength="6" ToolTip="Enter monthly gas cost" SkinID="TextBoxAR" 
                            TabIndex="26" meta:resourcekey="txtGasResource1"></asp:TextBox>
                        </td>
                    <td>
                        <asp:RangeValidator ID="RangeValidator4" runat="server" 
                            ControlToValidate="txtWater" Display="None" 
                            ErrorMessage="Water must be a number between 0 and 1000" MaximumValue="1000" 
                            MinimumValue="0" Type="Double" SetFocusOnError="True" 
                            meta:resourcekey="RangeValidator4Resource1" 
                            ValidationGroup="vgpCalculator"></asp:RangeValidator></td>
                </tr>
               
            </table>
        </td>
        <td width=30px style="height: 396px"></td>
        <td valign=top style="height: 396px">
            <table cellpadding=5 cellspacing=7 border=0>
                 <tr>
                    <td style="width: 127px" align="right">
                        <asp:Localize runat="server" Text="Loan Term:" 
                            meta:resourcekey="LocalizeResource1"></asp:Localize></td>
                    <td style="width:100px;" align=right>
                        &nbsp;<asp:Label ID="lblLoanTerm" runat="server" Text="25 yrs" 
                            EnableViewState="False" meta:resourcekey="lblLoanTermResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 127px" align="right">
                        <asp:Localize runat="server" Text="Interest Rate:" 
                            meta:resourcekey="LocalizeResource2"></asp:Localize></td>
                    <td style="width:100px;" align=right>
                        &nbsp;<asp:Label ID="lblInterestRate" runat="server" Text="5.00%" 
                            EnableViewState="False" meta:resourcekey="lblInterestRateResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 127px" align="right">
                        <asp:Localize runat="server" Text="Total Principal:" 
                            meta:resourcekey="LocalizeResource3"></asp:Localize></td>
                    <td style="width:100px;" align=right>
                        &nbsp;<asp:Label ID="lblTotalLoan" runat="server" Text="$0.00" 
                            EnableViewState="False" meta:resourcekey="lblTotalLoanResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 127px" align="right">
                        <asp:Localize runat="server" Text="Total Interest:" 
                            meta:resourcekey="LocalizeResource4"></asp:Localize></td>
                    <td align=right style="width: 100px">
                        &nbsp;<asp:Label ID="lblTotalInterest" runat="server" Text="$0.00" 
                            EnableViewState="False" meta:resourcekey="lblTotalInterestResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 127px" align="right">
                        <asp:Localize runat="server" Text="Total Mortgage:" 
                            meta:resourcekey="LocalizeResource5"></asp:Localize></td>
                    <td align=right style="width: 100px">
                        &nbsp;<asp:Label ID="lblTotalMortgage" runat="server" Text="$0.00" 
                            EnableViewState="False" meta:resourcekey="lblTotalMortgageResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 127px" align="right">
                        <asp:Localize runat="server" Text="Monthly Principal:" 
                            meta:resourcekey="LocalizeResource6"></asp:Localize></td>
                    <td align=right style="width: 100px">
                        &nbsp;<asp:Label ID="lblMonthlyPrincipal" runat="server" Text="$0.00" 
                            EnableViewState="False" meta:resourcekey="lblMonthlyPrincipalResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 127px" align="right">
                        <asp:Localize runat="server" Text="Monthly Interest:" 
                            meta:resourcekey="LocalizeResource7"></asp:Localize></td>
                    <td align=right style="width: 100px">
                        &nbsp;<asp:Label ID="lblMonthlyInterest" runat="server" Text="$0.00" 
                            EnableViewState="False" meta:resourcekey="lblMonthlyInterestResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 127px" align="right">
                        <asp:Localize runat="server" Text="Monthly Mortgage:" 
                            meta:resourcekey="LocalizeResource8"></asp:Localize></td>
                    <td align=right style="width: 100px">
                        &nbsp;<asp:Label ID="lblMonthlyMortgage" runat="server" Text="$0.00" 
                            ForeColor="Blue" EnableViewState="False" 
                            meta:resourcekey="lblMonthlyMortgageResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 127px" align="right">
                        <asp:Localize runat="server" Text="
                        Monthly Prop. Tax:" meta:resourcekey="LocalizeResource9"></asp:Localize></td>
                    <td align=right style="width: 100px">
                        &nbsp;<asp:Label ID="lblMonthlyPropTax" runat="server" Text="$0.00" 
                            ForeColor="Blue" EnableViewState="False" 
                            meta:resourcekey="lblMonthlyPropTaxResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td nowrap=true align="right">
                        <asp:Localize runat="server" Text="Monthly Maintenance:" 
                            meta:resourcekey="LocalizeResource10"></asp:Localize></td>
                    <td align=right style="width: 100px">
                        &nbsp;<asp:Label ID="lblMonthlyHomeMaintenance" runat="server" Text="$0.00" 
                            ForeColor="Blue" EnableViewState="False" 
                            meta:resourcekey="lblMonthlyHomeMaintenanceResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan=2>
                        <hr />
                    </td>
                  </tr>
                <tr>
                    <td nowrap style="width: 127px" align="right">
                        <asp:Localize runat="server" Text="Monthly Payment:" 
                            meta:resourcekey="LocalizeResource11"></asp:Localize></td>
                    <td align=right style="width: 100px">
                        &nbsp;<asp:Label ID="lblMonthlyPayment" runat="server" Text="$0.00" 
                            ForeColor="Red" EnableViewState="False" 
                            meta:resourcekey="lblMonthlyPaymentResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan=2 align="right">
                        <span id="printExclusive">
                        <asp:button id="btnReset" runat="server" Text=" Reset " 
                            OnClick="btnReset_Click" CausesValidation="False" 
                            ToolTip="Click here to reset all values" TabIndex="28" 
                            meta:resourcekey="btnResetResource1"></asp:button>&nbsp;&nbsp;
                        <asp:Button ID="btnCalculate" runat="server" OnClick="btnCalculate_Click" 
                            Text="Calculate" ToolTip="Click here to calculate the total of monthly payment" 
                            TabIndex="30" meta:resourcekey="btnCalculateResource1" 
                            ValidationGroup="vgpCalculator" />
                        </span>
                    </td>
                  </tr>
            </table>
        </td>
        <td></td>
    </tr>
    <tr height=100px><td colspan=4></td>
    </tr>
   
</table>
    <asp:ValidationSummary ID="vldsMortgageCalculator" runat="server" 
    HeaderText="Please, correct the field(s) below:" ShowMessageBox="True" 
    ShowSummary="False" meta:resourcekey="vldsMortgageCalculatorResource1" 
         ValidationGroup="vgpCalculator" />













