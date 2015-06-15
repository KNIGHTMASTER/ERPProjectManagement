
<%@ page import="ProjectRiskManagement.Planning.AnalysisProjectScopeStatement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'analysisProjectScopeStatement.label', default: 'AnalysisProjectScopeStatement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-analysisProjectScopeStatement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-analysisProjectScopeStatement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="analysisProjectScopeStatement.identificationProjectScopeStatement.label" default="Identification Project Scope Statement" /></th>
                                                
						<g:sortableColumn property="ranking" title="${message(code: 'analysisProjectScopeStatement.ranking.label', default: 'Ranking')}" />
                                                <th>Weight</th>
					
						<th><g:message code="analysisProjectScopeStatement.subCategories.label" default="Sub Categories" /></th>
                                                <th>Category</th>
                                                <th>Sub Category</th>
                                                <th>Total</th>
					
						<g:sortableColumn property="description" title="${message(code: 'analysisProjectScopeStatement.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'analysisProjectScopeStatement.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${analysisProjectScopeStatementInstanceList}" status="i" var="analysisProjectScopeStatementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${analysisProjectScopeStatementInstance.id}">${fieldValue(bean: analysisProjectScopeStatementInstance, field: "identificationProjectScopeStatement")}</g:link></td>
					
						<td>${fieldValue(bean: analysisProjectScopeStatementInstance, field: "ranking")}</td>
                                                <td>${fieldValue(bean: analysisProjectScopeStatementInstance, field: "")}</td>
					
						<td>${fieldValue(bean: analysisProjectScopeStatementInstance, field: "subCategories")}</td>
                                                <td>${fieldValue(bean: analysisProjectScopeStatementInstance, field: "ranking")}</td>
                                                <td>${fieldValue(bean: analysisProjectScopeStatementInstance, field: "ranking")}</td>
                                                <td>${fieldValue(bean: analysisProjectScopeStatementInstance, field: "ranking")}</td>
					
						<td>${fieldValue(bean: analysisProjectScopeStatementInstance, field: "description")}</td>
					
						<td><g:formatDate date="${analysisProjectScopeStatementInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${analysisProjectScopeStatementInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
