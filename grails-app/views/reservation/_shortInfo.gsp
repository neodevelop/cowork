<h4>Detalle de reservacion</h4>
Costo unitario: <b>$ <g:formatNumber number="${reservation.workspace.costoPorHora}" type="currency" currencyCode="MXN"/></b><br/>
Horas reservadas: <b>${horasDeUso} hora(s)</b>
<div class="linesep"></div>
Total del costo: <b>$ <g:formatNumber number="${costoTotal}" type="currency" currencyCode="MXN"/></b>
<br/><br/>
<g:remoteLink action="confirm" onComplete="confirmed(${reservation.id});">
  Confirmar reservación
</g:remoteLink>

<g:javascript>
  $('div#rightbox a').button();
  function confirmed(id){
    $('img#notconfirmed'+id).hide();
    $('img#confirmed'+id).fadeIn('slow');
    $('div#shortInfo').fadeOut('slow');
  }
</g:javascript>