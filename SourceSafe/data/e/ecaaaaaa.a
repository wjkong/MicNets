using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace MicNets.Model
{
    public class PhotoInfo
    {
        // Fields
        private DateTime _dateTaken;
        private string _description;
        private int _maxPageIndex;
        private int _pageIndex;
        private int _pageSize;
        private int _photoID;

        // Methods
        public PhotoInfo()
        {
        }

        public PhotoInfo(PhotoInfo info)
        {
            this.Clone(info);
        }

        public void Clone(PhotoInfo info)
        {
            foreach (PropertyInfo info2 in base.GetType().GetProperties())
            {
                info2.SetValue(this, info2.GetValue(info, null), null);
            }
        }

        // Properties
        public DateTime DateTaken
        {
            get
            {
                return this._dateTaken;
            }
            set
            {
                this._dateTaken = value;
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

        public int MaxPageIndex
        {
            get
            {
                return this._maxPageIndex;
            }
            set
            {
                this._maxPageIndex = value;
            }
        }

        public int PageIndex
        {
            get
            {
                return this._pageIndex;
            }
            set
            {
                this._pageIndex = value;
            }
        }

        public int PageSize
        {
            get
            {
                return this._pageSize;
            }
            set
            {
                this._pageSize = value;
            }
        }

        public int PhotoID
        {
            get
            {
                return this._photoID;
            }
            set
            {
                this._photoID = value;
            }
        }
    }
}
