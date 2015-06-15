
<%@ page import="ProjectCostManagement.DetermineBudget.Cost" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cost.label', default: 'Cost')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cost" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="cost.costProject.label" default="Cost Project" /></th>
					
                                                <th>Human</th>
						<th>Material</th>
                                                <th>Management</th>
                                                <th>Profit</th>
                                                <g:sortableColumn property="description" title="${message(code: 'cost.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${costInstanceList}" status="i" var="costInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${costInstance.id}">${fieldValue(bean: costInstance, field: "costProject")}</g:link></td>
					
						<td>${fieldValue(bean: costInstance, field: "human")}</td>
					
						<td>${fieldValue(bean: costInstance, field: "material")}</td>
					
						<td>${fieldValue(bean: costInstance, field: "management")}</td>
					
						<td>${fieldValue(bean: costInstance, field: "profit")}</td>
					
						<td>${fieldValue(bean: costInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${costInstanceTotal}" />
			</div>
		</div>
	</body>
</html>