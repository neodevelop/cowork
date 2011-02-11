<sec:ifLoggedIn>
<div id="myMenu">
  <sec:ifAnyGranted roles="ROLE_OPERATOR">
  <g:link controller="person" action="create" class="menuItem">Crea un cliente</g:link>
  <g:link controller="person" action="list">Ver clientes</g:link>
  <g:link controller="workspace" action="create">Crea un espacio</g:link>
  <g:link controller="workspace" action="list">Lista de espacios</g:link>
  </sec:ifAnyGranted>
  <g:link controller="reservation" action="choose">Realiza una reservación</g:link>
  <g:link controller="calendar" action="showReservations">Ver el calendario</g:link>
  
  <sec:ifNotGranted roles="ROLE_OPERATOR">
  <g:link controller="reservation" action="showByClient">Confirmar una reservación</g:link>
  <g:link controller="person" action="showAccount">Mi cuenta</g:link>
  </sec:ifNotGranted>
  <g:link controller="logout" >Salir</g:link>
</div>
<g:javascript>
  $("div#myMenu > a").button();
</g:javascript>
</sec:ifLoggedIn>