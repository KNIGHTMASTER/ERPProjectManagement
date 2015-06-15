
<%@ page import="ProjectTimeManagement.DefineActivity.DelayActivity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'delayActivity.label', default: 'DelayActivity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-delayActivity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/schedule"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-delayActivity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="data display datatable" id="example">
				<thead>
					<tr>
					
						<th><g:message code="delayActivity.activity.label" default="Activity" /></th>
					
						<g:sortableColumn property="planningEndDate" title="${message(code: 'delayActivity.planningEndDate.label', default: 'Finishing')}" />

            <th>End Date</th>
            <th>Delay</th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${delayActivityInstanceList}" status="i" var="delayActivityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${delayActivityInstance.id}">${fieldValue(bean: delayActivityInstance, field: "activity")}</g:link></td>
					
						<td><g:formatDate date="${delayActivityInstance.planningEndDate}" /></td>

						<td><g:formatDate date="${delayActivityInstance.activity?.endDate}" /></td>
            <td>${delayActivityInstance.difference}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${delayActivityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
