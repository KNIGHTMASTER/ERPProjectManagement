
<%@ page import="ProjectCostManagement.DetermineBudget.ManagementCostActivity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managementCostActivity.label', default: 'ManagementCostActivity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-managementCostActivity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-managementCostActivity" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list managementCostActivity">
			
				<g:if test="${managementCostActivityInstance?.cost}">
				<li class="fieldcontain">
					<span id="cost-label" class="property-label"><g:message code="managementCostActivity.cost.label" default="Cost" /></span>
					
						<span class="property-value" aria-labelledby="cost-label"><g:link controller="cost" action="show" id="${managementCostActivityInstance?.cost?.id}">${managementCostActivityInstance?.cost?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostActivityInstance?.detail}">
				<li class="fieldcontain">
					<span id="detail-label" class="property-label"><g:message code="managementCostActivity.detail.label" default="Detail" /></span>
					
						<span class="property-value" aria-labelledby="detail-label"><g:fieldValue bean="${managementCostActivityInstance}" field="detail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostActivityInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="managementCostActivity.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${managementCostActivityInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostActivityInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="managementCostActivity.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${managementCostActivityInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostActivityInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="managementCostActivity.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${managementCostActivityInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostActivityInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="managementCostActivity.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${managementCostActivityInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostActivityInstance?.approve}">
				<li class="fieldcontain">
					<span id="approve-label" class="property-label"><g:message code="managementCostActivity.approve.label" default="Approve" /></span>
					
						<span class="property-value" aria-labelledby="approve-label"><g:formatBoolean boolean="${managementCostActivityInstance?.approve}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostActivityInstance?.managementCostUse}">
				<li class="fieldcontain">
					<span id="managementCostUse-label" class="property-label"><g:message code="managementCostActivity.managementCostUse.label" default="Management Cost Use" /></span>
					
						<g:each in="${managementCostActivityInstance.managementCostUse}" var="m">
						<span class="property-value" aria-labelledby="managementCostUse-label"><g:link controller="managementCostUse" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${managementCostActivityInstance?.id}" />
					<g:link class="edit" action="edit" id="${managementCostActivityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
