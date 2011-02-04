<table id="workspaceList" width="100%" cellpadding="5">
  <thead>
    <tr>
      <td align="center"><b>Espacio de trabajo</b></td>
    </tr>
  </thead>
  <tbody>
  <g:each in="${listWorkspace}" var="workspace">
  <tr>
    <td>
      <div id="workspaceOption">
        <g:radio value="${workspace.id}" name="workspaceSelected"/>
      </div>
      <b>${workspace.nombreDeEspacio}</b><br/>
      Direccion: <i>${workspace.direccion}</i><br/>
      Tamaño: <i>${workspace.tamanio} m<sup>2</sup></i><br/>
      Capacidad: <i>${workspace.capacidad} personas</i><br/>
      Costo: <i>$ ${workspace.costoPorHora} MXN por hora</i>
    </td>
  </tr>
  </g:each>
  </tbody>
</table>