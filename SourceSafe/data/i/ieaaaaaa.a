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
    public partial class ContactMe : BasePage
    {
        // Fields
        protected Controls.ctlEmailer CtlEmailer1;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.CtlEmailer1.To = ConfigurationManager.AppSettings["DefaultEmail"].ToString();
            }
        }

       
    }


}
