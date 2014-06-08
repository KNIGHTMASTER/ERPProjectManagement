<%@ page import="ProjectProcurementManagement.AdministerProcurements.MaterialResource" %>



<div class="fieldcontain ${hasErrors(bean: materialResourceInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="materialResource.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${materialResourceInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialResourceInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="materialResource.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${materialResourceInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialResourceInstance, field: 'material', 'error')} ">
	<label for="material">
		<g:message code="materialResource.material.label" default="Material" />
		
	</label>
	<g:textField name="material" value="${materialResourceInstance?.material}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialResourceInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="materialResource.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${materialResourceInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialResourceInstance, field: 'available', 'error')} required">
	<label for="available">
		<g:message code="materialResource.available.label" default="Available" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="available" type="number" value="${materialResourceInstance.available}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialResourceInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="materialResource.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${materialResourceInstance.constraints.status.inList}" value="${materialResourceInstance?.status}" valueMessagePrefix="materialResource.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialResourceInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="materialResource.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${materialResourceInstance?.description}"/>
</div>

