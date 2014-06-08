
<%@ page import="ProjectCostManagement.DetermineBudget.HumanResourceCost" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'humanResourceCost.label', default: 'HumanResourceCost')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-humanResourceCost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-humanResourceCost" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="humanResourceCost.activityCost.label" default="Activity Cost" /></th>
					
						<th><g:message code="humanResourceCost.employee.label" default="Employee" /></th>
					
						<g:sortableColumn property="idx" title="${message(code: 'humanResourceCost.idx.label', default: 'Idx')}" />
					
						<g:sortableColumn property="approve" title="${message(code: 'humanResourceCost.approve.label', default: 'Approve')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${humanResourceCostInstanceList}" status="i" var="humanResourceCostInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${humanResourceCostInstance.id}">${fieldValue(bean: humanResourceCostInstance, field: "activityCost")}</g:link></td>
					
						<td>${fieldValue(bean: humanResourceCostInstance, field: "employee")}</td>
					
						<td>${fieldValue(bean: humanResourceCostInstance, field: "idx")}</td>
					
						<td><g:formatBoolean boolean="${humanResourceCostInstance.approve}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${humanResourceCostInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
