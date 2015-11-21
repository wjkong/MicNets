using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using MicNets.Model;
using System.Configuration;
using System.Net;
using MicNets.BizLogic;


namespace MicNets.Web.WebService
{
    [WebService(Namespace = "http://MicNets/Blog")]
    public class RegularJob : System.Web.Services.WebService
    {
        // Fields
        private Helper oHelp = new Helper();

        // Methods
        [WebMethod]
        public void CollectKeyword()
        {
            EmailInfo oEmailInfo = new EmailInfo();
            oEmailInfo.Subject = "Hit Web Serivce";
            oEmailInfo.From = ConfigurationManager.AppSettings["AnonymousEmail"].ToString();
            oEmailInfo.To = ConfigurationManager.AppSettings["AnonymousEmail"].ToString();
            oEmailInfo.Body = "Hit web service from site";
            this.Send(oEmailInfo);
        }

        [WebMethod]
        public void DailyUpdate()
        {
            new Customer().RemoveAllActive();
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

        private bool SendHttpRequest(string url)
        {
            HttpWebRequest request = null;
            HttpWebResponse response = null;
            bool flag;
            try
            {
                request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = NHttpMethod.GET.ToString();
                using (response = (HttpWebResponse)request.GetResponse())
                {
                    flag = response.StatusCode == HttpStatusCode.OK;
                }
            }
            catch
            {
                throw;
            }
            return flag;
        }

        [WebMethod]
        public void WeeklyUpdate()
        {
            Email email = new Email();
            string str = "http://www.micnets.com/sitemap.ashx";
            NSearchEngineURL[] eurlArray = new NSearchEngineURL[4];
            eurlArray[1] = NSearchEngineURL.YAHOO;
            eurlArray[2] = NSearchEngineURL.MSN;
            eurlArray[3] = NSearchEngineURL.ASK;
            NSearchEngineURL[] eurlArray2 = eurlArray;
            for (int i = 0; i < eurlArray2.Length; i++)
            {
                string url = this.oHelp.GetStringValue(eurlArray2[i]) + str;
                if (!this.SendHttpRequest(url))
                {
                    email.SendErrorNotice("WeeklyUpdate: failure to send a request to " + eurlArray2[i].ToString());
                }
            }
        }
    }

 

}
