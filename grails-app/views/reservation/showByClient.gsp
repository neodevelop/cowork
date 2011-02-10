<html>
<head>
  <meta name="layout" content="content-bizhub"/>
  <title>Reservaciones para este cliente...</title>
  <script type="text/javascript" src="${createLinkTo(dir:'js',file:'tables.js')}"></script>
  <g:javascript>
    $(document).ready(function () {
      $("#reservations").styleTable();
    });
  </g:javascript>
</head>
<body>
<div id="left">
  <br/><h4>Reservaciones hechas por este cliente...</h4><br/>
  <table width="100%" cellpadding="0" cellspacing="0" id="reservations" class="full">
    <thead>
    <tr>
      <th>Nombre de espacio</th>
      <th>Fecha de reservación</th>
      <th>Hora de inicio</th>
      <th>Hora de termino</th>
      <th>Confirmado</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${reservations}" var="r">
      <tr>
        <td>${r.workspace.nombreDeEspacio}</td>
        <td><g:formatDate date="${r.fechaHoraReservacion}" format="dd-MM-yyyy"/></td>
        <td><g:formatDate date="${r.fechaHoraReservacion}" format="hh:mm"/></td>
        <td><g:formatDate date="${r.fechaHoraTerminoDeUso}" format="hh:mm"/></td>
        <td>
          <g:if test="${r.confirmado}">
            <img src="${createLinkTo(dir:'images',file:'yes.gif')}" alt="yes" width="16" height="16"/>
          </g:if>
          <g:else>
            <g:remoteLink action="showShortInfo" update="shortInfo" id="${r.id}" onComplete="showInfo();">
              <img style="display:block;" id="notconfirmed${r.id}" src="${createLinkTo(dir:'images',file:'no.gif')}" alt="no" width="16" height="16"/>
            </g:remoteLink>
              <img style="display:none;" id="confirmed${r.id}" src="${createLinkTo(dir:'images',file:'yes.gif')}" alt="yes" width="16" height="16"/>
          </g:else>
        </td>
      </tr>
    </g:each>
    </tbody>
  </table>
</div>
<div id="right" style="display:block;">
  <div id="rightbox">
    <div id="shortInfo"></div>
  </div>
</div>
<g:javascript>
function showInfo(){
  $('div#shortInfo').fadeIn('slow');
}
</g:javascript>
</body>
</html>