<%@ page import="ProjectCostManagement.ControlCost.MaterialForecasting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialForecasting.label', default: 'MaterialForecasting')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-materialForecasting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-materialForecasting" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="periode" title="${message(code: 'materialForecasting.periode.label', default: 'Periode')}" />
                                                <th>Actual Cost</th>
                                                <th>Estimate Cost</th>
                                                <th>trend Value</th>
                                                <th>Forecasting Periode + 1</th>
                                                <th>Forecasting Next Month</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${materialForecastingInstanceList}" status="i" var="materialForecastingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materialForecastingInstance.id}">${fieldValue(bean: materialForecastingInstance, field: "periode")}</g:link></td>
					
						<td>${fieldValue(bean: materialForecastingInstance, field: "actualCost")}</td>
					
						<td>${fieldValue(bean: materialForecastingInstance, field: "esC")}</td>
					
						<td>${fieldValue(bean: materialForecastingInstance, field: "trV")}</td>
					
						<td>${fieldValue(bean: materialForecastingInstance, field: "forecasting")}</td>
                                                
                                                <td>${fieldValue(bean: materialForecastingInstance, field: "fc")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${materialForecastingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>