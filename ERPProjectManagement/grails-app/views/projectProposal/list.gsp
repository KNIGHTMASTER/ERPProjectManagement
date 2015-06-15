
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectProposal.label', default: 'ProjectProposal')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectProposal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectProposal" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectProposal.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="plannedBudget" title="${message(code: 'projectProposal.plannedBudget.label', default: 'Planned Budget')}" />
					
						<g:sortableColumn property="priorityOfTheProject" title="${message(code: 'projectProposal.priorityOfTheProject.label', default: 'Priority Of The Project')}" />
					
						<g:sortableColumn property="projectDescription" title="${message(code: 'projectProposal.projectDescription.label', default: 'Project Description')}" />
					
						<g:sortableColumn property="requestedStartDate" title="${message(code: 'projectProposal.requestedStartDate.label', default: 'Requested Start Date')}" />
					
						<g:sortableColumn property="requestedCompletionDate" title="${message(code: 'projectProposal.requestedCompletionDate.label', default: 'Requested Completion Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectProposalInstanceList}" status="i" var="projectProposalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectProposalInstance.id}">${fieldValue(bean: projectProposalInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectProposalInstance, field: "plannedBudget")}</td>
					
						<td>${fieldValue(bean: projectProposalInstance, field: "priorityOfTheProject")}</td>
					
						<td>${fieldValue(bean: projectProposalInstance, field: "projectDescription")}</td>
					
						<td><g:formatDate date="${projectProposalInstance.requestedStartDate}" /></td>
					
						<td><g:formatDate date="${projectProposalInstance.requestedCompletionDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectProposalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
