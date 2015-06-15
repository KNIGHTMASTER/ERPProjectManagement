
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectCharter.label', default: 'ProjectCharter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectCharter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><a class="list" href="../Payment/"><g:message code="Project Payment"/></a></li>
                <li><a class="list" href="../ProjectCharterApproval/"><g:message code="Project Charter Approvals"/></a></li>
			</ul>
		</div>
		<div id="list-projectCharter" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectCharter.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="projectPurpose" title="${message(code: 'projectCharter.projectPurpose.label', default: 'Project Purpose')}" />
					
						<g:sortableColumn property="projectDescription" title="${message(code: 'projectCharter.projectDescription.label', default: 'Project Description')}" />
					
						<g:sortableColumn property="projectScope" title="${message(code: 'projectCharter.projectScope.label', default: 'Project Scope')}" />
					
						<g:sortableColumn property="acceptanceCriteria" title="${message(code: 'projectCharter.acceptanceCriteria.label', default: 'Acceptance Criteria')}" />
					
						<g:sortableColumn property="initialRisk" title="${message(code: 'projectCharter.initialRisk.label', default: 'Initial Risk')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectCharterInstanceList}" status="i" var="projectCharterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectCharterInstance.id}">${fieldValue(bean: projectCharterInstance, field: "projectName")}</g:link></td>

                        <td>${projectCharterInstance.projectPurpose}</td>

                        <td>${projectCharterInstance.projectDescription}</td>

                        <td>${projectCharterInstance.projectScope}</td>

                        <td>${projectCharterInstance.acceptanceCriteria}</td>

                        <td>${projectCharterInstance.initialRisk}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectCharterInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
