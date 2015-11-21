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
using System.IO;

namespace MicNets.Web
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            int[] nValues = new int[50];

            for (int i = 0; i < 50; i++)
            {
                nValues[i] = 1 + i * 2;
            }

            var Results = from n in nValues where n > 55 select n;

            string temp = string.Empty;
            foreach (var Result in Results)
            {
                temp = temp + Convert.ToString(Result);
            }

            Response.Write(temp);
        }
    }
}
