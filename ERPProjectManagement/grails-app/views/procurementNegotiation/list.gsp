
<%@ page import="ProjectProcurementManagement.ConductProcurements.ProcurementNegotiation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'procurementNegotiation.label', default: 'ProcurementNegotiation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-procurementNegotiation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-procurementNegotiation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="procurementNegotiation.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="procurementNegotiation.vendorName.label" default="Vendor Name" /></th>
					
						<g:sortableColumn property="policy" title="${message(code: 'procurementNegotiation.policy.label', default: 'Policy')}" />
					
						<g:sortableColumn property="lock" title="${message(code: 'procurementNegotiation.lock.label', default: 'Lock')}" />
					
						<g:sortableColumn property="unLock" title="${message(code: 'procurementNegotiation.unLock.label', default: 'Un Lock')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${procurementNegotiationInstanceList}" status="i" var="procurementNegotiationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${procurementNegotiationInstance.id}">${fieldValue(bean: procurementNegotiationInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: procurementNegotiationInstance, field: "vendorName")}</td>
					
						<td>${fieldValue(bean: procurementNegotiationInstance, field: "policy")}</td>
					
						<td><g:formatBoolean boolean="${procurementNegotiationInstance.lock}" /></td>
					
						<td><g:formatBoolean boolean="${procurementNegotiationInstance.unLock}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${procurementNegotiationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
