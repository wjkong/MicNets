using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using MicNets.Model.DataSets;
using MicNets.Model;
using MicNets.BizLogic;

namespace MicNets.Web.WebService
{
    /// <summary>
    /// Summary description for ContactRouteWS
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class ContactRouteWS : System.Web.Services.WebService
    {
        [WebMethod]
        public DSContact GetContactData()
        {
            DSContact dsContact = new DSContact();

            Contact oContact = new Contact();

            oContact.LoadAll();

            int i = 1;
            i++;

            return dsContact;


        }
    }
}
