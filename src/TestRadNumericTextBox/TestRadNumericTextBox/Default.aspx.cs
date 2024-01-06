using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace TestRadNumericTextBox
{
public partial class _Default : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{

}

protected void cmbCultureCurrency_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
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
}
