
<%@ page import="ProjectCostManagement.ControlCost.HumanForecasting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'humanForecasting.label', default: 'HumanForecasting')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-humanForecasting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-humanForecasting" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="periode" title="${message(code: 'humanForecasting.periode.label', default: 'Periode')}" />
                                                <th>Actual Cost</th>
                                                <th>Estimate Cost</th>
                                                <th>trend Value</th>
                                                <th>Forecasting Periode + 1</th>
                                                <th>Forecasting Next Month</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${humanForecastingInstanceList}" status="i" var="humanForecastingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${humanForecastingInstance.id}">${fieldValue(bean: humanForecastingInstance, field: "periode")}</g:link></td>
					
						<td>${fieldValue(bean: humanForecastingInstance, field: "actualCost")}</td>
					
						<td>${fieldValue(bean: humanForecastingInstance, field: "esC")}</td>
					
						<td>${fieldValue(bean: humanForecastingInstance, field: "trV")}</td>
					
						<td>${fieldValue(bean: humanForecastingInstance, field: "forecasting")}</td>
                                                
                                                <td>${fieldValue(bean: humanForecastingInstance, field: "fc")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${humanForecastingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
