
<%@ page import="ProjectIntegrationManagement.DirectAndManageProjectExecution.ManageTeamMemberAssignedToProject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manageTeamMemberAssignedToProject.label', default: 'ManageTeamMemberAssignedToProject')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-manageTeamMemberAssignedToProject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-manageTeamMemberAssignedToProject" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="manageTeamMemberAssignedToProject.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="manageTeamMemberAssignedToProject.activity.label" default="Activity" /></th>
					
						<th><g:message code="manageTeamMemberAssignedToProject.leader.label" default="Leader" /></th>

                        <th><g:message code="manageTeamMemberAssignedToProject.member.label" default="Members" /></th>
					
						<g:sortableColumn property="assigned" title="${message(code: 'manageTeamMemberAssignedToProject.assigned.label', default: 'Assigned')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'manageTeamMemberAssignedToProject.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${manageTeamMemberAssignedToProjectInstanceList}" status="i" var="manageTeamMemberAssignedToProjectInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${manageTeamMemberAssignedToProjectInstance.id}">${fieldValue(bean: manageTeamMemberAssignedToProjectInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: manageTeamMemberAssignedToProjectInstance, field: "activity")}</td>
					
						<td>${fieldValue(bean: manageTeamMemberAssignedToProjectInstance, field: "leader")}</td>

                        <td>
                            <g:each in="${manageTeamMemberAssignedToProjectInstance.teamMembers}" var="t">
                                <span class="property-value" aria-labelledby="teamMembers-label"><g:link controller="employee" action="show" id="${t.id}">${t?.encodeAsHTML()}<br /></g:link></span>
                            </g:each>
                        </td>
					
						<td><g:formatBoolean boolean="${manageTeamMemberAssignedToProjectInstance.assigned}" /></td>
					
						<td>${fieldValue(bean: manageTeamMemberAssignedToProjectInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${manageTeamMemberAssignedToProjectInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
