
<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.Requirement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirement.label', default: 'Requirement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-requirement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-requirement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="idRequirement" title="${message(code: 'requirement.idRequirement.label', default: 'Id Requirement')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'requirement.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="requirement" title="${message(code: 'requirement.requirement.label', default: 'Requirement')}" />
					
						<g:sortableColumn property="descriptions" title="${message(code: 'requirement.descriptions.label', default: 'Descriptions')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${requirementInstanceList}" status="i" var="requirementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${requirementInstance.id}">${fieldValue(bean: requirementInstance, field: "idRequirement")}</g:link></td>
					
						<td><g:formatDate date="${requirementInstance.date}" /></td>
					
						<td>${fieldValue(bean: requirementInstance, field: "requirement")}</td>
					
						<td>${fieldValue(bean: requirementInstance, field: "descriptions")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${requirementInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
