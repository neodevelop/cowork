<table id="clientList" width="100%" cellpadding="5">
  <thead>
    <tr>
      <td align="center"><b>Cliente</b></td>
    </tr>
  </thead>
  <tbody>
  <g:each in="${listClient}" var="client">
  <tr>
    <td>
      <div id="clientOption">
        <g:radio value="${client.id}" name="clientSelected"/>
      </div>
      <b>${client.razonSocial}</b><br/>
      Contacto: <i>${client.nombreReal} ${client.apellidoPaterno} ${client.apellidoMaterno}</i><br/>
      RFC: <i>${client.rfc}</i><br/>
      Correo: <i>${client.email}</i>
    </td>
  </tr>
  </g:each>
  </tbody>
</table>