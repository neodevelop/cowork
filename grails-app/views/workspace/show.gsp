<%@ page import="com.synergyj.cowork.Workspace" %>
<html>
<head>
  <meta name="layout" content="content-bizhub"/>
  <g:set var="entityName" value="${message(code: 'workspace.label', default: 'Workspace')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<!--div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div-->
<!--div class="body"-->
<div id="left">
  <h1><g:message code="workspace.info"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <h2>${workspaceInstance?.nombreDeEspacio}</h2>
  <span class="bluetext">
      Ubicado en: ${workspaceInstance?.direccion}
  </span>

  <div></div>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="workspace.ubicacionInterna.label" default="Ubicacion Interna"/></td>

        <td valign="top" class="value">${fieldValue(bean: workspaceInstance, field: "ubicacionInterna")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="workspace.tamanio.label" default="Tamaño"/></td>

        <td valign="top" class="value">
          <b>${fieldValue(bean: workspaceInstance, field: "tamanio")} m<sup>2</sup></b>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="workspace.capacidad.label" default="Capacidad"/></td>

        <td valign="top" class="value">
          <b>${fieldValue(bean: workspaceInstance, field: "capacidad")} personas</b>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="workspace.costoPorHora.label" default="Costo Por Hora"/></td>

        <td valign="top" class="value"><b>$ ${fieldValue(bean: workspaceInstance, field: "costoPorHora")} MXN</b></td>

      </tr>

      <!--tr class="prop">
        <td valign="top" class="name"><g:message code="workspace.ubicacion.label" default="Ubicacion"/></td>
        <td valign="top" class="value">${fieldValue(bean: workspaceInstance, field: "ubicacion")}</td>
      </tr-->

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${workspaceInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </g:form>
  </div>
</div>
</body>
</html>
