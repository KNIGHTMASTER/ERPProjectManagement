<%@ page import="ProjectRiskManagement.Planning.IdentificationDelay" %>



<div class="fieldcontain ${hasErrors(bean: identificationDelayInstance, field: 'delayActivity', 'error')} ">
	<label for="delayActivity">
		<g:message code="identificationDelay.delayActivity.label" default="Delay Activity" />
		
	</label>
	<g:select id="delayActivity" name="delayActivity.id" from="${ProjectTimeManagement.DefineActivity.DelayActivity.list()}" optionKey="id" value="${identificationDelayInstance?.delayActivity?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationDelayInstance, field: 'riskCategories', 'error')} ">
	<label for="riskCategories">
		<g:message code="identificationDelay.riskCategories.label" default="Risk Categories" />
		
	</label>
	<g:select id="riskCategories" name="riskCategories.id" from="${ProjectRiskManagement.Planning.RiskCategories.list()}" optionKey="id" value="${identificationDelayInstance?.riskCategories?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationDelayInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="identificationDelay.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${identificationDelayInstance?.description}"/>
</div>

