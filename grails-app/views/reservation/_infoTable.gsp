<table id="reservations" class="full" width="100%" cellpadding="0" cellspacing="0">
  <thead>
    <tr>
      <th>Lugar</th>
      <th>Horas reservadas</th>
      <th>Precio unitario</th>
      <th>Subtotal</th>
    </tr>
  </thead>
  <tbody>
  <g:each in="${reservations}" var="r">
    <tr>
      <td>${r.nombreDeEspacio}</td>
      <td>${r.horasDeUso}</td>
      <td>$ <g:formatNumber number="${r.costoPorHora}" type="currency" currencyCode="MXN"/></td>
      <td>$ <g:formatNumber number="${r.costoDeUso}" type="currency" currencyCode="MXN"/></td>
    </tr>
  </g:each>
  </tbody>
  <tfoot>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>Subtotal</td>
      <td>$ <g:formatNumber number="${costoSubtotalDeCliente}" type="currency" currencyCode="MXN"/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>IVA(16%)</td>
      <td>$ <g:formatNumber number="${iva}" type="currency" currencyCode="MXN"/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>Total</td>
      <td>$ <g:formatNumber number="${costoTotalDeCliente}" type="currency" currencyCode="MXN"/></td>
    </tr>
  </tfoot>
</table>
<g:javascript>
  $("#reservations").styleTable();
</g:javascript>