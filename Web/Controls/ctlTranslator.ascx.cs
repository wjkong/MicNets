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
using MicNets.Controls;
using System.Net;
using System.Text;
using System.IO;

namespace MicNets.Web.Controls
{
    public partial class ctlTranslator : BaseControl
    {
        // Fields
        protected Button btnTranslate;
        protected DropDownList ddlLangSource;
        protected DropDownList ddlLangTrans;
        protected Image Image4;
        protected RequiredFieldValidator RequiredFieldValidator1;
        protected ScriptManager ScriptManager1;
        protected TextArea txtSource;
        protected TextBox txtTrans;
        protected UpdatePanel UpdatePanel1;
        protected UpdateProgress UpdateProgress1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.Page.SetFocus(this.txtSource.ClientID);
            }
        }
    }
}