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
    public partial class SignOut : Page
    {
        // Methods
        protected void Page_PreInit(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            this.Session.Clear();
            this.Session.Abandon();
            base.Response.Redirect("~/Blog/Default.aspx");
        }


    }
}
