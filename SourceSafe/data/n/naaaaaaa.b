using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using MicNets.DAL;

namespace MicNets.BizLogic
{
    [Serializable]
    public class Customer
    {
        // Fields
        protected CustomerInfo info = new CustomerInfo();

        // Methods
        public bool Add()
        {
            CustomerDAC rdac = new CustomerDAC(this.info);
            return (rdac.InsertOne() >= Utility.ONE_ROW_AFFECTED);
        }

        public bool Load()
        {
            CustomerDAC rdac = new CustomerDAC(this.info);
            return rdac.SelectOne();
        }

        public DataSet LoadAll()
        {
            CustomerDAC rdac = new CustomerDAC(this.info);
            return rdac.SelectAll();
        }

        public bool LoadOneByEmail()
        {
            this.info.CurrentTask = NTaskCustomer.LoadByEmail;
            CustomerDAC rdac = new CustomerDAC(this.info);
            return rdac.SelectOne();
        }

        public bool Login()
        {
            CustomerDAC rdac = new CustomerDAC(this.info);
            return rdac.LoginDAC();
        }

        public bool Modify(CustomerInfo oCustInfo)
        {
            CustomerDAC rdac = new CustomerDAC(oCustInfo);
            return (rdac.UpdateOne() >= Utility.ONE_ROW_AFFECTED);
        }

        public bool ModifyPwd()
        {
            CustomerDAC rdac = new CustomerDAC(this.info);
            return (rdac.UpdatePwd() >= Utility.ONE_ROW_AFFECTED);
        }

        public bool Remove(CustomerInfo oCustInfo)
        {
            CustomerDAC rdac = new CustomerDAC(oCustInfo);
            return (rdac.DeleteOne() >= Utility.ONE_ROW_AFFECTED);
        }

        public void RemoveAllActive()
        {
            new CustomerDAC().DeleteAllActive();
        }

        // Properties
        public CustomerInfo Info
        {
            get
            {
                return this.info;
            }
            set
            {
                this.info = value;
            }
        }
    }
}
