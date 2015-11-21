using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using MicNets.DAL;

namespace MicNets.BizLogic
{
    public class Location : LocationInfo
    {
        // Fields
        private LocationDAC dao;

        // Methods
        public Location()
        {
        }

        public Location(LocationInfo info)
            : base(info)
        {
        }

        public bool AddOne()
        {
            this.dao = new LocationDAC(this);
            return (this.dao.InsertOne() >= Utility.ONE_ROW_AFFECTED);
        }

        public DataSet LoadAll()
        {
            this.dao = new LocationDAC(this);
            return this.dao.SelectAll();
        }

        public DataSet LoadAllCityByProvinceID()
        {
            this.dao = new LocationDAC(this);
            return this.dao.SelectAllCityByProvinceID();
        }
    }


}
