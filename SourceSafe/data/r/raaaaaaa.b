using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using MicNets.DAL;

namespace MicNets.BizLogic
{
    public class Link
    {
        // Fields
        protected LinkInfo info = new LinkInfo();

        // Methods
        public bool Add()
        {
            LinkDAC dao = new LinkDAC(this.info);
            return (dao.InsertOne() >= Utility.ONE_ROW_AFFECTED);
        }

        public bool CanUserAccess()
        {
            LinkDAC dao = new LinkDAC(this.info);
            return dao.CheckUserAccess();
        }

        public DataSet LoadAll()
        {
            LinkDAC dao = new LinkDAC(this.info);
            return dao.SelectAll();
        }

        public bool Modify()
        {
            LinkDAC dao = new LinkDAC(this.info);
            return (dao.UpdateOne() >= Utility.ONE_ROW_AFFECTED);
        }

        public bool ModifyALL()
        {
            LinkDAC dao = new LinkDAC(this.info);
            return (dao.UpdateAll() >= Utility.ONE_ROW_AFFECTED);
        }

        public bool Remove()
        {
            LinkDAC dao = new LinkDAC(this.info);
            return (dao.DeleteOne() >= Utility.ONE_ROW_AFFECTED);
        }

        // Properties
        public LinkInfo Info
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
