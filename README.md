# Utilizando el control RadNumericTextBox de Telerik

El RadNumericTextBox es uno de los controles que pertenecen al conjunto  de controles RadInput de telerik, estos controles además de permitir al usuario ingresar y editar información textual como si fuera un control TextBox ASP .NET tradicional,  poseen propiedades adicionales como: eventos del lado del cliente, marca de agua, botón para aceptar, botones para selección de rango, mensaje predeterminado, tooltip, entre otras que extienden la funcionalidad básica proporcionada por el control TextBox ASP.NET estándar.

La funcionalidad principal del RadNumericTextBox es filtrar la entrada de datos permitiendo únicamente datos numéricos sin necesidad de programación Javascript o el uso de validators ASP .NET, este control además puede configurarse para utilizar determinados formatos o configuraciones regionales. Entre las propiedades de configuración se encuentran:

Type Indica el formato del texto, Number para formato númerico, Currency para formato moneda, Percent para un formato porcentaje.
Culture Establece el soporte para la globalización y localización del valor.
MinValue y MaxValue Indican los valores minimos y maximos de un rango de valores.
ShowSpinButtons Estable la propiedad para mostrar un control de selección de flechas para el incremento o decremento del valor.
Como ejemplo del uso de este control escribí una página ASP.NET que calcula los montos de un producto deacuerdo a su cantidad y su precio, mostrando caracteristicas utiles del RadNumericTextBox como la globalización y algunas funciones del lado del cliente. (client-side)

El código de la página ASP.NET
<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Default.aspx.cs"
Inherits="TestRadNumericTextBox._Default" %>
<%@ Register Assembly="Telerik.Web.UI"
Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "
http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Test RadNumeric Text Box</title>
</head>
<body>
<form id="form1" runat="server">
<telerik:RadScriptManager ID="RadScriptManager1"
runat="server">
<Scripts>
<asp:ScriptReference Assembly="Telerik.Web.UI"
Name="Telerik.Web.UI.Common.Core.js">
</asp:ScriptReference>
<asp:ScriptReference Assembly="Telerik.Web.UI"
Name="Telerik.Web.UI.Common.jQuery.js">
</asp:ScriptReference>
<asp:ScriptReference Assembly="Telerik.Web.UI"
Name="Telerik.Web.UI.Common.jQueryInclude.js">
</asp:ScriptReference>
</Scripts>
</telerik:RadScriptManager>
<telerik:RadScriptBlock ID="RadScriptBlock1"
runat="server">
<script type="text/javascript">
function Calculate() {
var ctrlQuantity = $find("txtQuantity");
var ctrlPrice = $find("txtPrice");
var ctrlSubtotal = $find("txtSubtotal");
var ctrlTaxPercent = $find("txtTax");
var ctrlTaxAmount = $find("txtTaxAmount");
var ctrlTotal = $find("txtTotal");
var quantity = parseInt(ctrlQuantity.get_value());
var price = parseFloat(ctrlPrice.get_value());
var subtotal = quantity * price;
ctrlSubtotal.set_value(subtotal);
var percent = parseFloat(ctrlTaxPercent.get_value()) * .01;
var taxAmount = subtotal * percent;
ctrlTaxAmount.set_value(taxAmount);
var total = subtotal + taxAmount;
ctrlTotal.set_value(total);
}
</script>
</telerik:RadScriptBlock>
<div>
<telerik:RadComboBox ID="cmbCultureCurrency"
runat="server"
onselectedindexchanged="cmbCultureCurrency_SelectedIndexChanged"
EmptyMessage="Select your country"
AutoPostBack="true">
<Items>
<telerik:RadComboBoxItem Text="Brazil"
Value="pt-BR" />
<telerik:RadComboBoxItem Text="United Kingdom"
Value="en-GB" />
<telerik:RadComboBoxItem Text="United States"
Value="en-US" />
<telerik:RadComboBoxItem Text="Spain"
Value="es-ES"/>
</Items>
</telerik:RadComboBox>
</div>
<br />
<table>
<tr>
<td>Product</td>
<td>
<telerik:RadComboBox ID="cmbProduct"
EmptyMessage="Select a product"
runat="server">
<Items>
<telerik:RadComboBoxItem Value="1"
Text="Potatoes" />
<telerik:RadComboBoxItem Value="2"
Text="Beans" />
<telerik:RadComboBoxItem Value="3"
Text="Apples" />
<telerik:RadComboBoxItem Value="4"
Text="Oranges" />
</Items>
</telerik:RadComboBox>
</td>
</tr>
<tr>
<td>Quantity</td>
<td>
<telerik:RadNumericTextBox ID="txtQuantity"
Runat="server"
Type="Number"
DataType="System.Uint32">
<NumberFormat ZeroPattern="n"></NumberFormat>
</telerik:RadNumericTextBox>
</td>
</tr>
<tr>
<td>Tax</td>
<td>
<telerik:RadNumericTextBox ID="txtTax"
Runat="server"
Type="Percent"
MinValue="1"
MaxValue="20"
Value="16"
ShowSpinButtons="true">
<NumberFormat ZeroPattern="n %"></NumberFormat>
</telerik:RadNumericTextBox>
</td>
</tr>
<tr>
<td>Price</td>
<td>
<telerik:RadNumericTextBox ID="txtPrice"
Runat="server"
Type="Currency"
ClientEvents-OnBlur="Calculate">
</telerik:RadNumericTextBox>
</td>
</tr>

