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
using MicNets.BizLogic;
using MicNets.Web.Resources;
namespace MicNets.Web.Controls
{
    public partial class ctlGallery : UserControl
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
        protected ImageButton btnRestore;
        private const int FIRST_PAGE_INDEX = 0;
        protected HiddenField hidMaxPageIndex;
        protected HiddenField hidPageIndex;
        protected Image imgPhoto;
        protected ScriptManager kk;
        protected Label lblAge;
        protected Label lblAge2;
        protected Label lblDatePicTaken;
        protected Label lblDatePicTaken2;
        protected Label lblPageIndex;
        protected Label lblPageIndex2;
        private const int PAGE_SIZE = 1;
        protected Panel Panel1;
        protected UpdatePanel pnlImage;
        protected RoundedCornersExtender RoundedCornersExtender1;

        // Methods
        protected void btnFirst_Click(object sender, EventArgs e)
        {
            this.hidPageIndex.Value = Convert.ToString(0);
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

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            this.hidPageIndex.Value = Convert.ToString((int)(Convert.ToInt32(this.hidPageIndex.Value) - 1));
            this.SetScreen();
        }

        protected void btnRestore_Click(object sender, EventArgs e)
        {
            base.Session["PageIndex"] = this.hidPageIndex.Value;
            base.Response.Redirect(ConfigurationManager.AppSettings["applicationPath"].ToString() + "Album.aspx");
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
                if (base.Request.QueryString["PageIndex"] != null)
                {
                    this.hidPageIndex.Value = base.Request.QueryString["PageIndex"].ToString();
                }
                else
                {
                    this.hidPageIndex.Value = Convert.ToString(0);
                }
                this.BuildMeta();
                this.SetScreen();
            }
        }

        private void SetScreen()
        {
            Photo photo = new Photo();
            photo.PageIndex = Convert.ToInt32(this.hidPageIndex.Value);
            photo.PageSize = 1;
            DataRow row = photo.LoadAll().Rows[0];
            this.imgPhoto.ImageUrl = "http://i46.photobucket.com/albums/f127/weijunkong/" + row["photoName"].ToString().Replace(" ", string.Empty);
            this.imgPhoto.ToolTip = row["photoName"].ToString();
            this.imgPhoto.Width = new Unit(800);
            this.lblDatePicTaken.Text = Common.lblDatePicTaken + row["timeTaken"];
            if (row["year"].ToString().Equals("0"))
            {
                this.lblAge.Text = string.Format(Common.lblAgeNoYear, row["month"]);
            }
            else
            {
                this.lblAge.Text = string.Format(Common.lblAge, row["year"],row["month"]);
            }
            this.hidMaxPageIndex.Value = photo.MaxPageIndex.ToString();
            this.btnFirst.OnClientClick = (photo.PageIndex != 0) ? string.Empty : "return false";
            this.btnPrev.OnClientClick = this.btnFirst.OnClientClick;
            this.btnLast.OnClientClick = (photo.PageIndex != photo.MaxPageIndex) ? string.Empty : "return false";
            this.btnNext.OnClientClick = this.btnLast.OnClientClick;
            this.btnPre2.OnClientClick = this.btnPrev.OnClientClick;
            this.btnFirst2.OnClientClick = this.btnFirst.OnClientClick;
            this.btnNext2.OnClientClick = this.btnNext.OnClientClick;
            this.btnLast2.OnClientClick = this.btnLast.OnClientClick;
            this.lblAge2.Text = this.lblAge.Text;
            this.lblDatePicTaken2.Text = this.lblDatePicTaken.Text;
            this.lblPageIndex.Text = string.Concat(new object[] { string.Empty, Convert.ToInt32(this.hidPageIndex.Value) + 1, "/", Convert.ToInt32(this.hidMaxPageIndex.Value) + 1 });
            this.lblPageIndex2.Text = this.lblPageIndex.Text;
        }
    }
}