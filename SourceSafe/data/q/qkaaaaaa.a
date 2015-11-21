using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MicNets.BizLogic;

namespace MicNets.Web.Controls
{
    public partial class ctlTopicHeader : UserControl
    {
        // Fields
        protected int _topicID;
        protected Label lblNumView;
        protected Label lblTimeCreated;
        protected Label lblTimeUpdated;

        // Methods
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                string[] segments = base.Request.Url.Segments;
                int index = segments.Length - 1;
                string str = segments[index];
                string str2 = str.Replace("-", " ").Replace(".aspx", string.Empty);
                Topic topic = new Topic();
                topic.Title = str2;
                topic.PageName = str;
                if (topic.Load())
                {
                    this.TopicID = topic.TopicID;
                    this.lblNumView.Text = topic.NumView.ToString();
                    this.lblTimeCreated.Text = topic.TimeCreated.ToShortDateString();
                    this.lblTimeUpdated.Text = topic.TimeUpdated.ToShortDateString();
                }
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