<tr>
<td>Subtotal</td>
<td>
<telerik:RadNumericTextBox ID="txtSubtotal"
Runat="server"
Type="Currency"
DataType="System.Decimal"
ReadOnly="true">
<NumberFormat ZeroPattern="$n"></NumberFormat>
</telerik:RadNumericTextBox>
</td>
</tr>
<tr>
<td>Tax amount</td>
<td>
<telerik:RadNumericTextBox ID="txtTaxAmount"
runat="server"
ReadOnly="true">
</telerik:RadNumericTextBox>
</td>
</tr>
<tr>
<td>Total</td>
<td>
<telerik:RadNumericTextBox ID="txtTotal"
Runat="server"
Type="Currency"
DataType="System.Decimal"
ReadOnly="true">
</telerik:RadNumericTextBox>
</td>
</tr>
</table>
<div>Selected currency: <asp:Label ID="lblSelectedCurrency"
runat="server"></asp:Label></div>
</form>
</body>
</html>
El código de la clase CodeBehind
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

protected void cmbCultureCurrency_SelectedIndexChanged(object sender, 
Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
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
        
En la página ASP.NET, en el bloque JavaScript, dentro de la función Calculate() obtengo la referencia a los controles mediante la función $find(“[nombre del control]”) después utilizo las funciones get_value() y set_value() para obtener o establecer el valor. Estas funciones son del lado del cliente, porque del lado del server se hace con la propiedad Text.

function Calculate() {
var ctrlQuantity = $find("txtQuantity");
var ctrlPrice = $find("txtPrice");
var ctrlSubtotal = $find("txtSubtotal");
var ctrlTaxPercent = $find("txtTax");
var ctrlTaxAmount = $find("txtTaxAmount");
var ctrlTotal = $find("txtTotal");
var quantity = parseInt(ctrlQuantity.get_value());
var price = parseFloat(ctrlPrice.get_value());
var subtotal = quantity * price;
ctrlSubtotal.set_value(subtotal);
var percent = parseFloat(ctrlTaxPercent.get_value()) * .01;
var taxAmount = subtotal * percent;
ctrlTaxAmount.set_value(taxAmount);
var total = subtotal + taxAmount;
ctrlTotal.set_value(total);
}
En el control txtQuantity utilizo la propiedad type=”Number” lo que le da el formato numérico al valor

<telerik:RadNumericTextBox ID="txtQuantity"
Runat="server"
Type="Number"
DataType="System.Uint32">
<NumberFormat ZeroPattern="n"></NumberFormat>
</telerik:RadNumericTextBox>
El control txtTax demuestra el uso de la propiedad type=”percent”, las propiedades para el valor mínimo (MinValue), valor máximo (MaxValue) y la propiedad ShowSpinButtons.

<telerik:RadNumericTextBox ID="txtTax"
Runat="server"
Type="Percent"
MinValue="1"
MaxValue="20"
Value="16"
ShowSpinButtons="true">
<NumberFormat ZeroPattern="n %"></NumberFormat>
</telerik:RadNumericTextBox>
Los controles txtSubtotal, txtTotal y txtPrice muestran el uso de la propiedad type=Currency para dar formato de tipo moneda al valor, además en el control txtPrice utilizo el evento ClientEvents-OnBlur del lado del cliente para invocar al método Calculate definido en el bloque JavaScript.

<telerik:RadNumericTextBox ID="txtPrice"
Runat="server"
Type="Currency"
ClientEvents-OnBlur="Calculate">
</telerik:RadNumericTextBox>
Por último en el code-behind utilizo la propiedad Culture para establecer el formato en los controles RadNumericTextBox según las preferencias de la cultura seleccionada.

Al ejecutar la página ASP.NET observaras los siguientes resultados,  si el país es  Brazil, las cantidades se formatean deacuerdo a la configuración de ese país.



Si el páis seleccionado es United Kingdom, lo mismo sucede con las cantidades y con las monedas en este caso aparece el símbolo de la libra (pound).



Si el país es United States,  en las cantidades aparece el símbolo del Dollar.



Y por último si la opción del país es Spain, aparece el símbolo del Euro.


