
<%@ page import="ProjectScopeManagement.DefineScope.ProjectScopeStatement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectScopeStatement.label', default: 'ProjectScopeStatement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectScopeStatement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/identificationProjectScopeStatement/list"><g:message code="Identification Project Scope Statement"/></a></li>                                                                                                   
			</ul>
		</div>
		<div id="list-projectScopeStatement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectScopeStatement.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="productScopeDescription" title="${message(code: 'projectScopeStatement.productScopeDescription.label', default: 'Product Scope Description')}" />
					
						<g:sortableColumn property="projectAcceptanceCriteria" title="${message(code: 'projectScopeStatement.projectAcceptanceCriteria.label', default: 'Project Acceptance Criteria')}" />
					
						<g:sortableColumn property="projectExclusions" title="${message(code: 'projectScopeStatement.projectExclusions.label', default: 'Project Exclusions')}" />
					
						<g:sortableColumn property="projectConstraints" title="${message(code: 'projectScopeStatement.projectConstraints.label', default: 'Project Constraints')}" />
					
						<g:sortableColumn property="projectAssumptions" title="${message(code: 'projectScopeStatement.projectAssumptions.label', default: 'Project Assumptions')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectScopeStatementInstanceList}" status="i" var="projectScopeStatementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectScopeStatementInstance.id}">${fieldValue(bean: projectScopeStatementInstance, field: "projectName")}</g:link></td>
					
						<td>${projectScopeStatementInstance.productScopeDescription}</td>
					
						<td>${projectScopeStatementInstance.projectAcceptanceCriteria}</td>
					
						<td>${projectScopeStatementInstance.projectExclusions}</td>
					
						<td>${projectScopeStatementInstance.projectConstraints}</td>
					
						<td>${projectScopeStatementInstance.projectAssumptions}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectScopeStatementInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
