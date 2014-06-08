<%@ page import="ProjectRiskManagement.Planning.IdentificationProjectScopeStatement" %>



<div class="fieldcontain ${hasErrors(bean: identificationProjectScopeStatementInstance, field: 'projectScopeStatement', 'error')} ">
	<label for="projectScopeStatement">
		<g:message code="identificationProjectScopeStatement.projectScopeStatement.label" default="Project Scope Statement" />
		
	</label>
	<g:select id="projectScopeStatement" name="projectScopeStatement.id" from="${ProjectScopeManagement.DefineScope.ProjectScopeStatement.list()}" optionKey="id" value="${identificationProjectScopeStatementInstance?.projectScopeStatement?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationProjectScopeStatementInstance, field: 'riskCategories', 'error')} ">
	<label for="riskCategories">
		<g:message code="identificationProjectScopeStatement.riskCategories.label" default="Risk Categories" />
		
	</label>
	<g:select id="riskCategories" name="riskCategories.id" from="${ProjectRiskManagement.Planning.RiskCategories.list()}" optionKey="id" value="${identificationProjectScopeStatementInstance?.riskCategories?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationProjectScopeStatementInstance, field: 'risk', 'error')} required">
	<label for="risk">
		<g:message code="identificationProjectScopeStatement.risk.label" default="Risk" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="risk" cols="40" rows="5" maxlength="500" required="" value="${identificationProjectScopeStatementInstance?.risk}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationProjectScopeStatementInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="identificationProjectScopeStatement.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${identificationProjectScopeStatementInstance?.description}"/>
</div>

