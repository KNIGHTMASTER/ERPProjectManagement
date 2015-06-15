
<%@ page import="ProjectCostManagement.DetermineBudget.FinanceOcm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'financeOcm.label', default: 'FinanceOcm')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-financeOcm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-financeOcm" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="financeOcm.monthBudget.label" default="Month Budget" /></th>
					
						<g:sortableColumn property="outcome" title="${message(code: 'financeOcm.outcome.label', default: 'Outcome')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${financeOcmInstanceList}" status="i" var="financeOcmInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${financeOcmInstance.id}">${fieldValue(bean: financeOcmInstance, field: "monthBudget")}</g:link></td>
					
						<td>${fieldValue(bean: financeOcmInstance, field: "outcome")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${financeOcmInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
