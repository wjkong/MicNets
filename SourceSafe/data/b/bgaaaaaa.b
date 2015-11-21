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
using System.IO;

namespace MicNets.Web.Blog
{
    public partial class Resume : BasePage
    {
        // Fields
        protected AdRotator AdProfile;
        protected Button btnDownload;
        protected Label lblLastUpdated;
        protected ScriptManager ScriptManager1;

        // Methods
        protected void btnDownload_Click(object sender, EventArgs e)
        {
            string fileName = string.Empty;
            if (Session["CurrentCulture"] != null && Session["CurrentCulture"].ToString() == "zh-CN")
                fileName = "/Blog/Michael Resume Net Web Developer.doc";
            else
                fileName = "/Blog/Michael Resume Net Web Developer.doc";

            FileInfo info = new FileInfo(base.Server.MapPath(base.Request.ApplicationPath + fileName));
            if (info.Exists)
            {
                base.Response.ClearContent();
                base.Response.AddHeader("Content-Disposition", "attachment; filename=" + info.Name);
                base.Response.ContentType = "application/ms-word";
                base.Response.WriteFile(info.FullName);
                base.Response.End();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                base.Keywords = "Computer,Scricen,Bachelor,MCAD,York,Software Engineer,Web Developer";
                base.Description = "York University,Seneca Collage,DealerTrack,DGN,C#,ASP.NET,ADO.NET,XML,COM+,Web Service,SOAP,MS Reporting Services,MS Visual Studio,MS Source Safe,SQL Server 2000/2005,Core Java,Java Swing Package,Java Applet,JavaScript,DHTML,HTML,CSS";
                this.lblLastUpdated.Text = DateTime.Now.AddDays(-10.0).ToString("MMMM dd, yyyy");
            }
        }

    }
}
