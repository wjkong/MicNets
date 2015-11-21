using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace MicNets.Model
{
    public class ContactInfo
    {
        // Fields
        private string _cellPhone;
        private int _contactID;
        private string _email;
        private string _firstName;
        private bool _isFromChina;
        private bool _isPopup;
        private string _lastName;
        private string _phone;

        // Methods
        public ContactInfo()
        {
        }

        public ContactInfo(ContactInfo info)
        {
            this.Clone(info);
        }

        public void Clone(ContactInfo info)
        {
            foreach (PropertyInfo info2 in base.GetType().GetProperties())
            {
                info2.SetValue(this, info2.GetValue(info, null), null);
            }
        }

        // Properties
        public string CellPhone
        {
            get
            {
                return this._cellPhone;
            }
            set
            {
                this._cellPhone = value;
            }
        }

        public int ContactID
        {
            get
            {
                return this._contactID;
            }
            set
            {
                this._contactID = value;
            }
        }

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

        public string FirstName
        {
            get
            {
                return this._firstName;
            }
            set
            {
                this._firstName = value;
            }
        }

        public bool IsFromChina
        {
            get
            {
                return this._isFromChina;
            }
            set
            {
                this._isFromChina = value;
            }
        }

        public bool IsPopup
        {
            get
            {
                return this._isPopup;
            }
            set
            {
                this._isPopup = value;
            }
        }

        public string LastName
        {
            get
            {
                return this._lastName;
            }
            set
            {
                this._lastName = value;
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
    }
}
