<%@ page import="ProjectProcurementManagement.AdministerProcurements.PerformanceVendor" %>



<div class="fieldcontain ${hasErrors(bean: performanceVendorInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="performanceVendor.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${performanceVendorInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: performanceVendorInstance, field: 'vendorName', 'error')} ">
	<label for="vendorName">
		<g:message code="performanceVendor.vendorName.label" default="Vendor Name" />
		
	</label>
	<g:textField name="vendorName" value="${performanceVendorInstance?.vendorName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: performanceVendorInstance, field: 'productQuality', 'error')} ">
	<label for="productQuality">
		<g:message code="performanceVendor.productQuality.label" default="Product Quality" />
		
	</label>
	<g:select name="productQuality" from="${performanceVendorInstance.constraints.productQuality.inList}" value="${performanceVendorInstance?.productQuality}" valueMessagePrefix="performanceVendor.productQuality" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: performanceVendorInstance, field: 'onTimeDelivery', 'error')} ">
	<label for="onTimeDelivery">
		<g:message code="performanceVendor.onTimeDelivery.label" default="On Time Delivery" />
		
	</label>
	<g:select name="onTimeDelivery" from="${performanceVendorInstance.constraints.onTimeDelivery.inList}" value="${performanceVendorInstance?.onTimeDelivery}" valueMessagePrefix="performanceVendor.onTimeDelivery" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: performanceVendorInstance, field: 'documentationQuality', 'error')} ">
	<label for="documentationQuality">
		<g:message code="performanceVendor.documentationQuality.label" default="Documentation Quality" />
		
	</label>
	<g:select name="documentationQuality" from="${performanceVendorInstance.constraints.documentationQuality.inList}" value="${performanceVendorInstance?.documentationQuality}" valueMessagePrefix="performanceVendor.documentationQuality" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: performanceVendorInstance, field: 'developmentCost', 'error')} ">
	<label for="developmentCost">
		<g:message code="performanceVendor.developmentCost.label" default="Development Cost" />
		
	</label>
	<g:select name="developmentCost" from="${performanceVendorInstance.constraints.developmentCost.inList}" value="${performanceVendorInstance?.developmentCost}" valueMessagePrefix="performanceVendor.developmentCost" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: performanceVendorInstance, field: 'developmentTime', 'error')} ">
	<label for="developmentTime">
		<g:message code="performanceVendor.developmentTime.label" default="Development Time" />
		
	</label>
	<g:select name="developmentTime" from="${performanceVendorInstance.constraints.developmentTime.inList}" value="${performanceVendorInstance?.developmentTime}" valueMessagePrefix="performanceVendor.developmentTime" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: performanceVendorInstance, field: 'costPerUnit', 'error')} ">
	<label for="costPerUnit">
		<g:message code="performanceVendor.costPerUnit.label" default="Cost Per Unit" />
		
	</label>
	<g:select name="costPerUnit" from="${performanceVendorInstance.constraints.costPerUnit.inList}" value="${performanceVendorInstance?.costPerUnit}" valueMessagePrefix="performanceVendor.costPerUnit" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: performanceVendorInstance, field: 'transactionalEfficiency', 'error')} ">
	<label for="transactionalEfficiency">
		<g:message code="performanceVendor.transactionalEfficiency.label" default="Transactional Efficiency" />
		
	</label>
	<g:select name="transactionalEfficiency" from="${performanceVendorInstance.constraints.transactionalEfficiency.inList}" value="${performanceVendorInstance?.transactionalEfficiency}" valueMessagePrefix="performanceVendor.transactionalEfficiency" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: performanceVendorInstance, field: 'quality', 'error')} ">
	<label for="quality">
		<g:message code="performanceVendor.quality.label" default="Quality" />
		
	</label>
	<g:select name="quality" from="${performanceVendorInstance.constraints.quality.inList}" value="${performanceVendorInstance?.quality}" valueMessagePrefix="performanceVendor.quality" noSelection="['': '']"/>
</div>

