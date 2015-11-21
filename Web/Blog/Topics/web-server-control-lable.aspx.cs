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
    public partial class web_server_control_lable : BasePage
    {
        // Fields
        protected Label lblAmountFinanced;
        protected Label lblTitle;
        protected TextBox txtAmountFinanced;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                base.Keywords = "Web,Server,Control,Label,web,window,application,AssociatedControlID,cursor,automatically,document.getElementById,Javascript,value,innerHTML,Literal control,style,difference,demo";
                base.Description = "cursor will move to the associated control automatically,in centain particular situation,only either Lable control or Literal control can be applied";

                Master.TopicTitle = "ASP.NET Web Server Control I: Lable";
            }
        }

    }
}
