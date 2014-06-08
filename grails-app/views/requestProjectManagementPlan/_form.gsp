<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.RequestProjectManagementPlan" %>



<div class="fieldcontain ${hasErrors(bean: requestProjectManagementPlanInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="requestProjectManagementPlan.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${namaProyek}" optionKey="id" required="" value="${requestProjectManagementPlanInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requestProjectManagementPlanInstance, field: 'functionalPlan', 'error')} ">
	<label for="functionalPlan">
		<g:message code="requestProjectManagementPlan.functionalPlan.label" default="Functional Plan" />
		
	</label>
	<g:select name="functionalPlan" from="${requestProjectManagementPlanInstance.constraints.functionalPlan.inList}" value="${requestProjectManagementPlanInstance?.functionalPlan}" valueMessagePrefix="requestProjectManagementPlan.functionalPlan" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requestProjectManagementPlanInstance, field: 'message', 'error')} ">
	<label for="message">
		<g:message code="requestProjectManagementPlan.message.label" default="Message" />
		
	</label>
	<g:textArea name="message" cols="40" rows="5" maxlength="2000" value="${requestProjectManagementPlanInstance?.message}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requestProjectManagementPlanInstance, field: 'request', 'error')} ">
	<label for="request">
		<g:message code="requestProjectManagementPlan.request.label" default="Request" />
		
	</label>
	<g:checkBox name="request" value="${requestProjectManagementPlanInstance?.request}" />
</div>

