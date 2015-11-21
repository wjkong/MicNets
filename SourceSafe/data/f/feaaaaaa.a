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
using MicNets.Model;

namespace MicNets.Web.Blog
{
    public partial class Certification : BasePage
    {
        // Fields
        protected Controls.ctlToolBar CtlToolBar1;
        protected HtmlGenericControl FunctionBar;
        protected ScriptManager ScriptManager1;
        protected TabContainer TabContainer1;
        protected TabPanel TabMCAD;
        protected TabPanel tabMCADVB;
        protected TabPanel tabMCPD;
        protected TabPanel tabMCSD;
        protected TabPanel tabMCSDVB;
        protected UpdatePanel UpdatePanel1;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                base.Keywords = "Microsoft..NET,Certifications,MCSD,MSAD,MCPD,Web Applications,Visual Studio .NET,Windows-based,Web Services";
                base.Description = "SQL Server 2000 Enterprise Edition,BizTalk Server,register exam,Security,Implementation and Maintenance,E-Business Solutions";
                if (base.Request.QueryString["Type"] != null)
                {
                    string str = base.Request.QueryString["Type"].ToString().ToUpper();
                    if (str == NTabIndex.MCSD.ToString())
                    {
                        this.TabContainer1.ActiveTabIndex = 2;
                    }
                    else if (str == NTabIndex.MCPD.ToString())
                    {
                        this.TabContainer1.ActiveTabIndex = 4;
                    }
                    else
                    {
                        this.TabContainer1.ActiveTabIndex = 0;
                    }
                }
                else
                {
                    this.TabContainer1.ActiveTabIndex = 0;
                }
            }
        }

    }
}
