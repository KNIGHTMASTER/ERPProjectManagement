
<%@ page import="ProjectRiskManagement.Planning.IdentificationQualityAssurance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationQualityAssurance.label', default: 'IdentificationQualityAssurance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-identificationQualityAssurance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-identificationQualityAssurance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="identificationQualityAssurance.qualityAssurance.label" default="Quality Assurance" /></th>
					
						<th><g:message code="identificationQualityAssurance.riskCategories.label" default="Risk Categories" /></th>
					
						<g:sortableColumn property="risk" title="${message(code: 'identificationQualityAssurance.risk.label', default: 'Risk')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'identificationQualityAssurance.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${identificationQualityAssuranceInstanceList}" status="i" var="identificationQualityAssuranceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${identificationQualityAssuranceInstance.id}">${fieldValue(bean: identificationQualityAssuranceInstance, field: "qualityAssurance")}</g:link></td>
					
						<td>${fieldValue(bean: identificationQualityAssuranceInstance, field: "riskCategories")}</td>
					
						<td>${fieldValue(bean: identificationQualityAssuranceInstance, field: "risk")}</td>
					
						<td>${fieldValue(bean: identificationQualityAssuranceInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${identificationQualityAssuranceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
