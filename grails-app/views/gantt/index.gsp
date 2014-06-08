<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!doctype html>
<html>
	<head>
                <!--<link type="text/css" rel="stylesheet" href="${resource(dir: 'css', file: 'layout_1.css')}" type="text/css">-->
                <link type="text/css" rel="stylesheet" href="${resource(dir: 'js/gantt', file: 'jsgantt.css')}" type="text/css">
                <script type="text/javascript" src="${resource(dir: 'js/gantt', file: 'jsgantt.js')}"></script>
                <script type="text/javascript" src="${resource(dir: 'js/gantt', file: 'jsgantt.compressed.js')}"></script>
		<title>Project Management</title>
	</head>


</body>

<div style="position:relative" class="calendar" id="GanttChartDIV"></div>
  ${data}       
</body>
</html>