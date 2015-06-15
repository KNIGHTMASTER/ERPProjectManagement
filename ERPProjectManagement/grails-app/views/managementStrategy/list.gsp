
<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.ManagementStrategy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managementStrategy.label', default: 'ManagementStrategy')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-managementStrategy" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-managementStrategy" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="key" title="${message(code: 'managementStrategy.key.label', default: 'Key')}" />
					
						<g:sortableColumn property="organization" title="${message(code: 'managementStrategy.organization.label', default: 'Organization')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'managementStrategy.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="power" title="${message(code: 'managementStrategy.power.label', default: 'Power')}" />
					
						<g:sortableColumn property="interest" title="${message(code: 'managementStrategy.interest.label', default: 'Interest')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${managementStrategyInstanceList}" status="i" var="managementStrategyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${managementStrategyInstance.id}">${fieldValue(bean: managementStrategyInstance, field: "key")}</g:link></td>
					
						<td>${fieldValue(bean: managementStrategyInstance, field: "organization")}</td>
					
						<td>${fieldValue(bean: managementStrategyInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: managementStrategyInstance, field: "power")}</td>
					
						<td>${fieldValue(bean: managementStrategyInstance, field: "interest")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${managementStrategyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
