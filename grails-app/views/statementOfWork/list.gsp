
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'statementOfWork.label', default: 'StatementOfWork')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-statementOfWork" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a class="list" href="../PlaceOfPerformance/"><g:message code="Place Of Performance"/></a></li>
                                <li><a class="list" href="../PeriodOfPerformance/"><g:message code="Period Of Performance"/></a></li>
                                <li><a class="list" href="../WorkRequirements/"><g:message code="Work Requirements"/></a></li>
                                <li><a class="list" href="../AcceptanceCriteria/"><g:message code="Acceptance Criteria"/></a></li>
                                <li><a class="list" href="../statementOfWorkApproval/"><g:message code="Statement Of Work Approvals"/></a></li>
                                <li><a class="list" href="../Milestones/"><g:message code="Milestones"/></a></li>                        
                                <li><a class="list" href="../../ERPProjectManagement/task/"><g:message code="Tasks"/></a></li>
			</ul>
		</div>
		<div id="list-statementOfWork" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="idProject" title="${message(code: 'statementOfWork.idProject.label', default: 'Id Project')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'statementOfWork.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="projectName" title="${message(code: 'statementOfWork.projectName.label', default: 'Project Name')}" />
					
						<g:sortableColumn property="introduction" title="${message(code: 'statementOfWork.introduction.label', default: 'Introduction')}" />
					
						<g:sortableColumn property="scopeOfWork" title="${message(code: 'statementOfWork.scopeOfWork.label', default: 'Scope Of Work')}" />
					
						<g:sortableColumn property="otherRequirements" title="${message(code: 'statementOfWork.otherRequirements.label', default: 'Other Requirements')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${statementOfWorkInstanceList}" status="i" var="statementOfWorkInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${statementOfWorkInstance.id}">${fieldValue(bean: statementOfWorkInstance, field: "idProject")}</g:link></td>
					
						<td><g:formatDate date="${statementOfWorkInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: statementOfWorkInstance, field: "projectName")}</td>
					
						<td>${statementOfWorkInstance.introduction}</td>
					
						<td>${statementOfWorkInstance.scopeOfWork}</td>
					
						<td>${statementOfWorkInstance.otherRequirements}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${statementOfWorkInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
