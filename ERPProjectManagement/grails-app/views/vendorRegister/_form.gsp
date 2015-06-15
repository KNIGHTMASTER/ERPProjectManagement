<%@ page import="ProjectProcurementManagement.ConductProcurements.VendorRegister" %>



<div class="fieldcontain ${hasErrors(bean: vendorRegisterInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="vendorRegister.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${vendorRegisterInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendorRegisterInstance, field: 'vendorName', 'error')} required">
	<label for="vendorName">
		<g:message code="vendorRegister.vendorName.label" default="Vendor Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vendorName" name="vendorName.id" from="${ProjectProcurementManagement.AdministerProcurements.PerformanceVendor.list()}" optionKey="id" required="" value="${vendorRegisterInstance?.vendorName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendorRegisterInstance, field: 'companyType', 'error')} ">
	<label for="companyType">
		<g:message code="vendorRegister.companyType.label" default="Company Type" />
		
	</label>
	<g:select name="companyType" from="${vendorRegisterInstance.constraints.companyType.inList}" value="${vendorRegisterInstance?.companyType}" valueMessagePrefix="vendorRegister.companyType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendorRegisterInstance, field: 'dateRegister', 'error')} ">
	<label for="dateRegister">
		<g:message code="vendorRegister.dateRegister.label" default="Date Register" />
		
	</label>
	<g:datePicker name="dateRegister" precision="day"  value="${vendorRegisterInstance?.dateRegister}" default="none" noSelection="['': '']" />
</div>

