<%@ page import="com.synergyj.cowork.Reservation" %>
<html>
<head>
  <meta name="layout" content="content-bizhub"/>
  <g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}"/>
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
  <h1><g:message code="default.show.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <!--tr class="prop">
        <td valign="top" class="name"><g:message code="reservation.id.label" default="Id"/></td>

        <td valign="top" class="value">${fieldValue(bean: reservationInstance, field: "id")}</td>

      </tr-->

      <tr class="prop">
        <td valign="top" class="name"><g:message code="reservation.cliente.label" default="Cliente"/></td>

        <td valign="top" class="value"><g:link controller="person" action="show" id="${reservationInstance?.cliente?.id}">${reservationInstance?.cliente?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="reservation.fechaHoraReservacion.label" default="Fecha Hora Reservacion"/></td>

        <td valign="top" class="value"><g:formatDate format="dd-MM-yy hh:mm" date="${reservationInstance?.fechaHoraReservacion}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="reservation.fechaHoraTerminoDeUso.label" default="Fecha Hora Termino De Uso"/></td>

        <td valign="top" class="value"><g:formatDate format="dd-MM-yy hh:mm"  date="${reservationInstance?.fechaHoraTerminoDeUso}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="reservation.workspace.label" default="Workspace"/></td>

        <td valign="top" class="value"><g:link controller="workspace" action="show" id="${reservationInstance?.workspace?.id}">${reservationInstance?.workspace?.encodeAsHTML()}</g:link></td>

      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${reservationInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </g:form>
  </div>
</div>
</body>
</html>
