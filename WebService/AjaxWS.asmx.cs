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
using System.Net;
using System.Text;
using System.IO;
using System.Configuration;
using MicNets.BizLogic;

namespace MicNets.Web.WebService
{
    /// <summary>
    /// Summary description for AjaxWS
    /// </summary>
    [WebService(Namespace = "http://MicNets.Web.WebService/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.Web.Script.Services.ScriptService]
    public class AjaxWS : System.Web.Services.WebService
    {
        [WebMethod]
        public string GetTranslatedText(string sourseText, string langSource, string langTrans)
        {
            Helper helper = new Helper();
            string returnValue = string.Empty;
         
            if (!helper.IsNullOrEmpty(sourseText))
            {
                HttpWebRequest request = null;
                HttpWebResponse response = null;
                StringBuilder builder = new StringBuilder("http://ajax.googleapis.com/ajax/services/language/translate?v=1.0");
                builder.Append("&q=" + HttpUtility.UrlEncode(sourseText.Trim()));
                builder.Append("&langpair=" + langSource + "|" + langTrans);
                builder.Append("&key=" + ConfigurationManager.AppSettings["GoogleAPIKey"]);
                request = (HttpWebRequest)WebRequest.Create(builder.ToString());
                request.Method = NHttpMethod.GET.ToString();
                response = (HttpWebResponse)request.GetResponse();

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    string str = new StreamReader(response.GetResponseStream()).ReadToEnd();
                    string leadingText = "{\"translatedText\":\"";
                    int startIndex = str.IndexOf(leadingText) + leadingText.Length;
                    int index = str.IndexOf("\"},");

                    returnValue = str.Substring(startIndex, index - startIndex);
                }
                else
                    returnValue = "Google translation service no response.";
            }

            return returnValue;
        
        }

        [WebMethod]
        public string GetProvinces(int countryID)
        {
            string rowSeparator = ";";
            string colSeparator = ",";

            Helper oHelper = new Helper();

            Location oLocation = new Location();

            oLocation.CountryID = countryID;

            DataTable dtProvince = oLocation.LoadAll().Tables[1];

            return oHelper.ConvertDataTableToString(dtProvince);
        }
    }
}
