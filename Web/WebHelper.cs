using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MicNets.Model;
using System.IO;
using System.Drawing;

namespace MicNets.Web
{
    public abstract class WebHelper
    {
        // Methods
        protected WebHelper()
        {
        }

        public static int CountSelectedItem(ListControl lst)
        {
            int num = 0;
            foreach (ListItem item in lst.Items)
            {
                if (item.Selected)
                {
                    num++;
                }
            }
            return num;
        }

        public static void DataGridToExcel(HttpResponse myResponse, DataGrid dg, string fileName, int numRowLock)
        {
            myResponse.Clear();
            myResponse.Buffer = true;
            myResponse.ContentType = "application/vnd.ms-excel";
            myResponse.Charset = "";
            myResponse.AddHeader("content-disposition", "attachment;filename=" + fileName + ".xls");
            StringWriter writer = new StringWriter();
            HtmlTextWriter writer2 = new HtmlTextWriter(writer);
            dg.HeaderStyle.Height = 30;
            dg.HeaderStyle.BackColor = Color.LightSlateGray;
            MassageData(dg);
            dg.RenderControl(writer2);
            myResponse.End();
        }

        public static void Flip(HtmlInputFile file, System.Web.UI.WebControls.Image img, bool blnReadOnly)
        {
            img.Visible = blnReadOnly;
            file.Visible = !blnReadOnly;
            if (blnReadOnly && (file.PostedFile.ContentLength != 0))
            {
                img.ImageUrl = file.PostedFile.FileName;
            }
        }

        public static void Flip(Label lbl, ListControl lst, bool blnReadOnly)
        {
            lbl.Visible = blnReadOnly;
            lst.Visible = !blnReadOnly;
            if (blnReadOnly)
            {
                lbl.Text = "";
                foreach (ListItem item in lst.Items)
                {
                    if (item.Selected)
                    {
                        lbl.Text = lbl.Text + "<br>" + item.Text;
                    }
                }
                if (lbl.Text != "")
                {
                    lbl.Text = lbl.Text.Remove(0, 4);
                }
            }
            else
            {
                string str = lbl.Text.Replace("<br>", ",");
                if (str != "")
                {
                    foreach (string str2 in str.Split(new char[] { ',' }))
                    {
                        SelectedByText(lst, str2);
                    }
                }
            }
        }

        public static void Flip(TextBox txt, ListControl lst, bool blnReadOnly)
        {
            txt.Visible = blnReadOnly;
            lst.Visible = !blnReadOnly;
            if (blnReadOnly)
            {
                txt.Text = lst.SelectedItem.Text;
            }
            else
            {
                SelectedByText(lst, txt.Text);
            }
        }

        public static HtmlMeta GetDescriptions(string descriptions)
        {
            return GetHtmlMeta(descriptions, NHtmlMetaType.Description);
        }

        private static HtmlMeta GetHtmlMeta(string content, NHtmlMetaType metaType)
        {
            HtmlMeta meta = new HtmlMeta();
            meta.Name = metaType.ToString().ToLower();
            meta.Content = content.ToLower();
            return meta;
        }

        public static int GetIndex(DataGrid dg, string columnName)
        {
            for (int i = 0; i < dg.Columns.Count; i++)
            {
                if (dg.Columns[i].HeaderText == columnName)
                {
                    return i;
                }
            }
            return -1;
        }

        public static HtmlMeta GetKeywords(string keywords)
        {
            return GetHtmlMeta(keywords, NHtmlMetaType.Keywords);
        }

        public static string GetListText(ListControl lst)
        {
            return ListToString(lst, "TEXT");
        }

        public static string GetListValue(ListControl lst)
        {
            return ListToString(lst, "VALUE");
        }

        public static HtmlMeta GetTitle(string title)
        {
            return GetHtmlMeta(title, NHtmlMetaType.Title);
        }

        public static string ListToString(ListControl lst, string type)
        {
            string str = "";
            foreach (ListItem item in lst.Items)
            {
                if (item.Selected)
                {
                    if (type == "TEXT")
                    {
                        str = str + "<br>" + item.Text;
                    }
                    else if (type == "VALUE")
                    {
                        str = str + "<br>" + item.Value;
                    }
                }
            }
            if (str != "")
            {
                str = str.Remove(0, 4);
            }
            return str;
        }

        public static void LoadData(DataTable dt, ListControl listControl)
        {
            listControl.DataSource = dt;
            listControl.DataValueField = dt.Columns[0].ToString();
            listControl.DataTextField = dt.Columns[1].ToString();
        }

        public static void MassageData(DataGrid dg)
        {
            bool flag = false;
            int num = 0;
            while (num < dg.Columns.Count)
            {
                if (dg.Columns[num].Visible && (dg.Columns[num].HeaderText.Trim().ToUpper() == "ORDER CODE"))
                {
                    flag = true;
                    break;
                }
                num++;
            }
            if (flag)
            {
                foreach (DataGridItem item in dg.Items)
                {
                    item.Cells[num].Text = "'" + item.Cells[num].Text;
                }
            }
        }

        public static void ModifyTextBox(TextBox[] arrTxt, bool blnReadOnly, BorderStyle borderStyle)
        {
            for (int i = 0; i < arrTxt.Length; i++)
            {
                arrTxt[i].ReadOnly = blnReadOnly;
                if ((arrTxt[i].TextMode == TextBoxMode.MultiLine) && blnReadOnly)
                {
                    arrTxt[i].BorderStyle = BorderStyle.Groove;
                }
                else
                {
                    arrTxt[i].BorderStyle = borderStyle;
                }
            }
        }

        public static bool SelectedByText(ListControl lst, string strText)
        {
            ListItem item = lst.Items.FindByText(strText);
            if (item == null)
            {
                return false;
            }
            if ((lst.GetType().ToString() != "System.Web.UI.WebControls.ListBox") && (lst.GetType().ToString() != "System.Web.UI.WebControls.CheckBoxList"))
            {
                lst.ClearSelection();
            }
            item.Selected = true;
            return true;
        }

        public static bool SelectedByValue(ListControl lst, string strValue)
        {
            ListItem item = lst.Items.FindByValue(strValue);
            if (item == null)
            {
                return false;
            }
            if ((lst.GetType().ToString() != "System.Web.UI.WebControls.ListBox") && (lst.GetType().ToString() != "System.Web.UI.WebControls.CheckBoxList"))
            {
                lst.ClearSelection();
            }
            item.Selected = true;
            return true;
        }

        public static void SwitchStars(Label[] arrLbl, bool blnReadOnly)
        {
            for (int i = 0; i < arrLbl.Length; i++)
            {
                arrLbl[i].Visible = !blnReadOnly;
            }
        }
    }
}

