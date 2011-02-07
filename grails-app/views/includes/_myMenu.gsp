<div id="myMenu">
  <g:link controller="person" action="create" class="menuItem">Crea un cliente</g:link>
  <g:link controller="person" action="list">Ver clientes</g:link>
  <g:link controller="workspace" action="create">Crea un espacio</g:link>
  <g:link controller="workspace" action="list">Lista de espacios</g:link>
  <g:link controller="reservation" action="choose">Realiza una reservación</g:link>
</div>
<g:javascript>
  $("div#myMenu > a").button();
</g:javascript>