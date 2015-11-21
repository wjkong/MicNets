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
using System.IO;

namespace MicNets.Web.Controls
{
    public partial class ctlToolBar : UserControl
    {
        // Fields
        protected HyperLink hypEmail;
        protected HyperLink hypRSS;
        protected Image Image1;
        protected Image Image2;
        protected Image Image4;
        protected Image Image5;

        // Methods
        private string GetHandlerName(string url)
        {
            int startIndex = url.LastIndexOf('/') + 1;
            return url.Substring(startIndex, url.Length - startIndex).Replace("aspx", "ashx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.hypEmail.NavigateUrl = ConfigurationManager.AppSettings["applicationPath"].ToString() + "ContactMe.aspx";
                string path = "~/Controls/Handlers/RSS_" + this.GetHandlerName(this.Page.Request.RawUrl.ToString());
                if (File.Exists(base.Server.MapPath(path)))
                {
                    this.hypRSS.NavigateUrl = path;
                }
                else
                {
                    this.hypRSS.Visible = false;
                    imgRSS.Visible = false;
                }
            }
        }

      
    }


}