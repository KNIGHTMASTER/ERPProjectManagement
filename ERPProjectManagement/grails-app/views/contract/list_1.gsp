
<%@ page import="ProjectProcurementManagement.AdministerProcurements.Contract" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contract" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="data display datatable" id="example">
				<thead>
					<tr>
					
						<th><g:message code="contract.vendorName.label" default="Vendor Name" /></th>
					
						<g:sortableColumn property="noContract" title="${message(code: 'contract.noContract.label', default: 'No Contract')}" />
					
						<th><g:message code="contract.materialName.label" default="Material Name" /></th>
					
						<g:sortableColumn property="price" title="${message(code: 'contract.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="contractDate" title="${message(code: 'contract.contractDate.label', default: 'Contract Date')}" />
					
						<g:sortableColumn property="startWork" title="${message(code: 'contract.startWork.label', default: 'Start Work')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contractInstanceList}" status="i" var="contractInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contractInstance.id}">${fieldValue(bean: contractInstance, field: "vendorName")}</g:link></td>
					
						<td>${fieldValue(bean: contractInstance, field: "noContract")}</td>
					
						<td>${fieldValue(bean: contractInstance, field: "materialName")}</td>
					
						<td>${fieldValue(bean: contractInstance, field: "price")}</td>
					
						<td><g:formatDate date="${contractInstance.contractDate}" /></td>
					
						<td><g:formatDate date="${contractInstance.startWork}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contractInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
