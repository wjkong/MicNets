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
using System.Text;


namespace MicNets.Web.Blog
{
    public partial class SearchResult : BasePage
    {
        // Fields
        protected Button btnSearch;
        protected Image Image1;
        protected Image Image3;
        protected TextBox txtQuery;
        protected RequiredFieldValidator vldSearch;

        // Methods
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                StringBuilder builder = new StringBuilder("~/Blog/SearchResult.aspx");
                builder.Append("?q=" + HttpUtility.UrlEncode(this.txtQuery.Text.Trim()));
                builder.Append("&cx=" + HttpUtility.UrlEncode(ConfigurationManager.AppSettings["GoogleSearchKey"].ToString()));
                builder.Append("&cof=" + HttpUtility.UrlEncode("FORID:9"));
                builder.Append("&ie=" + HttpUtility.UrlEncode("UTF-8"));
                base.Response.Redirect(builder.ToString(), false);
                this.Context.ApplicationInstance.CompleteRequest();
            }
        }

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
