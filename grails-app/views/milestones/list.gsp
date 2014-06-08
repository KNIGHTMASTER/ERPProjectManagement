
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.Milestones" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'milestones.label', default: 'Milestones')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-milestones" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-milestones" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="idMilestone" title="${message(code: 'milestones.idMilestone.label', default: 'Id Milestone')}" />
					
						<g:sortableColumn property="milestoneName" title="${message(code: 'milestones.milestoneName.label', default: 'Milestone Name')}" />
					
						<g:sortableColumn property="parent" title="${message(code: 'milestones.parent.label', default: 'Parent')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'milestones.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'milestones.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'milestones.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${milestonesInstanceList}" status="i" var="milestonesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${milestonesInstance.id}">${fieldValue(bean: milestonesInstance, field: "idMilestone")}</g:link></td>
					
						<td>${fieldValue(bean: milestonesInstance, field: "milestoneName")}</td>
					
						<td>${fieldValue(bean: milestonesInstance, field: "parent")}</td>
					
						<td><g:formatDate date="${milestonesInstance.startDate}" /></td>
					
						<td><g:formatDate date="${milestonesInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: milestonesInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${milestonesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
