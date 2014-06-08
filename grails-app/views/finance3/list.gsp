
<%@ page import="ProjectCostManagement.DetermineBudget.Finance3" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'finance3.label', default: 'Finance3')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-finance3" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-finance3" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="finance3.budget.label" default="Budget" /></th>
					
						<g:sortableColumn property="income" title="${message(code: 'finance3.income.label', default: 'Income')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${finance3InstanceList}" status="i" var="finance3Instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${finance3Instance.id}">${fieldValue(bean: finance3Instance, field: "budget")}</g:link></td>
					
						<td>${fieldValue(bean: finance3Instance, field: "income")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${finance3InstanceTotal}" />
			</div>
		</div>
	</body>
</html>
