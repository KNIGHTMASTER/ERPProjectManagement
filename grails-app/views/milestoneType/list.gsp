
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.MilestoneType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'milestoneType.label', default: 'MilestoneType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-milestoneType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-milestoneType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="milestone" title="${message(code: 'milestoneType.milestone.label', default: 'Milestone')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'milestoneType.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${milestoneTypeInstanceList}" status="i" var="milestoneTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${milestoneTypeInstance.id}">${fieldValue(bean: milestoneTypeInstance, field: "milestone")}</g:link></td>
					
						<td>${fieldValue(bean: milestoneTypeInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${milestoneTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
