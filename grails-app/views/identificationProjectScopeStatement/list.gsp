
<%@ page import="ProjectRiskManagement.Planning.IdentificationProjectScopeStatement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationProjectScopeStatement.label', default: 'IdentificationProjectScopeStatement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-identificationProjectScopeStatement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/projectScopeStatement/list"><g:message code="Project Scope Statement"/></a></li>
                                <li><a href="/ERPProjectManagement/IdentificationRequirementsManagementPlan/list"><g:message code="Identification Requirements Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityManagementPlan/list"><g:message code="Identification Quality Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityAssurance/list"><g:message code="Identification Quality Assurance"/></a></li>
                                <li><a href="/ERPProjectManagement/IdentificationTimeManagementPlan/list"><g:message code="Identification Time Management Plan"/></a></li>
                                <li><a href="/ERPProjectManagement/identificationDelay"><g:message code="Identification Delay"/></a></li>
                                <li><a href="/ERPProjectManagement/identificationCostManagementPlan/list"><g:message code="Identification Cost Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationMaterialCost/list"><g:message code="Identification Material Cost"/></a></li>                                                                                                   
                                 
			</ul>
		</div>
		<div id="list-identificationProjectScopeStatement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="identificationProjectScopeStatement.projectScopeStatement.label" default="Project Scope Statement" /></th>
					
						<th><g:message code="identificationProjectScopeStatement.riskCategories.label" default="Risk Categories" /></th>
					
						<g:sortableColumn property="risk" title="${message(code: 'identificationProjectScopeStatement.risk.label', default: 'Risk')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'identificationProjectScopeStatement.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${identificationProjectScopeStatementInstanceList}" status="i" var="identificationProjectScopeStatementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${identificationProjectScopeStatementInstance.id}">${fieldValue(bean: identificationProjectScopeStatementInstance, field: "projectScopeStatement")}</g:link></td>
					
						<td>${fieldValue(bean: identificationProjectScopeStatementInstance, field: "riskCategories")}</td>
					
						<td>${fieldValue(bean: identificationProjectScopeStatementInstance, field: "risk")}</td>
					
						<td>${fieldValue(bean: identificationProjectScopeStatementInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${identificationProjectScopeStatementInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
