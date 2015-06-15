
<%@ page import="ProjectTimeManagement.Utility.ActivityChangeRequest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityChangeRequest.label', default: 'ActivityChangeRequest')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activityChangeRequest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activityChangeRequest" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="data display datatable" id="example">
				<thead>
					<tr>
					
						<th><g:message code="activityChangeRequest.activity.label" default="Activity" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'activityChangeRequest.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="changeDate" title="${message(code: 'activityChangeRequest.changeDate.label', default: 'Change Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityChangeRequestInstanceList}" status="i" var="activityChangeRequestInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityChangeRequestInstance.id}">${fieldValue(bean: activityChangeRequestInstance, field: "activity")}</g:link></td>
					
						<td>${fieldValue(bean: activityChangeRequestInstance, field: "description")}</td>
					
						<td><g:formatDate date="${activityChangeRequestInstance.changeDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activityChangeRequestInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
