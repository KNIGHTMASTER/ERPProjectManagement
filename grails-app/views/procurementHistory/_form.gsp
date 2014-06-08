<%@ page import="ProjectProcurementManagement.ConductProcurements.ProcurementHistory" %>



<div class="fieldcontain ${hasErrors(bean: procurementHistoryInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="procurementHistory.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${procurementHistoryInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementHistoryInstance, field: 'vendorName', 'error')} ">
	<label for="vendorName">
		<g:message code="procurementHistory.vendorName.label" default="Vendor Name" />
		
	</label>
	<g:textField name="vendorName" value="${procurementHistoryInstance?.vendorName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementHistoryInstance, field: 'productQuality', 'error')} ">
	<label for="productQuality">
		<g:message code="procurementHistory.productQuality.label" default="Product Quality" />
		
	</label>
	<g:select name="productQuality" from="${procurementHistoryInstance.constraints.productQuality.inList}" value="${procurementHistoryInstance?.productQuality}" valueMessagePrefix="procurementHistory.productQuality" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementHistoryInstance, field: 'onTimeDelivery', 'error')} ">
	<label for="onTimeDelivery">
		<g:message code="procurementHistory.onTimeDelivery.label" default="On Time Delivery" />
		
	</label>
	<g:select name="onTimeDelivery" from="${procurementHistoryInstance.constraints.onTimeDelivery.inList}" value="${procurementHistoryInstance?.onTimeDelivery}" valueMessagePrefix="procurementHistory.onTimeDelivery" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementHistoryInstance, field: 'documentationQuality', 'error')} ">
	<label for="documentationQuality">
		<g:message code="procurementHistory.documentationQuality.label" default="Documentation Quality" />
		
	</label>
	<g:select name="documentationQuality" from="${procurementHistoryInstance.constraints.documentationQuality.inList}" value="${procurementHistoryInstance?.documentationQuality}" valueMessagePrefix="procurementHistory.documentationQuality" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementHistoryInstance, field: 'developmentCost', 'error')} ">
	<label for="developmentCost">
		<g:message code="procurementHistory.developmentCost.label" default="Development Cost" />
		
	</label>
	<g:select name="developmentCost" from="${procurementHistoryInstance.constraints.developmentCost.inList}" value="${procurementHistoryInstance?.developmentCost}" valueMessagePrefix="procurementHistory.developmentCost" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementHistoryInstance, field: 'developmentTime', 'error')} ">
	<label for="developmentTime">
		<g:message code="procurementHistory.developmentTime.label" default="Development Time" />
		
	</label>
	<g:select name="developmentTime" from="${procurementHistoryInstance.constraints.developmentTime.inList}" value="${procurementHistoryInstance?.developmentTime}" valueMessagePrefix="procurementHistory.developmentTime" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementHistoryInstance, field: 'costPerUnit', 'error')} ">
	<label for="costPerUnit">
		<g:message code="procurementHistory.costPerUnit.label" default="Cost Per Unit" />
		
	</label>
	<g:select name="costPerUnit" from="${procurementHistoryInstance.constraints.costPerUnit.inList}" value="${procurementHistoryInstance?.costPerUnit}" valueMessagePrefix="procurementHistory.costPerUnit" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementHistoryInstance, field: 'transactionalEfficiency', 'error')} ">
	<label for="transactionalEfficiency">
		<g:message code="procurementHistory.transactionalEfficiency.label" default="Transactional Efficiency" />
		
	</label>
	<g:select name="transactionalEfficiency" from="${procurementHistoryInstance.constraints.transactionalEfficiency.inList}" value="${procurementHistoryInstance?.transactionalEfficiency}" valueMessagePrefix="procurementHistory.transactionalEfficiency" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procurementHistoryInstance, field: 'quality', 'error')} ">
	<label for="quality">
		<g:message code="procurementHistory.quality.label" default="Quality" />
		
	</label>
	<g:select name="quality" from="${procurementHistoryInstance.constraints.quality.inList}" value="${procurementHistoryInstance?.quality}" valueMessagePrefix="procurementHistory.quality" noSelection="['': '']"/>
</div>

