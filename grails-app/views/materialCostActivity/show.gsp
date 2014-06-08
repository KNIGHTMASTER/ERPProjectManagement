
<%@ page import="ProjectCostManagement.DetermineBudget.MaterialCostActivity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialCostActivity.label', default: 'MaterialCostActivity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-materialCostActivity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/identificationMaterialCost/list"><g:message code="Identification Material Cost"/></a></li>
			</ul>
		</div>
		<div id="show-materialCostActivity" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list materialCostActivity">
			
				<g:if test="${materialCostActivityInstance?.cost}">
				<li class="fieldcontain">
					<span id="cost-label" class="property-label"><g:message code="materialCostActivity.cost.label" default="Cost" /></span>
					
						<span class="property-value" aria-labelledby="cost-label"><g:link controller="cost" action="show" id="${materialCostActivityInstance?.cost?.id}">${materialCostActivityInstance?.cost?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostActivityInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="materialCostActivity.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${materialCostActivityInstance?.activity?.id}">${materialCostActivityInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostActivityInstance?.approve}">
				<li class="fieldcontain">
					<span id="approve-label" class="property-label"><g:message code="materialCostActivity.approve.label" default="Approve" /></span>
					
						<span class="property-value" aria-labelledby="approve-label"><g:formatBoolean boolean="${materialCostActivityInstance?.approve}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostActivityInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="materialCostActivity.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${materialCostActivityInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostActivityInstance?.material}">
				<li class="fieldcontain">
					<span id="material-label" class="property-label"><g:message code="materialCostActivity.material.label" default="Material" /></span>
					
						<span class="property-value" aria-labelledby="material-label"><g:link controller="purchaseVendor" action="show" id="${materialCostActivityInstance?.material?.id}">${materialCostActivityInstance?.material?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostActivityInstance?.materialCostUse}">
				<li class="fieldcontain">
					<span id="materialCostUse-label" class="property-label"><g:message code="materialCostActivity.materialCostUse.label" default="Material Cost Use" /></span>
					
						<g:each in="${materialCostActivityInstance.materialCostUse}" var="m">
						<span class="property-value" aria-labelledby="materialCostUse-label"><g:link controller="materialCostUse" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${materialCostActivityInstance?.id}" />
					<g:link class="edit" action="edit" id="${materialCostActivityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
