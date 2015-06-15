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
                                <li><a href="/ERPProjectManagement/ForecastingChart"><g:message code="Forecasting Chart"/></a></li>
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
                                <canvas id="canvas" height="450" width="600"></canvas> ${data1}
                          </body>
                          <!--end topmenu-->
                        </div>
                        
		</div>
		<div id="page-body" role="main">	
		</div>
        
        </body>
</html>