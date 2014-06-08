
<%@ page import="ProjectScopeManagement.CollectRequirements.RelationshipTraceability" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-relationshipTraceability" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-relationshipTraceability" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="relationshipTraceability.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="relationshipTraceability.requirementsTraceabilityMatrix.label" default="Requirements Traceability Matrix" /></th>
					
						<g:sortableColumn property="relatesToObjectives" title="${message(code: 'relationshipTraceability.relatesToObjectives.label', default: 'Relates To Objectives')}" />
					
						<g:sortableColumn property="manifestInWBSDeliverable" title="${message(code: 'relationshipTraceability.manifestInWBSDeliverable.label', default: 'Manifest In WBSD eliverable')}" />
					
						<g:sortableColumn property="verification" title="${message(code: 'relationshipTraceability.verification.label', default: 'Verification')}" />
					
						<g:sortableColumn property="validation" title="${message(code: 'relationshipTraceability.validation.label', default: 'Validation')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${relationshipTraceabilityInstanceList}" status="i" var="relationshipTraceabilityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${relationshipTraceabilityInstance.id}">${fieldValue(bean: relationshipTraceabilityInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: relationshipTraceabilityInstance, field: "requirementsTraceabilityMatrix")}</td>
					
						<td>${fieldValue(bean: relationshipTraceabilityInstance, field: "relatesToObjectives")}</td>
					
						<td>${fieldValue(bean: relationshipTraceabilityInstance, field: "manifestInWBSDeliverable")}</td>
					
						<td>${fieldValue(bean: relationshipTraceabilityInstance, field: "verification")}</td>
					
						<td>${fieldValue(bean: relationshipTraceabilityInstance, field: "validation")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${relationshipTraceabilityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
