
<%@ page import="ProjectTimeManagement.Utility.Lagi" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lagi.label', default: 'Lagi')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-lagi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-lagi" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="idEmp" title="${message(code: 'lagi.idEmp.label', default: 'Id Emp')}" />
					
						<g:sortableColumn property="pro" title="${message(code: 'lagi.pro.label', default: 'Pro')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${lagiInstanceList}" status="i" var="lagiInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${lagiInstance.id}">${fieldValue(bean: lagiInstance, field: "idEmp")}</g:link></td>
					
						<td>${fieldValue(bean: lagiInstance, field: "pro")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${lagiInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
