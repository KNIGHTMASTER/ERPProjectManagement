<%@ page import="ProjectProcurementManagement.ConductProcurements.ProcurementNegotiation" %>



<div class="fieldcontain ${hasErrors(bean: procurementNegotiationInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="procurementNegotiation.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${procurementNegotiationInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementNegotiationInstance, field: 'vendorName', 'error')} required">
	<label for="vendorName">
		<g:message code="procurementNegotiation.vendorName.label" default="Vendor Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vendorName" name="vendorName.id" from="${ProjectProcurementManagement.AdministerProcurements.PerformanceVendor.list()}" optionKey="id" required="" value="${procurementNegotiationInstance?.vendorName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementNegotiationInstance, field: 'policy', 'error')} ">
	<label for="policy">
		<g:message code="procurementNegotiation.policy.label" default="Policy" />
		
	</label>
	<g:textField name="policy" value="${procurementNegotiationInstance?.policy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementNegotiationInstance, field: 'lock', 'error')} ">
	<label for="lock">
		<g:message code="procurementNegotiation.lock.label" default="Lock" />
		
	</label>
	<g:checkBox name="lock" value="${procurementNegotiationInstance?.lock}" />
</div>

<div class="fieldcontain ${hasErrors(bean: procurementNegotiationInstance, field: 'unLock', 'error')} ">
	<label for="unLock">
		<g:message code="procurementNegotiation.unLock.label" default="Un Lock" />
		
	</label>
	<g:checkBox name="unLock" value="${procurementNegotiationInstance?.unLock}" />
</div>

