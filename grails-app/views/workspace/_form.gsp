    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="nombreDeEspacio"><g:message code="workspace.nombreDeEspacio.label" default="Nombre De Espacio"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: workspaceInstance, field: 'nombreDeEspacio', 'errors')}">
            <g:textField name="nombreDeEspacio" value="${workspaceInstance?.nombreDeEspacio}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="direccion"><g:message code="workspace.direccion.label" default="Direccion"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: workspaceInstance, field: 'direccion', 'errors')}">
            <g:textArea name="direccion" cols="40" rows="5" value="${workspaceInstance?.direccion}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="ubicacionInterna"><g:message code="workspace.ubicacionInterna.label" default="Ubicacion Interna"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: workspaceInstance, field: 'ubicacionInterna', 'errors')}">
            <g:textField name="ubicacionInterna" value="${workspaceInstance?.ubicacionInterna}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="tamanio"><g:message code="workspace.tamanio.label" default="Tamanio"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: workspaceInstance, field: 'tamanio', 'errors')}">
            <g:textField name="tamanio" value="${fieldValue(bean: workspaceInstance, field: 'tamanio')}"/> m<sup>2</sup>. (Metros cuadrados)
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="capacidad"><g:message code="workspace.capacidad.label" default="Capacidad"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: workspaceInstance, field: 'capacidad', 'errors')}">
            <g:textField name="capacidad" value="${fieldValue(bean: workspaceInstance, field: 'capacidad')}" size="8"/> <b>Personas</b>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="costoPorHora"><g:message code="workspace.costoPorHora.label" default="Costo Por Hora"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: workspaceInstance, field: 'costoPorHora', 'errors')}">
            $ <g:textField name="costoPorHora" value="${fieldValue(bean: workspaceInstance, field: 'costoPorHora')}" size="8"/> <b>MXN</b>
          </td>
        </tr>

        <!--tr class="prop">
          <td valign="top" class="name">
            <label for="ubicacion"><g:message code="workspace.ubicacion.label" default="Ubicacion"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: workspaceInstance, field: 'ubicacion', 'errors')}">
            <g:textField name="ubicacion" value="${workspaceInstance?.ubicacion}"/>
          </td>
        </tr-->

        <g:hiddenField name="ubicacion" value="${workspaceInstance?.ubicacion}"/>
        </tbody>
      </table>
    </div>