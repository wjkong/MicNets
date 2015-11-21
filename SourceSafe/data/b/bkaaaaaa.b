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
using MicNets.Model;

namespace MicNets.Web.Controls
{
    public partial class ctlMyAccount : BaseControl
    {
        // Fields
        protected Button btnUpdateInfo;
        protected Button btnUpdatePwd;
        protected HiddenField hidCustID;
        protected Image Image1;
        protected Image Image2;
        protected Image Image3;
        protected Image Image4;
        protected Image Image5;
        protected Label Label1;
        protected Label Label2;
        protected Label lblCurrentPassword;
        protected Label lblEmail;
        protected Label lblFirstName;
        protected Label lblLastName;
        protected Label lblPassword;
        protected Label lblPwdAgain;
        protected Label lblUserName;
        private Customer oCust;
        protected Panel pnlInfo;
        protected Panel pnlPasswordChange;
        protected RequiredFieldValidator RequiredFieldValidator1;
        protected RequiredFieldValidator RequiredFieldValidator2;
        protected TextBox txtCurrentPassword;
        protected TextBox txtEmail;
        protected TextBox txtFirstName;
        protected TextBox txtLastName;
        protected TextBox txtPassword;
        protected TextBox txtPasswordAgain;
        protected TextBox txtUserName;
        protected CompareValidator vldcNewPwd;
        protected CompareValidator vldcPassword;
        protected RegularExpressionValidator vldeEmail;
        protected RequiredFieldValidator vldrPassword;
        protected RequiredFieldValidator vldrPasswordAgain;
        protected RequiredFieldValidator vldrUserName;
        protected CustomValidator vldxNewPwd;
        protected CustomValidator vldxPassword;

        // Methods
        protected void btnUpdateInfo_Click(object sender, EventArgs e)
        {
            this.Page.Validate("vgpInfo");
            if (this.Page.IsValid)
            {
                this.oCust.Info.UserName = this.txtUserName.Text.Trim();
                this.oCust.Info.Email = this.txtEmail.Text.Trim();
                this.oCust.Info.CustID = Convert.ToInt32(this.hidCustID.Value);
                this.oCust.Info.CustRole = NRole.DEFAULT;
                this.oCust.Info.LastName = this.txtLastName.Text.Trim();
                this.oCust.Info.FirstName = this.txtFirstName.Text.Trim();
                if (this.oCust.Modify(this.oCust.Info))
                {
                    base.BuildPopup("Successfully updated your profile.");
                }
                else
                {
                    base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
                }
            }
        }

        protected void btnUpdatePwd_Click(object sender, EventArgs e)
        {
            this.Page.Validate("vgpPwd");
            if (this.Page.IsValid)
            {
                this.oCust.Info.Password = this.txtPassword.Text.Trim();
                if (this.oCust.ModifyPwd())
                {
                    base.BuildPopup("Successfully updated the password.");
                }
                else
                {
                    base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.oCust = new Customer();
                this.oCust.Info.SessionID = base.Session["token"].ToString();
                this.oCust.Info.CurrentTask = NTaskCustomer.LoadBySessionID;
                if (this.oCust.Load())
                {
                    this.txtEmail.Text = this.oCust.Info.Email;
                    this.txtFirstName.Text = this.oCust.Info.FirstName;
                    this.txtLastName.Text = this.oCust.Info.LastName;
                    this.txtUserName.Text = this.oCust.Info.UserName;
                    this.hidCustID.Value = this.oCust.Info.CustID.ToString();
                }
                this.ViewState["Customer"] = this.oCust;
            }
            else
            {
                this.oCust = (Customer)this.ViewState["Customer"];
            }
        }

        protected void vldxNewPwd_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string str = args.Value.Trim();
            if ((str.Length >= 6) && (str.Length <= 10))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void vldxPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            this.oCust.Info.Password = args.Value.Trim();
            if (this.oCust.Login())
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }

        }
    }
}