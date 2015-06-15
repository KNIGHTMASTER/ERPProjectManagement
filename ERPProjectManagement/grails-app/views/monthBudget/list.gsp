
<%@ page import="ProjectCostManagement.DetermineBudget.MonthBudget" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'monthBudget.label', default: 'MonthBudget')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-monthBudget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-monthBudget" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="monthBudget.budget.label" default="Budget" /></th>
					
						<g:sortableColumn property="startDate" title="${message(code: 'monthBudget.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'monthBudget.endDate.label', default: 'End Date')}" />
					
                                                <th>Income</th>
                                                <th>Human Cost</th>
                                                <th>Material Cost</th>
                                                <th>Management Cost</th>
                                                <th>Outcome</th>
                                                <th>Balance</th>
						<g:sortableColumn property="note" title="${message(code: 'monthBudget.note.label', default: 'Note')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${monthBudgetInstanceList}" status="i" var="monthBudgetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${monthBudgetInstance.id}">${fieldValue(bean: monthBudgetInstance, field: "budget")}</g:link></td>
					
						<td><g:formatDate date="${monthBudgetInstance.startDate}" /></td>
					
						<td><g:formatDate date="${monthBudgetInstance.endDate}" /></td>
                                                
                                                <td>${fieldValue(bean: monthBudgetInstance, field: "income")}</td>
					
						<td>${fieldValue(bean: monthBudgetInstance, field: "human")}</td>
					
						<td>${fieldValue(bean: monthBudgetInstance, field: "material")}</td>
					
						<td>${fieldValue(bean: monthBudgetInstance, field: "management")}</td>
					
						<td>${fieldValue(bean: monthBudgetInstance, field: "outcome")}</td>
					
						<td>${fieldValue(bean: monthBudgetInstance, field: "balance")}</td>
					
						<td>${fieldValue(bean: monthBudgetInstance, field: "note")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${monthBudgetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
