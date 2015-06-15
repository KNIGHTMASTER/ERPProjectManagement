<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.Perspektif" %>



<div class="fieldcontain ${hasErrors(bean: perspektifInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="perspektif.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${perspektifInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perspektifInstance, field: 'data1', 'error')} ">
	<label for="data1">
		<g:message code="perspektif.data1.label" default="Data1" />
		
	</label>
	<g:select name="data1" from="${perspektifInstance.constraints.data1.inList}" value="${perspektifInstance?.data1}" valueMessagePrefix="perspektif.data1" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perspektifInstance, field: 'data2', 'error')} ">
	<label for="data2">
		<g:message code="perspektif.data2.label" default="Data2" />
		
	</label>
	<g:select name="data2" from="${perspektifInstance.constraints.data2.inList}" value="${perspektifInstance?.data2}" valueMessagePrefix="perspektif.data2" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perspektifInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="perspektif.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="value" value="${fieldValue(bean: perspektifInstance, field: 'value')}" required=""/>
</div>

