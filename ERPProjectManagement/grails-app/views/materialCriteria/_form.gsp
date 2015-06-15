<%@ page import="ProjectProcurementManagement.ConductProcurements.MaterialCriteria" %>



<div class="fieldcontain ${hasErrors(bean: materialCriteriaInstance, field: 'materialId', 'error')} ">
	<label for="materialId">
		<g:message code="materialCriteria.materialId.label" default="Material Id" />
		
	</label>
	<g:textField name="materialId" value="${materialCriteriaInstance?.materialId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCriteriaInstance, field: 'materialName', 'error')} ">
	<label for="materialName">
		<g:message code="materialCriteria.materialName.label" default="Material Name" />
		
	</label>
	<g:textField name="materialName" value="${materialCriteriaInstance?.materialName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCriteriaInstance, field: 'unitType', 'error')} ">
	<label for="unitType">
		<g:message code="materialCriteria.unitType.label" default="Unit Type" />
		
	</label>
	<g:select name="unitType" from="${materialCriteriaInstance.constraints.unitType.inList}" value="${materialCriteriaInstance?.unitType}" valueMessagePrefix="materialCriteria.unitType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCriteriaInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="materialCriteria.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${materialCriteriaInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCriteriaInstance, field: 'available', 'error')} required">
	<label for="available">
		<g:message code="materialCriteria.available.label" default="Available" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="available" type="number" value="${materialCriteriaInstance.available}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCriteriaInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="materialCriteria.note.label" default="Note" />
		
	</label>
	<g:textArea name="note" cols="40" rows="5" maxlength="500" value="${materialCriteriaInstance?.note}"/>
</div>

