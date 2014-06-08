
<%@ page import="ProjectProcurementManagement.ConductProcurements.VendorRegister" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vendorRegister.label', default: 'VendorRegister')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vendorRegister" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vendorRegister" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="vendorRegister.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="vendorRegister.vendorName.label" default="Vendor Name" /></th>
					
						<g:sortableColumn property="companyType" title="${message(code: 'vendorRegister.companyType.label', default: 'Company Type')}" />
					
						<g:sortableColumn property="dateRegister" title="${message(code: 'vendorRegister.dateRegister.label', default: 'Date Register')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vendorRegisterInstanceList}" status="i" var="vendorRegisterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vendorRegisterInstance.id}">${fieldValue(bean: vendorRegisterInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: vendorRegisterInstance, field: "vendorName")}</td>
					
						<td>${fieldValue(bean: vendorRegisterInstance, field: "companyType")}</td>
					
						<td><g:formatDate date="${vendorRegisterInstance.dateRegister}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vendorRegisterInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
