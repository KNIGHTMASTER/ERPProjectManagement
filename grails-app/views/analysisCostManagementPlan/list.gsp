
<%@ page import="ProjectRiskManagement.Planning.AnalysisCostManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'analysisCostManagementPlan.label', default: 'AnalysisCostManagementPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-analysisCostManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/costManagementPlan/list"><g:message code="Cost Management Plan List"/></a></li>
                                <li><a href="/ERPProjectManagement/AnalysisTimeManagementPlan/list"><g:message code="Analysis Time Management Plan"/></a></li>                                 
                                 <li><a href="/ERPProjectManagement/AnalysisProjectScopeStatement/list"><g:message code="Analysis Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/AnalysisQualityManagementPlan/list"><g:message code="Analysis Quality Management Plan"/></a></li>                                 
			</ul>
		</div>
		<div id="list-analysisCostManagementPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="analysisCostManagementPlan.identificationCostManagementPlan.label" default="Identification Cost Management Plan" /></th>
                                                <th>Rating</th>
					
						<g:sortableColumn property="ranking" title="${message(code: 'analysisCostManagementPlan.ranking.label', default: 'Ranking')}" />
                                                <th>Weight</th>
					
						<th><g:message code="analysisCostManagementPlan.subCategories.label" default="Sub Categories" /></th>
                                                <th>Category</th>
                                                <th>SubCategory</th>
                                                <th>Total</th>
					
						<g:sortableColumn property="description" title="${message(code: 'analysisCostManagementPlan.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'analysisCostManagementPlan.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${analysisCostManagementPlanInstanceList}" status="i" var="analysisCostManagementPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${analysisCostManagementPlanInstance.id}">${fieldValue(bean: analysisCostManagementPlanInstance, field: "identificationCostManagementPlan")}</g:link></td>
                                                <td>${fieldValue(bean: analysisCostManagementPlanInstance, field: "rating")}</td>
						<td>${fieldValue(bean: analysisCostManagementPlanInstance, field: "ranking")}</td>
                                                <td>${fieldValue(bean: analysisCostManagementPlanInstance, field: "weight")}</td>
					
						<td>${fieldValue(bean: analysisCostManagementPlanInstance, field: "subCategories")}</td>
                                                <td>${fieldValue(bean: analysisCostManagementPlanInstance, field: "category")}</td>
                                                <td>${fieldValue(bean: analysisCostManagementPlanInstance, field: "subKategori")}</td>
                                                <td>${fieldValue(bean: analysisCostManagementPlanInstance, field: "total")}</td>
					
						<td>${fieldValue(bean: analysisCostManagementPlanInstance, field: "description")}</td>
					
						<td><g:formatDate date="${analysisCostManagementPlanInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${analysisCostManagementPlanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
