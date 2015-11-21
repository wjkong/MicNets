using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using MicNets.DAL;

namespace MicNets.BizLogic
{
    public class Comment : CommentInfo
    {
        // Methods
        public Comment()
        {
        }

        public Comment(CommentInfo info)
            : base(info)
        {
        }

        public bool AddOne()
        {
            CommentDAC tdac = new CommentDAC(this);
            return (tdac.InsertOne() == Utility.ONE_ROW_AFFECTED);
        }

        public DataTable LoadAll()
        {
            CommentDAC tdac = new CommentDAC(this);
            return tdac.SelectAllByTopic();
        }

        public bool Modify()
        {
            CommentDAC tdac = new CommentDAC(this);
            return (tdac.UpdateOne() == Utility.ONE_ROW_AFFECTED);
        }

        public bool Remove()
        {
            CommentDAC tdac = new CommentDAC(this);
            return (tdac.DeleteOne() == Utility.ONE_ROW_AFFECTED);
        }
    }


}
