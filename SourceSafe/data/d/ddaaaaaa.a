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
using System.Globalization;
using System.Threading;
using MicNets.BizLogic;
using MicNets.Model;

namespace MicNets.Web
{
    public class BasePage : Page
    {
        // Fields
        protected int ClientScreenWidth;
        protected string Description;
        protected string Keywords;
        protected Customer oCustomer;
        protected Helper oHelper;

        // Methods
        protected void BuildPopup(string message)
        {
            string script = "<script language=\"JavaScript\">ShowPopup('" + message + "', ShowPopupCallback);</script>";
            Page.ClientScript.RegisterClientScriptBlock(typeof(BasePage), "alert", script);
            //string script = "<script language=\"JavaScript\">alert('" + message + "')</script>";
            //ClientScript.RegisterClientScriptBlock(typeof(BasePage), "alert", script);
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            this.oHelper = new Helper();
            this.oCustomer = new Customer();

            if (Session["CurrentCulture"] != null && Session["CurrentCulture"].ToString() == "zh-CN")
            {
                Page.Theme = "BlogChinese";
            }
            else
                Page.Theme = "Blog";
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.Page.Header.Controls.Add(WebHelper.GetKeywords(this.Title.Replace(' ', ',') + "," + this.Keywords));
            this.Page.Header.Controls.Add(WebHelper.GetDescriptions(this.Title.Replace(' ', ',') + "," + this.Keywords + "," + this.Description));
        }

        protected override void InitializeCulture()
        {
            if (Session["CurrentCulture"] != null)
            {
                CultureInfo currentCulture = new CultureInfo(Session["CurrentCulture"].ToString());

                Thread.CurrentThread.CurrentCulture = currentCulture;
                
                Thread.CurrentThread.CurrentUICulture = currentCulture;
            }
        }
    }
}

