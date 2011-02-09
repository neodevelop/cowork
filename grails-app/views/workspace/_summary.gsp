<h4>Resumen</h4>
Uso: <b>${horasDeUso}</b> horas
<div class="linesep"></div>
Costo unitario: <b>$ <g:formatNumber number="${workspace.costoPorHora}" type="currency" currencyCode="MXN" /></b><br/>
Costo total: <b>$ <g:formatNumber number="${costoTotal}" type="currency" currencyCode="MXN" /></b>
<div class="linesep"></div>
Clientes:
<ul>
  <g:each in="${clients}" var="client" status="i">
    <li>
      <g:remoteLink action="hoursWorkspaceByClient" update="horas${i}" params="[clientId:client.id,workspaceId:workspace.id]">
        ${client.razonSocial}
      </g:remoteLink>
      <span id="horas${i}"></span>
    </li>
  </g:each>
</ul>

<g:remoteLink method="GET" class="showMe" params="[workspaceId:workspace.id]" controller="calendar" action="populateReservationsByWorkspace" onComplete="showCalendar();">
  Ver espacios
</g:remoteLink>

<g:javascript>
  $('div#workspaceShortInfo a:last').button();
  function showCalendar(){
    $("<br/><br/><div id='calendar'></div>").appendTo("#left");
    $("#calendar").fullCalendar({
      theme:true,
        editable:false,
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
      events: "${createLink(controller:'calendar',action:'populateReservationsByWorkspace',params:[workspaceId:workspace.id])}"
    });
  }
</g:javascript>