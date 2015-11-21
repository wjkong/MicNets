<%@ WebHandler Language="C#" Class="RSS_Blog_SiteMap" %>

using System;
using System.Web;
using System.Xml;
using System.Data;
using MicNets.Model;
using MicNets.BizLogic;
using System.Configuration;
using MicNets.Model.RSS;

public class RSS_Blog_SiteMap : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/xml";
        context.Response.AddHeader("Content-Disposition", "inline;filename=rss.xml");

        RSSInfo oRSSInfo = new RSSInfo();
        oRSSInfo.Version = "2.0";
        oRSSInfo.Channel.Title = "Michael Blog - Site Map";
        oRSSInfo.Channel.Link = "http://www.micnets.com/Blog/SiteMap.aspx";
        oRSSInfo.Channel.Description = "Michael Blog Site Map";
        oRSSInfo.Channel.Language = "en-US";

        string baseUri = ConfigurationManager.AppSettings["Domain"].ToString() + "/"; ;
        DataRow[] drLinks = this.GetRSSItems();
        oRSSInfo.Channel.Items = new RSSItem[drLinks.Length];

        for (int i = 0; i < drLinks.Length; i++)
        {
            oRSSInfo.Channel.Items[i] = new RSSItem();
            oRSSInfo.Channel.Items[i].Title = drLinks[i]["text"].ToString();
            oRSSInfo.Channel.Items[i].Description = drLinks[i]["text"].ToString();
            oRSSInfo.Channel.Items[i].Category = string.Empty;
            oRSSInfo.Channel.Items[i].Link = baseUri + drLinks[i]["url"].ToString();
            oRSSInfo.Channel.Items[i].DatePublished = DateTime.Now.ToString("yyyy-MM-dd");
        }

        XmlTextWriter oWriter = new XmlTextWriter(context.Response.OutputStream, System.Text.Encoding.UTF8);
        Helper oHelp = new Helper();
        oHelp.GenerateRSSSeed(oWriter, oRSSInfo);

        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    private DataRow[] GetRSSItems()
    {
        Link oLink = new Link();
        oLink.Info.RoleID = (short)NRole.GUEST;
        oLink.Info.CurrentTask = NTaskLink.LoadAllByRole;
        oLink.Info.LinkCategory = NLinkCategory.Blog;
      
        DataTable dtLink = oLink.LoadAll().Tables[0];

        string strFilter = "url <> '#'";

        return oLink.LoadAll().Tables[0].Select(strFilter);
    }

}