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
using AjaxControlToolkit;
using System.Text;
using MicNets.BizLogic;


namespace MicNets.Web.Blog
{
    public partial class Default : BasePage
    {
        // Fields
        protected ImageButton btnPayPalDonation;
        protected Button btnSearch;
        protected Calendar calHome;
        protected Controls.ctlLogin CtlLogin1;
        protected XmlDataSource dasAspNet;
        protected DataGrid dgArtical;
        protected DataGrid dgMyArtical;
        protected UpdatePanel hhh;
        protected ScriptManager jjj;
        protected Label Label1;
        protected Label lblLogin;
        protected Label lblTools;
        protected TabPanel tabASPNET;
        protected TabContainer TabContainer1;
        protected TabPanel TabMyArtical;
        protected TextBox txtQuery;
        protected RequiredFieldValidator vldSearch;

        // Methods
        protected void btnPayPalDonation_Click(object sender, ImageClickEventArgs e)
        {
            base.Response.Redirect("https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=wjkong%40canada%2ecom&item_name=Michael%20Kong%20Blog&no_shipping=0&no_note=1&tax=0&currency_code=CAD&lc=CA&bn=PP%2dDonationsBF&charset=UTF%2d8");
        }

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

        protected void dgArtical_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                Label label = (Label)e.Item.FindControl("lblNum");
                label.Text = Convert.ToString((int)(e.Item.ItemIndex + 1)) + ".";
            }
        }

        protected void dgArtical_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            ((DataGrid)source).CurrentPageIndex = e.NewPageIndex;
            ((DataGrid)source).DataBind();
        }

        protected void dgMyArtical_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                Label label = (Label)e.Item.FindControl("lblNum");
                label.Text = Convert.ToString((int)(e.Item.ItemIndex + 1)) + ".";
            }
        }

        protected void dgMyArtical_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            ((DataGrid)source).CurrentPageIndex = e.NewPageIndex;
            ((DataGrid)source).DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            CtlLogin1.WidthTextbox = 120;

            if (!this.Page.IsPostBack)
            {
                base.Keywords = "";
                base.Description = "";
                Topic oTopic = new Topic();
                this.dgMyArtical.DataSource = oTopic.LoadAll();
                this.dgMyArtical.DataBind();
            }
        }

        protected void TabContainer1_ActiveTabChanged(object sender, EventArgs e)
        {
            int activeTabIndex = this.TabContainer1.ActiveTabIndex;
        }
    }
}
