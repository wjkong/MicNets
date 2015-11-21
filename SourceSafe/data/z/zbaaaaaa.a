using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace MicNets.Model
{
    public class ItemInfo
    {
        // Fields
        private string _address;
        private int _categoryID;
        private string _city;
        private int _cityID;
        private string _contactEmail;
        private string _contactPhone;
        private int _custID;
        private string _description;
        private DateTime _expiredDate;
        private int _ID;
        private string _imgFile;
        private string _intersaction1;
        private string _intersaction2;
        private string _name;
        private byte[] _picture;
        private DateTime _postedDate;
        private decimal _price;
        private byte[] _thumbnail;

        // Methods
        public ItemInfo()
        {
        }

        public ItemInfo(ItemInfo info)
        {
            this.Clone(info);
        }

        public void Clone(ItemInfo info)
        {
            foreach (PropertyInfo info2 in base.GetType().GetProperties())
            {
                info2.SetValue(this, info2.GetValue(info, null), null);
            }
        }

        // Properties
        public string Address
        {
            get
            {
                return this._address;
            }
            set
            {
                this._address = value;
            }
        }

        public int CategoryID
        {
            get
            {
                return this._categoryID;
            }
            set
            {
                this._categoryID = value;
            }
        }

        public string City
        {
            get
            {
                return this._city;
            }
            set
            {
                this._city = value;
            }
        }

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

        public string ContactEmail
        {
            get
            {
                return this._contactEmail;
            }
            set
            {
                this._contactEmail = value;
            }
        }

        public string ContactPhone
        {
            get
            {
                return this._contactPhone;
            }
            set
            {
                this._contactPhone = value;
            }
        }

        public int CustID
        {
            get
            {
                return this._custID;
            }
            set
            {
                this._custID = value;
            }
        }

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

        public DateTime ExpiredDate
        {
            get
            {
                return this._expiredDate;
            }
            set
            {
                this._expiredDate = value;
            }
        }

        public int ID
        {
            get
            {
                return this._ID;
            }
            set
            {
                this._ID = value;
            }
        }

        public string ImgFile
        {
            get
            {
                return this._imgFile;
            }
            set
            {
                this._imgFile = value;
            }
        }

        public string Intersaction1
        {
            get
            {
                return this._intersaction1;
            }
            set
            {
                this._intersaction1 = value;
            }
        }

        public string Intersaction2
        {
            get
            {
                return this._intersaction2;
            }
            set
            {
                this._intersaction2 = value;
            }
        }

        public string Name
        {
            get
            {
                return this._name;
            }
            set
            {
                this._name = value;
            }
        }

        public byte[] Picture
        {
            get
            {
                return this._picture;
            }
            set
            {
                this._picture = value;
            }
        }

        public DateTime PostedDate
        {
            get
            {
                return this._postedDate;
            }
            set
            {
                this._postedDate = value;
            }
        }

        public decimal Price
        {
            get
            {
                return this._price;
            }
            set
            {
                this._price = value;
            }
        }

        public byte[] Thumbnail
        {
            get
            {
                return this._thumbnail;
            }
            set
            {
                this._thumbnail = value;
            }
        }
    }


}
