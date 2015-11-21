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
using MicNets.BizLogic;

namespace MicNets.Web.Controls
{
    public partial class ctlAlbum : UserControl
    {
        // Fields
        protected ImageButton btnFirst;
        protected ImageButton btnFirst2;
        protected ImageButton btnLast;
        protected ImageButton btnLast2;
        protected ImageButton btnNext;
        protected ImageButton btnNext2;
        protected ImageButton btnPre2;
        protected ImageButton btnPrev;
        protected DataList dlPhoto;
        private const int FIRST_PAGE_INDEX = 0;
        protected HiddenField hidMaxPageIndex;
        protected HiddenField hidPageIndex;
        protected Label lblPageIndex;
        protected Label lblPageIndex2;
        private const int PAGE_SIZE = 9;

        // Methods
        protected void btnFirst_Click(object sender, EventArgs e)
        {
            this.hidPageIndex.Value = 0.ToString();
            this.SetScreen();
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            this.hidPageIndex.Value = this.hidMaxPageIndex.Value;
            this.SetScreen();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            this.hidPageIndex.Value = Convert.ToString((int)(Convert.ToInt32(this.hidPageIndex.Value) + 1));
            this.SetScreen();
        }

        protected void btnPhoto_Click(object sender, EventArgs e)
        {
            int itemIndex = ((DataListItem)((Control)sender).Parent).ItemIndex;
            int num2 = (Convert.ToInt32(this.hidPageIndex.Value) * 9) + itemIndex;
            base.Response.Redirect(ConfigurationManager.AppSettings["applicationPath"].ToString() + "Gallery.aspx?PageIndex=" + num2);
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            this.hidPageIndex.Value = Convert.ToString((int)(Convert.ToInt32(this.hidPageIndex.Value) - 1));
            this.SetScreen();
        }

        private void BuildMeta()
        {
            string keywords = "MicNets Photo Album,Fun,Cute,photo,summer,park,han,children,parent,family";
            string descriptions = "MicNets Photo Album,Fun,Cute,photo,summer,park,han,children,parent,family";
            this.Page.Header.Controls.Add(WebHelper.GetKeywords(keywords));
            this.Page.Header.Controls.Add(WebHelper.GetDescriptions(descriptions));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                if (base.Session["PageIndex"] != null)
                {
                    this.hidPageIndex.Value = Convert.ToString((int)(Convert.ToInt32(base.Session["PageIndex"]) / 9));
                    base.Session["PageIndex"] = null;
                }
                else
                {
                    this.hidPageIndex.Value = 0.ToString();
                }
                this.BuildMeta();
                this.SetScreen();
            }
        }

        private void SetScreen()
        {
            Photo photo = new Photo();
            photo.PageIndex = Convert.ToInt32(this.hidPageIndex.Value);
            photo.PageSize = 9;
            this.dlPhoto.DataSource = photo.LoadAll();
            this.dlPhoto.DataBind();
            this.hidMaxPageIndex.Value = photo.MaxPageIndex.ToString();
            this.btnFirst.OnClientClick = (photo.PageIndex != 0) ? string.Empty : "return false";
            this.btnPrev.OnClientClick = this.btnFirst.OnClientClick;
            this.btnLast.OnClientClick = (photo.PageIndex != photo.MaxPageIndex) ? string.Empty : "return false";
            this.btnNext.OnClientClick = this.btnLast.OnClientClick;
            this.btnPre2.OnClientClick = this.btnPrev.OnClientClick;
            this.btnFirst2.OnClientClick = this.btnFirst.OnClientClick;
            this.btnNext2.OnClientClick = this.btnNext.OnClientClick;
            this.btnLast2.OnClientClick = this.btnLast.OnClientClick;
            this.lblPageIndex.Text = string.Concat(new object[] { string.Empty, Convert.ToInt32(this.hidPageIndex.Value) + 1, "/", Convert.ToInt32(this.hidMaxPageIndex.Value) + 1 });
            this.lblPageIndex2.Text = this.lblPageIndex.Text;
        }

    }
}