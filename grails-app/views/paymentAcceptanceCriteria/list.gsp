
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.PaymentAcceptanceCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-paymentAcceptanceCriteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-paymentAcceptanceCriteria" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="paymentAcceptanceCriteria.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="paymentAcceptanceCriteria.payment.label" default="Payment" /></th>
					
						<g:sortableColumn property="acceptanceCriteria" title="${message(code: 'paymentAcceptanceCriteria.acceptanceCriteria.label', default: 'Acceptance Criteria')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'paymentAcceptanceCriteria.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${paymentAcceptanceCriteriaInstanceList}" status="i" var="paymentAcceptanceCriteriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${paymentAcceptanceCriteriaInstance.id}">${fieldValue(bean: paymentAcceptanceCriteriaInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: paymentAcceptanceCriteriaInstance, field: "payment")}</td>
					
						<td>${fieldValue(bean: paymentAcceptanceCriteriaInstance, field: "acceptanceCriteria")}</td>
					
						<td>${fieldValue(bean: paymentAcceptanceCriteriaInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${paymentAcceptanceCriteriaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
