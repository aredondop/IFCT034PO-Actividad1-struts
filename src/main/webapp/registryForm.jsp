<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html>
<html>
<head>
  <title><s:text name="hello.message"/></title>
  <s:head/>
  <sx:head/>
</head>

<body>

<%-- Verificación en el propio formulario --%>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String subject = request.getParameter("invoiceBean.subject");
        String dateFrom = request.getParameter("invoiceBean.dateFrom");
        String dateTo = request.getParameter("invoiceBean.dateTo");
        String amount = request.getParameter("invoiceBean.amount");

        if (subject != null && dateFrom != null && dateTo != null && amount != null) {
            // Calcular el importe con IVA
            double amountValue = Double.parseDouble(amount);
            double ivaRate = 0.21;
            double totalAmount = amountValue + (amountValue * ivaRate);
%>
            <h2>Resumen de la Factura</h2>
            <table>
                <tr>
                    <td>Importe Bruto:</td>
                    <td><%= amount %></td>
                </tr>
                <tr>
                    <td>Importe con IVA:</td>
                    <td><%= totalAmount %></td>
                </tr>
            </table>
<%
        }
    }
%>


<s:form theme="simple" id="itemAdd" name="itemAdd" action="invoice" method="post" validate="true">
  <h1><s:text name="form.tittle.message"/></h1>
  <table>
  <tr>
      <td class="evenRow">
        <s:fielderror fieldName = "invoiceBean.subject" />
        <s:text name="form.subject.message"/>
        <s:textfield id="subject" name="invoiceBean.subject" required="required" />
      </td>
    </tr>
  <tr>
      <td class="evenRow">
        <s:text name="form.fromDate.message"/>
        <sx:datetimepicker id="dateFrom" name="invoiceBean.dateFrom" required="required" />
      </td>
    </tr>
  <tr>
    <td class="evenRow">
       <s:text name="form.toDate.message"/>
       <sx:datetimepicker id="dateTo" name="invoiceBean.dateTo" required="required" />
    </td>

  </tr>
  <tr>
    <td class="evenRow">
        <s:submit align="left" value="Enviar"/>
    </td>
  </tr>
  </table>
</s:form>

</body>
</html>
