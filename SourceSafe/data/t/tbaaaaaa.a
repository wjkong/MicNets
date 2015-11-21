using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace MicNets.Model
{
    public class BussinessInfo
    {
        // Fields
        private string _email;
        private string _phone;
        private string _URL;

        // Methods
        public BussinessInfo()
        {
        }

        public BussinessInfo(BussinessInfo info)
        {
            this.Clone(info);
        }

        public void Clone(BussinessInfo info)
        {
            foreach (PropertyInfo info2 in base.GetType().GetProperties())
            {
                info2.SetValue(this, info2.GetValue(info, null), null);
            }
        }

        // Properties
        public string Email
        {
            get
            {
                return this._email;
            }
            set
            {
                this._email = value;
            }
        }

        public string Phone
        {
            get
            {
                return this._phone;
            }
            set
            {
                this._phone = value;
            }
        }

        public string URL
        {
            get
            {
                return this._URL;
            }
            set
            {
                this._URL = value;
            }
        }
    }
}
