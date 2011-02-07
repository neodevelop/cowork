<h4><b>Espacio de trabajo</b></h4>
<g:each in="${listWorkspace}" var="workspace">
  <div class="workspaceShortDetail">
    <div id="workspaceOption" style="display:none;">
      <g:radio value="${workspace.id}" name="workspaceSelected"/>
    </div>
    <div style="padding:0; height: 32px;">
      <div class="nombreEspacio"><b>${workspace.nombreDeEspacio}</b></div>
    </div>
    <div class="teamline"></div>
    <p>
      Direccion: <i>${workspace.direccion}</i><br/>
      Tamaño: <i>${workspace.tamanio} m<sup>2</sup></i><br/>
      Capacidad: <i>${workspace.capacidad} personas</i><br/>
      Costo: <i>$ ${workspace.costoPorHora} MXN por hora</i>
    </p>
  </div>
</g:each>
