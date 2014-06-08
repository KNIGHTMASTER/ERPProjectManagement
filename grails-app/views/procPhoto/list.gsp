
<%@ page import="ProjectProcurementManagement.CloseProcurements.ProcPhoto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'procPhoto.label', default: 'ProcPhoto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-procPhoto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-procPhoto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="procPhoto.materialName.label" default="Material Name" /></th>
					
						<g:sortableColumn property="photo" title="${message(code: 'procPhoto.photo.label', default: 'Photo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${procPhotoInstanceList}" status="i" var="procPhotoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${procPhotoInstance.id}">${fieldValue(bean: procPhotoInstance, field: "materialName")}</g:link></td>
					
						<td>${fieldValue(bean: procPhotoInstance, field: "photo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${procPhotoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
