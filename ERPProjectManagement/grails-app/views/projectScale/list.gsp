
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectScale" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectScale.label', default: 'ProjectScale')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectScale" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectScale" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="scale" title="${message(code: 'projectScale.scale.label', default: 'Scale')}" />
					
						<g:sortableColumn property="minPrice" title="${message(code: 'projectScale.minPrice.label', default: 'Min Price')}" />
					
						<g:sortableColumn property="maxPrice" title="${message(code: 'projectScale.maxPrice.label', default: 'Max Price')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'projectScale.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectScaleInstanceList}" status="i" var="projectScaleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectScaleInstance.id}">${fieldValue(bean: projectScaleInstance, field: "scale")}</g:link></td>
					
						<td>${fieldValue(bean: projectScaleInstance, field: "minPrice")}</td>
					
						<td>${fieldValue(bean: projectScaleInstance, field: "maxPrice")}</td>
					
						<td>${fieldValue(bean: projectScaleInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectScaleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
