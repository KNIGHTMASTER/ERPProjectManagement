
<%@ page import="ProjectCostManagement.DetermineBudget.FinanceEvAcMaterial" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'financeEvAcMaterial.label', default: 'FinanceEvAcMaterial')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-financeEvAcMaterial" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-financeEvAcMaterial" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="ac" title="${message(code: 'financeEvAcMaterial.ac.label', default: 'Ac')}" />
					
						<g:sortableColumn property="evr" title="${message(code: 'financeEvAcMaterial.evr.label', default: 'Evr')}" />
					
						<th><g:message code="financeEvAcMaterial.materialCostActivity.label" default="Material Cost Activity" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${financeEvAcMaterialInstanceList}" status="i" var="financeEvAcMaterialInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${financeEvAcMaterialInstance.id}">${fieldValue(bean: financeEvAcMaterialInstance, field: "ac")}</g:link></td>
					
						<td>${fieldValue(bean: financeEvAcMaterialInstance, field: "evr")}</td>
					
						<td>${fieldValue(bean: financeEvAcMaterialInstance, field: "materialCostActivity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${financeEvAcMaterialInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
