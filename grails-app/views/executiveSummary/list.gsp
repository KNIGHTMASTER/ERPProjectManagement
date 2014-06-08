
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ExecutiveSummary" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'executiveSummary.label', default: 'ExecutiveSummary')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-executiveSummary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-executiveSummary" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="executiveSummary.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="issue" title="${message(code: 'executiveSummary.issue.label', default: 'Issue')}" />
					
						<g:sortableColumn property="anticipatedOutcomes" title="${message(code: 'executiveSummary.anticipatedOutcomes.label', default: 'Anticipated Outcomes')}" />
					
						<g:sortableColumn property="recommendation" title="${message(code: 'executiveSummary.recommendation.label', default: 'Recommendation')}" />
					
						<g:sortableColumn property="justification" title="${message(code: 'executiveSummary.justification.label', default: 'Justification')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${executiveSummaryInstanceList}" status="i" var="executiveSummaryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${executiveSummaryInstance.id}">${fieldValue(bean: executiveSummaryInstance, field: "projectName")}</g:link></td>

                        <td>${executiveSummaryInstance.issue}</td>
					
						<td>${executiveSummaryInstance.anticipatedOutcomes}</td>
					
						<td>${executiveSummaryInstance.recommendation}</td>
					
						<td>${executiveSummaryInstance.justification}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${executiveSummaryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
