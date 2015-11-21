using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace MicNets.Model
{
    public class CommentInfo
    {
        // Fields
        private int _commentID;
        private string _content;
        private int _custID;
        private string _custName;
        private DateTime _timeCreated;
        private DateTime _timeUpdated;
        private int _topicID;

        // Methods
        public CommentInfo()
        {
        }

        public CommentInfo(CommentInfo info)
        {
            this.Clone(info);
        }

        public void Clone(CommentInfo info)
        {
            foreach (PropertyInfo info2 in base.GetType().GetProperties())
            {
                info2.SetValue(this, info2.GetValue(info, null), null);
            }
        }

        // Properties
        public int CommentID
        {
            get
            {
                return this._commentID;
            }
            set
            {
                this._commentID = value;
            }
        }

        public string Content
        {
            get
            {
                return this._content;
            }
            set
            {
                this._content = value;
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

        public string CustName
        {
            get
            {
                return this._custName;
            }
            set
            {
                this._custName = value;
            }
        }

        public DateTime TimeCreated
        {
            get
            {
                return this._timeCreated;
            }
            set
            {
                this._timeCreated = value;
            }
        }

        public DateTime TimeUpdated
        {
            get
            {
                return this._timeUpdated;
            }
            set
            {
                this._timeUpdated = value;
            }
        }

        public int TopicID
        {
            get
            {
                return this._topicID;
            }
            set
            {
                this._topicID = value;
            }
        }
    }


}
