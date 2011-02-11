<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Calendario de reservaciones</title>
  <meta name="layout" content="content-bizhub"/>
  <link rel='stylesheet' type='text/css' href='http://arshaw.com/js/fullcalendar/fullcalendar/fullcalendar.css'/>
  <script type='text/javascript' src='http://arshaw.com/js/fullcalendar/fullcalendar/fullcalendar.min.js'></script>
  <g:javascript>

    var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();

    $(function() {
      $('#calendar').fullCalendar({
        theme:true,
        editable:false,
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        events: "${createLink(controller:'calendar',action:'populateReservations')}"
      });
    });
  </g:javascript>
  <style type="text/css">
  #calendar{
    width:100%;
  }
  </style>
</head>
<body>
<h1>Calendario de reservaciones</h1>
<div id="calendar"></div>
</body>
</html>