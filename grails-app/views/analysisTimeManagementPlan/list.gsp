
<%@ page import="ProjectRiskManagement.Planning.AnalysisTimeManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-analysisTimeManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/IdentificationTimeManagementPlan/list"><g:message code="Identification Time Management Plan"/></a></li>
                                <li><a href="/ERPProjectManagement/AnalysisCostManagementPlan/list"><g:message code="Analysis Cost Management Plan"/></a></li>                                 
                                 <li><a href="/ERPProjectManagement/AnalysisProjectScopeStatement/list"><g:message code="Analysis Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/AnalysisQualityManagementPlan/list"><g:message code="Analysis Quality Management Plan"/></a></li>                                 w
			</ul>
		</div>
		<div id="list-analysisTimeManagementPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="analysisTimeManagementPlan.identificationTimeManagementPlan.label" default="Identification Time Management Plan" /></th>
                                                <th>Rating</th>
					
						<g:sortableColumn property="ranking" title="${message(code: 'analysisTimeManagementPlan.ranking.label', default: 'Ranking')}" />
                                                <th>Weight</th>
					
						<th><g:message code="analysisTimeManagementPlan.subCategories.label" default="Sub Categories" /></th>
                                                <th>Category</th>
                                                <th>Sub Categories</th>
                                                <th>Total</th>
					
                                                
						<g:sortableColumn property="description" title="${message(code: 'analysisTimeManagementPlan.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'analysisTimeManagementPlan.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${analysisTimeManagementPlanInstanceList}" status="i" var="analysisTimeManagementPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${analysisTimeManagementPlanInstance.id}">${fieldValue(bean: analysisTimeManagementPlanInstance, field: "identificationTimeManagementPlan")}</g:link></td>
					
						<td>${fieldValue(bean: analysisTimeManagementPlanInstance, field: "rating")}</td>
                                                <td>${fieldValue(bean: analysisTimeManagementPlanInstance, field: "ranking")}</td>
                                                <td>${fieldValue(bean: analysisTimeManagementPlanInstance, field: "weight")}</td>
                                                
					
						<td>${fieldValue(bean: analysisTimeManagementPlanInstance, field: "subCategories")}</td>
                                                <td>${fieldValue(bean: analysisTimeManagementPlanInstance, field: "category")}</td>
                                                <td>${fieldValue(bean: analysisTimeManagementPlanInstance, field: "subKategori")}</td>
                                                <td>${fieldValue(bean: analysisTimeManagementPlanInstance, field: "total")}</td>
					
						<td>${fieldValue(bean: analysisTimeManagementPlanInstance, field: "description")}</td>
					
						<td><g:formatDate date="${analysisTimeManagementPlanInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${analysisTimeManagementPlanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
