
<%@ page import="ProjectProcurementManagement.ConductProcurements.ProcurementHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'procurementHistory.label', default: 'ProcurementHistory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-procurementHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-procurementHistory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="procurementHistory.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="vendorName" title="${message(code: 'procurementHistory.vendorName.label', default: 'Vendor Name')}" />
					
						<g:sortableColumn property="productQuality" title="${message(code: 'procurementHistory.productQuality.label', default: 'Product QualityRange')}" />
					
						<g:sortableColumn property="onTimeDelivery" title="${message(code: 'procurementHistory.onTimeDelivery.label', default: 'On Time Delivery')}" />
					
						<g:sortableColumn property="documentationQuality" title="${message(code: 'procurementHistory.documentationQuality.label', default: 'Documentation QualityRange')}" />
					
						<g:sortableColumn property="developmentCost" title="${message(code: 'procurementHistory.developmentCost.label', default: 'Development Cost')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${procurementHistoryInstanceList}" status="i" var="procurementHistoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${procurementHistoryInstance.id}">${fieldValue(bean: procurementHistoryInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: procurementHistoryInstance, field: "vendorName")}</td>
					
						<td>${fieldValue(bean: procurementHistoryInstance, field: "productQuality")}</td>
					
						<td>${fieldValue(bean: procurementHistoryInstance, field: "onTimeDelivery")}</td>
					
						<td>${fieldValue(bean: procurementHistoryInstance, field: "documentationQuality")}</td>
					
						<td>${fieldValue(bean: procurementHistoryInstance, field: "developmentCost")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${procurementHistoryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
