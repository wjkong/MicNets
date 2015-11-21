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
using System.Text;
using MicNets.Model;

namespace MicNets.Web.Controls
{
    public partial class ctlRegister : BaseControl
    {
        // Fields
        protected Button btnRegister;
        protected Image Image1;
        protected Image Image2;
        protected Image Image3;
        protected Image Image4;
        protected Label lblEmail;
        protected Label lblFirstName;
        protected Label lblLastName;
        protected Label lblPassword;
        protected Label lblPwdAgain;
        protected Label lblUserName;
        private Customer oUser;
        protected Panel pnlRegister;
        protected RequiredFieldValidator RequiredFieldValidator1;
        protected TextBox txtEmail;
        protected TextBox txtFirstName;
        protected TextBox txtLastName;
        protected TextBox txtPassword;
        protected TextBox txtPasswordAgain;
        protected TextBox txtUserName;
        protected CompareValidator vldcPassword;
        protected RegularExpressionValidator vldeEmail;
        protected RequiredFieldValidator vldrPassword;
        protected RequiredFieldValidator vldrPasswordAgain;
        protected RequiredFieldValidator vldrUserName;

        // Methods
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            this.Page.Validate("Registration");
            if (this.Page.IsValid)
            {
                StringBuilder strbMeg = new StringBuilder("Please, correct the following invalid item(S)" + Utility.JS_NEW_LINE + Utility.JS_NEW_LINE);
                bool flag = true;
                flag = this.IsEmailValid(strbMeg);
                if (this.IsUserNameValid(strbMeg) && flag)
                {
                    this.oUser.Info.UserName = this.txtUserName.Text.Trim();
                    this.oUser.Info.Email = this.txtEmail.Text.Trim();
                    
                    this.oUser.Info.Password = this.txtPassword.Text.Trim();
                    this.oUser.Info.CustRole = NRole.MEMBER;
                    Email email = new Email();
                    email.To = this.oUser.Info.Email;
                    if (this.oUser.Add()) // && !base.Request.IsLocal) && email.SendRegConfirmEmail(this.oUser.Info.Password))
                    {
                        base.BuildPopup("User " + this.oUser.Info.UserName + " has been successfully registered in Database.");
                        email.SendRegConfirmEmail(this.oUser.Info.Password, Request.IsLocal);
                    }
                }
                else
                {
                    base.BuildPopup(strbMeg.ToString());
                }
            }
        }

        private bool IsEmailValid(StringBuilder strbMeg)
        {
            this.oUser.Info.Email = this.txtEmail.Text.Trim();
            if (this.oUser.LoadOneByEmail())
            {
                strbMeg.Append("Email address " + this.oUser.Info.Email + " has been registered. Please, choose another one." + Utility.JS_NEW_LINE);
                return false;
            }
            return true;
        }

        private bool IsUserNameValid(StringBuilder strbMeg)
        {
            this.oUser.Info.UserName = this.txtUserName.Text.Trim();
            this.oUser.Info.CurrentTask = NTaskCustomer.LoadByUsername;
            if (this.oUser.Load())
            {
                strbMeg.Append("User name " +  this.oUser.Info.UserName + " has been used. Please, choose another one." + Utility.JS_NEW_LINE);
                return false;
            }
            return true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.oUser = new Customer();
            if (!this.Page.IsPostBack)
            {
                this.Page.SetFocus(this.txtEmail);
            }
        }
    }
}