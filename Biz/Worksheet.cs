using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;

namespace MicNets.BizLogic
{
    public class Worksheet
    {
        public WorksheetInfo Info { get; set; }

        public Worksheet(WorksheetInfo info)
        {
            this.Info = info;
        }

        public void PerformCalculation()
        {
            Info.MortgageInsurance = CalculateMortgageInsurance();
            Info.SubTotal = Info.CashPrice - Info.DownPayment + Info.MortgageInsurance;
            Info.GST = CalculateGST();
            Info.PST = Info.SubTotal * 0.05m;
            Info.TotalAmountFinanced = Info.SubTotal + Info.GST + Info.PST;
            Info.TotalMonthlyPayment = CalculateTotalMonthlyPayment();
        }

        private decimal CalculateTotalMonthlyPayment()
        {
            decimal installmentPayment = 0;

            if (Info.AmortizationPeriod > 0 && Info.Term > 0)
            {
                if (Info.APR == decimal.Zero)
                {
                    installmentPayment = Info.TotalAmountFinanced / (Info.AmortizationPeriod * 12);
                }
                else
                {
                    decimal interestPerPeriod = Info.APR * 0.01m / 12;

                    installmentPayment = (Info.TotalAmountFinanced * interestPerPeriod) / (decimal)(1 - Math.Pow((double)(1 + interestPerPeriod), (double)(-Info.AmortizationPeriod * 12)));
                }
            }

            return installmentPayment;
        }

        private decimal CalculateGST()
        {
            if (Info.GSTExempt)
                return decimal.Zero;
            else
                return Info.SubTotal * 0.05m;
        }

        public decimal CalculateMortgageInsurance()
        {
            decimal mortgageInsurance = decimal.Zero;

            if (Info.CashPrice <= decimal.Zero)
                return mortgageInsurance;

            decimal premiumRate = decimal.Zero;
            decimal percentage = Info.DownPayment / Info.CashPrice;

            if (percentage > 0.35m)
                premiumRate = decimal.Zero;
            else if (percentage == 0.35m)
                premiumRate = 0.005m;
            else if (percentage >= 0.25m && percentage < 0.35m)
                premiumRate = 0.065m;
            else if (percentage >= 0.20m && percentage < 0.25m)
                premiumRate = 0.01m;
            else if (percentage >= 0.15m && percentage < 0.20m)
                premiumRate = 0.0175m;
            else if (percentage >= 0.10m && percentage < 0.15m)
                premiumRate = 0.02m;
            else if (percentage >= 0.05m && percentage < 0.10m)
                premiumRate = 0.0295m;
            else
                premiumRate = 0.031m;

            mortgageInsurance = Math.Round((Info.CashPrice - Info.DownPayment) * premiumRate, 2);

            return mortgageInsurance;
        }
    }
}
