
<%@ page import="ProjectCostManagement.DetermineBudget.FinanceEvAc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'financeEvAc.label', default: 'FinanceEvAc')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-financeEvAc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-financeEvAc" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="financeEvAc.activityCost.label" default="Activity Cost" /></th>
					
						<g:sortableColumn property="evr" title="${message(code: 'financeEvAc.evr.label', default: 'Evr')}" />
					
						<g:sortableColumn property="ac" title="${message(code: 'financeEvAc.ac.label', default: 'Ac')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${financeEvAcInstanceList}" status="i" var="financeEvAcInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${financeEvAcInstance.id}">${fieldValue(bean: financeEvAcInstance, field: "activityCost")}</g:link></td>
					
						<td>${fieldValue(bean: financeEvAcInstance, field: "evr")}</td>
					
						<td>${fieldValue(bean: financeEvAcInstance, field: "ac")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${financeEvAcInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
