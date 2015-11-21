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
using AjaxControlToolkit;

namespace MicNets.Web.Blog
{
    public partial class universal_metric_convertor : BasePage
    {
        // Fields
        protected HiddenField hidPrefix;
        protected ScriptManager ScriptManager1;
        protected SliderExtender sldCelciusToFahrenheit;
        protected SliderExtender sldFahrenheitToCelcius;
        protected SliderExtender SliderExtender3;
        protected SliderExtender SliderExtender4;
        protected SliderExtender SliderExtender5;
        protected SliderExtender SliderExtender6;
        protected TextBox TextBox1;
        protected TextBox TextBox10;
        protected TextBox TextBox12;
        protected TextBox TextBox4;
        protected TextBox TextBox7;
        protected TextBox TextBox8;
        protected TextBox txtCelciusResult;
        protected TextBox txtCelciusSource;
        protected TextBox txtFahrenheitResult;
        protected TextBox txtFahrenheitSource;
        protected TextBox txtFeetResult;
        protected TextBox txtFeetSource;
        protected TextBox txtKilometerResult;
        protected TextBox txtKilometerSource;
        protected TextBox txtMeterResult;
        protected TextBox txtMeterSource;
        protected TextBox txtMileResult;
        protected TextBox txtMileSource;

        // Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Keywords = "convertor,fahrenheit,celsius,mile,kilometer,feet,meter,conversion,metric";
            base.Description = base.Keywords;
            ClientScript.RegisterHiddenField("hidPrefix", oHelper.GetPrefix(this.txtFeetResult));


        }
    }
}
