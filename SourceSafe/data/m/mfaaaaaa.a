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
    public partial class MortgageCalculator : BasePage
    {
        // Fields
        protected Controls.ctlToolBar CtlToolBar1;
        protected HtmlGenericControl FunctionBar;
        protected Controls.ctlMortgageCalculator MortgageCalculator1;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMortgageCalculator.Text = Resources.Common.lblMortageCalculator;

            if (!this.Page.IsPostBack)
            {
                base.Keywords = "";
                base.Description = "";
            }
        }
    }
}
