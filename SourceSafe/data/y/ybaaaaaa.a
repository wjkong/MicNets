using System.Linq;
using System.Text;
using System;
using System.Collections.Generic;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data.Common;
using System.Text.RegularExpressions;
using System.Reflection;
using System.Xml.Serialization;
using System.Web.Mail;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web;
using System.Web.Security;
using System.Xml;
using MicNets.Model.RSS;
using MicNets.Model.Validator;


namespace MicNets.Model
{
    public class Helper
    {
        // Methods
        public string BuildPopUpMessage(string meg)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("<script language='javascript'>");
            builder.Append("alert('" + meg + "')");
            builder.Append("</script>");
            return builder.ToString();
        }

        public int CountCharInString(string str, char cha)
        {
            int num = 0;
            for (int i = 0; i < str.Length; i++)
            {
                char ch = str[i];
                if (ch.Equals(cha))
                {
                    num++;
                }
            }
            return num;
        }

        public void GenerateRSSSeed(XmlTextWriter oWriter, RSSInfo oRSSInfo)
        {
            oWriter.WriteStartDocument();
            oWriter.WriteStartElement("rss");
            oWriter.WriteAttributeString("version", oRSSInfo.Version);
            oWriter.WriteStartElement("channel");
            oWriter.WriteElementString("title", oRSSInfo.Channel.Title);
            oWriter.WriteElementString("link", oRSSInfo.Channel.Link);
            oWriter.WriteElementString("description", oRSSInfo.Channel.Description);
            oWriter.WriteElementString("language", oRSSInfo.Channel.Language);
            for (int i = 0; i < oRSSInfo.Channel.Items.Length; i++)
            {
                oWriter.WriteStartElement("item");
                oWriter.WriteElementString("title", oRSSInfo.Channel.Items[i].Title);
                oWriter.WriteElementString("description", oRSSInfo.Channel.Items[i].Description);
                oWriter.WriteElementString("category", oRSSInfo.Channel.Items[i].Category);
                oWriter.WriteElementString("link", oRSSInfo.Channel.Items[i].Link);
                oWriter.WriteElementString("pubDate", oRSSInfo.Channel.Items[i].DatePublished);
                oWriter.WriteEndElement();
            }
            oWriter.WriteEndElement();
            oWriter.WriteEndElement();
            oWriter.WriteEndDocument();
            oWriter.Flush();
            oWriter.Close();
        }

        public Enum GetEnumByName(Type type, string value)
        {
            if (type.IsEnum)
            {
                string[] names = Enum.GetNames(type);
                for (int i = 0; i < names.Length; i++)
                {
                    Enum enum2 = (Enum)Enum.Parse(type, names[i], true);
                    if (enum2.ToString().Equals(value))
                    {
                        return enum2;
                    }
                }
            }
            return null;
        }

        public string GetPrefix(Control control)
        {
            string clientID = control.ClientID;
            return clientID.Substring(0, clientID.Length - control.ID.Length);
        }

        public string GetStringValue(Enum value)
        {
            StringValueAttribute[] customAttributes = value.GetType().GetField(value.ToString()).GetCustomAttributes(typeof(StringValueAttribute), false) as StringValueAttribute[];
            if (customAttributes.Length > 0)
            {
                return customAttributes[0].Value;
            }
            return string.Empty;
        }

        public string GetTempPassword()
        {
            return Guid.NewGuid().ToString().Substring(0, 8);
        }

