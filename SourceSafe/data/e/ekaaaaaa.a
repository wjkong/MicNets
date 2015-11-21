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
    public partial class ctlRecoverPassword : BaseControl
    {
        // Fields
        protected Button btnRecover;
        protected Image Image1;
        protected Image Image4;
        protected Label lblEmail;
        protected Label lblUserName;
        protected Panel pnlRegister;
        protected RequiredFieldValidator RequiredFieldValidator1;
        protected TextBox txtEmail;
        protected TextBox txtUserName;
        protected RegularExpressionValidator vldeEmail;
        protected RequiredFieldValidator vldrUserName;

        // Methods
        protected void btnRecover_Click(object sender, EventArgs e)
        {
            this.Page.Validate();
            if (this.Page.IsValid)
            {
                Customer customer = new Customer();
                customer.Info.Email = this.txtEmail.Text.Trim();
                customer.Info.UserName = this.txtUserName.Text.Trim();
                Email email = new Email();
                email.To = this.txtEmail.Text.Trim();
                
                if (email.SendPwdRecoveryEmail("12345", Request.IsLocal))
                {
                    base.BuildPopup("Your password has been retrieved and sent to your email.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.Page.SetFocus(this.txtEmail);
            }


        }
    }
}