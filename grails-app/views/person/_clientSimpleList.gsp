<h4>Clientes</h4>
<g:each in="${listClient}" var="client">
  <div class="clienteShortDetail">
    <div id="clientOption" style="display:none;">
      <g:radio value="${client.id}" name="clientSelected"/>
    </div>
    <div style="padding:0; height: 32px;">
      <div class="razonSocial"><b>${client.razonSocial}</b></div>
    </div>
    <div class="teamline"></div>
    <p>
      Contacto: <i>${client.nombreReal} ${client.apellidoPaterno} ${client.apellidoMaterno}</i><br/>
      RFC: <i>${client.rfc}</i><br/>
      Correo: <i>${client.email}</i>
    </p>
  </div>
</g:each>