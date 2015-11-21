<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mortgage-calculator.aspx.cs" Inherits="MicNets.Web.Blog.MortgageCalculator" title="Free Morgage Calculator Instant Precise Result Budget"  %>

<%@ Register Src="../Controls/ctlMortgageCalculator.ascx" TagName="ctlMortgageCalculator"
    TagPrefix="uc2" %>
<%@ Register Src="../Controls/ctlToolBar.ascx" TagName="ctlToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
<fieldset>
    <legend>
        <h1 Class="title"><asp:Label id="lblMortgageCalculator" runat="server" Text="Mortgage Calculator"></asp:Label></h1>
    </legend>
      <div class="row" align=right runat=server id="FunctionBar">
            <uc1:ctlToolBar ID="CtlToolBar1" runat="server" />
      </div>
      <div class="row" id="printingArea">
          <uc2:ctlMortgageCalculator id="MortgageCalculator1" runat="server">
          </uc2:ctlMortgageCalculator></div>
      <div class="row" align=center id="printExclusive">
            <A HREF="https://www.paypal.com/ca/mrb/pal=DDTAPUCXSSAD4" target="_blank"><IMG  SRC="http://images.paypal.com/en_US/i/bnr/paypal_mrb_banner.gif" BORDER="0" ALT="Sign up for PayPal and start accepting credit card payments instantly."></A>
      </div>
</fieldset>
</asp:Content>