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

namespace MicNets.Web.Blog.Topics
{
    public partial class Topic : MasterPage
    {
        // Fields
        protected Controls.ctlComment CtlComment1;
        protected Controls.ctlToolBar CtlToolBar1;
        protected Controls.ctlTopicHeader ctlTopicHeader1;
        protected HiddenField hidTopicID;
        protected Label lblTopicTitle;
        protected ContentPlaceHolder topicContent;

        public string TopicTitle
        {
            set
            {
                lblTopicTitle.Text = value;
            }
        }

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.hidTopicID.Value = this.ctlTopicHeader1.TopicID.ToString();
            }

            this.CtlComment1.TopicID = Convert.ToInt32(this.hidTopicID.Value);
        }

 

    }
}
