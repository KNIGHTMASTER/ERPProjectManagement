
<%@ page import="ProjectScopeManagement.CreateWBS.ScopeBaseline" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'scopeBaseline.label', default: 'ScopeBaseline')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-scopeBaseline" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-scopeBaseline" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="scopeBaseline.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="scopeBaseline.projectScopeStatement.label" default="Project Scope Statement" /></th>
					
						<th><g:message code="scopeBaseline.wbs.label" default="Wbs" /></th>
					
						<th><g:message code="scopeBaseline.wbsDictionary.label" default="Wbs Dictionary" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${scopeBaselineInstanceList}" status="i" var="scopeBaselineInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${scopeBaselineInstance.id}">${fieldValue(bean: scopeBaselineInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: scopeBaselineInstance, field: "projectScopeStatement")}</td>
					
						<td>${fieldValue(bean: scopeBaselineInstance, field: "wbs")}</td>
					
						<td>${fieldValue(bean: scopeBaselineInstance, field: "wbsDictionary")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${scopeBaselineInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
