<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="universal-metric-convertor.aspx.cs" Inherits="MicNets.Web.Blog.universal_metric_convertor" title="Universal Metric Converter" MasterPageFile="~/Blog/Blog.Master" meta:resourcekey="PageResource1"%>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<script type="text/javascript" src="../Scripts/MicNets.js"></script>
<script type="text/javascript">
    var prefix = document.getElementById("hidPrefix").value;
    setInterval("FahrenheitTOCelsius();CelsiusTOFahrenheit();MileToKilometer();KilometerToMile();MeterToFeet();FeetToMeter()", 1000);
    function MileToKilometer()
    {
        var mile = new Number(document.getElementById(prefix + "txtMileSource").value);
        var kilometer = mile * 1.609344;
        document.getElementById(prefix + "txtKilometerResult").value = FormatNumber(kilometer, 2); 
    }

    function KilometerToMile()
    {
        var kilometer = new Number(document.getElementById(prefix + "txtKilometerSource").value);
        var mile = kilometer / 1.609344;
        document.getElementById(prefix + "txtMileResult").value = FormatNumber(mile, 2);    
    }

    function FahrenheitTOCelsius()
    {
        var DegreeF = new Number(document.getElementById(prefix + "txtFahrenheitSource").value);
        var DegreeC = (DegreeF - 32) * 5 / 9;
        document.getElementById(prefix + "txtCelciusResult").value =  FormatNumber(DegreeC, 2);
    }

    function CelsiusTOFahrenheit()
    {
        var DegreeC = new Number(document.getElementById(prefix + "txtCelciusSource").value);
        var DegreeF = DegreeC * 9 / 5 + 32;
        document.getElementById(prefix + "txtFahrenheitResult").value = FormatNumber(DegreeF, 2);
    }

    function MeterToFeet()
    {
        var Meter = new Number(document.getElementById(prefix + "txtMeterSource").value);
        var Feet = Meter * 3.28;
        document.getElementById(prefix + "txtFeetResult").value = FormatNumber(Feet, 2); 
    }

    function FeetToMeter()
    {
        var Feet = new Number(document.getElementById(prefix + "txtFeetSource").value);
        var Meter = Feet / 3.28;

        document.getElementById(prefix + "txtMeterResult").value = FormatNumber(Meter, 2);    
    }
