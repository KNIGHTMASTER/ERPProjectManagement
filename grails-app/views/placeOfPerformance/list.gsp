
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.PlaceOfPerformance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'placeOfPerformance.label', default: 'PlaceOfPerformance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-placeOfPerformance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-placeOfPerformance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="placeOfPerformance.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="location" title="${message(code: 'placeOfPerformance.location.label', default: 'Location')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'placeOfPerformance.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${placeOfPerformanceInstanceList}" status="i" var="placeOfPerformanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${placeOfPerformanceInstance.id}">${fieldValue(bean: placeOfPerformanceInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: placeOfPerformanceInstance, field: "location")}</td>
					
						<td>${fieldValue(bean: placeOfPerformanceInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${placeOfPerformanceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
