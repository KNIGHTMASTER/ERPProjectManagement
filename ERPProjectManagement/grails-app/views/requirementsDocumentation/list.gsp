
<%@ page import="ProjectScopeManagement.CollectRequirements.RequirementsDocumentation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirementsDocumentation.label', default: 'RequirementsDocumentation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-requirementsDocumentation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <!--<li><a class="list" href="../RequirementsTraceabilityMatrix/"><g:message code="Requirements Traceability Matrix"/></a></li>
                                <li><a class="list" href="../RequirementInformation/"><g:message code="Requirement Information"/></a></li>
                                <li><a class="list" href="../RelationshipTraceability/"><g:message code="Relationship Traceability"/></a></li>-->
			</ul>
		</div>
		<div id="list-requirementsDocumentation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="requirementsDocumentation.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="requirementsDocumentation.stakeholder.label" default="Stakeholder" /></th>
					
						<g:sortableColumn property="requirement" title="${message(code: 'requirementsDocumentation.requirement.label', default: 'Requirement')}" />
					
						<g:sortableColumn property="category" title="${message(code: 'requirementsDocumentation.category.label', default: 'Category')}" />
					
						<g:sortableColumn property="priority" title="${message(code: 'requirementsDocumentation.priority.label', default: 'Priority')}" />
					
						<g:sortableColumn property="acceptanceCriteria" title="${message(code: 'requirementsDocumentation.acceptanceCriteria.label', default: 'Acceptance Criteria')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${requirementsDocumentationInstanceList}" status="i" var="requirementsDocumentationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${requirementsDocumentationInstance.id}">${fieldValue(bean: requirementsDocumentationInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: requirementsDocumentationInstance, field: "stakeholder")}</td>
					
						<td>${fieldValue(bean: requirementsDocumentationInstance, field: "requirement")}</td>
					
						<td>${fieldValue(bean: requirementsDocumentationInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: requirementsDocumentationInstance, field: "priority")}</td>
					
						<td>${fieldValue(bean: requirementsDocumentationInstance, field: "acceptanceCriteria")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${requirementsDocumentationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
