
<%@ page import="ProjectHumanResourceManagement.EmployeeType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employeeType.label', default: 'EmployeeType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-employeeType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-employeeType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="data display datatable" id="example">
				<thead>
					<tr>
					
						<g:sortableColumn property="type" title="${message(code: 'employeeType.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'employeeType.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${employeeTypeInstanceList}" status="i" var="employeeTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${employeeTypeInstance.id}">${fieldValue(bean: employeeTypeInstance, field: "type")}</g:link></td>
					
						<td>${fieldValue(bean: employeeTypeInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${employeeTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
