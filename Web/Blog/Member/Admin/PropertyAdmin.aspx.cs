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
using System.Data.OleDb;
using System.Net;
using MicNets.Model.DataSets;
using MicNets.BizLogic;

namespace MicNets.Web.Blog.Member.Admin
{
    public partial class PropertyAdmin : BasePage
    {
        // Fields
        protected Button btnUpload;
        protected FileUpload filExcel;
        protected Label lblNotice;

        // Methods
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            new Helper();
            if (!this.filExcel.HasFile)
            {
                this.lblNotice.Text = "Please, provide an Excel file.";
            }
            else if (!this.filExcel.PostedFile.FileName.ToLower().EndsWith(".xls"))
            {
                this.lblNotice.Text = "Required an Excel file.";
            }
            else if (this.filExcel.PostedFile.ContentLength == 0)
            {
                this.lblNotice.Text = "The uploaded file is empty. Please, choose another one.";
            }
            else
            {
                try
                {
                    string str = DateTime.Now.Ticks + "_" + this.filExcel.FileName;
                    this.filExcel.SaveAs(base.Request.PhysicalApplicationPath + @"\Blog\Member\UploadedFiles\" + str);
                    string str2 = base.Server.MapPath("~/Blog/Member/UploadedFiles/" + str);
                    string selectConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + str2 + ";Extended Properties=Excel 8.0;";
                    OleDbDataAdapter adapter = new OleDbDataAdapter("SELECT * FROM [Properties$]", selectConnectionString);
                    
                    adapter.TableMappings.Add("Table", "DTProperty");
                    DSProperty dsPropertyOld = new DSProperty();
                    DSProperty dsProperty = new DSProperty();

                    adapter.Fill(dsProperty);
                    UpdateRecords(dsProperty);
                    this.lblNotice.Text = "Successfull uploaded file.";
                }
                catch (WebException exception)
                {
                    this.lblNotice.Text = exception.Message;
                }
                catch (Exception exception2)
                {
                    this.lblNotice.Text = exception2.Message;
                }
            }
        }

        private bool UpdateRecords(DSProperty dsProperty)
        {
            DSProperty.DTPropertyRow drProperty;
            Property oProperty = new Property();

            for (int i = 0; i < dsProperty.DTProperty.Rows.Count; i++)
            {
                drProperty = dsProperty.DTProperty.Rows[i] as DSProperty.DTPropertyRow;

                if (!drProperty.IsSKUNull() && !oHelper.IsNullOrEmpty(oProperty.SKU))
                {
                    oProperty.SKU = drProperty.SKU;
                    oProperty.Description = drProperty.Description;
                    oProperty.PricePurchased = drProperty.PricePurchased;
                    oProperty.PlacePurchased = drProperty.PlacePurchased;
                    oProperty.DatePurchased = drProperty.DatePurchased;
                    oProperty.HasReceipt = drProperty.HasReceipt;

                    oProperty.Modify();
                }
            }

            return true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

    }
}
