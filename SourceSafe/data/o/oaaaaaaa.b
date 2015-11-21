using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using MicNets.Model;
using System.Configuration;

namespace MicNets.BizLogic
{
    public class ErrorLog
    {
        // Fields
        private string mAdditionalInfo;
        private HttpContext mContext;
        private Exception mException;
        private string mMessage;
        private Helper oHelper;
        private const int TABLE_WIDTH = 0x44c;

        // Methods
        public ErrorLog(Exception ex)
        {
            this.oHelper = new Helper();
            this.mException = ex;
            this.ReportErrorNonWeb(string.Empty);
        }

        public ErrorLog(Exception ex, string additionalInfo)
        {
            this.oHelper = new Helper();
            this.mException = ex;
            this.mAdditionalInfo = additionalInfo;
            this.ReportErrorNonWeb(string.Empty);
        }

        public ErrorLog(Exception ex, HttpContext context)
        {
            this.oHelper = new Helper();
            this.mContext = context;
            this.mException = ex;
            this.ReportError();
        }

        public ErrorLog(Exception ex, string additionalInfo, HttpContext context)
        {
            this.oHelper = new Helper();
            this.mContext = context;
            this.mException = ex;
            this.mAdditionalInfo = additionalInfo;
            this.ReportError();
        }

        private void BuildMessageNonWeb()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("<body bgcolor='#E5EEFF' leftmargin=5 topmargin=5 rightmargin=0 bottommargin=0>");
            builder.Append("<table width=100% >");
            builder.Append("<tr><td>" + this.GetExceptionDetail(this.mException, "Exception Detail") + "</td></tr>");
            builder.Append("<tr><td>" + this.GetAdditionalInfo() + "</td></tr>");
            builder.Append("</table></body>");
            this.mMessage = builder.ToString();
        }

