using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Globalization;

public partial class Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void cmbCultureCurrency_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        CultureInfo info = null;
        if (string.IsNullOrEmpty(cmbCultureCurrency.SelectedValue))
            info = System.Threading.Thread.CurrentThread.CurrentCulture;
        else
        {
            info = new CultureInfo(cmbCultureCurrency.SelectedValue);
            lblSelectedCurrency.Text = cmbCultureCurrency.SelectedValue;
            txtQuantity.Culture =
            txtPrice.Culture =
            txtTaxAmount.Culture =
            txtSubtotal.Culture =
            txtTaxAmount.Culture =
            txtTotal.Culture = info;
        }
    }
}
