<%@ page import="com.synergyj.cowork.auth.Person" %>
<html>
<head>
  <meta name="layout" content="content-bizhub"/>
  <g:set var="entityName" value="${message(code: 'person.label', default: 'Cliente')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
  <script type="text/javascript" src="${createLinkTo(dir:'js',file:'tables.js')}"></script>
  <g:javascript>
    $(function(){
      $("#clients").styleTable();
    });
  </g:javascript>
</head>
<body>
<div class="body">
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div id="clients" class="list">
    <table width="100%" class="full" cellpadding="0" cellspacing="0">
      <thead>
      <tr>

        <g:sortableColumn property="id" title="${message(code: 'person.id.label', default: 'Id')}"/>

        <g:sortableColumn property="email" title="${message(code: 'person.email.label', default: 'E-Mail')}"/>

        <g:sortableColumn property="razonSocial" title="${message(code: 'person.razonSocial.label', default: 'Razon Social')}"/>

        <g:sortableColumn property="rfc" title="${message(code: 'person.rfc.label', default: 'RFC')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${personInstanceList}" status="i" var="personInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td>
            <g:link action="show" id="${personInstance.id}">
              ${personInstance.nombreReal} ${personInstance.apellidoPaterno} ${personInstance.apellidoMaterno}
            </g:link>
          </td>

          <td>${fieldValue(bean: personInstance, field: "email")}</td>

          <td>${fieldValue(bean: personInstance, field: "razonSocial")}</td>

          <td>${fieldValue(bean: personInstance, field: "rfc")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${personInstanceTotal}"/>
  </div>
</div>
</body>
</html>
