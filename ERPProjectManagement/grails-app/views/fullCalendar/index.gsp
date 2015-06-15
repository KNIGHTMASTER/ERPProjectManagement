<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<html>
<head>
<link rel="stylesheet" type="text/css" href="js/calendar/theme.css"/>
<link rel="stylesheet" type="text/css" href="js/calendar/fullcalendar.css"/>
<link rel="stylesheet" type="text/css" href="js/calendar/fullcalendar.print.css" media="print"/>
<script language="javascript" src="js/calendar/jquery-1.8.1.min.js"></script>
<script language="javascript" src="js/calendar/jquery-ui-1.8.23.custom.min.js"></script>
<script language="javascript" src="js/calendar/fullcalendar.min.js"></script>
<script type='text/javascript'>

	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		var calendar = $('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			
			editable: true,
			events: [
				${data}
                                ]
		});
		
	});

</script>
<style type='text/css'>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 13px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

</style>
</head>
<body>
<div id='calendar'></div>
</body>
</html>
