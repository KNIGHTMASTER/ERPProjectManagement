
<%@ page import="ProjectScopeManagement.VerifyScope.Inspection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspection.label', default: 'Inspection')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inspection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inspection" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="inspection.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="inspection.deliverable.label" default="Deliverable" /></th>
					
						<g:sortableColumn property="decision" title="${message(code: 'inspection.decision.label', default: 'Decision')}" />
					
						<g:sortableColumn property="realization" title="${message(code: 'inspection.realization.label', default: 'Realization')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inspectionInstanceList}" status="i" var="inspectionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inspectionInstance.id}">${fieldValue(bean: inspectionInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: inspectionInstance, field: "deliverable")}</td>
					
						<td>${fieldValue(bean: inspectionInstance, field: "decision")}</td>
					
						<td>${fieldValue(bean: inspectionInstance, field: "realization")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inspectionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
