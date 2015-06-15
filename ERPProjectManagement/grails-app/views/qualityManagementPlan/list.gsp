
<%@ page import="ProjectQualityManagement.QualityManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'qualityManagementPlan.label', default: 'QualityManagementPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-qualityManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-qualityManagementPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="qualityManagementPlan.projectCharter.label" default="Project Charter" /></th>
					
						<g:sortableColumn property="qualityAssuranceApproach" title="${message(code: 'qualityManagementPlan.qualityAssuranceApproach.label', default: 'QualityRange Assurance Approach')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'qualityManagementPlan.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${qualityManagementPlanInstanceList}" status="i" var="qualityManagementPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${qualityManagementPlanInstance.id}">${fieldValue(bean: qualityManagementPlanInstance, field: "projectCharter")}</g:link></td>
					
						<td>${fieldValue(bean: qualityManagementPlanInstance, field: "qualityAssuranceApproach")}</td>
					
						<td><g:formatDate date="${qualityManagementPlanInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${qualityManagementPlanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
