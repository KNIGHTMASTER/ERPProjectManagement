<%@ page import="ProjectProcurementManagement.AdministerProcurements.Contract" %>



<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'vendorName', 'error')} required">
	<label for="vendorName">
		<g:message code="contract.vendorName.label" default="Vendor Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vendorName" name="vendorName.id" from="${ProjectProcurementManagement.ConductProcurements.VendorRegister.list()}" optionKey="id" required="" value="${contractInstance?.vendorName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'noContract', 'error')} ">
	<label for="noContract">
		<g:message code="contract.noContract.label" default="No Contract" />
		
	</label>
	<g:textField name="noContract" value="${contractInstance?.noContract}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'materialName', 'error')} required">
	<label for="materialName">
		<g:message code="contract.materialName.label" default="Material Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materialName" name="materialName.id" from="${ProjectProcurementManagement.PlanProcurement.Approval.list()}" optionKey="id" required="" value="${contractInstance?.materialName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="contract.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: contractInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'contractDate', 'error')} required">
	<label for="contractDate">
		<g:message code="contract.contractDate.label" default="Contract Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="contractDate" precision="day"  value="${contractInstance?.contractDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'startWork', 'error')} required">
	<label for="startWork">
		<g:message code="contract.startWork.label" default="Start Work" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startWork" precision="day"  value="${contractInstance?.startWork}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'endWork', 'error')} required">
	<label for="endWork">
		<g:message code="contract.endWork.label" default="End Work" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endWork" precision="day"  value="${contractInstance?.endWork}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'acceptance', 'error')} ">
	<label for="acceptance">
		<g:message code="contract.acceptance.label" default="Acceptance" />
		
	</label>
	<g:checkBox name="acceptance" value="${contractInstance?.acceptance}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'complete', 'error')} ">
	<label for="complete">
		<g:message code="contract.complete.label" default="Complete" />
		
	</label>
	<g:checkBox name="complete" value="${contractInstance?.complete}" />
</div>

