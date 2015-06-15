
<%@ page import="ProjectRiskManagement.Planning.SubCategories" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subCategories.label', default: 'SubCategories')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subCategories" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/RiskCategories/list"><g:message code="Risk Categories List"/></a></li>
                                <li><a href="/ERPProjectManagement/IdentificationCostManagementPlan/list"><g:message code="Risk Identification"/></a></li>
                                
			</ul>
		</div>
		<div id="list-subCategories" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="subCategories" title="${message(code: 'subCategories.subCategories.label', default: 'Sub Categories')}" />
					
						<th><g:message code="subCategories.riskCategories.label" default="Risk Categories" /></th>
					
						<g:sortableColumn property="ranking" title="${message(code: 'subCategories.ranking.label', default: 'Ranking')}" />
                                                <th>Weight</th>
					
						<g:sortableColumn property="description" title="${message(code: 'subCategories.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subCategoriesInstanceList}" status="i" var="subCategoriesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subCategoriesInstance.id}">${fieldValue(bean: subCategoriesInstance, field: "subCategories")}</g:link></td>
					
						<td>${fieldValue(bean: subCategoriesInstance, field: "riskCategories")}</td>
					
						<td>${fieldValue(bean: subCategoriesInstance, field: "ranking")}</td>
                                                <td>${fieldValue(bean: subCategoriesInstance, field: "weight")}</td>
					
						<td>${fieldValue(bean: subCategoriesInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subCategoriesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
