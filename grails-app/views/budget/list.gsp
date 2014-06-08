
<%@ page import="ProjectCostManagement.DetermineBudget.Budget" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'budget.label', default: 'Budget')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-budget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-budget" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="budget.project.label" default="Project" /></th>
					
                                                <th>Income</th>
                                                <th>Human Cost</th>
                                                <th>Material Cost</th>
                                                <th>Management Cost</th>
                                                <th>Outcome</th>
                                                <th>Balance</th>
						<g:sortableColumn property="note" title="${message(code: 'budget.note.label', default: 'Note')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${budgetInstanceList}" status="i" var="budgetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${budgetInstance.id}">${fieldValue(bean: budgetInstance, field: "project")}</g:link></td>
					
						<td>${fieldValue(bean: budgetInstance, field: "income")}</td>
					
						<td>${fieldValue(bean: budgetInstance, field: "human")}</td>
					
						<td>${fieldValue(bean: budgetInstance, field: "material")}</td>
					
						<td>${fieldValue(bean: budgetInstance, field: "management")}</td>
					
						<td>${fieldValue(bean: budgetInstance, field: "outcome")}</td>
					
						<td>${fieldValue(bean: budgetInstance, field: "balance")}</td>
					
						<td>${fieldValue(bean: budgetInstance, field: "note")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${budgetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
