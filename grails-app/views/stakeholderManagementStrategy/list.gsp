
<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.StakeholderManagementStrategy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stakeholderManagementStrategy.label', default: 'StakeholderManagementStrategy')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-stakeholderManagementStrategy" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-stakeholderManagementStrategy" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="stakeholderManagementStrategy.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="projectStatusControl" title="${message(code: 'stakeholderManagementStrategy.projectStatusControl.label', default: 'Project Status Control')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'stakeholderManagementStrategy.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stakeholderManagementStrategyInstanceList}" status="i" var="stakeholderManagementStrategyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stakeholderManagementStrategyInstance.id}">${fieldValue(bean: stakeholderManagementStrategyInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: stakeholderManagementStrategyInstance, field: "projectStatusControl")}</td>
					
						<td>${stakeholderManagementStrategyInstance.description}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stakeholderManagementStrategyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
