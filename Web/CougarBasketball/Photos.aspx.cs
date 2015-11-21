using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace MicNets.Web.CougarBasketball
{
    public partial class Photos : System.Web.UI.Page
    {
        protected void btnFirst_Click(object sender, EventArgs e)
        {
            this.hidPageIndex.Value = Convert.ToString(0);
            this.SetScreen();
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            this.hidPageIndex.Value = Convert.ToString(Convert.ToInt32(this.hidMaxPageIndex.Value) - 1);
            this.SetScreen();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            this.hidPageIndex.Value = Convert.ToString((int)(Convert.ToInt32(this.hidPageIndex.Value) + 1));
            this.SetScreen();
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            this.hidPageIndex.Value = Convert.ToString((int)(Convert.ToInt32(this.hidPageIndex.Value) - 1));
            this.SetScreen();
        }

      

        private void BuildMeta()
        {
            string keywords = "MicNets Photo Album,Fun,Cute,photo,summer,park,han,children,parent,family";
            string descriptions = "MicNets Photo Album,Fun,Cute,photo,summer,park,han,children,parent,family";
            this.Page.Header.Controls.Add(WebHelper.GetKeywords(keywords));
            this.Page.Header.Controls.Add(WebHelper.GetDescriptions(descriptions));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                if (Request.QueryString["PageIndex"] != null)
                {
                    this.hidPageIndex.Value = Request.QueryString["PageIndex"].ToString();
                }
                else
                {
                    this.hidPageIndex.Value = Convert.ToString(0);
                }
                //this.BuildMeta();
                this.SetScreen();
            }
        }

        private void SetScreen()
        {
            string relativePathDirectory = "~/CougarBasketball/Pictures/";
            string physicalPathDirectory = Server.MapPath(relativePathDirectory);

            string[] fileEntries = Directory.GetFiles(Server.MapPath(relativePathDirectory), "*.jpg");
            string[] urlImages = new string[fileEntries.Length];

            for (int i = 0; i < fileEntries.Length; i++)
            {
                urlImages[i] = fileEntries[i].Replace(physicalPathDirectory, relativePathDirectory);
            }


            this.imgPhoto.ImageUrl = urlImages[Convert.ToInt32(hidPageIndex.Value)];
            this.imgPhoto.Width = new Unit(1024);
          
            this.hidMaxPageIndex.Value = urlImages.Length.ToString();
            this.btnFirst.OnClientClick = (hidPageIndex.Value != "0") ? string.Empty : "return false";
            this.btnPrev.OnClientClick = this.btnFirst.OnClientClick;
            this.btnLast.OnClientClick = (hidPageIndex.Value != Convert.ToString(urlImages.Length - 1)) ? string.Empty : "return false";
            this.btnNext.OnClientClick = this.btnLast.OnClientClick;
            this.btnPre2.OnClientClick = this.btnPrev.OnClientClick;
            this.btnFirst2.OnClientClick = this.btnFirst.OnClientClick;
            this.btnNext2.OnClientClick = this.btnNext.OnClientClick;
            this.btnLast2.OnClientClick = this.btnLast.OnClientClick;
            this.lblPageIndex.Text = string.Concat(new object[] { string.Empty, Convert.ToInt32(this.hidPageIndex.Value) + 1, "/", Convert.ToInt32(this.hidMaxPageIndex.Value) });
            this.lblPageIndex2.Text = this.lblPageIndex.Text;
        }
    }
}
