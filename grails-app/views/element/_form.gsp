<%@ page import="ProjectScopeManagement.CreateWBS.Element" %>



<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="element.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${elementInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'wbsName', 'error')} required">
	<label for="wbsName">
		<g:message code="element.wbsName.label" default="Wbs Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="wbsName" name="wbsName.id" from="${ProjectScopeManagement.CreateWBS.Wbs.list()}" optionKey="id" required="" value="${elementInstance?.wbsName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="element.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="level" from="${elementInstance.constraints.level.inList}" required="" value="${elementInstance?.level}" valueMessagePrefix="element.level"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'wbsCode', 'error')} ">
	<label for="wbsCode">
		<g:message code="element.wbsCode.label" default="Wbs Code" />
		
	</label>
	<g:textField name="wbsCode" value="${elementInstance?.wbsCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'elementName', 'error')} ">
	<label for="elementName">
		<g:message code="element.elementName.label" default="Element Name" />
		
	</label>
	<g:textField name="elementName" value="${elementInstance?.elementName}"/>
</div>

