<%@ Page Language="C#" AutoEventWireup="true" 
CodeBehind="Default.aspx.cs" 
Inherits="TestRadNumericTextBox._Default" %>
<%@ Register Assembly="Telerik.Web.UI" 
Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
