using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MicNets.BizLogic.Accounts;


namespace MicNets.Web
{
    public class Initi
    {
        public Initi()
        {
            Dictionary<NAccountType, Account> accountCollection = new Dictionary<NAccountType, Account>();

            accountCollection.Add(NAccountType.CheckingAccount, new CheckingAccount());
            accountCollection.Add(NAccountType.SavingAccount, new SavingAccount());
            //accountCollection.Add(NAccountType.Visa, new Account());

            HttpContext.Current.Cache["AccountCollection"] = accountCollection;
        }
    }
}
