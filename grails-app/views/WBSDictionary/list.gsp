
<%@ page import="ProjectScopeManagement.CreateWBS.WbsDictionary" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wbsDictionary.label', default: 'WbsDictionary')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-wbsDictionary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-wbsDictionary" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="wbsDictionary.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="wbsDictionary.wbsName.label" default="Wbs Name" /></th>
					
						<th><g:message code="wbsDictionary.element.label" default="Element" /></th>
					
						<g:sortableColumn property="definition" title="${message(code: 'wbsDictionary.definition.label', default: 'Definition')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'wbsDictionary.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${wbsDictionaryInstanceList}" status="i" var="wbsDictionaryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${wbsDictionaryInstance.id}">${fieldValue(bean: wbsDictionaryInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: wbsDictionaryInstance, field: "wbsName")}</td>
					
						<td>${fieldValue(bean: wbsDictionaryInstance, field: "element")}</td>
					
						<td>${fieldValue(bean: wbsDictionaryInstance, field: "definition")}</td>
					
						<td><g:formatDate date="${wbsDictionaryInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${wbsDictionaryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
