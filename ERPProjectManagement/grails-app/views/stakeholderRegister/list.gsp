
<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stakeholderRegister.label', default: 'StakeholderRegister')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-stakeholderRegister" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><a class="list" href="../StakeholderRoles/"><g:message code="Stakeholder Role"/></a></li>
                <li><a class="list" href="../CommunicationType/"><g:message code="Communication Type"/></a></li>
			</ul>
		</div>
		<div id="list-stakeholderRegister" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="stakeholderRegister.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="stakeholderRegister.role.label" default="Role" /></th>
					
						<g:sortableColumn property="fullName" title="${message(code: 'stakeholderRegister.fullName.label', default: 'Full Name')}" />
					
						<g:sortableColumn property="designation" title="${message(code: 'stakeholderRegister.designation.label', default: 'Designation')}" />
					
						<g:sortableColumn property="department" title="${message(code: 'stakeholderRegister.department.label', default: 'Department')}" />
					
						<g:sortableColumn property="stakeholderType" title="${message(code: 'stakeholderRegister.stakeholderType.label', default: 'Stakeholder Type')}" />

                        <g:sortableColumn property="image" title="${message(code: 'stakeholderRegister.image.label', default: 'Image')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stakeholderRegisterInstanceList}" status="i" var="stakeholderRegisterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stakeholderRegisterInstance.id}">${fieldValue(bean: stakeholderRegisterInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: stakeholderRegisterInstance, field: "role")}</td>
					
						<td>${fieldValue(bean: stakeholderRegisterInstance, field: "fullName")}</td>
					
						<td>${fieldValue(bean: stakeholderRegisterInstance, field: "designation")}</td>
					
						<td>${fieldValue(bean: stakeholderRegisterInstance, field: "department")}</td>
					
						<td>${fieldValue(bean: stakeholderRegisterInstance, field: "stakeholderType")}</td>

                        <td><img src="${createLink(action:'displayAvatar', id:stakeholderRegisterInstance?.id)}" width="40" height="40"/></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stakeholderRegisterInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
