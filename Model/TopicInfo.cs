using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace MicNets.Model
{

    [Serializable]
    public class TopicInfo
    {
        // Fields
        private int _numView;
        private string _pageName;
        private DateTime _timeCreated;
        private DateTime _timeUpdated;
        private string _title;
        private int _topicID;

        // Methods
        public TopicInfo()
        {
        }

        public TopicInfo(TopicInfo info)
        {
            this.Clone(info);
        }

        public void Clone(TopicInfo info)
        {
            foreach (PropertyInfo info2 in base.GetType().GetProperties())
            {
                info2.SetValue(this, info2.GetValue(info, null), null);
            }
        }

        // Properties
        public int NumView
        {
            get
            {
                return this._numView;
            }
            set
            {
                this._numView = value;
            }
        }

        public string PageName
        {
            get
            {
                return this._pageName;
            }
            set
            {
                this._pageName = value;
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

        public string Title
        {
            get
            {
                return this._title;
            }
            set
            {
                this._title = value;
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
