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
    public partial class CurrencyConvertor : BasePage
    {
        // Fields
        protected Controls.ctlToolBar CtlToolBar1;
        protected Controls.ctlCurrencyConvertor CurrencyConvertor1;
        protected HtmlGenericControl FunctionBar;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                base.Keywords = "exchange,rate,live,currency,convertor,CAD,USD,EUR,CNY,dollar,euro,yuan,yan,china,usa,canada,pound";
                base.Description = "hong kong,british,austrilian,canadian,AUD,GBP";
            }
        }
    }
}
