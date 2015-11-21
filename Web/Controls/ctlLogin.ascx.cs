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
using MicNets.BizLogic;

namespace MicNets.Web.Controls
{
    public partial class ctlLogin : BaseControl
    {
        // Fields
        protected Button btnLogin;
        protected CheckBox chkRememberMe;
        protected HyperLink hypForgotPassword;
        protected HyperLink hypRegister;
        protected Label lblPassword;
        protected Label lblUserName;
        protected TextBox txtPassword;
        protected TextBox txtUsername;
        protected RequiredFieldValidator vldrPassword;
        protected RequiredFieldValidator vldrUsername;
        private int _widthTextbox;

        public int WidthTextbox
        {
            set
            {
                this._widthTextbox = value;
            }
        }

        // Methods
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            this.Page.Validate("vgpLogin");

            if (this.Page.IsValid)
            {
                Customer customer = new Customer();
                customer.Info.UserName = this.txtUsername.Text.Trim();
                customer.Info.Password = this.txtPassword.Text.Trim();
                customer.Info.SessionID = Guid.NewGuid().ToString();
                base.Session["token"] = customer.Info.SessionID;
                if (customer.Login())
                {
                    FormsAuthentication.SetAuthCookie(customer.Info.UserName, false);
                    string redirectUrl = FormsAuthentication.GetRedirectUrl(customer.Info.UserName, false);
                    if (string.IsNullOrEmpty(redirectUrl) || redirectUrl.ToLower().EndsWith("default.aspx"))
                    {
                        redirectUrl = base.PathBase + "Member/MyAccount.aspx";
                    }
                    if (this.chkRememberMe.Checked)
                    {
                        HttpCookie cookie = new HttpCookie("UserName", customer.Info.UserName);
                        cookie.Expires = DateTime.Now.AddDays(30.0);
                        base.Response.Cookies.Add(cookie);
                    }
                    else if (base.Request.Cookies["UserName"] != null)
                    {
                        HttpCookie cookie2 = new HttpCookie("UserName");
                        cookie2.Expires = DateTime.Now.AddDays(-1.0);
                        base.Response.Cookies.Add(cookie2);
                    }
                    base.Response.Redirect(redirectUrl);
                }
                else
                {
                    base.BuildPopup("Invalid Password & Username.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this._widthTextbox > 0)
            {
                txtUsername.Width = new Unit(_widthTextbox);
                txtPassword.Width = txtUsername.Width;
            }

            if (!this.Page.IsPostBack)
            {
                this.hypRegister.NavigateUrl = base.PathBase + "Register.aspx";
                this.hypForgotPassword.NavigateUrl = base.PathBase + "Recover-Password.aspx";
                if (base.Request.Cookies["UserName"] != null)
                {
                    this.chkRememberMe.Checked = true;
                    this.txtUsername.Text = base.Request.Cookies["UserName"].Value;
                    this.Page.SetFocus(this.txtPassword);
                }
                else
                {
                    this.chkRememberMe.Checked = false;
                    this.Page.SetFocus(this.txtUsername);
                }
            }
        }
    }
}