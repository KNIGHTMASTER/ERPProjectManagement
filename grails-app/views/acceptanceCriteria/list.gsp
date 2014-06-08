
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.AcceptanceCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-acceptanceCriteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-acceptanceCriteria" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="acceptanceCriteria.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="dateAcceptance" title="${message(code: 'acceptanceCriteria.dateAcceptance.label', default: 'Date Acceptance')}" />
					
						<g:sortableColumn property="methodOfAcceptance" title="${message(code: 'acceptanceCriteria.methodOfAcceptance.label', default: 'Method Of Acceptance')}" />
					
						<th><g:message code="acceptanceCriteria.authority.label" default="Authority" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${acceptanceCriteriaInstanceList}" status="i" var="acceptanceCriteriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${acceptanceCriteriaInstance.id}">${fieldValue(bean: acceptanceCriteriaInstance, field: "projectName")}</g:link></td>
					
						<td><g:formatDate date="${acceptanceCriteriaInstance.dateAcceptance}" /></td>
					
						<td>${fieldValue(bean: acceptanceCriteriaInstance, field: "methodOfAcceptance")}</td>
					
						<td>${fieldValue(bean: acceptanceCriteriaInstance, field: "authority")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${acceptanceCriteriaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
