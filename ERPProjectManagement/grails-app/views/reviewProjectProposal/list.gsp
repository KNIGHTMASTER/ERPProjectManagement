
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ReviewProjectProposal" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reviewProjectProposal.label', default: 'ReviewProjectProposal')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reviewProjectProposal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reviewProjectProposal" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="reviewProjectProposal.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="reviewProjectProposal.reviewer.label" default="Reviewer" /></th>
					
						<g:sortableColumn property="projectStatus" title="${message(code: 'reviewProjectProposal.projectStatus.label', default: 'Project Status')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'reviewProjectProposal.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="acceptance" title="${message(code: 'reviewProjectProposal.acceptance.label', default: 'Acceptance')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reviewProjectProposalInstanceList}" status="i" var="reviewProjectProposalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reviewProjectProposalInstance.id}">${fieldValue(bean: reviewProjectProposalInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: reviewProjectProposalInstance, field: "reviewer")}</td>
					
						<td>${fieldValue(bean: reviewProjectProposalInstance, field: "projectStatus")}</td>
					
						<td>${fieldValue(bean: reviewProjectProposalInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${reviewProjectProposalInstance.acceptance}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reviewProjectProposalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
