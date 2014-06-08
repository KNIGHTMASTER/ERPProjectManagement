
<%@ page import="ProjectCostManagement.DetermineBudget.ActivityCost" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityCost.label', default: 'ActivityCost')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activityCost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activityCost" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activityCost">
			
				<g:if test="${activityCostInstance?.cost}">
				<li class="fieldcontain">
					<span id="cost-label" class="property-label"><g:message code="activityCost.cost.label" default="Cost" /></span>
					
						<span class="property-value" aria-labelledby="cost-label"><g:link controller="cost" action="show" id="${activityCostInstance?.cost?.id}">${activityCostInstance?.cost?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCostInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="activityCost.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${activityCostInstance?.activity?.id}">${activityCostInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCostInstance?.approve}">
				<li class="fieldcontain">
					<span id="approve-label" class="property-label"><g:message code="activityCost.approve.label" default="Approve" /></span>
					
						<span class="property-value" aria-labelledby="approve-label"><g:formatBoolean boolean="${activityCostInstance?.approve}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCostInstance?.humanResourceCost}">
				<li class="fieldcontain">
					<span id="humanResourceCost-label" class="property-label"><g:message code="activityCost.humanResourceCost.label" default="Human Resource Cost" /></span>
					
						<g:each in="${activityCostInstance.humanResourceCost}" var="h">
						<span class="property-value" aria-labelledby="humanResourceCost-label"><g:link controller="humanResourceCost" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${activityCostInstance?.id}" />
					<g:link class="edit" action="edit" id="${activityCostInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
