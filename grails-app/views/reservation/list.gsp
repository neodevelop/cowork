<%@ page import="com.synergyj.cowork.Reservation" %>
<html>
<head>
  <meta name="layout" content="content-bizhub"/>
  <g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<body>
<!--div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div-->
<!--div class="body"-->
<div id="left">
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="${message(code: 'reservation.id.label', default: 'Id')}"/>

        <th><g:message code="reservation.cliente.label" default="Cliente"/></th>

        <th><g:message code="reservation.workspace.label" default="Workspace"/></th>

        <g:sortableColumn property="fechaHoraReservacion" title="${message(code: 'reservation.fechaHoraReservacion.label', default: 'Fecha Hora Reservacion')}"/>

        <g:sortableColumn property="fechaHoraTerminoDeUso" title="${message(code: 'reservation.fechaHoraTerminoDeUso.label', default: 'Fecha Hora Termino De Uso')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${reservationInstanceList}" status="i" var="reservationInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${reservationInstance.id}">${fieldValue(bean: reservationInstance, field: "id")}</g:link></td>

          <td>${fieldValue(bean: reservationInstance, field: "cliente")}</td>

          <td>${fieldValue(bean: reservationInstance, field: "workspace")}</td>

          <td><g:formatDate format="dd-MM-yy hh:mm" date="${reservationInstance.fechaHoraReservacion}"/></td>

          <td><g:formatDate format="hh:mm" date="${reservationInstance.fechaHoraTerminoDeUso}"/></td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${reservationInstanceTotal}"/>
  </div>
</div>
</body>
</html>
