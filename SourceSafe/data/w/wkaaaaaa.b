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

namespace MicNets.Web.Controls
{
    public partial class ctlVideoClips : BaseControl
    {
        // Fields
        protected GridView gvVideoList;
        protected Controls.ctlVideoViewer VideoViewer1;
        private Video oVedio = new Video();

        // Methods
        protected void btnPlay_Click(object sender, EventArgs e)
        {
            int num = ((GridViewRow)((Control)sender).Parent.Parent).RowIndex;
            this.VideoViewer1.VideoID = "http://www.youtube.com/v/" + this.gvVideoList.DataKeys[num].Value + "&autoplay=1";
            DataTable table = oVedio.LoadAll();
            this.gvVideoList.DataSource = table;
            this.gvVideoList.DataBind();
        }

        private void BuildMeta()
        {
            string keywords = "MicNets Photo Album,Fun,Cute,photo,summer,park,han,children,parent,family";
            string descriptions = "MicNets Photo Album,Fun,Cute,photo,summer,park,han,children,parent,family";
            this.Page.Header.Controls.Add(WebHelper.GetKeywords(keywords));
            this.Page.Header.Controls.Add(WebHelper.GetDescriptions(descriptions));
        }

        protected string GetThumbnailPath()
        {
            return "~/Image/GetThumbnail.ashx?videoID=104";
        }

        protected void gvVideoList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvVideoList.PageIndex = e.NewPageIndex;
            this.SetScreen();
        }

        protected void gvVideoList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType == DataControlRowType.DataRow) && (e.Row.FindControl("btniThumbnail") != null))
            {
                ImageButton button = (ImageButton)e.Row.FindControl("btniThumbnail");
                button.ImageUrl = "~/Controls/Handlers/GetThumbnail.ashx?videoID=" + ((DataRowView)e.Row.DataItem)["videoID"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.BuildMeta();
                DataTable table = oVedio.LoadAll();
                this.VideoViewer1.VideoID = "http://www.youtube.com/v/" + table.Rows[0]["youTubeID"] + "&autoplay=1";
                this.gvVideoList.DataSource = table;
                this.gvVideoList.DataBind();
            }
        }

        private void SetScreen()
        {
            DataTable table = oVedio.LoadAll();
            int num = this.gvVideoList.PageIndex * 5;
            this.VideoViewer1.VideoID = "http://www.youtube.com/v/" + table.Rows[num]["youTubeID"];
            this.gvVideoList.DataSource = table;
            this.gvVideoList.DataBind();
        }

    }
}