        private void BuildMessageWeb()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("<body bgcolor='#E5EEFF' leftmargin=5 topmargin=5 rightmargin=0 bottommargin=0>");
            builder.Append("<table width=100%>");
            builder.Append("<tr><td>" + this.GetSource() + "</td></tr>");
            builder.Append("<tr><td>" + this.GetExceptionDetail(this.mException, "Exception Detail") + "</td></tr>");
            builder.Append("<tr><td>" + this.GetAdditionalInfo() + "</td></tr>");
            builder.Append("<tr><td>" + this.GetQueryString() + "</td></tr>");
            builder.Append("<tr><td>" + this.GetRequestForm() + "</td></tr>");
            builder.Append("<tr><td>" + this.GetSession() + "</td></tr>");
            builder.Append("<tr><td>" + this.GetServerVariables() + "</td></tr>");
            builder.Append("</table></body>");
            this.mMessage = builder.ToString();
        }

        private string GetAdditionalInfo()
        {
            if (this.oHelper.IsNullOrEmpty(this.mAdditionalInfo))
            {
                return string.Empty;
            }
            StringBuilder builder = new StringBuilder();
            builder.Append("<table border=1  bgcolor=white width=" + 0x44c + ">");
            builder.Append("<tr><td><strong>Additional Info</strong></td></tr>");
            builder.Append("<tr><td>" + this.mAdditionalInfo + "</td></tr></table><br>");
            return builder.ToString();
        }

        private string GetErrorDetail()
        {
            StringBuilder builder = new StringBuilder("<table border=1  bgcolor=white width=" + 0x44c + ">");
            if (this.mException == null)
            {
                return string.Empty;
            }
            builder.Append("<tr><td colspan=2><strong>Error Details<strong></td><td>");
            builder.Append("<tr><td>Description</td><td>" + this.mException.Message + "</td></tr>");
            builder.Append("<tr><td>Source</td><td>" + this.mException.Source + "</td></tr>");
            builder.Append("<tr><td>Target Site</td><td>" + this.mException.TargetSite + "</td></tr>");
            builder.Append("<tr><td>Trace</td><td>" + this.mException.StackTrace + "</td></tr></table><br>");
            return builder.ToString();
        }

        private string GetExceptionDetail(Exception ex, string title)
        {
            StringBuilder builder = new StringBuilder("<table border=1  bgcolor=white width=" + 0x44c + ">");
            if (ex == null)
            {
                return string.Empty;
            }
            builder.Append("<tr><td colspan=2><strong>" + title + "<strong></td><td>");
            builder.Append("<tr><td>Description</td><td>" + ex.Message + "</td></tr>");
            builder.Append("<tr><td width=130px>Exception Type</td><td>" + ex.GetType().ToString() + "</td></tr>");
            if (!this.oHelper.IsNullOrEmpty(ex.Source))
            {
                builder.Append("<tr><td>Source</td><td>" + ex.Source + "</td></tr>");
            }
            if (!this.oHelper.IsNullOrEmpty(ex.TargetSite))
            {
                builder.Append("<tr><td>Target Site</td><td>" + ex.TargetSite + "</td></tr>");
            }
            if (!this.oHelper.IsNullOrEmpty(ex.StackTrace))
            {
                builder.Append("<tr><td>Trace</td><td>" + ex.StackTrace + "</td></tr>");
            }
            builder.Append("</table><br>");
            if (ex.InnerException == null)
            {
                return builder.ToString();
            }
            return builder.Append(this.GetExceptionDetail(ex.InnerException, "Inner Exception Detail")).ToString();
        }

        private string GetQueryString()
        {
            StringBuilder builder = new StringBuilder("<table border=1  bgcolor=white width=" + 0x44c + ">");
            string[] allKeys = this.mContext.Request.QueryString.AllKeys;
            if (allKeys.Length == 0)
            {
                return string.Empty;
            }
            builder.Append("<tr><td colspan=2><strong>Query String Data</strong></td></tr>");
            for (int i = 0; i < allKeys.Length; i++)
            {
                if (!this.oHelper.IsNullOrEmpty(this.mContext.Request.QueryString[allKeys[i]]))
                {
                    builder.Append("<tr><td>" + allKeys[i] + "</td><td>" + this.mContext.Request.QueryString[allKeys[i]] + "</td></tr>");
                }
            }
            builder.Append("</table><br>");
            return builder.ToString();
        }

        private string GetRequestForm()
        {
            StringBuilder builder = new StringBuilder("<table border=1  bgcolor=white width=" + 0x44c + ">");
            string[] allKeys = this.mContext.Request.Form.AllKeys;
            if (allKeys.Length == 0)
            {
                return string.Empty;
            }
            builder.Append("<tr><td colspan=2><strong>Form Post Data</strong></td></tr>");
            for (int i = 0; i < allKeys.Length; i++)
            {
                if (!this.oHelper.IsNullOrEmpty(this.mContext.Request.Form[allKeys[i]]))
                {
                    builder.Append("<tr><td>" + allKeys[i] + "</td><td>" + this.mContext.Request.Form[allKeys[i]] + "</td></tr>");
                }
            }
            builder.Append("</table><br>");
            return builder.ToString();
        }

        private string GetServerVariables()
        {
            StringBuilder builder = new StringBuilder("<table border=1  bgcolor=white width=" + 0x44c + ">");
            string[] allKeys = this.mContext.Request.ServerVariables.AllKeys;
            if (allKeys.Length == 0)
            {
                return string.Empty;
            }
            builder.Append("<tr><td colspan=2><strong>Server Variables Data</strong></td></tr>");
            for (int i = 0; i < allKeys.Length; i++)
            {
                if (!this.oHelper.IsNullOrEmpty(this.mContext.Request.ServerVariables[allKeys[i]]))
                {
                    builder.Append("<tr><td>" + allKeys[i] + "</td><td>" + this.mContext.Request.ServerVariables[allKeys[i]] + "</td><tr>");
                }
            }
            builder.Append("</table>");
            return builder.ToString();
        }

        private string GetSession()
        {
            StringBuilder builder = new StringBuilder("<table border=1  bgcolor=white width=" + 0x44c + ">");
            if (((this.mContext == null) || (this.mContext.Session == null)) || (this.mContext.Session.Keys.Count == 0))
            {
                return string.Empty;
            }
            builder.Append("<tr><td colspan=2><strong>Session Data</strong></td></tr>");
            for (int i = 0; i < this.mContext.Session.Keys.Count; i++)
            {
                builder.Append(string.Concat(new object[] { "<Tr><td>", this.mContext.Session.Keys[i], "</td><td>", this.mContext.Session[this.mContext.Session.Keys[i]], "</td></Tr>" }));
            }
            builder.Append("</table><br>");
            return builder.ToString();
        }

        private string GetSource()
        {
            StringBuilder builder = new StringBuilder("<table border=1  bgcolor=white width=" + 0x44c + ">");
            builder.Append("<tr><td colspan=2><b>Error on " + this.mContext.Server.MachineName + "</b></td></tr>");
            builder.Append("<tr><td>File</td><td>" + this.mContext.Request.FilePath + "</td></tr>");
            builder.Append("<tr><td>Raw URL</td><td>" + this.mContext.Request.RawUrl + "</td></tr>");
            builder.Append("<tr><td>User Agent</td><td>" + this.mContext.Request.UserAgent + "</td></tr></table><br>");
            return builder.ToString();
        }

        private void ReportError()
        {
            this.BuildMessageWeb();
            EmailInfo oEmailInfo = new EmailInfo();
            oEmailInfo.Subject = "MicNets: Server error happended at " + DateTime.Now.ToString();
            oEmailInfo.From = ConfigurationSettings.AppSettings["AnonymousEmail"].ToString();
            oEmailInfo.To = ConfigurationSettings.AppSettings["DefaultEmail"].ToString();
            oEmailInfo.Body = this.mMessage;
            this.Send(oEmailInfo);
        }

        private void ReportErrorNonWeb(string serverName)
        {
            this.BuildMessageNonWeb();
            EmailInfo oEmailInfo = new EmailInfo();
            oEmailInfo.Subject = "ERROR";
            oEmailInfo.From = ConfigurationSettings.AppSettings["AnonymousEmail"].ToString();
            oEmailInfo.To = ConfigurationSettings.AppSettings["AnonymousEmail"].ToString();
            oEmailInfo.Body = this.mMessage;
            this.Send(oEmailInfo);
        }

        private bool Send(EmailInfo oEmailInfo)
        {
            Email email = new Email(oEmailInfo);
            if (HttpContext.Current.Request.IsLocal)
            {
                return email.SendFromLocal();
            }
            return email.Send();
        }
    }


}
