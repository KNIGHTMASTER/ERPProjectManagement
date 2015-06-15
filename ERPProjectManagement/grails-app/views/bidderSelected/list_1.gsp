
<%@ page import="ProjectProcurementManagement.ConductProcurements.BidderSelected" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bidderSelected.label', default: 'BidderSelected')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bidderSelected" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bidderSelected" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="data display datatable" id="example">
				<thead>
					<tr>
					
						<th><g:message code="bidderSelected.vendorName.label" default="Vendor Name" /></th>
					
						<th><g:message code="bidderSelected.materialName.label" default="Material Name" /></th>
					
						<g:sortableColumn property="dateSelected" title="${message(code: 'bidderSelected.dateSelected.label', default: 'Date Selected')}" />
					
						<g:sortableColumn property="bidderType" title="${message(code: 'bidderSelected.bidderType.label', default: 'Bidder Type')}" />
					
						<g:sortableColumn property="note" title="${message(code: 'bidderSelected.note.label', default: 'Note')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bidderSelectedInstanceList}" status="i" var="bidderSelectedInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bidderSelectedInstance.id}">${fieldValue(bean: bidderSelectedInstance, field: "vendorName")}</g:link></td>
					
						<td>${fieldValue(bean: bidderSelectedInstance, field: "materialName")}</td>
					
						<td><g:formatDate date="${bidderSelectedInstance.dateSelected}" /></td>
					
						<td>${fieldValue(bean: bidderSelectedInstance, field: "bidderType")}</td>
					
						<td>${fieldValue(bean: bidderSelectedInstance, field: "note")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bidderSelectedInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
