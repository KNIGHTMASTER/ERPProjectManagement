
<%@ page import="ProjectCommunicationManagement.ReportPerformance.UserAvatar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userAvatar.label', default: 'UserAvatar')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userAvatar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userAvatar" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="avatar" title="${message(code: 'userAvatar.avatar.label', default: 'Avatar')}" />
					
						<g:sortableColumn property="avatarType" title="${message(code: 'userAvatar.avatarType.label', default: 'Avatar Type')}" />
					
						<g:sortableColumn property="userId" title="${message(code: 'userAvatar.userId.label', default: 'User Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userAvatarInstanceList}" status="i" var="userAvatarInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${userAvatarInstance.id}"><img src="${createLink(action:'displayAvatar', id:userAvatarInstance?.id)}" /></g:link></td>
					
						<td align="center">${fieldValue(bean: userAvatarInstance, field: "avatarType")}</td>
					
						<td  style="text-align: center">${fieldValue(bean: userAvatarInstance, field: "userId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userAvatarInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
