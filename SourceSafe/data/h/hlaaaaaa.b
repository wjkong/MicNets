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
using MicNets.BizLogic;

namespace MicNets.Web.WebService
{
    [WebService(Namespace = "http://MicNets")]
    public class EmailServer : System.Web.Services.WebService
    {
        [WebMethod]
        public bool SendEmail(EmailInfo oInfo, string password)
        {
            if (password.Equals(ConfigurationManager.AppSettings["ServicePassword"].ToString()))
            {
                Email email = new Email(oInfo);
                return email.Send();
            }
            return false;
        }
    }


}
