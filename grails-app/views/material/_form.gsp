<%@ page import="ProjectProcurementManagement.PlanProcurement.Material" %>



<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="material.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${materialInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'materialName', 'error')} required">
	<label for="materialName">
		<g:message code="material.materialName.label" default="Material Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materialName" name="materialName.id" from="${ProjectProcurementManagement.ConductProcurements.MaterialCriteria.list()}" optionKey="id" required="" value="${materialInstance?.materialName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'justification', 'error')} ">
	<label for="justification">
		<g:message code="material.justification.label" default="Justification" />
		
	</label>
	<g:textArea name="justification" cols="40" rows="5" maxlength="500" value="${materialInstance?.justification}"/>
</div>

