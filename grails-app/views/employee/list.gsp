
<%@ page import="ProjectHumanResourceManagement.Employee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-employee" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="data display datatable" id="example">
				<thead>
					<tr>
					
						<th><g:message code="employee.project.label" default="Project" /></th>
					
						<g:sortableColumn property="idEmployee" title="${message(code: 'employee.idEmployee.label', default: 'Id Employee')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'employee.name.label', default: 'Name')}" />
					
						<th><g:message code="employee.employeeType.label" default="Employee Type" /></th>
					
						<g:sortableColumn property="sex" title="${message(code: 'employee.sex.label', default: 'Sex')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'employee.address.label', default: 'Address')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${employeeInstance.id}">${fieldValue(bean: employeeInstance, field: "project")}</g:link></td>
					
						<td>${fieldValue(bean: employeeInstance, field: "idEmployee")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "employeeType")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "sex")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "address")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${employeeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
