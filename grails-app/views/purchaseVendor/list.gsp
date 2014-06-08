
<%@ page import="ProjectProcurementManagement.AdministerProcurements.PurchaseVendor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'purchaseVendor.label', default: 'PurchaseVendor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-purchaseVendor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-purchaseVendor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="purchaseVendor.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="purchaseVendor.material.label" default="Material" /></th>
					
						<g:sortableColumn property="purchaseDate" title="${message(code: 'purchaseVendor.purchaseDate.label', default: 'Purchase Date')}" />
					
						<g:sortableColumn property="pricePerUnit" title="${message(code: 'purchaseVendor.pricePerUnit.label', default: 'Price Per Unit')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${purchaseVendorInstanceList}" status="i" var="purchaseVendorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${purchaseVendorInstance.id}">${fieldValue(bean: purchaseVendorInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: purchaseVendorInstance, field: "material")}</td>
					
						<td><g:formatDate date="${purchaseVendorInstance.purchaseDate}" /></td>
					
						<td>${fieldValue(bean: purchaseVendorInstance, field: "pricePerUnit")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${purchaseVendorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
