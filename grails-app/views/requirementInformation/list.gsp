
<%@ page import="ProjectScopeManagement.CollectRequirements.RequirementInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirementInformation.label', default: 'RequirementInformation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-requirementInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-requirementInformation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="requirementInformation.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="requirementInformation.requirementsTraceabilityMatrix.label" default="Requirements Traceability Matrix" /></th>
					
						<g:sortableColumn property="requirement" title="${message(code: 'requirementInformation.requirement.label', default: 'Requirement')}" />
					
						<g:sortableColumn property="priority" title="${message(code: 'requirementInformation.priority.label', default: 'Priority')}" />
					
						<g:sortableColumn property="category" title="${message(code: 'requirementInformation.category.label', default: 'Category')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${requirementInformationInstanceList}" status="i" var="requirementInformationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${requirementInformationInstance.id}">${fieldValue(bean: requirementInformationInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: requirementInformationInstance, field: "requirementsTraceabilityMatrix")}</td>
					
						<td>${fieldValue(bean: requirementInformationInstance, field: "requirement")}</td>
					
						<td>${fieldValue(bean: requirementInformationInstance, field: "priority")}</td>
					
						<td>${fieldValue(bean: requirementInformationInstance, field: "category")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${requirementInformationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
