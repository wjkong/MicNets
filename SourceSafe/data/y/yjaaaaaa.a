using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MicNets.Model;

namespace MicNets.Web.Controls
{
    public partial class ctlMortgageCalculator : BaseControl
    {
        // Fields
        protected Button btnCalculate;
        protected Button btnReset;
        protected DropDownList ddlInterestRate;
        protected DropDownList ddlTerm;
        private double interestRate;
        protected Label Label1;
        protected Label Label2;
        protected Label Label3;
        protected Label Label4;
        protected Label Label5;
        protected Label Label6;
        protected Label Label7;
        protected Label Label8;
        protected Label Label9;
        protected Label lblInterestRate;
        protected Label lblLoanTerm;
        protected Label lblMonthlyHomeMaintenance;
        protected Label lblMonthlyInterest;
        protected Label lblMonthlyMortgage;
        protected Label lblMonthlyPayment;
        protected Label lblMonthlyPrincipal;
        protected Label lblMonthlyPropTax;
        protected Label lblMortgageInsurance;
        protected Label lblPurchasePrice;
        protected Label lblTotalInterest;
        protected Label lblTotalLoan;
        protected Label lblTotalMortgage;
        private double monthlyMortgage;
        private const int NUM_MONTH_PER_YEAR = 12;
        protected RangeValidator RangeValidator3;
        protected RangeValidator RangeValidator4;
        private int term;
        private double totalLoan;
        private double totalMortgage;
        protected TextBox txtDownPayment;
        protected TextBox txtGas;
        protected TextBox txtHomeInsurance;
        protected TextBox txtHydro;
        protected TextBox txtInsurance;
        protected TextBox txtMaintenance;
        protected TextBox txtPrincipal;
        protected TextBox txtPropertyTax;
        protected TextBox txtWater;
        protected CompareValidator vldcDownPayment;
        protected RangeValidator vldgDownPayment;
        protected RangeValidator vldgHomeInsurance;
        protected RangeValidator vldgInsurance;
        protected RangeValidator vldgPropertyTax;
        protected RangeValidator vldgPurchasePrice;
        protected RequiredFieldValidator vldrPurchasePrice;
        protected ValidationSummary vldsMortgageCalculator;

        // Methods
        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            this.Page.Validate("vgpCalculator");
            if (this.Page.IsValid)
            {
                Helper helper = new Helper();
                TextBox[] boxArray2 = new TextBox[] { this.txtDownPayment, this.txtHomeInsurance, this.txtPropertyTax, this.txtMaintenance, this.txtHydro, this.txtWater, this.txtGas};
                for (int i = 0; i < boxArray2.Length; i++)
                {
                    if (helper.IsNullOrEmpty(boxArray2[i].Text))
                    {
                        boxArray2[i].Text = "0.00";
                    }
                }
                this.txtInsurance.Text = this.CalculateInsurance().ToString();
                this.interestRate = Convert.ToDouble(this.ddlInterestRate.SelectedValue) / 100.0;
                this.totalLoan = (Convert.ToDouble(this.txtPrincipal.Text.Trim()) + Convert.ToDouble(this.txtInsurance.Text.Trim())) - Convert.ToDouble(this.txtDownPayment.Text.Trim());
                this.term = Convert.ToInt32(this.ddlTerm.SelectedValue) * 12;
                this.interestRate /= 12.0;
                double num3 = Convert.ToDouble(Math.Pow(this.interestRate + 1.0, Convert.ToDouble(this.term)));
                this.totalMortgage = this.totalLoan * num3;
                this.monthlyMortgage = (this.totalMortgage * this.interestRate) / (num3 - 1.0);
                double num4 = (((Convert.ToDouble(this.txtHomeInsurance.Text.Trim()) + Convert.ToDouble(this.txtMaintenance.Text.Trim())) + Convert.ToDouble(this.txtHydro.Text.Trim())) + Convert.ToDouble(this.txtWater.Text.Trim())) + Convert.ToDouble(this.txtGas.Text.Trim());
                double num5 = Convert.ToDouble(this.txtPropertyTax.Text.Trim()) / 12.0;
                this.totalMortgage = this.monthlyMortgage * this.term;
                this.lblTotalMortgage.Text = string.Format("{0:c}", this.totalMortgage);
                this.lblTotalLoan.Text = string.Format("{0:c}", this.totalLoan);
                this.lblTotalInterest.Text = string.Format("{0:c}", this.totalMortgage - this.totalLoan);
                this.lblMonthlyMortgage.Text = string.Format("{0:c}", this.monthlyMortgage);
                this.lblMonthlyPrincipal.Text = string.Format("{0:c}", this.totalLoan / ((double)this.term));
                this.lblMonthlyInterest.Text = string.Format("{0:c}", (this.totalMortgage - this.totalLoan) / ((double)this.term));
                this.lblMonthlyHomeMaintenance.Text = string.Format("{0:c}", num4);
                this.lblMonthlyPropTax.Text = string.Format("{0:c}", num5);
                this.lblMonthlyPayment.Text = string.Format("{0:c}", (num5 + num4) + this.monthlyMortgage);
                this.lblInterestRate.Text = this.ddlInterestRate.SelectedValue + "%";
                this.lblLoanTerm.Text = this.ddlTerm.SelectedValue + " yrs";
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            base.Server.Transfer("mortgage-calculator.aspx");
        }

        private double CalculateInsurance()
        {
            double num = Convert.ToDouble(this.txtPrincipal.Text.Trim());
            double num2 = Convert.ToDouble(this.txtDownPayment.Text.Trim());
            Helper helper = new Helper();
            if (helper.IsNullOrEmpty(num))
            {
                num = 0.0;
            }
            if (helper.IsNullOrEmpty(num2))
            {
                num2 = 0.0;
            }
            double premiumRate = this.GetPremiumRate(num, num2);
            return (Math.Round((double)(((num - num2) * premiumRate) * 100.0)) / 100.0);
        }

        private double GetPremiumRate(double purchasePrice, double downPayment)
        {
            double num = downPayment / purchasePrice;
            if (num > 0.35)
            {
                return 0.0;
            }
            if (num == 0.35)
            {
                return 0.005;
            }
            if ((num >= 0.25) && (num < 0.35))
            {
                return 0.065;
            }
            if ((num >= 0.2) && (num < 0.25))
            {
                return 0.01;
            }
            if ((num >= 0.15) && (num < 0.2))
            {
                return 0.0175;
            }
            if ((num >= 0.1) && (num < 0.15))
            {
                return 0.02;
            }
            if ((num >= 0.05) && (num < 0.1))
            {
                return 0.0295;
            }
            return 0.031;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.Page.SetFocus(this.txtPrincipal);
                this.lblInterestRate.Text = this.ddlInterestRate.SelectedValue + "%";
                this.lblLoanTerm.Text = this.ddlTerm.SelectedValue + " yrs";
            }
            
            ScriptManager.RegisterHiddenField(this, "hidPrefix", this.oHelper.GetPrefix(this.txtPrincipal));
        }

      
    }
}