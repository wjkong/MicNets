using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.Xml.Serialization;

namespace MicNets.Model
{
    [XmlType("Email")]
    public class EmailInfo
    {
        // Fields
        private string mBody;
        private DateTime mDateSent;
        private long mEmailID;
        private string mFrom;
        private string mPriority;
        private string mSubject;
        private string mTo;

        // Methods
        public EmailInfo()
        {
        }

        public EmailInfo(EmailInfo info)
        {
            this.Clone(info);
        }

        public void Clone(EmailInfo info)
        {
            foreach (PropertyInfo info2 in base.GetType().GetProperties())
            {
                info2.SetValue(this, info2.GetValue(info, null), null);
            }
        }

  
        public string Body
        {
            get
            {
                return this.mBody;
            }
            set
            {
                this.mBody = value;
            }
        }

        public DateTime DateSent
        {
            get
            {
                return this.mDateSent;
            }
            set
            {
                this.mDateSent = value;
            }
        }

        public long EmailID
        {
            get
            {
                return this.mEmailID;
            }
            set
            {
                this.mEmailID = value;
            }
        }

        public string From
        {
            get
            {
                return this.mFrom;
            }
            set
            {
                this.mFrom = value;
            }
        }

        public string NPriority
        {
            get
            {
                return this.mPriority;
            }
            set
            {
                this.mPriority = value;
            }
        }

        public string Subject
        {
            get
            {
                return this.mSubject;
            }
            set
            {
                this.mSubject = value;
            }
        }

        public string To
        {
            get
            {
                return this.mTo;
            }
            set
            {
                this.mTo = value;
            }
        }
    }
}
