<%@ page import="ProjectRiskManagement.Planning.IdentificationQualityAssurance" %>



<div class="fieldcontain ${hasErrors(bean: identificationQualityAssuranceInstance, field: 'qualityAssurance', 'error')} ">
	<label for="qualityAssurance">
		<g:message code="identificationQualityAssurance.qualityAssurance.label" default="Quality Assurance" />
		
	</label>
	<g:select id="qualityAssurance" name="qualityAssurance.id" from="${ProjectQualityManagement.QualityAssurance.list()}" optionKey="id" value="${identificationQualityAssuranceInstance?.qualityAssurance?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationQualityAssuranceInstance, field: 'riskCategories', 'error')} ">
	<label for="riskCategories">
		<g:message code="identificationQualityAssurance.riskCategories.label" default="Risk Categories" />
		
	</label>
	<g:select id="riskCategories" name="riskCategories.id" from="${ProjectRiskManagement.Planning.RiskCategories.list()}" optionKey="id" value="${identificationQualityAssuranceInstance?.riskCategories?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationQualityAssuranceInstance, field: 'risk', 'error')} required">
	<label for="risk">
		<g:message code="identificationQualityAssurance.risk.label" default="Risk" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="risk" cols="40" rows="5" maxlength="500" required="" value="${identificationQualityAssuranceInstance?.risk}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationQualityAssuranceInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="identificationQualityAssurance.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${identificationQualityAssuranceInstance?.description}"/>
</div>

