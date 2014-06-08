
<%@ page import="ProjectCostManagement.ControlCost.AnalysisEVM" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'analysisEVM.label', default: 'AnalysisEVM')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-analysisEVM" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-analysisEVM" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="analysisEVM.idMilestone.label" default="Id Milestone" /></th>
					
						<g:sortableColumn property="plannedValue" title="${message(code: 'analysisEVM.plannedValue.label', default: 'Planned Value')}" />
					
						<g:sortableColumn property="earnedValue" title="${message(code: 'analysisEVM.earnedValue.label', default: 'Earned Value')}" />
					
						<g:sortableColumn property="actualCost" title="${message(code: 'analysisEVM.actualCost.label', default: 'Actual Cost')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${analysisEVMInstanceList}" status="i" var="analysisEVMInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${analysisEVMInstance.id}">${fieldValue(bean: analysisEVMInstance, field: "idMilestone")}</g:link></td>
					
						<td>${fieldValue(bean: analysisEVMInstance, field: "plannedValue")}</td>
					
						<td>${fieldValue(bean: analysisEVMInstance, field: "earnedValue")}</td>
					
						<td>${fieldValue(bean: analysisEVMInstance, field: "actualCost")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${analysisEVMInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
