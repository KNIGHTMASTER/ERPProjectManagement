
<%@ page import="ProjectScopeManagement.CreateWBS.Element" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'element.label', default: 'Element')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-element" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-element" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="element.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="element.wbsName.label" default="Wbs Name" /></th>
					
						<g:sortableColumn property="level" title="${message(code: 'element.level.label', default: 'Level')}" />
					
						<g:sortableColumn property="wbsCode" title="${message(code: 'element.wbsCode.label', default: 'Wbs Code')}" />
					
						<g:sortableColumn property="elementName" title="${message(code: 'element.elementName.label', default: 'Element Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${elementInstanceList}" status="i" var="elementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${elementInstance.id}">${fieldValue(bean: elementInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: elementInstance, field: "wbsName")}</td>
					
						<td>${fieldValue(bean: elementInstance, field: "level")}</td>
					
						<td>${fieldValue(bean: elementInstance, field: "wbsCode")}</td>
					
						<td>${fieldValue(bean: elementInstance, field: "elementName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${elementInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
