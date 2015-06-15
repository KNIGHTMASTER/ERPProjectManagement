
<%@ page import="ProjectCostManagement.DetermineBudget.SalaryHumanResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-salaryHumanResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-salaryHumanResource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="salaryHumanResource.humanResourceCost.label" default="Human Resource Cost" /></th>
					
						<g:sortableColumn property="paymentDate" title="${message(code: 'salaryHumanResource.paymentDate.label', default: 'Payment Date')}" />
					
						<g:sortableColumn property="isPayed" title="${message(code: 'salaryHumanResource.isPayed.label', default: 'Is Payed')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${salaryHumanResourceInstanceList}" status="i" var="salaryHumanResourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${salaryHumanResourceInstance.id}">${fieldValue(bean: salaryHumanResourceInstance, field: "humanResourceCost")}</g:link></td>
					
						<td><g:formatDate date="${salaryHumanResourceInstance.paymentDate}" /></td>
					
						<td><g:formatBoolean boolean="${salaryHumanResourceInstance.isPayed}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${salaryHumanResourceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
