
<%@ page import="ProjectCostManagement.ControlCost.EstimateComplete" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estimateComplete.label', default: 'EstimateComplete')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-estimateComplete" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a class="list" href="../HumanForecasting/"><g:message code="Human Forecasting List"/></a></li>
                                <li><a class="list" href="../MaterialForecasting/"><g:message code="Material Forecasting List"/></a></li>
                                <li><a class="list" href="../ManagementForecasting/"><g:message code="Management Forecasting List"/></a></li>
			</ul>
		</div>
		<div id="list-estimateComplete" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="periode" title="${message(code: 'estimateComplete.periode.label', default: 'Periode')}" />
					
						<g:sortableColumn property="actualCost" title="${message(code: 'estimateComplete.actualCost.label', default: 'Actual Cost')}" />
					
						<g:sortableColumn property="estimateCost" title="${message(code: 'estimateComplete.estimateCost.label', default: 'Estimate Cost')}" />
					
						<g:sortableColumn property="trendValue" title="${message(code: 'estimateComplete.trendValue.label', default: 'Trend Value')}" />
					
                                                <th>Forecasting Periode + 1</th>
                                                <th>Forecasting Next Month</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${estimateCompleteInstanceList}" status="i" var="estimateCompleteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${estimateCompleteInstance.id}">${fieldValue(bean: estimateCompleteInstance, field: "periode")}</g:link></td>
					
						<td>${fieldValue(bean: estimateCompleteInstance, field: "actualCost")}</td>
					
						<td>${fieldValue(bean: estimateCompleteInstance, field: "esC")}</td>
					
						<td>${fieldValue(bean: estimateCompleteInstance, field: "trV")}</td>
					
						<td>${fieldValue(bean: estimateCompleteInstance, field: "forecasting")}</td>
					
						<td>${fieldValue(bean: estimateCompleteInstance, field: "fc")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${estimateCompleteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
