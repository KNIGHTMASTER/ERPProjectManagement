<%@ page import="ProjectScopeManagement.CreateWBS.ScopeBaseline" %>



<div class="fieldcontain ${hasErrors(bean: scopeBaselineInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="scopeBaseline.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${scopeBaselineInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scopeBaselineInstance, field: 'projectScopeStatement', 'error')} required">
	<label for="projectScopeStatement">
		<g:message code="scopeBaseline.projectScopeStatement.label" default="Project Scope Statement" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectScopeStatement" name="projectScopeStatement.id" from="${ProjectScopeManagement.DefineScope.ProjectScopeStatement.list()}" optionKey="id" required="" value="${scopeBaselineInstance?.projectScopeStatement?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scopeBaselineInstance, field: 'wbs', 'error')} required">
	<label for="wbs">
		<g:message code="scopeBaseline.wbs.label" default="Wbs" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="wbs" name="wbs.id" from="${ProjectScopeManagement.CreateWBS.Wbs.list()}" optionKey="id" required="" value="${scopeBaselineInstance?.wbs?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scopeBaselineInstance, field: 'wbsDictionary', 'error')} required">
	<label for="wbsDictionary">
		<g:message code="scopeBaseline.wbsDictionary.label" default="Wbs Dictionary" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="wbsDictionary" name="wbsDictionary.id" from="${ProjectScopeManagement.CreateWBS.WbsDictionary.list()}" optionKey="id" required="" value="${scopeBaselineInstance?.wbsDictionary?.id}" class="many-to-one"/>
</div>

