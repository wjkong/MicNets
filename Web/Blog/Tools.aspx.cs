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
    public partial class Tools : BasePage
    {
        // Fields
        protected HyperLink HyperLink1;
        protected HyperLink HyperLink2;
        protected HyperLink HyperLink3;
        protected HyperLink HyperLink4;
        protected HyperLink HyperLink5;
        protected HyperLink HyperLink6;
        protected HyperLink HyperLink7;
        protected HyperLink HyperLink8;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                base.Keywords = "";
                base.Description = "";
            }
        }


    }
}
