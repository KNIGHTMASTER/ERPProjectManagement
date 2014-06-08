
<%@ page import="ProjectCommunicationManagement.ManageStakeholderExpectations.CommunicationMethods" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'communicationMethods.label', default: 'CommunicationMethods')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-communicationMethods" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-communicationMethods" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="communicationMethods" title="${message(code: 'communicationMethods.communicationMethods.label', default: 'Communication Methods')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${communicationMethodsInstanceList}" status="i" var="communicationMethodsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${communicationMethodsInstance.id}">${fieldValue(bean: communicationMethodsInstance, field: "communicationMethods")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${communicationMethodsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
