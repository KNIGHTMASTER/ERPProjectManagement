
<%@ page import="ProjectCostManagement.DetermineBudget.FinanceEvAcManag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'financeEvAcManag.label', default: 'FinanceEvAcManag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-financeEvAcManag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-financeEvAcManag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="ac" title="${message(code: 'financeEvAcManag.ac.label', default: 'Ac')}" />
					
						<g:sortableColumn property="evr" title="${message(code: 'financeEvAcManag.evr.label', default: 'Evr')}" />
					
						<th><g:message code="financeEvAcManag.managementCostActivity.label" default="Management Cost Activity" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${financeEvAcManagInstanceList}" status="i" var="financeEvAcManagInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${financeEvAcManagInstance.id}">${fieldValue(bean: financeEvAcManagInstance, field: "ac")}</g:link></td>
					
						<td>${fieldValue(bean: financeEvAcManagInstance, field: "evr")}</td>
					
						<td>${fieldValue(bean: financeEvAcManagInstance, field: "managementCostActivity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${financeEvAcManagInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
