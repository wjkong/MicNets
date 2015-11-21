using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using MicNets.DAL;

namespace MicNets.BizLogic
{
    public class Item : ItemInfo
    {
        // Fields
        private ItemDAC dao;

        // Methods
        public Item()
        {
        }

        public Item(ItemInfo info)
            : base(info)
        {
        }

        public bool AddOne()
        {
            this.dao = new ItemDAC(this);
            if (this.dao.InsertOne() >= Utility.ONE_ROW_AFFECTED)
            {
                base.ID = this.dao.ID;
                return true;
            }
            return false;
        }

        public bool Load()
        {
            this.dao = new ItemDAC(this);
            if (this.dao.SelectOne())
            {
                base.Clone(this.dao);
                return true;
            }
            return false;
        }

        public DataTable LoadAll()
        {
            this.dao = new ItemDAC(this);
            return this.dao.SelectAll();
        }

        public DataTable LoadAllByCityID(int cityID)
        {
            base.CityID = cityID;
            this.dao = new ItemDAC(this);
            return this.dao.SelectAllByCityID();
        }

        public DataTable LoadAllByCustID(int custID)
        {
            base.CustID = custID;
            this.dao = new ItemDAC(this);
            return this.dao.SelectAllByCustID();
        }

        public byte[] LoadPicture()
        {
            this.dao = new ItemDAC();
            this.dao.ID = base.ID;
            return this.dao.SelectPicture(false);
        }

        public byte[] LoadThumbnail()
        {
            this.dao = new ItemDAC();
            this.dao.ID = base.ID;
            return this.dao.SelectPicture(true);
        }

        public bool Remove()
        {
            this.dao = new ItemDAC(this);
            return (this.dao.DeleteOne() >= Utility.ONE_ROW_AFFECTED);
        }
    }
}
