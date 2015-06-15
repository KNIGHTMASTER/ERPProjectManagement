
<%@ page import="ProjectCostManagement.ControlCost.EstimateToComplete" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estimateToComplete.label', default: 'EstimateToComplete')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-estimateToComplete" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a class="list" href="../HumanForecasting/"><g:message code="Human Forecasting List"/></a></li>
                                <li><a class="list" href="../MaterialForecasting/"><g:message code="Material Forecasting List"/></a></li>
                                <li><a class="list" href="../ManagementForecasting/"><g:message code="Management Forecasting List"/></a></li>
			</ul>
		</div>
		<div id="list-estimateToComplete" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="periode" title="${message(code: 'estimateToComplete.periode.label', default: 'Periode')}" />
					
                                                <g:sortableColumn property="actualCostProject" title="${message(code: 'estimateToComplete.actualCostProject.label', default: 'Actual Cost Project')}" />
                                                
						<g:sortableColumn property="esC" title="${message(code: 'estimateToComplete.esC.label', default: 'Estimate Cost')}" />
					
						<g:sortableColumn property="trV" title="${message(code: 'estimateToComplete.trV.label', default: 'Trend Value')}" />
                                                <th>Forecasting Periode + 1</th>
                                                <th>Forecasting Next Month</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${estimateToCompleteInstanceList}" status="i" var="estimateToCompleteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${estimateToCompleteInstance.id}">${fieldValue(bean: estimateToCompleteInstance, field: "periode")}</g:link></td>
                                                
						<td>${fieldValue(bean: estimateToCompleteInstance, field: "actualCostProject")}</td>
					
						<td>${fieldValue(bean: estimateToCompleteInstance, field: "esC")}</td>
					
						<td>${fieldValue(bean: estimateToCompleteInstance, field: "trV")}</td>
					
						<td>${fieldValue(bean: estimateToCompleteInstance, field: "forecasting")}</td>
                                                
                                                <td>${fieldValue(bean: estimateToCompleteInstance, field: "fc")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${estimateToCompleteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
