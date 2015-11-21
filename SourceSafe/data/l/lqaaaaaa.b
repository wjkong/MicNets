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

namespace MicNets.Web.Controls
{
    public partial class ctlAlphaBar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LinkButton child = new LinkButton();
                child.Text = "All";
                child.CssClass = "noUnderLine";
                child.Font.Bold = true;
                //child.Click += new EventHandler(this.btnAlpha_Click);
                this.phdAlphaBar.Controls.Add(child);
                char ch = 'A';
                for (int i = 0; i < 26; i++)
                {
                    Label label = new Label();
                    label.Text = " | ";
                    this.phdAlphaBar.Controls.Add(label);
                    LinkButton button2 = new LinkButton();
                    button2.Text = Convert.ToChar((int)(ch + i)).ToString();
                    button2.CssClass = "noUnderLine";
                    button2.Font.Bold = true;
                    //button2.Click += new EventHandler(this.btnAlpha_Click);
                    this.phdAlphaBar.Controls.Add(button2);
                }
            }
        }
    }
}