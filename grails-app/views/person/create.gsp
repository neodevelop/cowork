<%@ page import="com.synergyj.cowork.auth.Person" %>
<html>
<head>
  <meta name="layout" content="content-bizhub"/>
  <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>
<body>

<!--g:link class="list" action="list"-->
  <!--g:message code="default.list.label" args="[entityName]"/-->
<!--/g:link-->

<div id="left">
  <h1><g:message code="client.create" default="Create client"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${personInstance}">
    <div class="errors">
      <g:renderErrors bean="${personInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save">
    <g:render template="clientForm" bean="personInstance" />
    <div class="buttons">
      <span class="button">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
      </span>
    </div>
  </g:form>
</div>
</body>
</html>
