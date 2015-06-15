
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.MilestoneSOW" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'milestoneSOW.label', default: 'MilestoneSOW')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-milestoneSOW" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-milestoneSOW" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="milestoneSOW.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="milestoneName" title="${message(code: 'milestoneSOW.milestoneName.label', default: 'Milestone Name')}" />
					
						<g:sortableColumn property="dueDate" title="${message(code: 'milestoneSOW.dueDate.label', default: 'Due Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${milestoneSOWInstanceList}" status="i" var="milestoneSOWInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${milestoneSOWInstance.id}">${fieldValue(bean: milestoneSOWInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: milestoneSOWInstance, field: "milestoneName")}</td>
					
						<td><g:formatDate date="${milestoneSOWInstance.dueDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${milestoneSOWInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
