<%@ page import="ProjectScopeManagement.CreateWBS.WbsDictionary" %>



<div class="fieldcontain ${hasErrors(bean: wbsDictionaryInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="wbsDictionary.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${wbsDictionaryInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wbsDictionaryInstance, field: 'wbsName', 'error')} required">
	<label for="wbsName">
		<g:message code="wbsDictionary.wbsName.label" default="Wbs Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="wbsName" name="wbsName.id" from="${ProjectScopeManagement.CreateWBS.Wbs.list()}" optionKey="id" required="" value="${wbsDictionaryInstance?.wbsName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wbsDictionaryInstance, field: 'element', 'error')} required">
	<label for="element">
		<g:message code="wbsDictionary.element.label" default="Element" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="element" name="element.id" from="${ProjectScopeManagement.CreateWBS.Element.list()}" optionKey="id" required="" value="${wbsDictionaryInstance?.element?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wbsDictionaryInstance, field: 'definition', 'error')} ">
	<label for="definition">
		<g:message code="wbsDictionary.definition.label" default="Definition" />
		
	</label>
	<g:textArea name="definition" cols="40" rows="5" maxlength="1000" value="${wbsDictionaryInstance?.definition}"/>
</div>

