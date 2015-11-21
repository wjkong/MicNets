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
using Subgurim.Controles;
using MicNets.Model;
using MicNets.BizLogic;
using System.Text;

namespace MicNets.Web.Blog
{
    public partial class GoogleMap : BasePage
    {
        // Fields
        protected Button btnSearchByKeyword;
        protected GMap ctlGoogleMap;
        protected Controls.ctlToolBar CtlToolBar1;
        protected DropDownList ddlCountry;
        protected DropDownList ddlProvince;
        protected HtmlGenericControl FunctionBar;
        private Helper oHelp;
        private Location oLocation;
        protected Panel Panel1;
        protected TextBox txtCity;
        protected TextBox txtKeyword;

        // Methods
        protected void btnSearchByKeyword_Click(object sender, EventArgs e)
        {
            GeoCode code = GMap.geoCodeRequest(this.GetKeywords(), this.ctlGoogleMap.Key);
            if (code.Status.code == 200)
            {
                this.ctlGoogleMap.setCenter(code.Placemark.coordinates);
                GMarker gMarker = new GMarker(code.Placemark.coordinates);
                GInfoWindow infoWindow = new GInfoWindow(gMarker, "<center><b>" + code.Placemark.address + "</b></center>", false, GListener.Event.mouseover);
                this.ctlGoogleMap.addInfoWindow(infoWindow);
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ddlProvince.Items.Clear();
            this.oLocation.CountryID = Convert.ToInt32(this.ddlCountry.SelectedValue);
            DataSet set = this.oLocation.LoadAll();
            this.oHelp.LoadData(set.Tables[1], this.ddlProvince);
            this.ddlProvince.DataBind();
        }

        private string GetKeywords()
        {
            StringBuilder builder = new StringBuilder();
            if (!this.oHelp.IsNullOrEmpty(this.txtKeyword.Text))
            {
                builder.Append(this.txtKeyword.Text.Trim());
            }
            if (!this.oHelp.IsNullOrEmpty(this.txtCity.Text))
            {
                builder.Append(" " + this.txtCity.Text.Trim());
            }
            builder.Append(" " + this.ddlProvince.SelectedItem.Text);
            builder.Append(" " + this.ddlCountry.SelectedItem.Text);
            return builder.ToString();
        }

        private string GetQuery()
        {
            StringBuilder builder = new StringBuilder();
            if (!this.oHelp.IsNullOrEmpty(this.Session["Key"]))
            {
                builder.Append(this.Session["Key"].ToString().Trim());
                this.txtKeyword.Text = this.Session["Key"].ToString().Trim();
                if (!this.oHelp.IsNullOrEmpty(this.Session["City"]))
                {
                    builder.Append(" " + this.Session["City"].ToString().Trim());
                    this.txtCity.Text = this.Session["City"].ToString();
                }
                if (!this.oHelp.IsNullOrEmpty(this.Session["Pro"]))
                {
                    builder.Append(" " + this.Session["Pro"].ToString().Trim());
                    this.oHelp.SelectedByText(this.ddlProvince, this.Session["Pro"].ToString());
                }
                if (!this.oHelp.IsNullOrEmpty(this.Session["Con"]))
                {
                    builder.Append(" " + this.Session["Con"].ToString());
                    this.oHelp.SelectedByText(this.ddlCountry, this.Session["Con"].ToString().ToUpper());
                }
            }
            else
            {
                builder.Append("Mississauga Ontario CANADA");
                this.txtCity.Text = "Mississauga";
                this.oHelp.SelectedByText(this.ddlProvince, "Ontario");
                this.oHelp.SelectedByText(this.ddlCountry, "CANADA");
            }
            this.Session["Key"] = null;
            this.Session["Pro"] = null;
            this.Session["Con"] = null;
            this.Session["City"] = null;
            return builder.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.ctlGoogleMap.Key = ConfigurationManager.AppSettings["GoogleAPIKey"].ToString();
            this.ctlGoogleMap.addControl(new GControl(GControl.preBuilt.LargeMapControl));
            if (!this.Page.IsPostBack)
            {
                base.Keywords = "";
                base.Description = "";
                this.oLocation.CountryID = 2;
                DataSet set = this.oLocation.LoadAll();
                this.oHelp.LoadData(set.Tables[0], this.ddlCountry);
                this.oHelp.LoadData(set.Tables[1], this.ddlProvince);
                this.Page.DataBind();
                this.oHelp.SelectedByText(this.ddlCountry, NCountry.CANADA.ToString());
                GeoCode code = GMap.geoCodeRequest(this.GetQuery(), this.ctlGoogleMap.Key);
                if (code.Status.code == 200)
                {
                    this.ctlGoogleMap.setCenter(code.Placemark.coordinates);
                    GMarker gMarker = new GMarker(code.Placemark.coordinates);
                    GInfoWindow infoWindow = new GInfoWindow(gMarker, "<center><b>" + code.Placemark.address + "</b></center>", false, GListener.Event.mouseover);
                    this.ctlGoogleMap.addInfoWindow(infoWindow);
                }
            }
        }

        protected new void Page_PreInit(object sender, EventArgs e)
        {
            this.oHelp = new Helper();
            this.oLocation = new Location();
            if (!this.oHelp.IsNullOrEmpty(base.Request.QueryString["Key"]))
            {
                this.Session["Key"] = base.Request.QueryString["Key"].ToString();
                if (!this.oHelp.IsNullOrEmpty(base.Request.QueryString["City"]))
                {
                    this.Session["City"] = base.Request.QueryString["City"].ToString();
                }
                if (!this.oHelp.IsNullOrEmpty(base.Request.QueryString["Pro"]))
                {
                    this.Session["Pro"] = base.Request.QueryString["Pro"].ToString();
                }
                if (!this.oHelp.IsNullOrEmpty(base.Request.QueryString["Con"]))
                {
                    this.Session["Con"] = base.Request.QueryString["Con"].ToString();
                }
                base.Response.Redirect("~/Blog/google-map.aspx", true);
            }
        }

      
    }
}
