
<%@ page import="ProjectProcurementManagement.AdministerProcurements.MaterialResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialResource.label', default: 'MaterialResource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-materialResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-materialResource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="materialResource.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="materialResource.activity.label" default="Activity" /></th>
					
						<g:sortableColumn property="material" title="${message(code: 'materialResource.material.label', default: 'Material')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'materialResource.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="available" title="${message(code: 'materialResource.available.label', default: 'Available')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'materialResource.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${materialResourceInstanceList}" status="i" var="materialResourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materialResourceInstance.id}">${fieldValue(bean: materialResourceInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: materialResourceInstance, field: "activity")}</td>
					
						<td>${fieldValue(bean: materialResourceInstance, field: "material")}</td>
					
						<td>${fieldValue(bean: materialResourceInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: materialResourceInstance, field: "available")}</td>
					
						<td>${fieldValue(bean: materialResourceInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${materialResourceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