</script>
<fieldset>
    <legend>
        <h1 Class="title"><asp:Localize runat="server" 
                meta:resourcekey="LocalizeResource10" Text="Universal Metric Convertor"></asp:Localize></h1>
    </legend>
    <div class="row">
        <table cellpadding=0 cellspacing=0>
            <tr>
                <td colspan=3>
                    <h5><asp:Localize runat="server" meta:resourcekey="LocalizeResource1" 
                            Text="1. Fahrenheit Exchange Celsius"></asp:Localize></h5>
                </td>
            </tr>
            <tr>
                <td>
                <ajaxToolkit:SliderExtender ID="sldFahrenheitToCelcius" runat="server" 
                        BehaviorID="TextBox1" TargetControlID="TextBox1" 
                        BoundControlID="txtFahrenheitSource"  Maximum=132 Minimum=0 
                        EnableHandleAnimation=True TooltipText="{0} °F" Decimals=1 Enabled="True">
                    </ajaxToolkit:SliderExtender>
                    <p>
                        <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        <asp:TextBox ID="txtFahrenheitSource" runat="server" Width=30px MaxLength="5" 
                            SkinID="TextBoxAR" ToolTip="Enter F degree here" 
                            meta:resourcekey="txtFahrenheitSourceResource1" onkeypress="KeyPressMoney()"></asp:TextBox>&nbsp;<asp:Localize
                            ID="Localize2" runat="server" meta:resourcekey="Localize2Resource1" 
                            Text="°F"></asp:Localize>
                        &nbsp; &nbsp; = &nbsp; &nbsp;
                        <asp:TextBox ID="txtCelciusResult" runat="server" Width=40px ReadOnly=True 
                            SkinID="TextBoxReadOnly" meta:resourcekey="txtCelciusResultResource1"></asp:TextBox>&nbsp;<asp:Localize
                            ID="Localize1" runat="server" meta:resourcekey="Localize1Resource1" 
                            Text="°C"></asp:Localize>
                     </p>
                     <p>
                        <asp:Localize runat="server" meta:resourcekey="LocalizeResource2" 
                             Text="Formula: Tc = (5 / 9) * (Tf - 32)"></asp:Localize>
                     </p>
                </td>
                <td rowspan=6 style="width:50px"><br /></td>
                <td><ajaxToolkit:SliderExtender ID="sldCelciusToFahrenheit" runat="server" 
                        BehaviorID="TextBox4" TargetControlID="TextBox4" 
                        BoundControlID="txtCelciusSource"  Maximum=50 Minimum=-30 
                        EnableHandleAnimation=True TooltipText="{0} °C" Decimals=1 Enabled="True" >
                    </ajaxToolkit:SliderExtender>
                    <p>
                        <asp:TextBox ID="TextBox4" runat="server" meta:resourcekey="TextBox4Resource1"></asp:TextBox>
                        <asp:TextBox ID="txtCelciusSource" runat="server" Width=30px MaxLength="5" 
                            SkinID="TextBoxAR" ValidationGroup="Enter Celcus degree here" 
                            meta:resourcekey="txtCelciusSourceResource1" onkeypress="KeyPressMoney()"></asp:TextBox>&nbsp;<asp:Localize
                            ID="Localize3" runat="server" meta:resourcekey="Localize3Resource1" 
                            Text="°C"></asp:Localize>
                        &nbsp; &nbsp; = &nbsp; &nbsp;
                        <asp:TextBox ID="txtFahrenheitResult" runat="server" Width=40px ReadOnly=True 
                            SkinID="TextBoxReadOnly" meta:resourcekey="txtFahrenheitResultResource1"></asp:TextBox>&nbsp;<asp:Localize 
                            ID="Localize4" runat="server" meta:resourcekey="Localize4Resource1" Text="°F"></asp:Localize>
                     </p>
                     <p>
                        <asp:Localize runat="server" meta:resourcekey="LocalizeResource3" 
                             Text="Formula: Tf = ( 9 / 5) * Tc + 32"></asp:Localize>
                     </p>
                </td>
            </tr>
            <tr>
                <td colspan=3>
                    <br />
                    <h5><asp:Localize runat="server" meta:resourcekey="LocalizeResource4" Text="2. Mile Exchange Kilometer"></asp:Localize></h5>
                </td>
            </tr>
               <tr>
                <td><ajaxToolkit:SliderExtender ID="SliderExtender3" runat="server" 
                        BehaviorID="TextBox7" TargetControlID="TextBox7" 
                        BoundControlID="txtMileSource"  Maximum=180 Minimum=0 
                        EnableHandleAnimation=True TooltipText="{0} Miles" Enabled="True" >
                    </ajaxToolkit:SliderExtender>
                    <br />
                    <p>
                        <asp:TextBox ID="TextBox7" runat="server" meta:resourcekey="TextBox7Resource1"></asp:TextBox>
                        <asp:TextBox ID="txtMileSource" runat="server" Width=30px MaxLength="4" 
                            SkinID="TextBoxAR" ToolTip="Enter miles here" 
                            meta:resourcekey="txtMileSourceResource1" onkeypress="KeyPressNumbers()"></asp:TextBox>&nbsp;<asp:Localize
                            ID="Localize5" runat="server" meta:resourcekey="Localize5Resource1" 
                            Text="Miles"></asp:Localize>
                        &nbsp; &nbsp; = &nbsp; &nbsp;
                        <asp:TextBox ID="txtKilometerResult" runat="server" Width=40px ReadOnly=True 
                            SkinID="TextBoxReadOnly" meta:resourcekey="txtKilometerResultResource1"></asp:TextBox>&nbsp;<asp:Localize
                            ID="Localize6" runat="server" meta:resourcekey="Localize6Resource1" 
                            Text="KMs"></asp:Localize>
                     </p>
                     <p>
                        <asp:Localize runat="server" meta:resourcekey="LocalizeResource5" 
                             Text="Formula: Kilometer =  Mile * 1.609344"></asp:Localize>
                     </p>
                </td>
                <td><ajaxToolkit:SliderExtender ID="SliderExtender4" runat="server" 
                        BehaviorID="TextBox10" TargetControlID="TextBox10" 
                        BoundControlID="txtKilometerSource"  Maximum=200 Minimum=0 
                        EnableHandleAnimation=True TooltipText="{0} Kilometer" Enabled="True" >
                    </ajaxToolkit:SliderExtender>
                    <br />
                    <p>
                        <asp:TextBox ID="TextBox10" runat="server" 
                            meta:resourcekey="TextBox10Resource1"></asp:TextBox>
                        <asp:TextBox ID="txtKilometerSource" runat="server" Width=30px MaxLength="4" 
                            SkinID="TextBoxAR" ToolTip="Enter Kilometers here" 
                            meta:resourcekey="txtKilometerSourceResource1" onkeypress="KeyPressNumbers()"></asp:TextBox>&nbsp;<asp:Localize
                            ID="Localize7" runat="server" meta:resourcekey="Localize7Resource1" 
                            Text="KMs"></asp:Localize>
                        &nbsp; &nbsp; = &nbsp; &nbsp;
                        <asp:TextBox ID="txtMileResult" runat="server" Width=40px ReadOnly=True 
                            meta:resourcekey="txtMileResultResource1" SkinID="TextBoxReadOnly"></asp:TextBox>&nbsp;<asp:Localize
                            ID="Localize8" runat="server" meta:resourcekey="Localize8Resource1" 
                            Text="Miles"></asp:Localize>
                     </p>
                     <p>
                        <asp:Localize runat="server" meta:resourcekey="LocalizeResource6" 
                             Text="Formula: Mile = Kilometer / 1.609344"></asp:Localize>
                     </p>
                </td>
            </tr>
         
              <tr>
                <td colspan=3>
                    <br />
                    <h5><asp:Localize runat="server" meta:resourcekey="LocalizeResource7" 
                            Text="3. Meter Exchange Feet"></asp:Localize></h5>
                </td>
            </tr>
              <tr>
                <td><ajaxToolkit:SliderExtender ID="SliderExtender5" runat="server" 
                        BehaviorID="TextBox8" TargetControlID="TextBox8" 
                        BoundControlID="txtMeterSource"  Maximum=100 Minimum=0 
                        EnableHandleAnimation=True TooltipText="{0} M" Decimals=2 Enabled="True" >
                    </ajaxToolkit:SliderExtender>
                    <br />
                    <p>
                        <asp:TextBox ID="TextBox8" runat="server" meta:resourcekey="TextBox8Resource1"></asp:TextBox>
                        <asp:TextBox ID="txtMeterSource" runat="server" Width=30px MaxLength="7" 
                            SkinID="TextBoxAR" ToolTip="Enter meters here" 
                            meta:resourcekey="txtMeterSourceResource1" onkeypress="KeyPressMoney()"></asp:TextBox>&nbsp;<asp:Localize
                            ID="Localize9" runat="server" meta:resourcekey="Localize9Resource1" 
                            Text="Meter"></asp:Localize>
                        &nbsp; &nbsp; = &nbsp; &nbsp;
                        <asp:TextBox ID="txtFeetResult" runat="server" Width=40px ReadOnly=True 
                            SkinID="TextBoxReadOnly" meta:resourcekey="txtFeetResultResource1"></asp:TextBox>&nbsp;<asp:Localize
                            ID="Localize10" runat="server" meta:resourcekey="Localize10Resource1" 
                            Text="Feet"></asp:Localize>
                     </p>
                     <p>
                        <asp:Localize runat="server" meta:resourcekey="LocalizeResource8" 
                             Text="Formula: Feet =  Meter * 3.28"></asp:Localize>
                     </p>
                </td>
                <td><ajaxToolkit:SliderExtender ID="SliderExtender6" runat="server" 
                        BehaviorID="TextBox12" TargetControlID="TextBox12" 
                        BoundControlID="txtFeetSource"  Maximum=100 Minimum=0 
                        EnableHandleAnimation=True TooltipText="{0} Feet" Decimals=2 Enabled="True" >
                    </ajaxToolkit:SliderExtender>
                    <br />
                    <p>
                        <asp:TextBox ID="TextBox12" runat="server" 
                            meta:resourcekey="TextBox12Resource1"></asp:TextBox>
                        <asp:TextBox ID="txtFeetSource" runat="server" Width=30px MaxLength="7" 
                            SkinID="TextBoxAR" ToolTip="Enter feet here" 
                            meta:resourcekey="txtFeetSourceResource1" onkeypress="KeyPressMoney()"></asp:TextBox>&nbsp;<asp:Localize
                            ID="Localize11" runat="server" meta:resourcekey="Localize11Resource1" 
                            Text="Feet"></asp:Localize>
                        &nbsp; &nbsp; = &nbsp; &nbsp;
                        <asp:TextBox ID="txtMeterResult" runat="server" Width=40px ReadOnly=True 
                            SkinID="TextBoxReadOnly" meta:resourcekey="txtMeterResultResource1"></asp:TextBox>&nbsp; 
                        <asp:Localize ID="Localize12" runat="server" 
                            meta:resourcekey="Localize12Resource1" Text="Meter"></asp:Localize>
                     </p>
                     <p>
                        <asp:Localize runat="server" meta:resourcekey="LocalizeResource9" 
                             Text="Formula: Mile = Kilometer / 1.609344"></asp:Localize>
                     </p>
                </td>
            </tr>
        </table>
    </div>
</fieldset>

    <asp:HiddenField ID="hidPrefix" runat="server" />
</asp:Content>

