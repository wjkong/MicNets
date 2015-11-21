using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using MicNets.DAL;

namespace MicNets.BizLogic
{
    public class Property : PropertiesInfo
    {
        // Methods
        public Property()
        {
        }

        public Property(PropertiesInfo info)
            : base(info)
        {
        }

        public bool AddOne()
        {
            PropertyDAC ydac = new PropertyDAC(this);
            return (ydac.InsertOne() == Utility.ONE_ROW_AFFECTED);
        }

        public bool Load()
        {
            PropertyDAC info = new PropertyDAC(this);
            if (info.SelectOne())
            {
                base.Clone(info);
                return true;
            }
            return false;
        }

        public DataTable LoadAll()
        {
            PropertyDAC ydac = new PropertyDAC(this);
            return ydac.SelectAll();
        }

        public bool Modify()
        {
            PropertyDAC ydac = new PropertyDAC(this);
            return (ydac.UpdateOne() == Utility.ONE_ROW_AFFECTED);
        }

        public bool Remove()
        {
            PropertyDAC ydac = new PropertyDAC(this);
            return (ydac.DeleteOne() == Utility.ONE_ROW_AFFECTED);
        }
    }


}
