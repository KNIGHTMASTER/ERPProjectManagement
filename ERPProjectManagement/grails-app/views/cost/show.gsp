
<%@ page import="ProjectCostManagement.DetermineBudget.Cost" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cost.label', default: 'Cost')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cost" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cost">
			
				<g:if test="${costInstance?.project}">
				<li class="fieldcontain">
					<span id="project-label" class="property-label"><g:message code="cost.project.label" default="Project" /></span>
					
						<span class="property-value" aria-labelledby="project-label"><g:link controller="projectCharter" action="show" id="${costInstance?.project?.id}">${costInstance?.project?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${costInstance?.costProject}">
				<li class="fieldcontain">
					<span id="costProject-label" class="property-label"><g:message code="cost.costProject.label" default="Cost Project" /></span>
					
						<span class="property-value" aria-labelledby="costProject-label"><g:link controller="costManagementPlan" action="show" id="${costInstance?.costProject?.id}">${costInstance?.costProject?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${costInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="cost.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${costInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costInstance?.humanCost}">
				<li class="fieldcontain">
					<span id="humanCost-label" class="property-label"><g:message code="cost.humanCost.label" default="Human Cost" /></span>
					
						<g:each in="${costInstance.humanCost}" var="h">
						<span class="property-value" aria-labelledby="humanCost-label"><g:link controller="activityCost" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${costInstance?.managementCost}">
				<li class="fieldcontain">
					<span id="managementCost-label" class="property-label"><g:message code="cost.managementCost.label" default="Management Cost" /></span>
					
						<g:each in="${costInstance.managementCost}" var="m">
						<span class="property-value" aria-labelledby="managementCost-label"><g:link controller="managementCostActivity" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${costInstance?.materialCost}">
				<li class="fieldcontain">
					<span id="materialCost-label" class="property-label"><g:message code="cost.materialCost.label" default="Material Cost" /></span>
					
						<g:each in="${costInstance.materialCost}" var="m">
						<span class="property-value" aria-labelledby="materialCost-label"><g:link controller="materialCostActivity" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${costInstance?.id}" />
					<g:link class="edit" action="edit" id="${costInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