        public bool IsDateTimeFormat(string strDateTime)
        {
            if (this.IsNullOrEmpty(strDateTime))
            {
                return false;
            }
            try
            {
                Convert.ToDateTime(strDateTime);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool IsDefinedName(Type type, object value)
        {
            if (value == null)
            {
                return false;
            }
            string[] names = Enum.GetNames(type);
            for (int i = 0; i < names.Length; i++)
            {
                if (names[i].ToUpper().Equals(value.ToString().ToUpper()))
                {
                    return true;
                }
            }
            return false;
        }

        public bool IsFileInUse(string path)
        {
            try
            {
                using (new FileStream(path, FileMode.OpenOrCreate))
                {
                }
                return false;
            }
            catch (IOException)
            {
                return true;
            }
        }

        public bool IsNullOrEmpty(object obj)
        {
            return ((obj == null) || (obj.ToString().Trim().Length == 0));
        }

        public bool IsPositiveNumber(string strNumber)
        {
            if (this.IsNullOrEmpty(strNumber))
            {
                return false;
            }
            Regex regex = new Regex("[^0-9.]");
            Regex regex2 = new Regex("^[.][0-9]+$|[0-9]*[.]*[0-9]+$");
            Regex regex3 = new Regex("[0-9]*[.][0-9]*[.][0-9]*");
            return ((!regex.IsMatch(strNumber) && regex2.IsMatch(strNumber)) && !regex3.IsMatch(strNumber));
        }

        public bool IsValidEmail(string strEmail)
        {
            if (this.IsNullOrEmpty(strEmail))
            {
                return false;
            }
            Regex regex = new Regex(@"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
            return regex.Match(strEmail).Success;
        }

        public bool IsValidPhone(string strPhone)
        {
            if (this.IsNullOrEmpty(strPhone) || (strPhone.Length != 10))
            {
                return false;
            }
            string pattern = "[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(strPhone);
        }

        public bool IsWholeNumber(string strNumber)
        {
            if (this.IsNullOrEmpty(strNumber))
            {
                return false;
            }
            Regex regex = new Regex("[^0-9]");
            return !regex.IsMatch(strNumber);
        }

        public void LoadData(DataTable dt, ListControl listControl)
        {
            if ((dt != null) && (dt.Rows.Count > 0))
            {
                listControl.DataSource = dt;
                listControl.DataValueField = dt.Columns[0].ToString();
                listControl.DataTextField = dt.Columns[1].ToString();
            }
        }

        public bool SelectedByText(ListControl lst, string strText)
        {
            ListItem item = lst.Items.FindByText(strText);
            if (item != null)
            {
                item.Selected = true;
                return true;
            }
            return false;
        }

        public bool SelectedByValue(ListControl lst, string strValue)
        {
            ListItem item = lst.Items.FindByValue(strValue);
            if (item != null)
            {
                item.Selected = true;
                return true;
            }
            return false;
        }

        public string SerizlizeToXML(object obj)
        {
            MemoryStream stream = new MemoryStream();
            TextWriter textWriter = new StreamWriter(stream, Encoding.UTF8);
            new XmlSerializer(obj.GetType()).Serialize(textWriter, obj);
            int length = (int)stream.Length;
            byte[] buffer = new byte[length];
            stream.Seek(0L, SeekOrigin.Begin);
            stream.Read(buffer, 0, length);
            UTF8Encoding encoding = new UTF8Encoding();
            return encoding.GetString(buffer).Trim();
        }

        public void ValidAllProperties(object obj, ArrayList lstError)
        {
            foreach (PropertyInfo info in obj.GetType().GetProperties())
            {
                ValidatorAttribute[] customAttributes = (ValidatorAttribute[])info.GetCustomAttributes(typeof(ValidatorAttribute), true);
                int length = customAttributes.Length;
                foreach (ValidatorAttribute attribute in customAttributes)
                {
                    attribute.PropInfo = info;
                    attribute.Instance = obj;
                    if (!attribute.IsValid())
                    {
                        object obj2 = info.GetValue(obj, null);
                        if (!this.IsNullOrEmpty(obj2))
                        {
                            obj2.ToString();
                        }
                    }
                }
            }
        }

        public string ConvertDataTableToString(DataTable dt)
        {
            string rowSeparator = ";";
            string colSeparator = ",";
            StringBuilder strb = new StringBuilder();
            int numOfRow = dt.Rows.Count;
            int numOfCol = dt.Columns.Count;

            for (int i = 0; i < numOfRow; i++)
            {
                for (int n = 0; n < numOfCol; n++)
                {
                    strb.Append(dt.Rows[i][n].ToString());
                    
                    if (n < numOfCol - 1) 
                       strb.Append(colSeparator);
                }

                if (i < numOfRow - 1)
                    strb.Append(rowSeparator);
            }

            return strb.ToString();
        }
    }
}
