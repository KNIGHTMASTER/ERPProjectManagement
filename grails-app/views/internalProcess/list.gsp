
<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.InternalProcess" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'internalProcess.label', default: 'InternalProcess')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-internalProcess" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-internalProcess" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nActivity" title="${message(code: 'internalProcess.nActivity.label', default: 'NA ctivity')}" />
					
						<g:sortableColumn property="nDelay" title="${message(code: 'internalProcess.nDelay.label', default: 'ND elay')}" />
					
						<g:sortableColumn property="nMissSequence" title="${message(code: 'internalProcess.nMissSequence.label', default: 'NM iss Sequence')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${internalProcessInstanceList}" status="i" var="internalProcessInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${internalProcessInstance.id}">${fieldValue(bean: internalProcessInstance, field: "nActivity")}</g:link></td>
					
						<td>${fieldValue(bean: internalProcessInstance, field: "nDelay")}</td>
					
						<td>${fieldValue(bean: internalProcessInstance, field: "nMissSequence")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${internalProcessInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
