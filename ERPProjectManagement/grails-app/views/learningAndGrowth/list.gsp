
<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.LearningAndGrowth" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'learningAndGrowth.label', default: 'LearningAndGrowth')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-learningAndGrowth" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-learningAndGrowth" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dayLoss" title="${message(code: 'learningAndGrowth.dayLoss.label', default: 'Day Loss')}" />
					
						<g:sortableColumn property="nActivity" title="${message(code: 'learningAndGrowth.nActivity.label', default: 'NA ctivity')}" />
					
						<g:sortableColumn property="nEmployee" title="${message(code: 'learningAndGrowth.nEmployee.label', default: 'NE mployee')}" />
					
						<g:sortableColumn property="nTurnOver" title="${message(code: 'learningAndGrowth.nTurnOver.label', default: 'NT urn Over')}" />
					
						<g:sortableColumn property="ncr" title="${message(code: 'learningAndGrowth.ncr.label', default: 'Ncr')}" />
					
						<g:sortableColumn property="nr" title="${message(code: 'learningAndGrowth.nr.label', default: 'Nr')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${learningAndGrowthInstanceList}" status="i" var="learningAndGrowthInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${learningAndGrowthInstance.id}">${fieldValue(bean: learningAndGrowthInstance, field: "dayLoss")}</g:link></td>
					
						<td>${fieldValue(bean: learningAndGrowthInstance, field: "nActivity")}</td>
					
						<td>${fieldValue(bean: learningAndGrowthInstance, field: "nEmployee")}</td>
					
						<td>${fieldValue(bean: learningAndGrowthInstance, field: "nTurnOver")}</td>
					
						<td>${fieldValue(bean: learningAndGrowthInstance, field: "ncr")}</td>
					
						<td>${fieldValue(bean: learningAndGrowthInstance, field: "nr")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${learningAndGrowthInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
