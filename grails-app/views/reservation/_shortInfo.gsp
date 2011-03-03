<h4>Detalle de reservacion</h4>
Costo unitario: <b>$ <g:formatNumber number="${reservation.workspace.costoPorHora}" type="currency" currencyCode="MXN"/></b><br/>
Horas reservadas: <b>${horasDeUso} hora(s)</b>
<div class="linesep"></div>
Total del costo: <b>$ <g:formatNumber number="${costoTotal}" type="currency" currencyCode="MXN"/></b>
<div id="deleteConfirm${reservation.id}" title="Confirmar...">
  <p>
    <span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;">
    </span>Estás a punto de cancelar una reservación... ¿Estas seguro?
  </p>
</div>
<br/><br/>
<div align="center">
  <g:remoteLink action="confirm" onComplete="confirmed(${reservation.id});" id="${reservation.id}">
    Confirmar reservación
  </g:remoteLink>
  <br/><br/>
<a id="confirmar">Cancelar reservación</a>
</div>

<g:javascript>
  $('div#rightbox a').button();

  $('div#deleteConfirm${reservation.id}').dialog({
    autoOpen:false,
    height:225,
    width:300,
    buttons:{
      "Aceptar":function(){
        $( this ).dialog( "close" );
        $.post("${createLink(action:'cancel',id:reservation.id)}");
        $('table#reservations tr.reservation${reservation.id}').fadeOut('slow');
        $('div#shortInfo').fadeOut('slow');
        $( this ).dialog( "close" );
      }
    }
  });

  $("a#confirmar").click(function(){
    $('div#deleteConfirm${reservation.id}').dialog('open');
  });

  function confirmed(id){
    $('img#notconfirmed'+id).hide();
    $('img#confirmed'+id).fadeIn('slow');
    $('div#shortInfo').fadeOut('slow');
  }

</g:javascript>