<%@ page import="ProjectRiskManagement.Planning.AnalysisProjectScopeStatement" %>



<div class="fieldcontain ${hasErrors(bean: analysisProjectScopeStatementInstance, field: 'identificationProjectScopeStatement', 'error')} ">
	<label for="identificationProjectScopeStatement">
		<g:message code="analysisProjectScopeStatement.identificationProjectScopeStatement.label" default="Identification Project Scope Statement" />
		
	</label>
	<g:select id="identificationProjectScopeStatement" name="identificationProjectScopeStatement.id" from="${ProjectRiskManagement.Planning.IdentificationProjectScopeStatement.list()}" optionKey="id" value="${analysisProjectScopeStatementInstance?.identificationProjectScopeStatement?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisProjectScopeStatementInstance, field: 'ranking', 'error')} required">
	<label for="ranking">
		<g:message code="analysisProjectScopeStatement.ranking.label" default="Ranking" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ranking" type="number" value="${analysisProjectScopeStatementInstance.ranking}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisProjectScopeStatementInstance, field: 'subCategories', 'error')} ">
	<label for="subCategories">
		<g:message code="analysisProjectScopeStatement.subCategories.label" default="Sub Categories" />
		
	</label>
	<g:select id="subCategories" name="subCategories.id" from="${ProjectRiskManagement.Planning.SubCategories.list()}" optionKey="id" value="${analysisProjectScopeStatementInstance?.subCategories?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisProjectScopeStatementInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="analysisProjectScopeStatement.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${analysisProjectScopeStatementInstance?.description}"/>
</div>

