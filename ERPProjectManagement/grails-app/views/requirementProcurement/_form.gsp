<%@ page import="ProjectProcurementManagement.PlanProcurement.RequirementProcurement" %>



<div class="fieldcontain ${hasErrors(bean: requirementProcurementInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="requirementProcurement.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${requirementProcurementInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementProcurementInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="requirementProcurement.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${requirementProcurementInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementProcurementInstance, field: 'materialName', 'error')} required">
	<label for="materialName">
		<g:message code="requirementProcurement.materialName.label" default="Material Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materialName" name="materialName.id" from="${ProjectProcurementManagement.PlanProcurement.Material.list()}" optionKey="id" required="" value="${requirementProcurementInstance?.materialName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementProcurementInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="requirementProcurement.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${requirementProcurementInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: requirementProcurementInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="requirementProcurement.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${requirementProcurementInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: requirementProcurementInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="requirementProcurement.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${requirementProcurementInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementProcurementInstance, field: 'priceReference', 'error')} required">
	<label for="priceReference">
		<g:message code="requirementProcurement.priceReference.label" default="Price Reference" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="priceReference" value="${fieldValue(bean: requirementProcurementInstance, field: 'priceReference')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementProcurementInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="requirementProcurement.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${requirementProcurementInstance?.description}"/>
</div>

