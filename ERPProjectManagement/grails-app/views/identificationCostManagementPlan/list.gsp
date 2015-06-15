
<%@ page import="ProjectRiskManagement.Planning.IdentificationCostManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationCostManagementPlan.label', default: 'IdentificationCostManagementPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-identificationCostManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/costManagementPlan/list"><g:message code="Cost Management Plan List"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationMaterialCost/list"><g:message code="Identification Material Cost"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationTimeManagementPlan/list"><g:message code="Identification Time Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationDelay/list"><g:message code="Identification Delay Activity"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationProjectScopeStatement/list"><g:message code="Identification Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationRequirementsManagementPlan/list"><g:message code="Identification Requirements Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityManagementPlan/list"><g:message code="Identification Quality Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityAssurance/list"><g:message code="Identification Quality Assurance"/></a></li>
			</ul>
		</div>
		<div id="list-identificationCostManagementPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="identificationCostManagementPlan.costManagementPlan.label" default="Cost Management Plan" /></th>
					
						<th><g:message code="identificationCostManagementPlan.riskCategories.label" default="Risk Categories" /></th>
                                                <th>Cost Management Plan</th>
					
						<g:sortableColumn property="description" title="${message(code: 'identificationCostManagementPlan.description.label', default: 'Description')}" />
                                                <th>Risk</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${identificationCostManagementPlanInstanceList}" status="i" var="identificationCostManagementPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${identificationCostManagementPlanInstance.id}">${fieldValue(bean: identificationCostManagementPlanInstance, field: "costManagementPlan")}</g:link></td>
					
						<td>${fieldValue(bean: identificationCostManagementPlanInstance, field: "riskCategories")}</td>
                                                <td>${fieldValue(bean: identificationCostManagementPlanInstance, field: "cost")}</td>
					
						<td>${fieldValue(bean: identificationCostManagementPlanInstance, field: "description")}</td>
                                                <td>${fieldValue(bean: identificationCostManagementPlanInstance, field: "risk")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${identificationCostManagementPlanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
