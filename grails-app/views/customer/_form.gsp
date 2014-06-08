<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.Customer" %>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'nAcceptedVendor', 'error')} required">
	<label for="nAcceptedVendor">
		<g:message code="customer.nAcceptedVendor.label" default="NA ccepted Vendor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nAcceptedVendor" type="number" value="${customerInstance.nAcceptedVendor}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'nComplain', 'error')} required">
	<label for="nComplain">
		<g:message code="customer.nComplain.label" default="NC omplain" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nComplain" type="number" value="${customerInstance.nComplain}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'nStakeholder', 'error')} required">
	<label for="nStakeholder">
		<g:message code="customer.nStakeholder.label" default="NS takeholder" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nStakeholder" type="number" value="${customerInstance.nStakeholder}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'nVendor', 'error')} required">
	<label for="nVendor">
		<g:message code="customer.nVendor.label" default="NV endor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nVendor" type="number" value="${customerInstance.nVendor}" required=""/>
</div>

