<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
                        <div id="container">
                          <ul>
                                <li><a href="/ERPProjectManagement/HumanFc"><g:message code="Human Forecasting Chart"/></a></li>
                                <li><a href="/ERPProjectManagement/MaterialFc"><g:message code="Material Forecasting Chart"/></a></li>
                                <li><a href="/ERPProjectManagement/ManagementFc"><g:message code="Management Forecasting Chart"/></a></li>
			</ul>
                          <!--topmenu -->
                           <head>
                                <script type="text/javascript" src="${resource(dir:'js/forecasting/', file:'Chart.js')}"></script>
                                <meta name = "viewport" content = "initial-scale = 1, user-scalable = no">
                                <style>
                                        canvas{
                                        }
                                </style>
                          </head>
                          <body>
                                <canvas id="canvas" height="450" width="600"></canvas> ${data}
                          </body>
                          <!--end topmenu-->
                        </div>
                        
		</div>
		<div id="page-body" role="main">	
		</div>
        
        </body>
</html>