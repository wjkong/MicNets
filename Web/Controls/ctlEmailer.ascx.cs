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
using MicNets.BizLogic;

namespace MicNets.Web.Controls
{
    public partial class ctlEmailer : BaseControl
    {
        // Fields
        protected string _from;
        protected string _to;
        protected Button btnSend;
        protected HiddenField hidUrlSource;
        protected Image Image1;
        protected Image Image2;
        protected Image Image3;
        protected Image Image4;
        protected TextBox txtCC;
        protected TextBox txtFrom;
        protected TextBox txtSubject;
        protected TextBox txtTo;
        protected RegularExpressionValidator vldeFrom;
        protected RegularExpressionValidator vldeTo;
        protected RequiredFieldValidator vldrFrom;
        protected RequiredFieldValidator vldrSubject;
        protected RequiredFieldValidator vldrTo;

        // Methods
        protected void btnSend_Click(object sender, EventArgs e)
        {
            this.Page.Validate("emailSend");
            if (this.Page.IsValid)
            {
                Email email = new Email();
                email.From = this.txtFrom.Text.Trim();
                email.To = this.txtTo.Text.Trim();
                email.Subject = this.txtSubject.Text.Trim();
                email.Body = edtBody.Content;
                if (base.Request.IsLocal && email.SendThroughWebService())
                {
                    base.BuildPopup("Message has been successfully sent to" + email.To);
                }
                else if (email.Send())
                {
                    base.BuildPopup("Message has been successfully sent to" + email.To);
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
                if (this.Context.Items["EmailInfo"] != null)
                {
                    EmailInfo info = (EmailInfo)this.Context.Items["EmailInfo"];
                    this.txtTo.Text = info.To;
                    this.txtSubject.Text = "Re:" + info.Subject;
                    this.hidUrlSource.Value = Request.Url.ToString();
                }
                if (!base.oHelper.IsNullOrEmpty(this._from))
                {
                    this.txtFrom.Text = this._from;
                }
                if (!base.oHelper.IsNullOrEmpty(this._to))
                {
                    this.txtTo.Text = this._to;
                }
            }
        }

      
        public string From
        {
            get
            {
                return this._from;
            }
            set
            {
                this._from = value;
            }
        }

       

        public string To
        {
            get
            {
                return this._to;
            }
            set
            {
                this._to = value;
            }
        }
    }
}