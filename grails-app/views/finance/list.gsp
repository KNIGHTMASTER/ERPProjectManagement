
<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.Finance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'finance.label', default: 'Finance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-finance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-finance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="ac" title="${message(code: 'finance.ac.label', default: 'Ac')}" />
					
						<g:sortableColumn property="ev" title="${message(code: 'finance.ev.label', default: 'Ev')}" />
					
						<g:sortableColumn property="evTotal" title="${message(code: 'finance.evTotal.label', default: 'Ev Total')}" />
					
						<g:sortableColumn property="income" title="${message(code: 'finance.income.label', default: 'Income')}" />
					
						<g:sortableColumn property="netIncome" title="${message(code: 'finance.netIncome.label', default: 'Net Income')}" />
					
						<g:sortableColumn property="pv" title="${message(code: 'finance.pv.label', default: 'Pv')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${financeInstanceList}" status="i" var="financeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${financeInstance.id}">${fieldValue(bean: financeInstance, field: "ac")}</g:link></td>
					
						<td>${fieldValue(bean: financeInstance, field: "ev")}</td>
					
						<td>${fieldValue(bean: financeInstance, field: "evTotal")}</td>
					
						<td>${fieldValue(bean: financeInstance, field: "income")}</td>
					
						<td>${fieldValue(bean: financeInstance, field: "netIncome")}</td>
					
						<td>${fieldValue(bean: financeInstance, field: "pv")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${financeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
