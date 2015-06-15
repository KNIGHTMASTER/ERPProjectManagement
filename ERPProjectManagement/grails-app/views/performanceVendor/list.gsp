
<%@ page import="ProjectProcurementManagement.AdministerProcurements.PerformanceVendor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'performanceVendor.label', default: 'PerformanceVendor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-performanceVendor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-performanceVendor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="performanceVendor.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="vendorName" title="${message(code: 'performanceVendor.vendorName.label', default: 'Vendor Name')}" />
					
						<g:sortableColumn property="productQuality" title="${message(code: 'performanceVendor.productQuality.label', default: 'Product QualityRange')}" />
					
						<g:sortableColumn property="onTimeDelivery" title="${message(code: 'performanceVendor.onTimeDelivery.label', default: 'On Time Delivery')}" />
					
						<g:sortableColumn property="documentationQuality" title="${message(code: 'performanceVendor.documentationQuality.label', default: 'Documentation QualityRange')}" />
					
						<g:sortableColumn property="developmentCost" title="${message(code: 'performanceVendor.developmentCost.label', default: 'Development Cost')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${performanceVendorInstanceList}" status="i" var="performanceVendorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${performanceVendorInstance.id}">${fieldValue(bean: performanceVendorInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: performanceVendorInstance, field: "vendorName")}</td>
					
						<td>${fieldValue(bean: performanceVendorInstance, field: "productQuality")}</td>
					
						<td>${fieldValue(bean: performanceVendorInstance, field: "onTimeDelivery")}</td>
					
						<td>${fieldValue(bean: performanceVendorInstance, field: "documentationQuality")}</td>
					
						<td>${fieldValue(bean: performanceVendorInstance, field: "developmentCost")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${performanceVendorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
