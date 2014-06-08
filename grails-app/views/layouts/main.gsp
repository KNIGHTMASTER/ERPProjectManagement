<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js"><!--<![endif]-->
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Project Plan Management</title>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'reset.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'text.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'form.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'buttons.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'grid.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'layout.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui-1.8.12.custom.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.visualize.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'facebox.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'uniform.default.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'dataTables.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'criticalpath.css')}" type="text/css">

<script type="text/javascript" src="${resource(dir: 'js/js/jquery', file: 'jquery-1.5.2.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/js/jquery', file: 'jquery-ui-1.8.12.custom.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/js/misc', file: 'excanvas.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/js/jquery', file: 'facebox.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/js/jquery', file: 'jquery.visualize.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/js/jquery', file: 'jquery.dataTables.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/js/jquery', file: 'jquery.tablesorter.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/js/jquery', file: 'jquery.uniform.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/js/jquery', file: 'jquery.placeholder.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/js', file: 'widgets.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/js', file: 'dashboard.js')}"></script>

<link rel="stylesheet" href="${resource(dir: 'css', file: 'styles.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'tablesorter.css')}" type="text/css">

<g:layoutHead/>
<r:layoutResources />
</head>

<body>

<div id="container">
        <!--title -->
	<g:render template="/navigasi/head" />
	<!--end title-->
        <!--content -->
        <div id="content">
          <g:layoutBody />
        <!--end content--> 
        </div>
        <!--footer -->
	<g:render template="/navigasi/footer" />
	<!--end footer-->
        <!--script -->
	<g:render template="/navigasi/script" />
	<!--end script-->
   </div>
 <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
</body>
</html>