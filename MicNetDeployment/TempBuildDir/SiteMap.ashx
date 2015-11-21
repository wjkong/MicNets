<%@ WebHandler Language="C#" Class="SiteMap" %>

using System;
using System.Web;
using System.Xml;
using System.Data;
using MicNets.Model;
using MicNets.Biz;
using System.Configuration;

public class SiteMap : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/xml";

        XmlTextWriter oWriter = new XmlTextWriter(context.Response.OutputStream, System.Text.Encoding.UTF8);
        oWriter.WriteStartDocument();
        oWriter.WriteStartElement("urlset");
        oWriter.WriteAttributeString("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9");

        Link oLink = new Link();
        oLink.Info.RoleID = (short)Role.GUEST;
        oLink.Info.CurrentTask = NTaskLink.LoadAllByRole;
        oLink.Info.LinkCategory = NLinkCategory.Blog;

        DataRow[] drLinks = oLink.LoadAll().Tables[0].Select("url <> '#'");

        string baseUri = ConfigurationManager.AppSettings["Domain"].ToString() + "/"; ;
       
        string today = DateTime.Now.ToString("yyyy-MM-dd");
        string link;
        decimal priority;
        for (int i = 0; i < drLinks.Length; i++)
        {
            link = drLinks[i]["url"].ToString();

            if (link.IndexOf("~/Blog") >= 0)
            {
                link = "Blog/Default.aspx";
                priority = 1.00M;
            }
            else
                priority = 0.5M;
                        
            oWriter.WriteStartElement("url");
            oWriter.WriteElementString("loc", baseUri + link);
            oWriter.WriteElementString("lastmod", today);
            oWriter.WriteElementString("changefreq", "Weekly");
            oWriter.WriteElementString("priority", priority.ToString());

            oWriter.WriteEndElement();
        }

        Topic oTopic = new Topic();
        DataTable datTopic = oTopic.LoadAll();
        
        for (int i = 0; i < datTopic.Rows.Count; i++)
        {
            oWriter.WriteStartElement("url");
            oWriter.WriteElementString("loc", baseUri + "Blog/" + datTopic.Rows[i]["pageName"]);
            oWriter.WriteElementString("lastmod", today);
            oWriter.WriteElementString("changefreq", "Weekly");
            oWriter.WriteElementString("priority", "0.8");

            oWriter.WriteEndElement();
        }   
     
        oWriter.WriteEndElement();
        oWriter.WriteEndDocument();

        oWriter.Flush();

        oWriter.Close();

        context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
