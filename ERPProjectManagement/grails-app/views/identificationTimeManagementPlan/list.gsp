
<%@ page import="ProjectRiskManagement.Planning.IdentificationTimeManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-identificationTimeManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/activity/list"><g:message code="Time Management Plan"/></a></li>
                                <li><a href="/ERPProjectManagement/delayActivity/list"><g:message code="Identification Delay"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationCostManagementPlan/list"><g:message code="Identification Cost Management Plan"/></a></li>                                 
                                 <li><a href="/ERPProjectManagement/identificationMaterialCost/list"><g:message code="Identification Material Cost"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationProjectScopeStatement/list"><g:message code="Identification Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationRequirementsManagementPlan/list"><g:message code="Identification Requirements Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityManagementPlan/list"><g:message code="Identification Quality Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityAssurance/list"><g:message code="Identification Quality Assurance"/></a></li>
			</ul>
		</div>
		<div id="list-identificationTimeManagementPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="identificationTimeManagementPlan.activity.label" default="Activity" /></th>
					
						<th><g:message code="identificationTimeManagementPlan.riskCategories.label" default="Risk Categories" /></th>
                                                <th>Activity Duration</th>
					
						<g:sortableColumn property="description" title="${message(code: 'identificationTimeManagementPlan.description.label', default: 'Description')}" />
                                                <th>Risk</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${identificationTimeManagementPlanInstanceList}" status="i" var="identificationTimeManagementPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${identificationTimeManagementPlanInstance.id}">${fieldValue(bean: identificationTimeManagementPlanInstance, field: "activity")}</g:link></td>
					
						<td>${fieldValue(bean: identificationTimeManagementPlanInstance, field: "riskCategories")}</td>
                                                <td>${fieldValue(bean: identificationTimeManagementPlanInstance, field: "time")}</td>
					
						<td>${fieldValue(bean: identificationTimeManagementPlanInstance, field: "description")}</td>
                                                <td>${fieldValue(bean: identificationTimeManagementPlanInstance, field: "risk")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${identificationTimeManagementPlanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
