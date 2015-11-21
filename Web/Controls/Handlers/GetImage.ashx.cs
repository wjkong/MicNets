using System;
using System.Collections;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Drawing;
using System.Drawing.Imaging;

namespace MicNets.Web.Controls.Handlers
{
    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class GetImage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string url = context.Request.QueryString["url"];

            Bitmap bmp = AddCopyright(context.Server.MapPath(url));

            context.Response.ContentType = "image/jpeg";
            bmp.Save(context.Response.OutputStream, ImageFormat.Jpeg);
            bmp.Dispose();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public Bitmap AddCopyright(string file)
        {
            
            string msg = DateTime.Now.ToShortDateString();
            Bitmap bmp = new Bitmap(file);

            Graphics g = Graphics.FromImage(bmp);

            StringFormat strFmt = new StringFormat();
            strFmt.Alignment = StringAlignment.Center;

            SolidBrush btmForeColor = new SolidBrush(Color.White);
            SolidBrush btnBackColor = new SolidBrush(Color.Transparent);

            Font btmFont = new Font("Verdana", 7);
            SizeF textSize = new SizeF();

            textSize = g.MeasureString(msg, btmFont);

            float x = ((float)bmp.Width - textSize.Width - 3);
            float y = ((float)bmp.Height - textSize.Height - 3);
            float w = ((float)x + textSize.Width);
            float h = ((float)y + textSize.Height);

            RectangleF textArea = new RectangleF(x, y, w, h);
            g.FillRectangle(btnBackColor, textArea);

            g.DrawString(msg, btmFont, btmForeColor, textArea);
            btmForeColor.Dispose();
            btnBackColor.Dispose();
            btmFont.Dispose();
            g.Dispose();

            return bmp;
        }
    }
}
