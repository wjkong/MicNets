using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Net.Mail;
using System.Configuration;


namespace MicNets.BizLogic
{
    public class Email : EmailInfo
    {
        // Fields
        public static readonly string DEFAULT_EMAIL = ConfigurationSettings.AppSettings["DefaultEmail"].ToString();

        // Methods
        public Email()
        {
        }

        public Email(EmailInfo info)
            : base(info)
        {
        }

        public bool Send()
        {
            MailMessage message = null;
            try
            {
                message = new MailMessage();
                message.IsBodyHtml = true;
                message.From = new MailAddress(base.From);
                message.To.Add(new MailAddress(base.To));
                message.Subject =  base.Subject;
                message.Body = base.Body;
                
                new SmtpClient(ConfigurationSettings.AppSettings["SMTPServer"].ToString()).Send(message);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool SendFromLocal()
        {
            MailMessage message = null;
            try
            {
                message = new MailMessage();
                message.IsBodyHtml = true;
                message.From = new MailAddress(base.From);
                message.To.Add(new MailAddress(base.To));
                message.Subject = base.Subject;
                message.Body = base.Body;

                new SmtpClient().Send(message);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool SendErrorNotice(string source)
        {
            StringBuilder builder = new StringBuilder("<html><body>");
            builder.Append("<p>There is error cause by " + source + "</p>");
            builder.Append("</body></html>");
            base.From = ConfigurationSettings.AppSettings["DefaultEmail"].ToString();
            base.To = ConfigurationSettings.AppSettings["DefaultEmail"].ToString();
            base.Subject = "MicNets - Error Notification";
            base.Body = builder.ToString();
            return this.Send();
        }

        public bool SendThroughWebService()
        {
            try
            {
                EmailWS.EmailServer oService = new EmailWS.EmailServer();
                EmailWS.Email oInfo = new EmailWS.Email();
                oInfo.From = base.From;
                oInfo.To = base.To;
                oInfo.Subject = base.Subject;
                oInfo.Body = base.Body;
                oInfo.NPriority = MailPriority.Low.ToString();
                string password = ConfigurationSettings.AppSettings["ServicePassword"].ToString();

                return oService.SendEmail(oInfo, password);
            }
            catch (Exception exception)
            {
                string message = exception.Message;
                return false;
            }
        }

        public bool SendPwdRecoveryEmail(string tempPassword, bool isLocal)
        {
            StringBuilder builder = new StringBuilder("<html><body>");
            builder.Append("<p>Thank you for your request.</p>");
            builder.Append("<p>Temparory Password: " + tempPassword + "</p>");
            builder.Append("<p>Login to <a href='http://www.micnets.com/Public/Login.aspx'>MicNets .NET Professional</a></p>");
            builder.Append("</body></html>");
            base.From = ConfigurationSettings.AppSettings["DefaultEmail"].ToString();
            base.Subject = "MicNets .NET Professional - Password recovery";
            base.Body = builder.ToString();

            if (isLocal)
                return this.SendThroughWebService();
            else
                return this.Send();
        }

        public bool SendRegConfirmEmail(string tempPassword, bool isLocal)
        {
            StringBuilder builder = new StringBuilder("<html><body>");
            builder.Append("<p>Thank you for registering with MicNets .NET Professional.</p>");
            builder.Append("<p>Here is your Temparory Password: " + tempPassword + "</p>");
            builder.Append("<p>Login to <a href='http://www.micnets.com/Public/Login.aspx'>MicNets .NET Professional</a></p>");
            builder.Append("</body></html>");
            base.From = ConfigurationSettings.AppSettings["DefaultEmail"].ToString();
            base.Subject = "MicNets .NET Professional - Registration confirmation";
            base.Body = builder.ToString();
            
            if (isLocal)
                return this.SendThroughWebService();
            else
                return this.Send();
        }
    }
}
