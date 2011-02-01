<%--

--%>

    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="nombreReal"><g:message code="person.nombreReal.label" default="Nombre Real"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'nombreReal', 'errors')}">
            <g:textField name="nombreReal" value="${personInstance?.nombreReal}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="apellidoPaterno"><g:message code="person.apellidoPaterno.label" default="Apellido Paterno"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'apellidoPaterno', 'errors')}">
            <g:textField name="apellidoPaterno" value="${personInstance?.apellidoPaterno}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="apellidoMaterno"><g:message code="person.apellidoMaterno.label" default="Apellido Materno"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'apellidoMaterno', 'errors')}">
            <g:textField name="apellidoMaterno" value="${personInstance?.apellidoMaterno}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="email"><g:message code="person.email.label" default="Email"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'email', 'errors')}">
            <g:textField name="email" value="${personInstance?.email}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="razonSocial"><g:message code="person.razonSocial.label" default="Razon Social"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'razonSocial', 'errors')}">
            <g:textField name="razonSocial" value="${personInstance?.razonSocial}" size="70"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="rfc"><g:message code="person.rfc.label" default="RFC"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'rfc', 'errors')}">
            <g:textField name="rfc" value="${personInstance?.rfc}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="direccionFiscal"><g:message code="person.direccionFiscal.label" default="Direccion fiscal"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'rfc', 'errors')}">
            <g:textArea name="direccionFiscal" value="${personInstance?.direccionFiscal}" cols="40" rows="5"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>
