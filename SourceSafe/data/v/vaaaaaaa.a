using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using MicNets.DAL;

namespace MicNets.BizLogic
{
    public class Topic : TopicInfo
    {
        // Fields
        private TopicDAC dao;

        // Methods
        public Topic()
        {
        }

        public Topic(TopicInfo info)
            : base(info)
        {
        }

        public bool Load()
        {
            this.dao = new TopicDAC(this);
            if (this.dao.SelectOne())
            {
                base.Clone(this.dao);
                return true;
            }
            return false;
        }

        public DataTable LoadAll()
        {
            this.dao = new TopicDAC(this);
            return this.dao.SelectAll();
        }
    }

 

}
