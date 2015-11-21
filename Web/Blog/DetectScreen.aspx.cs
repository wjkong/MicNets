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

namespace MicNets.Web.Blog
{
    public partial class DetectScreen : Page
    {
        // Fields
        protected HtmlForm form1;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (base.Request.QueryString["action"] != null)
            {
                this.Session["ScreenWidth"] = base.Request.QueryString["ScreenWidth"].ToString();
                base.Response.Redirect(this.Session["RedirectedPage"].ToString());
            }
        }
    }
}
