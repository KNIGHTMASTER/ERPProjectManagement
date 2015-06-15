
<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.CommunicationType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'communicationType.label', default: 'CommunicationType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-communicationType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-communicationType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="communicationType.statementOfWork.label" default="Statement Of Work" /></th>
					
						<g:sortableColumn property="communicationType" title="${message(code: 'communicationType.communicationType.label', default: 'Communication Type')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'communicationType.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${communicationTypeInstanceList}" status="i" var="communicationTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${communicationTypeInstance.id}">${fieldValue(bean: communicationTypeInstance, field: "statementOfWork")}</g:link></td>
					
						<td>${fieldValue(bean: communicationTypeInstance, field: "communicationType")}</td>
					
						<td>${fieldValue(bean: communicationTypeInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${communicationTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
