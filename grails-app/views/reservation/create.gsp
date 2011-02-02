

<%@ page import="com.synergyj.cowork.Reservation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reservationInstance}">
            <div class="errors">
                <g:renderErrors bean="${reservationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cliente"><g:message code="reservation.cliente.label" default="Cliente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservationInstance, field: 'cliente', 'errors')}">
                                    <g:select name="cliente.id" from="${com.synergyj.cowork.auth.Person.list()}" optionKey="id" value="${reservationInstance?.cliente?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaHoraReservacion"><g:message code="reservation.fechaHoraReservacion.label" default="Fecha Hora Reservacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservationInstance, field: 'fechaHoraReservacion', 'errors')}">
                                    <g:datePicker name="fechaHoraReservacion" precision="day" value="${reservationInstance?.fechaHoraReservacion}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaHoraTerminoDeUso"><g:message code="reservation.fechaHoraTerminoDeUso.label" default="Fecha Hora Termino De Uso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservationInstance, field: 'fechaHoraTerminoDeUso', 'errors')}">
                                    <g:datePicker name="fechaHoraTerminoDeUso" precision="day" value="${reservationInstance?.fechaHoraTerminoDeUso}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="workspace"><g:message code="reservation.workspace.label" default="Workspace" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reservationInstance, field: 'workspace', 'errors')}">
                                    <g:select name="workspace.id" from="${com.synergyj.cowork.Workspace.list()}" optionKey="id" value="${reservationInstance?.workspace?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
