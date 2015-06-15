<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.HandOver" %>



<div class="fieldcontain ${hasErrors(bean: handOverInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="handOver.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${handOverInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: handOverInstance, field: 'handOverMethod', 'error')} ">
	<label for="handOverMethod">
		<g:message code="handOver.handOverMethod.label" default="Hand Over Method" />
		
	</label>
	<g:textField name="handOverMethod" value="${handOverInstance?.handOverMethod}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: handOverInstance, field: 'acceptances', 'error')} ">
	<label for="acceptances">
		<g:message code="handOver.acceptances.label" default="Acceptances" />
		
	</label>
	<g:select name="acceptances" from="${ProjectIntegrationManagement.CloseProjectOrPhase.HandOverAcceptance.list()}" multiple="multiple" optionKey="id" size="5" value="${handOverInstance?.acceptances*.id}" class="many-to-many"/>
</div>

