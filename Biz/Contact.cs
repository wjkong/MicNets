using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MicNets.Model;
using MicNets.DAL;
using MicNets.Model.DataSets;

namespace MicNets.BizLogic
{
    public class Contact : ContactInfo
    {
        // Methods
        public Contact()
        {
        }

        public Contact(ContactInfo info)
            : base(info)
        {
        }

        public bool AddOne()
        {
            ContactDAC dao = new ContactDAC(this);
            return (dao.InsertOne() == Utility.ONE_ROW_AFFECTED);
        }

        public bool Load()
        {
            ContactDAC info = new ContactDAC(this);
            if (info.SelectOne())
            {
                base.Clone(info);
                return true;
            }
            return false;
        }

        public DataTable LoadAll()
        {
            ContactDAC dao = new ContactDAC(this);
            return dao.SelectAll();
        }

        public void LoadAll(DSContact dsContact)
        {
            ContactDAC dao = new ContactDAC(this);
            dao.SelectAll(dsContact);
        }

        public bool Modify()
        {
            ContactDAC dao = new ContactDAC(this);
            return (dao.UpdateOne() == Utility.ONE_ROW_AFFECTED);
        }

        public bool Remove()
        {
            ContactDAC dao = new ContactDAC(this);
            return (dao.DeleteOne() == Utility.ONE_ROW_AFFECTED);
        }
    }

 

}
