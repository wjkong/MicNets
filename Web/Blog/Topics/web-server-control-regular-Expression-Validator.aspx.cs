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

namespace MicNets.Web.Blog.Topics
{
    public partial class web_server_control_regularExpressionValidator : BasePage
    {
        // Fields
        protected Label lblCananaPostalCode;
        protected Label lblEmail;
        protected Label lblPhone;
        protected Label lblSIN;
        protected Label lblSSN;
        protected Label lblURL;
        protected Label lblUSAZipCode;
        protected TextBox txtCananaPostalCode;
        protected TextBox txtEmail;
        protected TextBox txtPhone;
        protected TextBox txtSIN;
        protected TextBox txtSSN;
        protected TextBox txtURL;
        protected TextBox txtUSAZipCode;
        protected RegularExpressionValidator vldeCananaPostalCode;
        protected RegularExpressionValidator vldeEmail;
        protected RegularExpressionValidator vldePhone;
        protected RegularExpressionValidator vldeSIN;
        protected RegularExpressionValidator vldeSSN;
        protected RegularExpressionValidator vldeURL;
        protected RegularExpressionValidator vldeUSAZipCode;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                base.Keywords = "Web,Server,Control,RegularExpressionValidator,validation,control,client-side,server-side,regular expression,Email,URL,Phone,Postal Code,Zip Code,SSN,SIN,Metacharacter,Quantifier";
                base.Description = "Validate Canadian Postal Code,Validate USA Zip Code,Validate Internet Email Address,Validate Internet URL,Validate North America Phone Number,Validate USA Social Security Number,Validate Canadian Social Insurance Number";

                Master.TopicTitle = "ASP.NET Web Server Control II: Regular Expression Validator";
            }
        }
    }
}
