using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model.Validator;
using System.Reflection;

namespace MicNets.Model
{
    public class PropertiesInfo
    {
        // Fields
        private DateTime _datePurchased;
        private string _description;
        private bool _hasReceipt;
        private string _placePurchased;
        private decimal _pricePurchased;
        private int _PropertyID;
        private string _SKU;

        // Methods
        public PropertiesInfo()
        {
        }

        public PropertiesInfo(PropertiesInfo info)
        {
            this.Clone(info);
        }

        public void Clone(PropertiesInfo info)
        {
            foreach (PropertyInfo info2 in base.GetType().GetProperties())
            {
                info2.SetValue(this, info2.GetValue(info, null), null);
            }
        }

        // Properties
        [RangeValidator(typeof(DateTime))]
        public DateTime DatePurchased
        {
            get
            {
                return this._datePurchased;
            }
            set
            {
                this._datePurchased = value;
            }
        }

        [RequiredValidator]
        public string Description
        {
            get
            {
                return this._description;
            }
            set
            {
                this._description = value;
            }
        }

        [RequiredValidator]
        public bool HasReceipt
        {
            get
            {
                return this._hasReceipt;
            }
            set
            {
                this._hasReceipt = value;
            }
        }

        public string PlacePurchased
        {
            get
            {
                return this._placePurchased;
            }
            set
            {
                this._placePurchased = value;
            }
        }

        [RangeValidator(typeof(decimal), 0.0, 999999.99)]
        public decimal PricePurchased
        {
            get
            {
                return this._pricePurchased;
            }
            set
            {
                this._pricePurchased = value;
            }
        }

        public int PropertyID
        {
            get
            {
                return this._PropertyID;
            }
            set
            {
                this._PropertyID = value;
            }
        }

        [RequiredValidator]
        public string SKU
        {
            get
            {
                return this._SKU;
            }
            set
            {
                this._SKU = value;
            }
        }
    }


}
