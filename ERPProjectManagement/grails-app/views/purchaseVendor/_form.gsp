<%@ page import="ProjectProcurementManagement.AdministerProcurements.PurchaseVendor" %>



<div class="fieldcontain ${hasErrors(bean: purchaseVendorInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="purchaseVendor.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${purchaseVendorInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: purchaseVendorInstance, field: 'material', 'error')} required">
	<label for="material">
		<g:message code="purchaseVendor.material.label" default="Material" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="material" name="material.id" from="${ProjectProcurementManagement.AdministerProcurements.MaterialResource.list()}" optionKey="id" required="" value="${purchaseVendorInstance?.material?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: purchaseVendorInstance, field: 'purchaseDate', 'error')} ">
	<label for="purchaseDate">
		<g:message code="purchaseVendor.purchaseDate.label" default="Purchase Date" />
		
	</label>
	<g:datePicker name="purchaseDate" precision="day"  value="${purchaseVendorInstance?.purchaseDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: purchaseVendorInstance, field: 'pricePerUnit', 'error')} required">
	<label for="pricePerUnit">
		<g:message code="purchaseVendor.pricePerUnit.label" default="Price Per Unit" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pricePerUnit" value="${fieldValue(bean: purchaseVendorInstance, field: 'pricePerUnit')}" required=""/>
</div>

