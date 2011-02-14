<html>
<head>
  <meta name="layout" content="content-bizhub"/>
  <title>Seleccion de clientes e instalaciones</title>
  <style type="text/css">
  .highlight {
    background-color: #007799;
  }

  .itemSelected {
    background-color: #440044;
  }
  </style>

  <script type="text/javascript" src="http://keith-wood.name/js/jquery.timeentry.js"></script>
  <style type="text/css">@import "http://keith-wood.name/css/jquery.timeentry.css";</style>
  <script type="text/javascript" src="${createLinkTo(dir:'js',file:'tables.js')}"></script>
  <g:javascript>
    function customRange(input) {
	  return {minTime: (input.id == 'timeTo' ?
		$('#timeFrom').timeEntry('getTime') : null),
		maxTime: (input.id == 'timeFrom' ?
		$('#timeTo').timeEntry('getTime') : null)};
    }
    $(function(){
      $('#fechaReservacion').datepicker({dateFormat:'dd-mm-yy'});
      $('.timeRange').timeEntry({beforeShow: customRange,timeSteps:[1,30,0],ampmPrefix: ' '});
    });
  </g:javascript>
</head>
<body>
<div id="left">
  <g:if test="${flash.message}">
    <br/>

    <div class="message ui-state-error ui-corner-all" style="padding: 0pt 0.7em;">
      <p style="margin:2px;">
        <span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-alert"></span>
        ${flash.message}
      </p>
    </div>

  </g:if>
  <h1>Realizar reservaciones</h1>
  <span class="bluetext">
    <sec:ifAllGranted roles="ROLE_OPERATOR">
      Puedes buscar a los clientes ya sea por <b>Razon social, RFC o correo electrónico</b><br/>
    </sec:ifAllGranted>
    Los espacios de trabajo los buscas por <b>Nombre del aula o direccion</b>
  </span>


  
  <table width="100%">
    <tr>
	<sec:ifAllGranted roles="ROLE_OPERATOR">
      <td>
        <g:formRemote url="[action:'searchClients']" name="searchClient" update="clientSimpleList">
          <label>Cliente:</label>
          <g:textField name="clientquery"/>
          <g:submitButton name="query" value="Consultar" class="button"/>
        </g:formRemote>
      </td>
</sec:ifAllGranted>
      <td width="50%">
        <g:formRemote url="[action:'searchWorkspaces']" name="searchWorkspace" update="workspaceSimpleList">
          <label>Espacio:</label>
          <g:textField name="workspacequery"/>
          <g:submitButton name="query" value="Consultar" class="button"/>
        </g:formRemote>
      </td>
    </tr>
  </thead>
  </table>

  <table width="100%">
    <tr>
      <td valign="top">
        <div id="clientSimpleList"/>
      </td>
      <td width="50%" valign="top">
        <div id="workspaceSimpleList"/>
      </td>
    </tr>
  </table>
  
<!-- 
  <sec:ifAllGranted roles="ROLE_USER">
  <table width="100%">
    <tr>
      <td>
        <g:formRemote url="[action:'searchWorkspaces']" name="searchWorkspace" update="workspaceSimpleList">
          <label>Espacio:</label>
          <g:textField name="workspacequery"/>
          <g:submitButton name="query" value="Consultar" class="button"/>
        </g:formRemote>
      </td>
    </tr>
  </thead>
  </table>

  <table width="100%">
    <tr>
      <td valign="top">
        <div id="workspaceSimpleList"/>
      </td>
    </tr>
  </table>
  </sec:ifAllGranted>
-->

</div>

<g:form action="prepare">
<g:hiddenField name="workspaceId"/>
<sec:ifAllGranted roles="ROLE_OPERATOR">
  <g:hiddenField name="clienteId"/>
</sec:ifAllGranted>

<div id="right" style="display:block;">
  <div id="rightbox">
    <g:hasErrors bean="${reservationCommand}">
      <!--g:renderErrors bean="${reservationCommand}"/-->
      <div class="error">
        <b>Los datos son incorrectos...</b>
      </div>
    </g:hasErrors>
    <label>Fecha de reservacion:</label> <g:textField name="fechaReservacion" value="${reservationCommand?.fechaReservacion}"/><br/><br/>
    <label>Hora de inicio:</label>
    <br/><input type="text" size="10" class="timeRange" id="timeFrom" name="timeFrom" value="${reservationCommand.timeFrom}"><br/>
    <label>Hora de termino:</label>
    <br/><input type="text" size="10" class="timeRange" id="timeTo" name="timeTo" value="${reservationCommand.timeTo}"><br/>
    <br/><input type="submit" name="doReservation" value="Realizar reservación" id="doReservation"/>
  </div>
</div>

</g:form>

<g:javascript>
  $('#rightbox :submit').button();
  var selectorTablaClientes = ".clienteShortDetail";
  $(selectorTablaClientes).live('mouseover', function() {
    $(this).addClass('highlight');
  });
  $(selectorTablaClientes).live('mouseleave', function() {
    $(this).removeClass('highlight');
  });
  $(selectorTablaClientes).live('click', function() {
    $(selectorTablaClientes).removeClass('itemSelected');
    $(this).find(":radio").attr('checked', 'checked');
    $('input#clienteId').val($(this).find(":radio").val());
    $(this).addClass('itemSelected');
  });

  var selectorTablaWorkspace = ".workspaceShortDetail";
  $(selectorTablaWorkspace).live('mouseover', function() {
    $(this).addClass('highlight');
  });
  $(selectorTablaWorkspace).live('mouseleave', function() {
    $(this).removeClass('highlight');
  });
  $(selectorTablaWorkspace).live('click', function() {
    $(selectorTablaWorkspace).removeClass('itemSelected');
    $(this).find(":radio").attr('checked', 'checked');
    $('input#workspaceId').val($(this).find(":radio").val());
    $(this).addClass('itemSelected');
    if(!$("#right").is(':visible')){
      $("#right").fadeIn();
    }
  });
</g:javascript>
</body>
</html>