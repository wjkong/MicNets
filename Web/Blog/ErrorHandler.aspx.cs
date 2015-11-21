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

namespace MicNets.Web.Blog
{
    public enum NStatusCode
    {
        UnAuthorizedAccess = 403,
        PageNotFound = 404,
        InternalServerError = 500
    }

    public partial class ErrorHandler : BasePage
    {
        // Fields
        protected Label lblMessage;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                base.Keywords = "";
                base.Description = "";
            }
            Helper helper = new Helper();

            if (helper.IsNullOrEmpty(base.Request.QueryString["statusCode"]) || Request.QueryString["statusCode"].ToString() == null || !helper.IsPositiveNumber(Request.QueryString["statusCode"].ToString()))
            {
                this.lblMessage.Text = "We encountered an unexpected server error!";
            }
            else
            {
               
                switch ((NStatusCode)Convert.ToInt32(Request.QueryString["statusCode"]))
                {
                    case NStatusCode.UnAuthorizedAccess:
                        lblMessage.Text = "You are not authorized to access to this page!";
                        break;
                    case NStatusCode.PageNotFound:
                        lblMessage.Text = "Do not find any page that matches the request URL!";
                        break;
                    case NStatusCode.InternalServerError:
                        lblMessage.Text = "We encountered an internal server error!";
                        break;
                    default:
                        lblMessage.Text = "Unexpected server error!";
                        break;

                }
            }
        }
    }
}
