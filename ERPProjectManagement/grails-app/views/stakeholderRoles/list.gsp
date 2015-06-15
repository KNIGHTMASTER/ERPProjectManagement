
<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRoles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stakeholderRoles.label', default: 'StakeholderRoles')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-stakeholderRoles" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-stakeholderRoles" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="stakeholderRoles.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="role" title="${message(code: 'stakeholderRoles.role.label', default: 'Role')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'stakeholderRoles.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stakeholderRolesInstanceList}" status="i" var="stakeholderRolesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stakeholderRolesInstance.id}">${fieldValue(bean: stakeholderRolesInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: stakeholderRolesInstance, field: "role")}</td>
					
						<td>${fieldValue(bean: stakeholderRolesInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stakeholderRolesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
