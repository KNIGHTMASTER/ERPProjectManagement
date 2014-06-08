
<%@ page import="ProjectCostManagement.DetermineBudget.HumanResourceCost" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'humanResourceCost.label', default: 'HumanResourceCost')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-humanResourceCost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-humanResourceCost" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list humanResourceCost">
			
				<g:if test="${humanResourceCostInstance?.activityCost}">
				<li class="fieldcontain">
					<span id="activityCost-label" class="property-label"><g:message code="humanResourceCost.activityCost.label" default="Activity Cost" /></span>
					
						<span class="property-value" aria-labelledby="activityCost-label"><g:link controller="activityCost" action="show" id="${humanResourceCostInstance?.activityCost?.id}">${humanResourceCostInstance?.activityCost?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${humanResourceCostInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="humanResourceCost.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${humanResourceCostInstance?.employee?.id}">${humanResourceCostInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${humanResourceCostInstance?.idx}">
				<li class="fieldcontain">
					<span id="idx-label" class="property-label"><g:message code="humanResourceCost.idx.label" default="Idx" /></span>
					
						<span class="property-value" aria-labelledby="idx-label"><g:fieldValue bean="${humanResourceCostInstance}" field="idx"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${humanResourceCostInstance?.approve}">
				<li class="fieldcontain">
					<span id="approve-label" class="property-label"><g:message code="humanResourceCost.approve.label" default="Approve" /></span>
					
						<span class="property-value" aria-labelledby="approve-label"><g:formatBoolean boolean="${humanResourceCostInstance?.approve}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${humanResourceCostInstance?.salaryHumanResource}">
				<li class="fieldcontain">
					<span id="salaryHumanResource-label" class="property-label"><g:message code="humanResourceCost.salaryHumanResource.label" default="Salary Human Resource" /></span>
					
						<g:each in="${humanResourceCostInstance.salaryHumanResource}" var="s">
						<span class="property-value" aria-labelledby="salaryHumanResource-label"><g:link controller="salaryHumanResource" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${humanResourceCostInstance?.id}" />
					<g:link class="edit" action="edit" id="${humanResourceCostInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
