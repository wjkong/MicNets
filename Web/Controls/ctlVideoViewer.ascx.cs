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
    public partial class ctlVideoViewer : UserControl
    {
        // Fields
        protected string _videoID;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected override void Render(HtmlTextWriter writer)
        {
            writer.WriteBeginTag("object");
            writer.WriteAttribute("type", "application/x-shockwave-flash");
            writer.WriteAttribute("style", "width:425px; height:350px;");
            writer.WriteAttribute("data=", this._videoID);
            writer.Write('>');
            writer.WriteBeginTag("param");
            writer.WriteAttribute("name", "movie");
            writer.WriteAttribute("value", this._videoID);
            writer.Write(" />");
            writer.WriteEndTag("object");
            base.Render(writer);
        }

        public string VideoID
        {
            get
            {
                return this._videoID;
            }
            set
            {
                this._videoID = value;
            }
        }
    }

 

}