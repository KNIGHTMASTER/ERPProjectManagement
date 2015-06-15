
<%@ page import="ProjectRiskManagement.Planning.RiskCategories" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'riskCategories.label', default: 'RiskCategories')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-riskCategories" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/projectCharter/list"><g:message code="Project Charter List"/></a></li>
                                <li><a href="/ERPProjectManagement/subCategories/list"><g:message code="Sub Categories List"/></a></li>
			</ul>
		</div>
		<div id="list-riskCategories" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="riskCategories.projectCharter.label" default="Project Charter" /></th>
					
						<g:sortableColumn property="riskCategories" title="${message(code: 'riskCategories.riskCategories.label', default: 'Risk Categories')}" />
					
						<g:sortableColumn property="ranking" title="${message(code: 'riskCategories.ranking.label', default: 'Ranking')}" />
                                                <th>Weight</th>
					
						<g:sortableColumn property="description" title="${message(code: 'riskCategories.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${riskCategoriesInstanceList}" status="i" var="riskCategoriesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${riskCategoriesInstance.id}">${fieldValue(bean: riskCategoriesInstance, field: "projectCharter")}</g:link></td>
					
						<td>${fieldValue(bean: riskCategoriesInstance, field: "riskCategories")}</td>
					
						<td>${fieldValue(bean: riskCategoriesInstance, field: "ranking")}</td>
                                                <td>${fieldValue(bean: riskCategoriesInstance, field: "weight")}</td>
					
						<td>${fieldValue(bean: riskCategoriesInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${riskCategoriesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
