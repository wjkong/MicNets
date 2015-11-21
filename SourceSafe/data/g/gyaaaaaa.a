using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using iTextSharp.text;
using iTextSharp.text.pdf;
using MicNets.BizLogic;
using System.Data;

namespace MicNets.Web.Blog
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Title = "Contact List";
            MemoryStream PDFData = new MemoryStream();
 
            // step 1: creation of a document-object
            Document document = new Document();

            // step 2:
            // we create a writer that listens to the document
            // and directs a PDF-stream to a file

            PdfWriter.GetInstance(document, PDFData);

            // step 3: we open the document
            document.Open();

            // step 4: we add a paragraph to the document
            document.Add(new Paragraph(DateTime.Now.ToString()));
            Contact oContact = new Contact();
            DataTable dtContact = oContact.LoadAll();
            int numRow = dtContact.Rows.Count;
            int numCol = 5;
            iTextSharp.text.Table aTable = new iTextSharp.text.Table(numCol, numRow);
            aTable.AutoFillEmptyCells = true;
            aTable.Padding = 1;
            aTable.Spacing = 1;

            Cell cell = new Cell(new Phrase("Contact List", FontFactory.GetFont(FontFactory.TIMES, 14, Font.BOLD)));
            cell.Header = true;
            cell.Colspan = numCol;
            cell.BackgroundColor = Color.LIGHT_GRAY;
            cell.HorizontalAlignment = Element.ALIGN_CENTER;

            aTable.AddCell(cell);

            

            for (int i = 0; i < dtContact.Rows.Count; i++)
            {
                for (int n = 1; n <= numCol; n++)
                    aTable.AddCell(dtContact.Rows[i][n].ToString());
                
            }
            document.Add(aTable);
            // step 5: we close the document
            document.Close();

            Response.Clear();
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/pdf";
            Response.Charset = string.Empty;
            Response.Cache.SetCacheability(System.Web.HttpCacheability.Public);
            Response.AddHeader("Content-Disposition",
                "attachment; filename=" + Title.Replace(" ", "").Replace(":", "-") + ".pdf");

            Response.OutputStream.Write(PDFData.GetBuffer(), 0, PDFData.GetBuffer().Length);
            Response.OutputStream.Flush();
            Response.OutputStream.Close();
            Response.End();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Page.Title = "Michael";
            MemoryStream PDFData = new MemoryStream();

            PdfReader reader = new PdfReader(Server.MapPath("~/PDF") + "\\Chap0101.pdf");
            //PdfStamper stamper = new PdfStamper(reader, new FileStream(Server.MapPath("~/PDF") + "/new.pdf", FileMode.Create));
            PdfStamper stamper = new PdfStamper(reader, PDFData);

            AcroFields fields = stamper.AcroFields;

            //fields.SetField("TextValue", "John Doe");

            Hashtable info = new Hashtable();
            info["Title"] = "Modified Form";
            info["Author"] = "Dolly";
            info["Creator"] = "My Web App";
            info["Subject"] = "My Web App";
            info["Keywords"] = "My Web App";
            stamper.MoreInfo = info;

            stamper.FormFlattening = true;
            stamper.Close();

            Response.Clear();
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/pdf";
            Response.Charset = string.Empty;
            Response.Cache.SetCacheability(System.Web.HttpCacheability.Public);
            Response.AddHeader("Content-Disposition",
                "attachment; filename=" + Title.Replace(" ", "").Replace(":", "-") + ".pdf");

            Response.OutputStream.Write(PDFData.GetBuffer(), 0, PDFData.GetBuffer().Length);
            Response.OutputStream.Flush();
            Response.OutputStream.Close();
            Response.End();

        }
    }
}
