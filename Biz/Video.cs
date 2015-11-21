using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.DAL;
using MicNets.Model;
using System.Data;

namespace MicNets.BizLogic
{
    public class Video : VideoInfo
    {
        // Fields
        private VideoDAC dao;

        // Methods
        public Video()
        {
        }

        public Video(VideoInfo info)
            : base(info)
        {
        }

        public bool AddOne()
        {
            this.dao = new VideoDAC(this);
            if (this.dao.InsertOne() >= Utility.ONE_ROW_AFFECTED)
            {
                base.VideoID = this.dao.VideoID;
                return true;
            }
            return false;
        }

        public DataTable LoadAll()
        {
            this.dao = new VideoDAC(this);
            return this.dao.SelectAll();
        }
    }


}
