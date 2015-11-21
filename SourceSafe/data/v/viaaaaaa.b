using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MicNets.Model;

namespace MicNets.Web.Controls
{
    public class BaseControl : UserControl
    {
        // Fields
        protected Helper oHelper = new Helper();
        protected string PathBase = ConfigurationManager.AppSettings["applicationPath"].ToString();

        // Methods
        protected void BuildPopup(string message)
        {
            string script = "<script language=\"JavaScript\">ShowPopup('" + message + "', ShowPopupCallback);</script>";

            Page.ClientScript.RegisterClientScriptBlock(typeof(BaseControl), "alert", script);


            //string script = "<script language=\"JavaScript\">alert('" + message + "')</script>";
            //Page.ClientScript.RegisterClientScriptBlock(typeof(BaseControl), "alert", script); 
        }
    }
}
