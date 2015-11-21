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
using MicNets.Controls;
using MicNets.BizLogic;
using System.Drawing;

namespace MicNets.Web.Controls
{
    public partial class ctlComment : BaseControl
    {
        // Fields
        protected int _topicID;
        protected Button btnAddComment;
        protected DataGrid dgComment;
        protected Label Label1;
        protected Label lblCustName;
        protected Panel Panel1;
        protected TextArea txtComment;
        protected TextBox txtCustName;
        protected RequiredFieldValidator vldrComment;
        protected RequiredFieldValidator vldrCustName;

        // Methods
        protected void btnAddComment_Click(object sender, EventArgs e)
        {
            Page.Validate("PostComment");

            if (Page.IsValid && IsVerificationCodeMatch()) 
            {
                int i = ratTopic.CurrentRating;
                Comment comment = new Comment();
                comment.Content = this.txtComment.Text.Trim();
                comment.CustName = this.txtCustName.Text.Trim();
                comment.TopicID = this._topicID;

                if (!IsValidData(comment.Content))
                {
                    base.BuildPopup("Sorry, your comment contains invalid characters.");
                }
                else
                {
                    if (comment.AddOne())
                    {
                        this.txtCustName.Text = string.Empty;
                        this.txtComment.Text = string.Empty;
                        this.txtVerificationCode.Text = string.Empty;

                        base.BuildPopup("Thank you for your comment!");
                    }
                    else
                    {
                        base.BuildPopup("Cannot post your comment due to an error.");
                    }
                }

                ResetVerificationCode();
            }

            this.SetScreen();
        }

        private bool IsVerificationCodeMatch()
        {
            string verificationCode = Session["VerificationCode"].ToString();

            if (!oHelper.IsNullOrEmpty(txtVerificationCode.Text) && txtVerificationCode.Text.ToUpper() == verificationCode)
                return true;
            else
                return false;
        }
        private bool IsValidData(string data)
        {
            if (data.IndexOf("http") >= 0 || data.IndexOf("HTTP") >= 0)
                return false;
            else
                return true;
        }

        protected void dgComment_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                int num = Convert.ToInt32(((DataRowView)e.Item.DataItem)["TotalComment"]) - e.Item.ItemIndex;
                Label label = (Label)e.Item.FindControl("lblNum");
                label.Text = string.Concat(new object[] { "#", num, " ", ((DataRowView)e.Item.DataItem)["custName"], " Posted: " });
            }
        }

        protected void dgComment_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            ((DataGrid)source).CurrentPageIndex = e.NewPageIndex;
            this.SetScreen();
        }

        public string CreateRandomCode(int codeCount)
        {
            string allChar = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
            string[] allCharArray = allChar.Split(',');
            string randomCode = "";
            int temp = -1;

            Random rand = new Random();
            for (int i = 0; i < codeCount; i++)
            {
                if (temp != -1)
                {
                    rand = new Random(i * temp * ((int)DateTime.Now.Ticks));
                }
                int t = rand.Next(26);
                if (temp != -1 && temp == t)
                {
                    return CreateRandomCode(codeCount);
                }
                temp = t;
                randomCode += allCharArray[t];
            }
            return randomCode;
        }

        private void CreateImage(string checkCode, string imageFile)
        {
            System.Drawing.Bitmap image = new System.Drawing.Bitmap(Convert.ToInt32(Math.Ceiling((decimal)(checkCode.Length * 14))), 33);
            Graphics g = Graphics.FromImage(image);

            try
            {
                Random random = new Random();
                g.Clear(Color.AliceBlue);

                for (int i = 0; i < 25; i++)
                {
                    int x1 = random.Next(image.Width);
                    int x2 = random.Next(image.Width);
                    int y1 = random.Next(image.Height);
                    int y2 = random.Next(image.Height);

                    g.DrawLine(new Pen(Color.Silver), x1, y1, x2, y2);
                }

                Font font = new System.Drawing.Font("Comic Sans MS", 14, System.Drawing.FontStyle.Bold);
                System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.Red, 1.2f, true);
                g.DrawString(checkCode, font, new SolidBrush(Color.Red), 2, 2);

                for (int i = 0; i < 100; i++)
                {
                    int x = random.Next(image.Width);
                    int y = random.Next(image.Height);

                    image.SetPixel(x, y, Color.FromArgb(random.Next()));
                }
                g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);

                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                image.Save(Server.MapPath(imageFile), System.Drawing.Imaging.ImageFormat.Gif);
                //Response.ClearContent();
                //Response.ContentType = "image/Gif";
                //Response.BinaryWrite(ms.ToArray());
            }
            finally
            {
                g.Dispose();
                image.Dispose();
            }
        } 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.SetScreen();

                ResetVerificationCode();
            }
        }

        private void ResetVerificationCode()
        {
            string imageFile = "~/Image/Verification/" + Session.SessionID + ".gif";
            imgVerificationCode.ImageUrl = imageFile;
            string verificationCode = CreateRandomCode(4);
            CreateImage(verificationCode, imageFile);
            Session["VerificationCode"] = verificationCode;
        }
        private void SetScreen()
        {
            Comment comment = new Comment();
            comment.TopicID = this._topicID;
            this.dgComment.DataSource = comment.LoadAll();
            this.dgComment.DataBind();
        }

        

        public int TopicID
        {
            get
            {
                return this._topicID;
            }
            set
            {
                this._topicID = value;
            }
        }

        protected void btnResetVerificationCode_Click(object sender, EventArgs e)
        {
            ResetVerificationCode();
        }
    }

 

}