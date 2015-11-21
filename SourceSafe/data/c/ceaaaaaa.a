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
using MicNets.Model;
using MicNets.BizLogic;
using System.Text;


namespace MicNets.Web.Blog
{
    public partial class Master : MasterPage
    {
        // Fields
        protected ImageButton btnPayPalDonation;
        protected ContentPlaceHolder content;
        protected HtmlForm form1;
        protected HiddenField hidScreenWidth;
        protected HyperLink hypLogo;
        protected Image Image1;
        protected Image imgCrystalTech;
        protected Menu menub;
        protected Menu menuTop;
        private Helper oHelp;

        // Methods
        protected void btnPayPalDonation_Click(object sender, ImageClickEventArgs e)
        {
            base.Response.Redirect("https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=wjkong%40canada%2ecom&item_name=Support%20Michael%20Kong%20Blog&no_shipping=0&no_note=1&tax=0&currency_code=CAD&lc=CA&bn=PP%2dDonationsBF&charset=UTF%2d8");
        }

        private void BuildChildMenuItem(DataRow[] drs, MenuItem menuItem)
        {
            foreach (DataRow row in drs)
            {
                MenuItem item = new MenuItem();
                item.NavigateUrl = "~/" + row["url"].ToString();
                item.Text = row["text"].ToString();
                menuItem.ChildItems.Add(item);
            }
        }

        private void BuildTopMenu()
        {
            Link link = new Link();
            link.Info.LinkCategory = NLinkCategory.Blog;

            if (Session["CurrentCulture"] != null)
                link.Info.Culture = Session["CurrentCulture"].ToString();

        
            if (base.Request.IsAuthenticated)
            {
                link.Info.SessionID = base.Session["token"].ToString();
                link.Info.CurrentTask = NTaskLink.LoadAllBySessionID;
            }
            else
            {
                link.Info.RoleID = (short)NRole.GUEST;
                link.Info.CurrentTask = NTaskLink.LoadAllByRole;
            }
            DataTable table = link.LoadAll().Tables[0];
            this.menuTop.Items.Clear();
            DataRow row = table.Select("parentLinkID IS NULL")[0];
            MenuItem menuItem = new MenuItem();
            menuItem.Text = row["text"].ToString();
            menuItem.NavigateUrl = row["url"].ToString();
            this.menuTop.Items.Add(menuItem);
            foreach (DataRow row2 in table.Select("parentLinkID = " + row["linkID"], "sequence ASC"))
            {
                menuItem = new MenuItem();
                menuItem.Text = row2["text"].ToString();
                menuItem.NavigateUrl = "~/" + row2["url"].ToString();
                this.BuildChildMenuItem(table.Select("parentLinkID = " + row2["linkID"], "sequence ASC"), menuItem);
                this.menuTop.Items.Add(menuItem);
            }
        }

        private string GetScriptFilePath()
        {
            string str = string.Empty;
            int num = this.oHelp.CountCharInString(base.Request.RawUrl, '/');
            if (base.Request.IsLocal)
            {
                num--;
            }
            for (int i = 1; i < num; i++)
            {
                str = str + "../";
            }
            return (str + "Scripts/MicNets.js");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UserAgent.IndexOf("AppleWebKit") > 0)
            {
                Request.Browser.Adapters.Clear();
            }

            this.oHelp = new Helper();
            this.BuildTopMenu();
            HtmlGenericControl child = new HtmlGenericControl();
            child.TagName = "script";
            child.Attributes.Add("type", "text/JavaScript");
            child.Attributes.Add("src", this.GetScriptFilePath());
            this.Page.Header.Controls.Add(child);
            Page page = this.Page;
            page.Title = page.Title + " - Michael Kong's Blog ";
            SetLanguageButtons();
        }

        protected void btnEnglish_Click(object sender, EventArgs e)
        {
            Session["CurrentCulture"] = null;
            
            Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void btnFrench_Click(object sender, EventArgs e)
        {
            Session["CurrentCulture"] = "fr-CA";

            Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void btnChinese_Click(object sender, EventArgs e)
        {
            Session["CurrentCulture"] = "zh-CN";

            Response.Redirect(Page.Request.Url.ToString(), true);
        }

        private void SetLanguageButtons()
        {
            if (Session["CurrentCulture"] == null)
            {
                btnEnglish.Visible = false;
                btnChinese.Visible = true;
                btnFrench.Visible = true;
            }
            else if (Session["CurrentCulture"].ToString() == "fr-CA")
            {
                btnEnglish.Visible = true;
                btnChinese.Visible = true;
                btnFrench.Visible = false;
            }
            else if (Session["CurrentCulture"].ToString() == "zh-CN")
            {
                btnEnglish.Visible = true;
                btnChinese.Visible = false;
                btnFrench.Visible = true;
            }
        }
    }
}
