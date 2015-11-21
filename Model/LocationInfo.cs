using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace MicNets.Model
{
    public class LocationInfo
    {
        // Fields
        private int _cityID;
        private int _countryID;
        private int _provinceID;

        // Methods
        public LocationInfo()
        {
        }

        public LocationInfo(LocationInfo info)
        {
            this.Clone(info);
        }

        public void Clone(LocationInfo info)
        {
            foreach (PropertyInfo info2 in base.GetType().GetProperties())
            {
                info2.SetValue(this, info2.GetValue(info, null), null);
            }
        }

        // Properties
        public int CityID
        {
            get
            {
                return this._cityID;
            }
            set
            {
                this._cityID = value;
            }
        }

        public int CountryID
        {
            get
            {
                return this._countryID;
            }
            set
            {
                this._countryID = value;
            }
        }

        public int ProvinceID
        {
            get
            {
                return this._provinceID;
            }
            set
            {
                this._provinceID = value;
            }
        }
    }
}
