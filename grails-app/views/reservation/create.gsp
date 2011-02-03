<%@ page import="com.synergyj.cowork.Reservation" %>
<html>
<head>
  <meta name="layout" content="content-bizhub"/>
  <g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>
<body>
<!--div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
</div-->
<!--div class="body"-->
<div id="left">
  <h1><g:message code="default.create.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${reservationInstance}">
    <div class="errors">
      <g:renderErrors bean="${reservationInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save">
    <g:render template="form" bean="${reservationInstance}"/>
    <div class="buttons">
      <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
