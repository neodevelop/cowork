<%@ page import="com.synergyj.cowork.auth.Person" %>
<html>
<head>
  <meta name="layout" content="content-bizhub"/>
  <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>
<body>

<div class="body">
  <h1><g:message code="client.edit"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${personInstance}">
    <div class="errors">
      <g:renderErrors bean="${personInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${personInstance?.id}"/>
    <g:hiddenField name="version" value="${personInstance?.version}"/>
    <g:render template="clientForm" bean="personInstance" />
    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
