<%@ page import="com.synergyj.cowork.Workspace" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="content-bizhub"/>
  <g:set var="entityName" value="${message(code: 'workspace.label', default: 'Workspace')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
  <script type="text/javascript" src="${createLinkTo(dir:'js',file:'tables.js')}"></script>
  <g:javascript>
    $(function(){
      $("#workspaces").styleTable();
    });
  </g:javascript>
</head>
<body>
<!--div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div-->
<div class="body">
<!--div id="left"-->
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table cellpadding="0" cellspacing="0" id="workspaces">
      <thead>
      <tr>

        <!--g:sortableColumn property="id" title="${message(code: 'workspace.id.label', default: 'Id')}"/-->

        <g:sortableColumn property="nombreDeEspacio" title="${message(code: 'workspace.nombreDeEspacio.label', default: 'Nombre De Espacio')}"/>

        <g:sortableColumn property="direccion" title="${message(code: 'workspace.direccion.label', default: 'Direccion')}"/>

        <g:sortableColumn property="ubicacionInterna" title="${message(code: 'workspace.ubicacionInterna.label', default: 'Ubicacion Interna')}"/>

        <g:sortableColumn property="tamanio" title="${message(code: 'workspace.tamanio.label', default: 'Tamanio')}"/>

        <g:sortableColumn property="capacidad" title="${message(code: 'workspace.capacidad.label', default: 'Capacidad')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${workspaceInstanceList}" status="i" var="workspaceInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <!--td><g:link action="show" id="${workspaceInstance.id}">${fieldValue(bean: workspaceInstance, field: "id")}</g:link></td-->

          <td><g:link action="show" id="${workspaceInstance.id}">${fieldValue(bean: workspaceInstance, field: "nombreDeEspacio")}</g:link></td>

          <td>${fieldValue(bean: workspaceInstance, field: "direccion")}</td>

          <td>${fieldValue(bean: workspaceInstance, field: "ubicacionInterna")}</td>

          <td>${fieldValue(bean: workspaceInstance, field: "tamanio")}</td>

          <td>${fieldValue(bean: workspaceInstance, field: "capacidad")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${workspaceInstanceTotal}"/>
  </div>
</div>
</body>
</html>
