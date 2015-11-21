using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MicNets.Model;

namespace MicNets.Web.Blog
{
    public partial class WeatherForecast : BasePage
    {
        // Fields
        protected Controls.ctlToolBar CtlToolBar1;
        protected XmlDataSource dasWeather;
        protected DropDownList ddlCity;
        protected DataGrid dgArtical;

        // Methods
        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SetScreen();
        }

        protected void dgArtical_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                Image image = (Image)e.Item.FindControl("imgCondition");
                if (image.ImageUrl == Utility.ABSENT_LINK)
                {
                    image.Visible = false;
                }
                if (e.Item.ItemIndex > 3)
                {
                    HyperLink link = (HyperLink)e.Item.FindControl("hypTitle");
                    link.Text = DateTime.Now.AddDays((double)(e.Item.ItemIndex - 3)).ToString("MMM dd") + " " + link.Text;
                }
                Literal literal = (Literal)e.Item.FindControl("litDescription");
                int index = literal.Text.IndexOf("Forecast issued");
                if (index > 0)
                {
                    literal.Text = literal.Text.Substring(0, index);
                }
            }
        }

        public string GetImageUrl(string title)
        {
            string str2 = Utility.ABSENT_LINK;
            string weatherCondition = this.GetWeatherCondition(title);
            object enumByName = base.oHelper.GetEnumByName(typeof(NWeatherCondition), weatherCondition);
            if (!base.oHelper.IsNullOrEmpty(enumByName))
            {
                switch (((NWeatherCondition)enumByName))
                {
                    case NWeatherCondition.CLOUDY:
                        str2 = NWeatherCondition.CLOUDY.ToString() + ".gif";
                        break;
                    case NWeatherCondition.SUNNY:
                        str2 = NWeatherCondition.SUNNY.ToString() + ".gif";
                        break;
                    case NWeatherCondition.SHOWERS:
                    case NWeatherCondition.RAIN:
                    case NWeatherCondition.A_FEW_SHOWERS:
                    case NWeatherCondition.PERIODS_OF_RAIN:
                    case NWeatherCondition.LIGHT_RAINSHOWER:
                        if (!this.IsChanceOfThunderstorm())
                        {
                            str2 = NWeatherCondition.SHOWERS.ToString() + ".gif";
                        }
                        else
                        {
                            str2 = NWeatherCondition.SHOWERS_THUNDERSTORM.ToString() + ".gif";
                        }
                        break;
                    case NWeatherCondition.FLOG:
                        str2 = NWeatherCondition.FLOG + ".gif";
                        break;
                    case NWeatherCondition.HAZE:
                        str2 = NWeatherCondition.HAZE + ".gif";
                        break;

                    case NWeatherCondition.MAINLY_SUNNY:
                    case NWeatherCondition.SUNNY_WITH_CLOUDY_PERIODS:
                        str2 = NWeatherCondition.MAINLY_SUNNY.ToString() + ".gif";
                        break;

                    case NWeatherCondition.MOSTLY_CLOUDY:
                    case NWeatherCondition.CLOUD_WITH_SUNNY_PERIODS:
                        str2 = NWeatherCondition.CLOUD_WITH_SUNNY_PERIODS.ToString() + ".gif";
                        break;

                    case NWeatherCondition.PARTLY_CLOUDY:
                    case NWeatherCondition.A_MIX_OF_SUN_AND_CLOUD:
                        str2 = NWeatherCondition.A_MIX_OF_SUN_AND_CLOUD.ToString() + ".gif";
                        break;

                    case NWeatherCondition.CHANCE_OF_SHOWERS:
                        str2 = NWeatherCondition.CHANCE_OF_SHOWERS.ToString() + ".gif";
                        break;

                    case NWeatherCondition.SHOWERS_OR_THUNDERSTORMS:
                        str2 = NWeatherCondition.SHOWERS_THUNDERSTORM.ToString() + ".gif";
                        break;
                }
            }
    
            return ("~/Image/Weather/" + str2);
        }

        private string GetWeatherCondition(string title)
        {
            int startIndex = title.IndexOf(":") + 1;
            int index = title.IndexOf(".");
            if (title.IndexOf("Current Conditions:") >= 0)
            {
                index = title.IndexOf(",");
            }
            if ((startIndex > 0) && (index > 0))
            {
                return title.Substring(startIndex, index - startIndex).Trim().ToUpper().Replace(' ', '_');
            }
            return string.Empty;
        }

        private bool IsChanceOfThunderstorm()
        {
            return false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.SetScreen();
                base.Keywords = "";
                base.Description = "";
            }
        }

        private void SetScreen()
        {
            this.dasWeather.DataFile = "http://weatheroffice.gc.ca/rss/city/on-" + this.ddlCity.SelectedValue + "_e.xml";
        }

    }
}
