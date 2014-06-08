<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.InternalProcess" %>



<div class="fieldcontain ${hasErrors(bean: internalProcessInstance, field: 'nActivity', 'error')} required">
	<label for="nActivity">
		<g:message code="internalProcess.nActivity.label" default="NA ctivity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nActivity" type="number" value="${internalProcessInstance.nActivity}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: internalProcessInstance, field: 'nDelay', 'error')} required">
	<label for="nDelay">
		<g:message code="internalProcess.nDelay.label" default="ND elay" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nDelay" type="number" value="${internalProcessInstance.nDelay}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: internalProcessInstance, field: 'nMissSequence', 'error')} required">
	<label for="nMissSequence">
		<g:message code="internalProcess.nMissSequence.label" default="NM iss Sequence" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nMissSequence" type="number" value="${internalProcessInstance.nMissSequence}" required=""/>
</div>

