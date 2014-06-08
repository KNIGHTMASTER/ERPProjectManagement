
<%@ page import="ProjectScopeManagement.DefineScope.ProjectDeliverable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectDeliverable.label', default: 'ProjectDeliverable')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectDeliverable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectDeliverable" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectDeliverable.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="projectDeliverable.milestones.label" default="Milestones" /></th>
					
						<g:sortableColumn property="deliverable" title="${message(code: 'projectDeliverable.deliverable.label', default: 'Deliverable')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectDeliverableInstanceList}" status="i" var="projectDeliverableInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectDeliverableInstance.id}">${fieldValue(bean: projectDeliverableInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectDeliverableInstance, field: "milestones")}</td>
					
						<td>${fieldValue(bean: projectDeliverableInstance, field: "deliverable")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectDeliverableInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
