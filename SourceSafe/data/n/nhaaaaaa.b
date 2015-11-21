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
using MicNets.BizLogic;
using MicNets.Model;

namespace MicNets.Web.Blog.Member
{
    public class SecurityPage : BasePage
    {
        // Methods
        private string GetURL(HttpRequest request)
        {
            string str = string.Empty;
            if (request.IsLocal)
            {
                str = request.RawUrl.Replace("/Web/", string.Empty);
            }
            else
            {
                str = request.RawUrl.Substring(1);
            }
            int index = str.IndexOf('?');
            if (index > 0)
            {
                str = str.Substring(0, index);
            }
            return str;
        }

        private bool IsUserAuthorizedAccess()
        {
            Link link = new Link();
            link.Info.SessionID = this.Session.SessionID;
            link.Info.URL = this.GetURL(base.Request);
            return link.CanUserAccess();
        }

        protected new void Page_PreInit(object sender, EventArgs e)
        {
            this.oHelper = new Helper();
            this.oCustomer = new Customer();

            base.oCustomer = new Customer();
            if (!base.Request.IsAuthenticated || !this.IsUserAuthorizedAccess())
            {
                FormsAuthentication.SignOut();
                this.Session.Clear();
                this.Session.Abandon();
                base.Response.Redirect(ConfigurationManager.AppSettings["applicationPath"].ToString() + "Default.aspx");
            }
        }
    }
}
