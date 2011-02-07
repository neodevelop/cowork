<%@ page import="com.synergyj.cowork.auth.Person" %>
<html>
<head>
  <meta name="layout" content="content-bizhub"/>
  <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div class="body">
  <h1><g:message code="client.info"/></h1>

  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>

  <h2>${personInstance?.razonSocial}</h2>
  <span class="bluetext">
      Representante: ${personInstance.nombreReal} ${personInstance?.apellidoPaterno} ${personInstance?.apellidoMaterno}
  </span>

  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="person.email.label" default="Email"/>:</td>

        <td valign="top" class="value">${fieldValue(bean: personInstance, field: "email")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="person.rfc.label" default="RFC"/>:</td>

        <td valign="top" class="value">${fieldValue(bean: personInstance, field: "rfc")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="person.direccionFiscal.label" default="Direcccion Fiscal"/>:</td>

        <td valign="top" class="value">${fieldValue(bean: personInstance, field: "direccionFiscal")}</td>

      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${personInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </g:form>
  </div>
</div>
</body>
</html>
