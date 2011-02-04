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
  <jqui:resources theme="darkness" />
</head>
<body>
<div id="left">
  <h1>Realizar reservaciones</h1>
  <span class="bluetext">
    Puedes buscar a los clientes ya sea por <b>Razon social, RFC o correo electrónico</b><br/>
    Y los espacioes de trabajo los buscas por <b>Nombre del aula o direccion</b>
  </span>

  <table width="100%">
    <tr>
      <td width="50%">
        <g:formRemote url="[action:'searchClients']" name="searchClient" update="clientSimpleList">
          <label>Cliente:</label>
          <g:textField name="clientquery"/>
          <g:submitButton name="query" value="Consultar" class="button"/>
        </g:formRemote>
      </td>
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
      <td width="50%" valign="top">
        <div id="clientSimpleList"/>
      </td>
      <td valign="top">
        <div id="workspaceSimpleList"/>
      </td>
    </tr>
  </table>

</div>

<div id="right" style="display:none;">
  <label>Fecha de reservacion:</label> <g:textField name="fechaReservacion"/><br/><br/>
  <label>Hora de inicio:</label> <g:textField name="horaInicio"/><br/>
  <label>Hora de termino:</label> <g:textField name="horaFin"/><br/>
</div>

<g:javascript>
  var selectorTablaClientes = "table#clientList > tbody > tr > td";
  $(selectorTablaClientes).live('mouseover', function() {
    $(this).addClass('highlight');
  });
  $(selectorTablaClientes).live('mouseleave', function() {
    $(this).removeClass('highlight');
  });
  $(selectorTablaClientes).live('click', function() {
    $(selectorTablaClientes).removeClass('itemSelected');
    $(this).find(":radio").attr('checked', 'checked');
    $(this).addClass('itemSelected');
  });

  var selectorTablaWorkspace = "table#workspaceList > tbody > tr > td";
  $(selectorTablaWorkspace).live('mouseover', function() {
    $(this).addClass('highlight');
  });
  $(selectorTablaWorkspace).live('mouseleave', function() {
    $(this).removeClass('highlight');
  });
  $(selectorTablaWorkspace).live('click', function() {
    $(selectorTablaWorkspace).removeClass('itemSelected');
    $(this).find(":radio").attr('checked', 'checked');
    $(this).addClass('itemSelected');
    if(!$("#right").is(':visible')){
      $("#right").fadeIn();
    }
  });
</g:javascript>
</body>
</html>