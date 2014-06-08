
<%@ page import="ProjectCostManagement.ControlCost.ManagementForecasting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managementForecasting.label', default: 'ManagementForecasting')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-managementForecasting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-managementForecasting" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="periode" title="${message(code: 'managementForecasting.periode.label', default: 'Periode')}" />
                                                <th>Actual Cost</th>
                                                <th>Estimate Cost</th>
                                                <th>trend Value</th>
                                                <th>Forecasting Periode + 1</th>
                                                <th>Forecasting Next Month</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${managementForecastingInstanceList}" status="i" var="managementForecastingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${managementForecastingInstance.id}">${fieldValue(bean: managementForecastingInstance, field: "periode")}</g:link></td>
					
                                                <td>${fieldValue(bean: managementForecastingInstance, field: "actualCost")}</td>
					
						<td>${fieldValue(bean: managementForecastingInstance, field: "esC")}</td>
					
						<td>${fieldValue(bean: managementForecastingInstance, field: "trV")}</td>
					
						<td>${fieldValue(bean: managementForecastingInstance, field: "forecasting")}</td>
                                                
                                                <td>${fieldValue(bean: managementForecastingInstance, field: "fc")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${managementForecastingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
