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
    public partial class naming_convention_design_guideline : BasePage
    {
        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                base.Keywords = "C#,Naming Convention,Design Guideline,consistent,pattern,Pascal case,Camel case,upper case,Class,namespace,interface,constant,enumeration,method,exception,control";
                base.Description = "code blocks opening closing braces spaces,improve readability by decreasing code density,eliminate unclear code and make it easier for developers to understand shared code,The first letter in the identifier and the first letter of each subsequent concatenated word are capitalized,The first letter of an identifier is lowercase and the first letter of each subsequent concatenated word is capitalized";
                Master.TopicTitle = "C# Naming Convention and Design Guideline";
            }

            string errorMeg = string.Empty;
        }
    }
}
