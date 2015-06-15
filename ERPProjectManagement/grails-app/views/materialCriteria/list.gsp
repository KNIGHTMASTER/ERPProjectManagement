
<%@ page import="ProjectProcurementManagement.ConductProcurements.MaterialCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialCriteria.label', default: 'MaterialCriteria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-materialCriteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-materialCriteria" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="materialId" title="${message(code: 'materialCriteria.materialId.label', default: 'Material Id')}" />
					
						<g:sortableColumn property="materialName" title="${message(code: 'materialCriteria.materialName.label', default: 'Material Name')}" />
					
						<g:sortableColumn property="unitType" title="${message(code: 'materialCriteria.unitType.label', default: 'Unit Type')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'materialCriteria.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="available" title="${message(code: 'materialCriteria.available.label', default: 'Available')}" />
					
						<g:sortableColumn property="note" title="${message(code: 'materialCriteria.note.label', default: 'Note')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${materialCriteriaInstanceList}" status="i" var="materialCriteriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materialCriteriaInstance.id}">${fieldValue(bean: materialCriteriaInstance, field: "materialId")}</g:link></td>
					
						<td>${fieldValue(bean: materialCriteriaInstance, field: "materialName")}</td>
					
						<td>${fieldValue(bean: materialCriteriaInstance, field: "unitType")}</td>
					
						<td>${fieldValue(bean: materialCriteriaInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: materialCriteriaInstance, field: "available")}</td>
					
						<td>${fieldValue(bean: materialCriteriaInstance, field: "note")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${materialCriteriaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
