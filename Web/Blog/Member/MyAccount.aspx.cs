﻿using System;
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

namespace MicNets.Web.Blog.Member
{
    public partial class MyAccount : BasePage
    {
        // Fields
        protected Controls.ctlMyAccount CtlMyAccount1;
        protected Image Image3;
        protected Label lblSubTitle;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                base.Title = this.lblSubTitle.Text;
            }
        }

    }
}
