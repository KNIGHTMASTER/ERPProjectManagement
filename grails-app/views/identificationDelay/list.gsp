
<%@ page import="ProjectRiskManagement.Planning.IdentificationDelay" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationDelay.label', default: 'IdentificationDelay')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-identificationDelay" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/delayActivity/list"><g:message code="Delay Activity"/></a></li>
                                <li><a href="/ERPProjectManagement/IdentificationTimeManagementPlan/list"><g:message code="Identification Time Management Plan"/></a></li>
                                <li><a href="/ERPProjectManagement/identificationCostManagementPlan/list"><g:message code="Identification Cost Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationMaterialCost/list"><g:message code="Identification Material Cost"/></a></li>                                                                  
                                 <li><a href="/ERPProjectManagement/IdentificationProjectScopeStatement/list"><g:message code="Identification Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationRequirementsManagementPlan/list"><g:message code="Identification Requirements Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityManagementPlan/list"><g:message code="Identification Quality Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityAssurance/list"><g:message code="Identification Quality Assurance"/></a></li>
			</ul>
		</div>
		<div id="list-identificationDelay" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="identificationDelay.delayActivity.label" default="Delay Activity" /></th>
					
						<th><g:message code="identificationDelay.riskCategories.label" default="Risk Categories" /></th>
                                                <th>Delay</th>
					
						<g:sortableColumn property="description" title="${message(code: 'identificationDelay.description.label', default: 'Description')}" />
                                                <th>Risk</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${identificationDelayInstanceList}" status="i" var="identificationDelayInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${identificationDelayInstance.id}">${fieldValue(bean: identificationDelayInstance, field: "delayActivity")}</g:link></td>
					
						<td>${fieldValue(bean: identificationDelayInstance, field: "riskCategories")}</td>
                                                <td>${fieldValue(bean: identificationDelayInstance, field: "ambil")}</td>
					
						<td>${fieldValue(bean: identificationDelayInstance, field: "description")}</td>
                                                <td>${fieldValue(bean: identificationDelayInstance, field: "risk")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${identificationDelayInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
