
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.PeriodOfPerformance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'periodOfPerformance.label', default: 'PeriodOfPerformance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-periodOfPerformance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-periodOfPerformance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="periodOfPerformance.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="startDate" title="${message(code: 'periodOfPerformance.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'periodOfPerformance.endDate.label', default: 'End Date')}" />
					
                                                <th>Time Period</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${periodOfPerformanceInstanceList}" status="i" var="periodOfPerformanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${periodOfPerformanceInstance.id}">${fieldValue(bean: periodOfPerformanceInstance, field: "projectName")}</g:link></td>
					
						<td><g:formatDate date="${periodOfPerformanceInstance.startDate}" /></td>
					
						<td><g:formatDate date="${periodOfPerformanceInstance.endDate}" /></td>
                                                
                                                <td>${periodOfPerformanceInstance.difference}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${periodOfPerformanceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
