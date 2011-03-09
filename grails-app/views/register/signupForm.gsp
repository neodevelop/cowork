<%@ page import="com.synergyj.cowork.auth.Person" %>
<html>
<head>
  <meta name="layout" content="content-bizhub"/>
  <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
  <title>Crear cuenta</title>
  <link rel="stylesheet" type="text/css" media="screen" href="http://jquery.bassistance.de/validate.password/jquery.validate.password.css" />
  <script type="text/javascript" src="http://jquery.bassistance.de/validate.password/lib/jquery.validate.js"></script>
  <script type="text/javascript" src="http://jquery.bassistance.de/validate.password/jquery.validate.password.js"></script>
  <g:javascript>
    $(function(){
      var validator = $('form.register').validate({
        rules:{
          password:{
            required:true,
            minlength:5
          },
          repassword:{
            required:true,
            equalTo:"#password"
          },
          email:{
            required:true,
            email:true
          },
          confirmaremail:{
            required:true,
            equalTo:"#email"
          }
        },
        messages:{
          password:{
            required:" Por favor escribe tu password...",
            minlength:" La longitud mínima del password es de 5 caracteres"
          },
          repassword:{
            required:" Por favor reescribe tu password...",
            equalTo:" Los passwords no coinciden..."
          },
          email:{
            required:" Por favor escribe tu correo...",
            email:" Esta no es una dirección de correo válida..."
          },
          confirmaremail:{
            required:" Por favor reescribe tu correo...",
            equalTo:" Las direcciones de correo no coinciden..."
          }
        }
      });
    });
  </g:javascript>
</head>
<body>

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
  <g:form class="register" action="createAccount" controller="register">
    <g:render template="/person/clientForm" bean="personInstance" />
    <div class="buttons">
      <span class="button">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
      </span>
    </div>
  </g:form>
</div>


</body>
</html>
