using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MicNets.BizLogic.Accounts
{
    public partial class BankAccount : Account, IBankAccount
    {
        public override string GetClassName()
        {
            return "BankAccount";
        }

        public decimal Deposit(decimal amount)
        {
            return Balance + amount;
        }

        public decimal Withdraw(decimal amount)
        {
            return Balance - amount;
        }
    }
}
