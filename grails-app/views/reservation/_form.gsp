    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="cliente"><g:message code="reservation.cliente.label" default="Cliente"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: reservationInstance, field: 'cliente', 'errors')}">
            <g:select name="cliente.id" from="${com.synergyj.cowork.auth.Person.list()}" optionKey="id" value="${reservationInstance?.cliente?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="fechaHoraReservacion"><g:message code="reservation.fechaHoraReservacion.label" default="Fecha Hora Reservacion"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: reservationInstance, field: 'fechaHoraReservacion', 'errors')}">
            <g:datePicker name="fechaHoraReservacion" precision="minute" value="${reservationInstance?.fechaHoraReservacion}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="fechaHoraTerminoDeUso"><g:message code="reservation.fechaHoraTerminoDeUso.label" default="Fecha Hora Termino De Uso"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: reservationInstance, field: 'fechaHoraTerminoDeUso', 'errors')}">
            <g:datePicker name="fechaHoraTerminoDeUso" precision="minute" value="${reservationInstance?.fechaHoraTerminoDeUso}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="workspace"><g:message code="reservation.workspace.label" default="Workspace"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: reservationInstance, field: 'workspace', 'errors')}">
            <g:select name="workspace.id" from="${com.synergyj.cowork.Workspace.list()}" optionKey="id" value="${reservationInstance?.workspace?.id}"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>